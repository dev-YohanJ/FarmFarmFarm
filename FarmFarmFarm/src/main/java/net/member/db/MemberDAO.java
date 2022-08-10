package net.member.db;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class MemberDAO {
	
	public int isID_exit(String id) {
	
	
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs =null;
	int result =0; // 존재하지 않는 경우 사용할수있다.
	
	
	try {
		
//context.xml에 리소스를 생성해 놓은(JNDI에 설정해 놓은) OracleDB를 참조하여 커넥션 객체 얻기
		Context init =  new InitialContext();
		DataSource ds = (DataSource)init.lookup("java:comp/env/jdbc/OracleDB");
		conn = ds.getConnection();
		
		String select_sql = "select * from test_table where id = ? ";
		//쿼리문 실행 확인.
		
		
		
		//PreparedStatement 객체 얻기
		
		pstmt = conn.prepareStatement(select_sql.toString());
		pstmt.setString(1, id);
		rs=pstmt.executeQuery();
		
		
		if(rs.next() || id.equals("")) {
				result = 1; //이미 존재하거나 "" 이라면
			
			}else {
				result = 0; //사용할수있다 라는 
			}
		System.out.println("볼수있나요? dao에서"+result);
	}catch(Exception se) {
		se.printStackTrace();
	}finally {
		
		try {
			if(rs!=null)
				rs.close();
		}catch(SQLException e) {
			System.out.println(e.getMessage());
		}
	
		
		try {
			if(pstmt!=null)
				pstmt.close();
		}catch(SQLException e) {
			System.out.println(e.getMessage());
		}
	
		
		try {
			if(conn!=null)
				conn.close();
			//4단계 db 연결을 끊는다.
			
		}catch(Exception e) {
			System.out.println(e.getMessage());
		}
			
		
		
		
		
	}
	return result;
	
}//isID_exit

	

}
