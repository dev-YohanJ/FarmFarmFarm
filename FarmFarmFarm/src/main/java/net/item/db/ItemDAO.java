package net.item.db;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.*;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class ItemDAO {
	private DataSource ds;
	
	public ItemDAO() {
		try {
			Context init = new InitialContext();
			ds = (DataSource) init.lookup("java:comp/env/jdbc/OracleDB");
			
		} catch (Exception ex) {
			System.out.println("DB 연결 실패 : " + ex);
		}
	}
	
	//main -> item.tem 이동 pg.
	public Item item_info(int id) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		Item item = null;
		try {
			con = ds.getConnection();
			String sql = "select * from item where item_id = ? ";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, id);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				item = new Item();
				item.setItem_id(rs.getInt("item_id"));
				item.setItem_name(rs.getString("item_name"));
				item.setItem_price(rs.getInt("item_price"));
				item.setItem_stock(rs.getInt("item_stock"));
				item.setItem_file1(rs.getString("item_file1"));
				item.setItem_file2(rs.getString("item_file2"));
				item.setItem_file3(rs.getString("item_file3"));
				item.setItem_file4(rs.getString("item_file4"));
				item.setItem_description(rs.getString("item_description"));
				return item;
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (rs != null)
				try {
					rs.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			if (pstmt != null)
				try {
					pstmt.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			if (con != null)
				try {
					con.close();
				} catch (Exception e) {
					e.printStackTrace();
				}
		}
		return null;
	}
	

	//ItemListAction.java -> (main->list pg) : 글 목록 보기 
	public List<Item> getList(int page, int limit) {
		List<Item> list = new ArrayList<Item>();
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			con = ds.getConnection();
			
			String sql = "select * "
					+ "	  from (select i.*, rownum rnum"
					+ " 	 	 from (select * from item "
					+ "		  			order by item_id) i"
					+ "		 	)"
					+ " where rnum>=? and rnum<=?";
			
			pstmt = con.prepareStatement(sql);
			
			//한페이지당 10개씩 목록인 경우 1페이지, 2페이지, 3페이지... 
			int startrow = (page -1) * limit + 1;		//읽기 시작할 row 번호 (1 11 21 31 ...)
			int endrow = startrow + limit -1;			//읽을 마지막 row 번호 (10 20 30 40 ...)
			
			pstmt.setInt(1, startrow);
			pstmt.setInt(2, endrow);		//김밥통에 넣어요 
			rs = pstmt.executeQuery();	
			
			//DB에서 가져온 데이터를 VO객체에 담습니다. 보여주고싶은것만 담아도 됍니다 !! 
			while (rs.next()) {
				Item i = new Item();
				i.setItem_id(rs.getInt(1));			//(상품번호)
				i.setItem_name(rs.getString(2));	//(상품명)
				i.setItem_price(rs.getInt(3));		//(상품가)
				i.setItem_discount(rs.getInt(4));	//(할인가)
				i.setItem_type(rs.getString(5));	//(종류)
				i.setItem_regdate(rs.getString(6));	//(등록일)
				i.setItem_file1(rs.getString(7));	//(상품이미지)
				i.setItem_sale(rs.getInt(8));	//(할인율)
				
				list.add(i);		//값을 담은 객체를 리스트에 저장합니다. 
			}
			
		} catch(Exception ex) {
			ex.printStackTrace();
			System.out.println("getList() 에러 : " + ex);
		}finally {
			if(rs != null)
				try {
					rs.close();
				} catch(SQLException e) {
					System.out.println(e.getMessage());
				}
			if(pstmt != null)
				try {
					pstmt.close();
				} catch(SQLException e) {
					System.out.println(e.getMessage());
				}			
			if(con != null)
				try {
					con.close();
				} catch(Exception e) {
					System.out.println(e.getMessage());
				}
		}//finally end;
		return list;
	}

	//ItemListAction.java -> (main->list pg) : 전체상품수 보기 
	public int getListCount() {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int x = 0;
		try {
			con = ds.getConnection();
			
			String sql = "select count(*) from item ";	
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				x = rs.getInt(1);
			}
		} catch(Exception ex) {
			ex.printStackTrace();
			System.out.println("getListCount() 에러 : " + ex);
		}finally {
			try {
				if (rs != null)
					rs.close();
			}catch(SQLException e) {
				System.out.println(e.getMessage());
			}
			try {
				if(pstmt != null)
					pstmt.close();
			}catch(SQLException e) {
				System.out.println(e.getMessage());
			}
			try {
				if(con != null)
					con.close();
			}catch(Exception e) {
				System.out.println(e.getMessage());
			}
		}//finally end;
		return x;
	}
}
