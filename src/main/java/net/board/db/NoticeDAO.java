package net.board.db;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class NoticeDAO {
	private DataSource ds;
	
	// 생성자에서 JNDI 리소스를 참조하여 Connection 객체를 얻어옵니다.
	public NoticeDAO() {
		try {
			Context init = new InitialContext();
			ds = (DataSource) init.lookup("java:comp/env/jdbc/OracleDB");
		} catch (Exception ex) {
			System.out.println("DB 연결 실패 : " + ex);
			return;
		}
	}
	
	public boolean noticeInsert(NoticeBean notice) {
		Connection con = null;
		PreparedStatement pstmt = null;
		int result=0;
		try {
			con = ds.getConnection();
			
			String max_sql = "(select nvl(max(notice_num),0)+1 from notice)";

			// 원문글의 NOTICE_RE_REF 필드는 자신의 글번호 입니다.
			String sql = "insert into notice " 
			            + "(NOTICE_NUM,     NOTICE_NAME,  NOTICE_PASS,    NOTICE_SUBJECT,"
					    + " NOTICE_CONTENT, NOTICE_FILE,  NOTICE_RE_REF," 
			            + " NOTICE_RE_LEV,  NOTICE_RE_SEQ,NOTICE_READCOUNT)"
					    + " values(" + max_sql + ",?,?,?," 
			            + "        ?,?," +   max_sql  + "," 
					    + "        ?,?,?)";

			 // 새로운 글을 등록하는 부분입니다.
			 pstmt = con.prepareStatement(sql);
			 pstmt.setString(1, notice.getNotice_name());
	         pstmt.setString(2, notice.getNotice_pass());
	         pstmt.setString(3, notice.getNotice_subject());
	         pstmt.setString(4, notice.getNotice_content());
	         pstmt.setString(5, notice.getNotice_file());
	         
	         // 원문의 경우 NOTICE_RE_LEV, NOTICE_RE_SEQ 필드 값은 0 입니다.
	         pstmt.setInt(6, 0); // NOTICE_RE_LEV 필드
	         pstmt.setInt(7, 0); // NOTICE_RE_SEQ 필드
	         pstmt.setInt(8, 0); // NOTICE_READCOUNT 필드
	         
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
	}// noticeInsert()메서드 end
	
	// 글의 갯수 구하기
	public int getListCount() {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs= null;
		int x = 0;
		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement("select count(*) from notice");
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
	public List<NoticeBean> getNoticeList(int page, int limit) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs= null;

		// page : 페이지
		// limit : 페이지 당 목록의 수
		// notice_re_ref desc, notice_re_seq asc에 의한 정렬한 것을
		// 조건절에 맞는 rnum의 범위 만큼 가져오는 쿼리문입니다.
		
		String notice_list_sql = "select * " 
                + "  from  (select rownum rnum, j.* "
                + "         from (select notice.*,  nvl(cnt,0) cnt "
	            + "               from notice left outer join (select comment_notice_num,count(*) cnt"
                + "                                           from comm"
                + "                                           group by comment_notice_num)"
                + "               on notice_num=comment_notice_num"
	            + "               order by NOTICE_RE_REF desc,"
                + "               NOTICE_RE_SEQ asc) j "
	            + "         where rownum<= ? "      
	            + "         ) "
	            + " where rnum>=? and rnum<=?";

		
		List<NoticeBean> list = new ArrayList<NoticeBean>();
		// 한 페이지당 10개씩 목록인 경우 1페이지, 2페이지, 3페이지, 4페이지 ...
		int startrow = (page -1) * limit + 1; // 일기 시작할 row 번호(1 11 21 31 ...
		int endrow = startrow + limit - 1;	 // 읽을 마지막 row 번호(10 20 30 40 ...
		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement(notice_list_sql);
			pstmt.setInt(1, endrow);
			pstmt.setInt(2, startrow);
			pstmt.setInt(3, endrow);
			rs = pstmt.executeQuery();

			// DB에서 가져온 데이터를 VO객체에 담습니다.
			while (rs.next()) {
				NoticeBean notice = new NoticeBean();
				notice.setNotice_num(rs.getInt("Notice_NUM"));
				notice.setNotice_name(rs.getString("NOTICE_NAME"));
				notice.setNotice_subject(rs.getString("NOTICE_SUBJECT"));
				notice.setNotice_content(rs.getString("NOTICE_CONTENT"));
				notice.setNotice_file(rs.getString("NOTICE_FILE"));
				notice.setNotice_re_ref(rs.getInt("NOTICE_RE_REF"));
				notice.setNotice_re_lev(rs.getInt("NOTICE_RE_LEV"));
				notice.setNotice_re_seq(rs.getInt("NOTICE_RE_SEQ"));
				notice.setNotice_readcount(rs.getInt("NOTICE_READCOUNT"));
				notice.setNotice_date(rs.getString("NOTICE_DATE"));
				notice.setCnt(rs.getInt("cnt"));
				list.add(notice); // 값을 담은 객체를 리스트에 저장합니다.
				
			}
		} catch (Exception ex) {
			ex.printStackTrace();
			System.out.println("getNoticeList() 에러: " + ex);
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
	}// getnoticeList()메서드 end
	
	// 조회수 업데이트 - 글번호에 해당하는 조회수를 1 증가합니다.
	public void setReadCountUpdate(int num) {
		Connection con = null;
		PreparedStatement pstmt = null;		
		String sql = "update notice "
				   + "set NOTICE_READCOUNT=NOTICE_READCOUNT+1 "
				   + "where NOTICE_NUM = ?";
		
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

	public NoticeBean getDetail(int num) {
		NoticeBean notice = null;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs= null;
		try{
			con = ds.getConnection();    
			pstmt = con.prepareStatement("select * from notice where NOTICE_NUM = ?");        
			pstmt.setInt(1, num);         
			rs= pstmt.executeQuery();         
			if (rs.next()) {
				notice = new NoticeBean();
				notice.setNotice_num(rs.getInt("NOTICE_NUM"));
				notice.setNotice_name(rs.getString("NOTICE_NAME"));
				notice.setNotice_subject(rs.getString("NOTICE_SUBJECT"));
				notice.setNotice_content(rs.getString("NOTICE_CONTENT"));
				notice.setNotice_file(rs.getString("NOTICE_FILE"));
				notice.setNotice_re_ref(rs.getInt("NOTICE_RE_REF"));
				notice.setNotice_re_lev(rs.getInt("NOTICE_RE_LEV"));
				notice.setNotice_re_seq(rs.getInt("NOTICE_RE_SEQ"));
				notice.setNotice_readcount(rs.getInt("NOTICE_READCOUNT"));
				notice.setNotice_date(rs.getString("NOTICE_DATE"));
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
		return notice;
	}// getDetail()메서드 end

	// 글쓴이인지 확인 - 비밀번호로 확인합니다.
	public boolean isnoticeWriter(int num, String pass) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		boolean result = false;
		String NOTICE_sql = "select NOTICE_PASS from notice where NOTICE_NUM=?";
		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement(NOTICE_sql);
			pstmt.setInt(1, num);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				if (pass.equals(rs.getString("NOTICE_PASS"))) {
					result = true;
				}
			}
		} catch(Exception ex) {
	         ex.printStackTrace();
	         System.out.println("isNoticeWriter() 에러: " + ex);
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
	}// isnoticeWriter()메서드 end

	// 글 수정
	public boolean noticeModify(NoticeBean modifynotice) {
		Connection con = null;
		PreparedStatement pstmt = null;
		String sql = "update notice "
				   + "set NOTICE_SUBJECT=?, NOTICE_CONTENT=?, NOTICE_FILE=? "
				   + "where NOTICE_NUM=? ";
		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, modifynotice.getNotice_subject());
			pstmt.setString(2, modifynotice.getNotice_content());
			pstmt.setString(3, modifynotice.getNotice_file());
			pstmt.setInt(4, modifynotice.getNotice_num());
			int result = pstmt.executeUpdate();
	         if(result == 1) {
	            System.out.println("성공 업데이트");
	            return true;
	         }
	      } catch (Exception ex) {
	         ex.printStackTrace();
	         System.out.println("noticeModify() 에러: " + ex);
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
	   }//noticeModify() 메서드 end

	// 글 답변
	public int noticeReply(NoticeBean notice) {
		PreparedStatement pstmt = null;
		Connection con = null;
		ResultSet rs=null;
		int num = 0;
		
		// notice 테이블의 글번호를 구하기 위해 NOTICE_num 컬럼의 최대값+1을 구해옵니다.
	    String NOTICE_max_sql = "select max(notice_num)+1 from notice"; 
		/*
		 * 답변을 할 원문 글 그룹 번호 입니다.
		 * 답변을 달게 되면 답변 글은 이 번호와 같은 관련글 번호를 갖게 처리되면서
		 * 같은 그룹에 속하게 됩니다. 글 목록에서 보여줄때 하나의 그룹으로 묶여서 출력됩니다.
		 */
		int re_ref = notice.getNotice_re_ref();
		
		/*
		 * 답글의 깊이를 의미합니다.
		 * 원문에 대한 답글이 출력될 때 한 번 들여쓰기 처리가 되고 답글에 대한 답글은 들여쓰기가 두번 처리되게
		 * 합니다. 원문인 경우에는 이 값이 0이고 원문의 답글은 1, 답글의 답글은 2가 됩니다.
		 */
		int re_lev = notice.getNotice_re_lev();
		
		// 같은 관련 글 중에서 해당 글이 출력되는 순서입니다.
		int re_seq = notice.getNotice_re_seq();
		
		try{
			con = ds.getConnection();
			
			// 트랜잭션을 이용하기 위해서 setAutoCommit을 false로 설정합니다.
			con.setAutoCommit(false);
			pstmt=con.prepareStatement(NOTICE_max_sql);
			rs=pstmt.executeQuery();
			if(rs.next()) {
				num=rs.getInt(1);
			}
			pstmt.close();
			
			// NOTICE_RE_RFFE, NOTICE_RE_SEQ 값을 확인하여 원문 글에 다른 답글이 있으면
			// 다른 닯글들의 NOTICE_RE_SEQ값은 1씩 증가합니다.
			// 현재 글을 다른 답글보다 앞에 출력되게 하기 위해서 입니다.
			String sql = "update notice " 
				       + "set    NOTICE_RE_SEQ = NOTICE_RE_SEQ + 1 " 
					   + "where  NOTICE_RE_REF = ? "
				  	   + "and    NOTICE_RE_SEQ > ?";
			
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, re_ref);
			pstmt.setInt(2, re_seq);
			pstmt.executeUpdate();
			pstmt.close();
			
			// 등록할 답변 글의 NOTICE_RE_LEV, NOTICE_RE_SEQ 값을 원문 글보다 1씩 증가시킵니다.
			re_seq = re_seq + 1;
			re_lev = re_lev + 1;
			
			sql = "insert into notice " 
				+ "(NOTICE_NUM,NOTICE_NAME,NOTICE_PASS,NOTICE_SUBJECT,"
				+ " NOTICE_CONTENT, NOTICE_FILE, NOTICE_RE_REF," 
				+ " NOTICE_RE_LEV, NOTICE_RE_SEQ, NOTICE_READCOUNT) "
				+ "values(" + num +","
				+ "  ?,?,?,"
				+ "	 ?,?,?,"
				+ "	 ?,?,?)";
			
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, notice.getNotice_name());
			pstmt.setString(2, notice.getNotice_pass());
			pstmt.setString(3, notice.getNotice_subject());
			pstmt.setString(4, notice.getNotice_content());
			pstmt.setString(5, ""); // 답변에는 파일을 업로드하지 않습니다.
			pstmt.setInt(6, re_ref);//원문의 글번호
			pstmt.setInt(7, re_lev);
			pstmt.setInt(8, re_seq);
			pstmt.setInt(9, 0); // NOTICE_READCOUNT(조회수)는 0
			if (pstmt.executeUpdate() == 1) {
			con.commit(); // commit합니다.
			}else {
				con.rollback();
			}
		} catch(Exception ex) {
			ex.printStackTrace();
	         System.out.println("noticeReply() 에러: " + ex);
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
	}//noticeReply()메서드 end
	
	// 글 삭제
	public boolean noticeDelete(int num) {
		/*
	       * 삭제의 조건
	       * 1. 선택한 글과 같은 NOTICE_RE_REF 값을 갖는다.
	       * 2. 선택한 글과 같거나 높은 NOTICE_RE_LEV 값을 갖는다.
	       * 3. 선택한 글과 같거나 높은 NOTICE_RE_SEQ 값을 갖는다.
	       *    단, NOTICE_RE_SEQ 범위는 선택한 글과
	       *        NOTICE_RE_REF, NOTICE_RE_LEV 값이 같고 선택한 글의
	       *        NOTICE_RE_SEQ보다 큰 것들 중 가장 작은값에서 1을 뺀 값을 갖는다.
	       *        만약 존재하지 않으면 NOTICE_RE_REF 값 중 가장 큰 NOTICE_RE_SEQ값을 갖는다.
	       */
		
		Connection con = null;
		PreparedStatement pstmt = null, pstmt2 = null;
		ResultSet rs = null;
		String select_sql = "select NOTICE_RE_REF, NOTICE_RE_LEV, NOTICE_RE_SEQ "
						  + " from notice"
						  + " where NOTICE_NUM=?";
		
		String notice_delete_sql = "delete from notice "
				+ "			 where  NOTICE_RE_REF = ?"
				+ " 		  and   NOTICE_RE_LEV >=?"
				+ "			  and   NOTICE_RE_SEQ >=?"
				+ " 		  and   NOTICE_RE_SEQ <=("
				+ "									nvl((SELECT min(NOTICE_re_seq)-1"
				+ "			                             FROM   notice "
				+ " 		                             WHERE  NOTICE_RE_REF=? "
				+ "			                             AND    NOTICE_RE_LEV=? "
				+ " 		                             AND    NOTICE_RE_SEQ>?) , " 
				+ "			                            (SELECT max(NOTICE_re_seq) "
				+ " 		                             FROM   notice "
				+ "                                    	 WHERE  NOTICE_RE_REF=? ))"
                + "			                        )";
		
      boolean result_check = false;
      try {
		  con = ds.getConnection();	
    	  pstmt = con.prepareStatement(select_sql);
    	  pstmt.setInt(1, num);
    	  rs = pstmt.executeQuery();
    	  if (rs.next()) {
    		pstmt2 = con.prepareStatement(notice_delete_sql);
			pstmt2.setInt(1, rs.getInt("NOTICE_RE_REF"));
			pstmt2.setInt(2, rs.getInt("NOTICE_RE_LEV"));
			pstmt2.setInt(3, rs.getInt("NOTICE_RE_SEQ"));
			pstmt2.setInt(4, rs.getInt("NOTICE_RE_REF"));
			pstmt2.setInt(5, rs.getInt("NOTICE_RE_LEV"));
			pstmt2.setInt(6, rs.getInt("NOTICE_RE_SEQ"));
			pstmt2.setInt(7, rs.getInt("NOTICE_RE_REF"));
			
			int count=pstmt2.executeUpdate();
			
			if(count>=1)
				result_check = true;// 삭제가 안된 경우에는 false를 반환합니다.
    	  }			
      } catch (Exception ex) {
      	ex.printStackTrace();
      	System.out.println("noticeDelete() 에러: " + ex);
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

	}// noticeDelte메서드 end

}// class end
