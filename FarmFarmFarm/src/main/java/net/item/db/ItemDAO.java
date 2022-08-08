package net.item.db;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

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
				item.setItem_file(rs.getString("item_file"));
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
	
}
