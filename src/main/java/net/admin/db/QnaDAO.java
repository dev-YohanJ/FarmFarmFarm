package net.admin.db;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class QnaDAO {
	private DataSource ds;
	
	// 생성자에서 JNDI 리소스를 참조하여 Connection 객체를 얻어옵니다.
	public QnaDAO() {
		try {
			Context init = new InitialContext();
			ds = (DataSource) init.lookup("java:comp/env/jdbc/OracleDB");
		} catch (Exception ex) {
			System.out.println("DB 연결 실패 : " + ex);
			return;
		}
	}
	
	public boolean qnaInsert(QnaBean qna) {
		Connection con = null;
		PreparedStatement pstmt = null;
		int result=0;
		try {
			con = ds.getConnection();
			
			String max_sql = "(select nvl(max(qna_num),0)+1 from qna)";

			// 원문글의 QNA_RE_REF 필드는 자신의 글번호 입니다.
			String sql = "insert into qna " 
			            + "(QNA_NUM,     QNA_NAME,  QNA_PASS,    QNA_SUBJECT,"
					    + " QNA_CONTENT, QNA_FILE,  QNA_RE_REF," 
			            + " QNA_RE_LEV,  QNA_RE_SEQ,QNA_READCOUNT)"
					    + " values(" + max_sql + ",?,?,?," 
			            + "        ?,?," +   max_sql  + "," 
					    + "        ?,?,?)";

			 // 새로운 글을 등록하는 부분입니다.
			 pstmt = con.prepareStatement(sql);
			 pstmt.setString(1, qna.getQna_name());
	         pstmt.setString(2, qna.getQna_pass());
	         pstmt.setString(3, qna.getQna_subject());
	         pstmt.setString(4, qna.getQna_content());
	         pstmt.setString(5, qna.getQna_file());
	         
	         // 원문의 경우 QNA_RE_LEV, QNA_RE_SEQ 필드 값은 0 입니다.
	         pstmt.setInt(6, 0); // QNA_RE_LEV 필드
	         pstmt.setInt(7, 0); // QNA_RE_SEQ 필드
	         pstmt.setInt(8, 0); // QNA_READCOUNT 필드
	         
	         result = pstmt.executeUpdate();
	         if (result ==1) {
	        	 System.out.println("데이터 삽입이 모두 완료되었습니다.");
	        	 return true;
	         }
		} catch (Exception ex) {
			ex.printStackTrace();
			System.out.println("getListCount() 에러: " + ex);
		} finally {
			 if (pstmt != null)
		            try {
		               pstmt.close();
		            } catch (SQLException ex) {
		               ex.printStackTrace();
		            }
		         if (con != null)
		            try {
		               con.close();
		            } catch (SQLException ex) {
		               ex.printStackTrace();
		            }
		}//finally   
		return false;
	}// qnaInsert()메서드 end
	
	// 글의 갯수 구하기
	public int getListCount() {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs= null;
		int x = 0;
		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement("select count(*) from QNA");
			rs = pstmt.executeQuery();
			
			if (rs.next()) {
				x = rs.getInt(1);
			}
		} catch (Exception ex) {
			System.out.println("getListCount() 에러: " + ex);
		} finally {
			if (rs != null)
				try {
					rs.close();
				} catch (SQLException ex) {
					ex.printStackTrace();
				}
			 if (pstmt != null)
		            try {
		               pstmt.close();
		            } catch (SQLException ex) {
		               ex.printStackTrace();
		            }
		         if (con != null)
		            try {
		               con.close();
		            } catch (SQLException ex) {
		               ex.printStackTrace();
		            }
		      }//finally   
		      return x;
	}//getListCount()메서드 end
	
	// 글 목록보기
	public List<QnaBean> getQnaList(int page, int limit) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs= null;

		// page : 페이지
		// limit : 페이지 당 목록의 수
		// qna_re_ref desc, qna_re_seq asc에 의한 정렬한 것을
		// 조건절에 맞는 rnum의 범위 만큼 가져오는 쿼리문입니다.
		
		String qna_list_sql = "select * " 
                + "  from  (select rownum rnum, j.* "
                + "         from (select qna.*,  nvl(cnt,0) cnt "
	            + "               from qna left outer join (select comment_qna_num,count(*) cnt"
                + "                                           from comm_qna"
                + "                                           group by comment_qna_num)"
                + "               on qna_num=comment_qna_num"
	            + "               order by QNA_RE_REF desc,"
                + "               QNA_RE_SEQ asc) j "
	            + "         where rownum<= ? "      
	            + "         ) "
	            + " where rnum>=? and rnum<=?";

		
		List<QnaBean> list = new ArrayList<QnaBean>();
		// 한 페이지당 10개씩 목록인 경우 1페이지, 2페이지, 3페이지, 4페이지 ...
		int startrow = (page -1) * limit + 1; // 일기 시작할 row 번호(1 11 21 31 ...
		int endrow = startrow + limit - 1;	 // 읽을 마지막 row 번호(10 20 30 40 ...
		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement(qna_list_sql);
			pstmt.setInt(1, endrow);
			pstmt.setInt(2, startrow);
			pstmt.setInt(3, endrow);
			rs = pstmt.executeQuery();

			// DB에서 가져온 데이터를 VO객체에 담습니다.
			while (rs.next()) {
				QnaBean qna = new QnaBean();
				qna.setQna_num(rs.getInt("QNA_NUM"));
				qna.setQna_name(rs.getString("QNA_NAME"));
				qna.setQna_subject(rs.getString("QNA_SUBJECT"));
				qna.setQna_content(rs.getString("QNA_CONTENT"));
				qna.setQna_file(rs.getString("QNA_FILE"));
				qna.setQna_re_ref(rs.getInt("QNA_RE_REF"));
				qna.setQna_re_lev(rs.getInt("QNA_RE_LEV"));
				qna.setQna_re_seq(rs.getInt("QNA_RE_SEQ"));
				qna.setQna_readcount(rs.getInt("QNA_READCOUNT"));
				qna.setQna_date(rs.getString("QNA_DATE"));
				qna.setCnt(rs.getInt("cnt"));
				list.add(qna); // 값을 담은 객체를 리스트에 저장합니다.
				
			}
		} catch (Exception ex) {
			ex.printStackTrace();
			System.out.println("getQnaList() 에러: " + ex);
		} finally {
			if (rs != null)
				try {
					rs.close();
				} catch (SQLException ex) {
					ex.printStackTrace();
				}
			 if (pstmt != null)
		            try {
		               pstmt.close();
		            } catch (SQLException ex) {
		               ex.printStackTrace();
		            }
		         if (con != null)
		            try {
		               con.close();
		            } catch (SQLException ex) {
		               ex.printStackTrace();
		            }
		      }//finally   
		      return list;
	}// getQnaList()메서드 end
	
	// 조회수 업데이트 - 글번호에 해당하는 조회수를 1 증가합니다.
	public void setReadCountUpdate(int num) {
		Connection con = null;
		PreparedStatement pstmt = null;		
		String sql = "update qna "
				   + "set QNA_READCOUNT=QNA_READCOUNT+1 "
				   + "where QNA_NUM = ?";
		
		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, num);
			pstmt.executeUpdate();
		} catch (Exception ex) {
			ex.printStackTrace();
			System.out.println("setReadCountUpdate() 에러: " + ex);
		} finally {
			 if (pstmt != null)
		            try {
		               pstmt.close();
		            } catch (SQLException ex) {
		               ex.printStackTrace();
		            }
		         if (con != null)
		            try {
		               con.close();
		            } catch (SQLException ex) {
		               ex.printStackTrace();
		            }
		      }//finally 
	}//setReadCountUpdate()메서드 end

	public QnaBean getDetail(int num) {
		QnaBean qna = null;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs= null;
		try{
			con = ds.getConnection();    
			pstmt = con.prepareStatement("select * from QNA where QNA_NUM = ?");        
			pstmt.setInt(1, num);         
			rs= pstmt.executeQuery();         
			if (rs.next()) {
				qna = new QnaBean();
				qna.setQna_num(rs.getInt("QNA_NUM"));
				qna.setQna_name(rs.getString("QNA_NAME"));
				qna.setQna_subject(rs.getString("QNA_SUBJECT"));
				qna.setQna_content(rs.getString("QNA_CONTENT"));
				qna.setQna_file(rs.getString("QNA_FILE"));
				qna.setQna_re_ref(rs.getInt("QNA_RE_REF"));
				qna.setQna_re_lev(rs.getInt("QNA_RE_LEV"));
				qna.setQna_re_seq(rs.getInt("QNA_RE_SEQ"));
				qna.setQna_readcount(rs.getInt("QNA_READCOUNT"));
				qna.setQna_date(rs.getString("QNA_DATE"));
			}        			
		} catch(Exception ex){  
			ex.printStackTrace();
			System.out.println("getDetail 에러 : " + ex);      
		} finally{         
			if(rs!=null)
			   try { 
					rs.close();
				} catch( SQLException ex){
					ex.printStackTrace();
				}         
			if(pstmt !=null)
			   try { 
					pstmt.close();
				} catch (SQLException ex) {
					ex.printStackTrace();
				}        
			if(con!=null) 
			   try {
					con.close();
				} catch (SQLException ex){
					ex.printStackTrace();
				}      
		}
		return qna;
	}// getDetail()메서드 end

	// 글쓴이인지 확인 - 비밀번호로 확인합니다.
	public boolean isQnaWriter(int num, String pass) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		boolean result = false;
		String qna_sql = "select QNA_PASS from qna where QNA_NUM=?";
		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement(qna_sql);
			pstmt.setInt(1, num);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				if (pass.equals(rs.getString("QNA_PASS"))) {
					result = true;
				}
			}
		} catch(Exception ex) {
	         ex.printStackTrace();
	         System.out.println("isQnaWriter() 에러: " + ex);
	      }finally {
	         if(rs != null)
	            try {
	               rs.close();
	            }catch (SQLException ex) {
	               ex.printStackTrace();
	            }
	         if(pstmt != null)
	            try {
	               pstmt.close();
	            }catch (SQLException ex) {
	               ex.printStackTrace();
	            }
	         if(con != null)
	            try {
	               con.close();
	            }catch (SQLException ex) {
	               ex.printStackTrace();
	            }
	      }//finally   
		return result;
	}// isQnaWriter()메서드 end

	// 글 수정
	public boolean qnaModify(QnaBean modifyqna) {
		Connection con = null;
		PreparedStatement pstmt = null;
		String sql = "update qna "
				   + "set QNA_SUBJECT=?, QNA_CONTENT=?, QNA_FILE=? "
				   + "where QNA_NUM=? ";
		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, modifyqna.getQna_subject());
			pstmt.setString(2, modifyqna.getQna_content());
			pstmt.setString(3, modifyqna.getQna_file());
			pstmt.setInt(4, modifyqna.getQna_num());
			int result = pstmt.executeUpdate();
	         if(result == 1) {
	            System.out.println("성공 업데이트");
	            return true;
	         }
	      } catch (Exception ex) {
	         ex.printStackTrace();
	         System.out.println("qnaModify() 에러: " + ex);
	      } finally {
	         if(pstmt != null)
	            try {
	               pstmt.close();
	            }catch (SQLException ex) {
	               ex.printStackTrace();
	            }
	         if(con != null)
	            try {
	               con.close();
	            }catch (SQLException ex) {
	               ex.printStackTrace();
	            }
	      }//finally  
	       return false;  
	   }//qnaModify() 메서드 end

	// 글 답변
	public int qnaReply(QnaBean qna) {
		PreparedStatement pstmt = null;
		Connection con = null;
		ResultSet rs=null;
		int num = 0;
		
		// qna 테이블의 글번호를 구하기 위해 qna_num 컬럼의 최대값+1을 구해옵니다.
	    String qna_max_sql = "select max(qna_num)+1 from qna"; 
		/*
		 * 답변을 할 원문 글 그룹 번호 입니다.
		 * 답변을 달게 되면 답변 글은 이 번호와 같은 관련글 번호를 갖게 처리되면서
		 * 같은 그룹에 속하게 됩니다. 글 목록에서 보여줄때 하나의 그룹으로 묶여서 출력됩니다.
		 */
		int re_ref = qna.getQna_re_ref();
		
		/*
		 * 답글의 깊이를 의미합니다.
		 * 원문에 대한 답글이 출력될 때 한 번 들여쓰기 처리가 되고 답글에 대한 답글은 들여쓰기가 두번 처리되게
		 * 합니다. 원문인 경우에는 이 값이 0이고 원문의 답글은 1, 답글의 답글은 2가 됩니다.
		 */
		int re_lev = qna.getQna_re_lev();
		
		// 같은 관련 글 중에서 해당 글이 출력되는 순서입니다.
		int re_seq = qna.getQna_re_seq();
		
		try{
			con = ds.getConnection();
			
			// 트랜잭션을 이용하기 위해서 setAutoCommit을 false로 설정합니다.
			con.setAutoCommit(false);
			pstmt=con.prepareStatement(qna_max_sql);
			rs=pstmt.executeQuery();
			if(rs.next()) {
				num=rs.getInt(1);
			}
			pstmt.close();
			
			// QNA_RE_RFFE, QNA_RE_SEQ 값을 확인하여 원문 글에 다른 답글이 있으면
			// 다른 닯글들의 QNA_RE_SEQ값은 1씩 증가합니다.
			// 현재 글을 다른 답글보다 앞에 출력되게 하기 위해서 입니다.
			String sql = "update QNA " 
				       + "set    QNA_RE_SEQ = QNA_RE_SEQ + 1 " 
					   + "where  QNA_RE_REF = ? "
				  	   + "and    QNA_RE_SEQ > ?";
			
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, re_ref);
			pstmt.setInt(2, re_seq);
			pstmt.executeUpdate();
			pstmt.close();
			
			// 등록할 답변 글의 QNA_RE_LEV, QNA_RE_SEQ 값을 원문 글보다 1씩 증가시킵니다.
			re_seq = re_seq + 1;
			re_lev = re_lev + 1;
			
			sql = "insert into qna " 
				+ "(QNA_NUM,QNA_NAME,QNA_PASS,QNA_SUBJECT,"
				+ " QNA_CONTENT, QNA_FILE, QNA_RE_REF," 
				+ " QNA_RE_LEV, QNA_RE_SEQ, QNA_READCOUNT) "
				+ "values(" + num +","
				+ "  ?,?,?,"
				+ "	 ?,?,?,"
				+ "	 ?,?,?)";
			
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, qna.getQna_name());
			pstmt.setString(2, qna.getQna_pass());
			pstmt.setString(3, qna.getQna_subject());
			pstmt.setString(4, qna.getQna_content());
			pstmt.setString(5, ""); // 답변에는 파일을 업로드하지 않습니다.
			pstmt.setInt(6, re_ref);//원문의 글번호
			pstmt.setInt(7, re_lev);
			pstmt.setInt(8, re_seq);
			pstmt.setInt(9, 0); // QNA_READCOUNT(조회수)는 0
			if (pstmt.executeUpdate() == 1) {
			con.commit(); // commit합니다.
			}else {
				con.rollback();
			}
		} catch(Exception ex) {
			ex.printStackTrace();
	         System.out.println("qnaReply() 에러: " + ex);
	         if (con != null) {
	        	 try {
	    		  con.rollback(); // rollback합니다.
	        	 } catch (SQLException e) {
	        		 e.printStackTrace();
	        	 }
	         }	 
		} finally {
			if (rs != null)
		         try {
		               rs.close();
		         } catch (SQLException ex) {
		            ex.printStackTrace();
		         }
			if (pstmt != null)
		         try {
		               pstmt.close();
		         } catch (SQLException ex) {
		            ex.printStackTrace();
		         }
			if (con != null)
		         try {
		        	 con.setAutoCommit(true);
		        	 con.close();
		         } catch (SQLException ex) {
		        	 ex.printStackTrace();
		         }
		     }
			return num;
	}//qnaReply()메서드 end
	
	// 글 삭제
	public boolean qnaDelete(int num) {
		/*
	       * 삭제의 조건
	       * 1. 선택한 글과 같은 QNA_RE_REF 값을 갖는다.
	       * 2. 선택한 글과 같거나 높은 QNA_RE_LEV 값을 갖는다.
	       * 3. 선택한 글과 같거나 높은 QNA_RE_SEQ 값을 갖는다.
	       *    단, QNA_RE_SEQ 범위는 선택한 글과
	       *        QNA_RE_REF, QNA_RE_LEV 값이 같고 선택한 글의
	       *        QNA_RE_SEQ보다 큰 것들 중 가장 작은값에서 1을 뺀 값을 갖는다.
	       *        만약 존재하지 않으면 QNA_RE_REF 값 중 가장 큰 QNA_RE_SEQ값을 갖는다.
	       */
		
		Connection con = null;
		PreparedStatement pstmt = null, pstmt2 = null;
		ResultSet rs = null;
		String select_sql = "select QNA_RE_REF, QNA_RE_LEV, QNA_RE_SEQ "
						  + " from QNA"
						  + " where QNA_NUM=?";
		
		String QNA_delete_sql = "delete from QNA "
				+ "			 where  QNA_RE_REF = ?"
				+ " 		  and   QNA_RE_LEV >=?"
				+ "			  and   QNA_RE_SEQ >=?"
				+ " 		  and   QNA_RE_SEQ <=("
				+ "									nvl((SELECT min(QNA_re_seq)-1"
				+ "			                             FROM   QNA "
				+ " 		                             WHERE  QNA_RE_REF=? "
				+ "			                             AND    QNA_RE_LEV=? "
				+ " 		                             AND    QNA_RE_SEQ>?) , " 
				+ "			                            (SELECT max(QNA_re_seq) "
				+ " 		                             FROM   QNA "
				+ "                                    	 WHERE  QNA_RE_REF=? ))"
                + "			                        )";
		
      boolean result_check = false;
      try {
		  con = ds.getConnection();	
    	  pstmt = con.prepareStatement(select_sql);
    	  pstmt.setInt(1, num);
    	  rs = pstmt.executeQuery();
    	  if (rs.next()) {
    		pstmt2 = con.prepareStatement(QNA_delete_sql);
			pstmt2.setInt(1, rs.getInt("QNA_RE_REF"));
			pstmt2.setInt(2, rs.getInt("QNA_RE_LEV"));
			pstmt2.setInt(3, rs.getInt("QNA_RE_SEQ"));
			pstmt2.setInt(4, rs.getInt("QNA_RE_REF"));
			pstmt2.setInt(5, rs.getInt("QNA_RE_LEV"));
			pstmt2.setInt(6, rs.getInt("QNA_RE_SEQ"));
			pstmt2.setInt(7, rs.getInt("QNA_RE_REF"));
			
			int count=pstmt2.executeUpdate();
			
			if(count>=1)
				result_check = true;// 삭제가 안된 경우에는 false를 반환합니다.
    	  }			
      } catch (Exception ex) {
      	ex.printStackTrace();
      	System.out.println("qnaDelete() 에러: " + ex);
      } finally {
          if(rs != null)
              try {
                 rs.close();
              }catch (SQLException ex) {
                 ex.printStackTrace();
              }
           if(pstmt != null)
              try {
                 pstmt.close();
              }catch (SQLException ex) {
                 ex.printStackTrace();
              }
           if (pstmt2 != null)
		         try {
		               pstmt2.close();
		         } catch (SQLException ex) {
		            ex.printStackTrace();
		         }
           if(con != null)
              try {
                 con.close();
              }catch (SQLException ex) {
                 ex.printStackTrace();
              }
        }   
        return result_check;

	}// qnaDelte메서드 end

}// class end
