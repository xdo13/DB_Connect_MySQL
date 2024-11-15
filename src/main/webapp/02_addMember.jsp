<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%!
	Connection con = null;
	PreparedStatement pstmt = null;
	
	String url = "jdbc:mysql://127.0.0.1:3306/estore";
	String uid = "dbuser";
	String pass = "12345";
	String sql = "insert into member values(?,?,?,?,?,?)";
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	request.setCharacterEncoding("utf-8");

	String name = request.getParameter("username");
	String userid = request.getParameter("userid");
	String pwd = request.getParameter("pwd");
	String email = request.getParameter("email");
	String phone = request.getParameter("phone");
	String admin = request.getParameter("admin");
	
	try{
		Class.forName("com.mysql.cj.jdbc.Driver");
		con = DriverManager.getConnection(url, uid, pass);
		System.out.println("con :" + con);
		pstmt = con.prepareStatement(sql);
		
		pstmt.setString(1, name);
		pstmt.setString(2, userid);
		pstmt.setString(3, pwd);
		pstmt.setString(4, email);
		pstmt.setString(5, phone);
		pstmt.setInt(6, Integer.parseInt(admin));
		
		int result = pstmt.executeUpdate();
		System.out.println("result : " +result);
	}catch(Exception e){
		e.getMessage();
		System.out.println("e.getMessage()==> : " + e.getMessage());
	}finally{
		try{
			if( pstmt != null) pstmt.close();
			if( con != null) con.close();
		}catch(Exception e){
			e.getMessage();
		}
	}
%>
<h3>회원가입 성공!!</h3>
<a href="01_allMember.jsp">전체회원 목록 보기</a>

</body>
</html>