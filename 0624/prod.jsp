<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String lprodGu = request.getParameter("gu");

	Class.forName("oracle.jdbc.driver.OracleDriver");
	String url = "jdbc:oracle:thin:@loacalhost:1521:xe";
	Connection conn = DriverManager.getConnection(url,"LHR91","java");
	Statement stmt = conn.createStatement();
	String sql = "select prod_id, prod_name from prod" +
			"where prod_lgu = '" + lprodGu + "'";
	ResultSet rs = stmt.executeQuery(sql);
	
	if(rs.next()){
		//데이터o
%>
		{
			"code" : "ok",
			"data" : [{},{},{},{},{}]
		}
<%
	}else {
		//데이터x
%>
		{
			"code" : "no"
		}
<%
	} //if end

%>