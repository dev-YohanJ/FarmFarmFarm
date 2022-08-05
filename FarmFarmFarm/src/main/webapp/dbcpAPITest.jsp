<%-- 1. Java naming and Directory Interface(JNDI)는
		Java 애플리케이션이 네트워크에서 이름(name)을 이용하여 
		객체롤 찾고 가져올 수 있도록 하는 표준 API이다.
		
		* jndi를 사용하면 Java 프로그램이나 jsp 페이지에서 
		응용 프로그램 내부 또는 외부에서 지정된 자원을 참조할 수 있다
		* 데이터베이스 커넥션 풀에서 사용하게 될 DataSource 객체는 
		네이밍 서비스를 통해 컨테이너에서 제공한다
		
	 2. DBCP(Database Connection Pool)
	 	데이터베이스와 연결될 커넥션을 미리 만들어서 풀(pool) 속에 저장해 두고 있다가
	 	필요할 때 커넥션을 풀에서 쓰고 다시 풀에 반환하는 기법을 말한다
	 	웹 프로그램에서는 데이터베이스의 환경설정과 연결 관리 등을 
	 	따로 xml 파일이나 속성 파일을 이용해서 관리하고,
	 	이렇게 설정된 정보는 이름을 사용하여 획득하는 방법을 사용한다
		
		* DBCP를 이용한 커넥션 풀을 사용하기 위해 먼저 톰캣에 DataSource를 등록해야 한다.
		  context.xml(애플리케이션 컨텍스트와 관련된 설정을 하는 파일)에서 등록할 수 있으며
		  위치는 META-INF에 저장한다
		
		* DBCP 라이브러리 : tomcat-dbcp.jar 파일
		
	 3. DataSource 이용 방법
	 	(1) lookup() 메소드를 통해 DataSource 객체를 얻어온다
	 		DataSource ds = (DataSource) init.lookup("java:comp/env/jdbc/OracleDB);
	 	(2) DataSource 객체의 getConnection()메소드를 통해서
	 		Connection Pool에서 Connection을 획득한다
	 	(3) Connection 객체를 통한 DBMS 작업을 수행한다
	 	(4) 모든 작업이 끝나면 DataSource 객체를 통해서 Connection Pool에 Connection을 반납한다
 --%>
<%@ page language="java" contentType="text/html; charset=UTF-8" %>

<%-- Connection 객체와 JNDI를 사용하기 위한 패키지를 import --%>
<%-- 일반 db 작업을 위해 import --%>
<%@ page import="java.sql.*" %>

<%-- javax.sql.DataSource 객체를 사용하기 위해 import --%>
<%@ page import="javax.sql.*" %>

<%-- JNDI 작업을 하기 위해 import --%>
<%@ page import="javax.naming.*" %>
<%
	Connection conn = null;
	try {
		Context init = new InitialContext();
		DataSource ds = (DataSource) init.lookup("java:comp/env/jdbc/OracleDB");
		conn = ds.getConnection();
		out.println("<h3>커넥션 풀에 연결되었습니다.</h3>");
		conn.close();
		/* Class.forName("oracle.jdbc.driver.OracleDriver");
		String url = "jdbc:oracle:thin:@DB20220615_medium?TNS_ADMIN=/Users/yohan/Desktop/Workspace/Wallet_DB20220615";
		conn = DriverManager.getConnection(url, "ADMIN", "asdfASDF1234!@#$"); */
	} catch (Exception e) {
		out.println("<h3>커넥션 풀 연결에 실패하였습니다.</h3>");
		e.printStackTrace();
	} 
%>