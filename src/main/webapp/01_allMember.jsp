<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
 <%!
 	Connection con = null;
 	Statement stmt = null;
 	ResultSet rs = null;
 	
 // String url = "jdbc:oracle:thin:@localhost:1521:xe"; //오라클 url
 
 	String url = "jdbc:mysql://127.0.0.1:3306/estore";  //estore ->스키마(db)명
 	
 	String uid= "dbuser";
 	String pwd = "12345";
 	String sql = "select * from member";
 	
 %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<table width ="800" border="1">
	<tr>
		<th>이름</th><th>아이디</th><th>암호</th>
		<th>이메일</th><th>전화번호</th><th>권한(1:관리자, 0:일반회원)</th>
	</tr>
	<%
		try{
	//		Class.forName("oracle.jdbc.driver.OracleDriver");
			Class.forName("com.mysql.cj.jdbc.Driver");
			con = DriverManager.getConnection(url, uid, pwd);
			
			System.out.println("mysql 연결 성공 : " +con);
			
			stmt = con.createStatement();
			rs = stmt.executeQuery(sql);
			
			while(rs.next()){
				out.println("<tr>");
				out.println("<td>" + rs.getString("username")+ "</td>");
				out.println("<td>" + rs.getString("userid")+ "</td>");
				out.println("<td>" + rs.getString("pwd")+ "</td>");
				out.println("<td>" + rs.getString("email")+ "</td>");
				out.println("<td>" + rs.getString("phone")+ "</td>");
				out.println("<td>" + rs.getString("admin")+ "</td>");
			  /*out.println("<tr>" + rs.getString(1)+ "</td>");
				out.println("<tr>" + rs.getString(2)+ "</td>");
				out.println("<tr>" + rs.getString(3)+ "</td>");
				out.println("<tr>" + rs.getString(4)+ "</td>");
				out.println("<tr>" + rs.getString(5)+ "</td>");
				out.println("<tr>" + rs.getInt(6)+ "</td>"); */
				out.println("</tr>");
				}
		}catch(Exception e){
			e.getMessage();
		}finally{
			try{
				if(rs != null) rs.close();
				if(stmt != null) stmt.close();
				if(con != null) con.close();
			}catch(Exception e){
				e.getMessage();
			}
		}
	%>
</table>

</body>
</html>