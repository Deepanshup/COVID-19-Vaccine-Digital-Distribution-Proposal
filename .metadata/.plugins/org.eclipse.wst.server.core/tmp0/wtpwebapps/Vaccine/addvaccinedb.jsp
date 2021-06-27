<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

 <%@page import="java.sql.*,java.util.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  
<%
try
{
	if(session.getAttribute("username") == null) {
	       response.sendRedirect("login.jsp");
	       return ;
	    }
String sname=request.getParameter("name");
String snov=request.getParameter("nov");
String sprice=request.getParameter("price");
String sage=request.getParameter("age");

Class.forName("com.mysql.jdbc.Driver");
Connection con=DriverManager.getConnection(  
"jdbc:mysql://localhost:3306/covid","root","");  
Statement stmt=con.createStatement();  
String sql="insert into vaccine(no_of_vaccine,company,price,age) values('"+snov+"','"+sname+"','"+sprice+"','"+sage+"')";
stmt.executeUpdate(sql);
out.println("Data is successfully inserted!");
}
catch(Exception e)
{
System.out.print(e);
e.printStackTrace();
}
%>