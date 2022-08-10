package net.cart.db;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import net.item.db.Item;

public class CartDAO {
	private DataSource ds;
	
	public CartDAO() {
		try {
			Context init = new InitialContext();
			ds = (DataSource) init.lookup("java:comp/env/jdbc/OracleDB");
		} catch (Exception ex) {
			System.out.println("DB 연결 실패 : " + ex);
		}
	}

	public int addCart(Cart c) {
		Connection con = null;
		PreparedStatement pstmt = null;
		int result = 0;
		try {
			con = ds.getConnection();
			String sql = "insert into cart"
					   + "values(cart_seq.nextval, ?, ?, ?);";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, c.getCart_mem_id());
			pstmt.setInt(2, c.getCart_item_id());
			pstmt.setInt(3, c.getCart_quantity());
			result = pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
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
		return result;
	}

	public ArrayList<Cart> getCartList(String memid) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		Cart cart = null;
		ArrayList<Cart> list = null;
		try {
			con = ds.getConnection();
			String sql = "select c.cart_id, c.cart_mem_id, c.cart_item_id, c.cart_quantity, i.ITEM_NAME, i.ITEM_PRICE, i.ITEM_FILE1 "
						+ "from cart c left outer join item i "
						+ "on c.cart_item_id = i.ITEM_ID "
						+ "where cart_mem_id = ? ";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, memid);
			rs = pstmt.executeQuery();
			int i = 0;
			while (rs.next()) {
				if (i++ == 0) {
					list = new ArrayList<Cart>();
				}
				cart = new Cart();
				cart.setCart_id(rs.getInt(1));
				cart.setCart_mem_id(rs.getString(2));
				cart.setCart_item_id(rs.getInt(3));
				cart.setCart_quantity(rs.getInt(4));
				cart.setItem_name(rs.getString(5));
				cart.setItem_price(rs.getInt(6));
				cart.setItem_file1(rs.getString(7));
				list.add(cart);
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
		return list;
	}
//
//	public ArrayList<Item> cartItemList(ArrayList<Cart> cartlist) {
//		Connection con = null;
//		PreparedStatement pstmt = null;
//		ResultSet rs = null;
//		Item item = null;
//		ArrayList<Item> list = null;
//		int a = 0;
//		try {
//			for (int i=0;i<cartlist.size();i++) {
//				con = ds.getConnection();
//				String sql = "select * from item where item_id = ?";
//				pstmt = con.prepareStatement(sql);
//				pstmt.setInt(1, cartlist.get(i).getCart_item_id());
//				rs = pstmt.executeQuery();
//				while (rs.next()) {
//					if (a++ == 0) {
//						list = new ArrayList<Item>();
//					}
//					item = new Item();
//					item.setItem_id(rs.getInt("item_id"));
//					item.setItem_name(rs.getString("item_name"));
//					item.setItem_price(rs.getInt("item_price"));
//					item.setItem_stock(rs.getInt("item_stock"));
//					item.setItem_file(rs.getString("item_file"));
//					item.setItem_description(rs.getString("item_description"));
//					list.add(item);
//				}
//			}
//			
//		} catch (Exception e) {
//			e.printStackTrace();
//		} finally {
//			if (rs != null)
//				try {
//					rs.close();
//				} catch (SQLException e) {
//					e.printStackTrace();
//				}
//			if (pstmt != null)
//				try {
//					pstmt.close();
//				} catch (SQLException e) {
//					e.printStackTrace();
//				}
//			if (con != null)
//				try {
//					con.close();
//				} catch (Exception e) {
//					e.printStackTrace();
//				}
//		}
//		return list;
//	}
	
}
