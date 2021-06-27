
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
String spopulation=request.getParameter("population");
String stcp=request.getParameter("tcp");
String stcw=request.getParameter("tcw");
String srp=request.getParameter("rp");
String ssel=request.getParameter("sel");

Class.forName("com.mysql.jdbc.Driver");
Connection con=DriverManager.getConnection(  
"jdbc:mysql://localhost:3306/covid","root",""); 

Statement stmt=con.createStatement(); 
Statement stmt1=con.createStatement();

String sql="Select id from state where name='"+ssel+"'"; 
ResultSet rs= stmt.executeQuery(sql);
while(rs.next()){
String stateid=rs.getString("id");
String sqll="insert into city(population,name,cp,cw,op,s_id) values('"+spopulation+"','"+sname+"','"+stcp+"','"+stcw+"','"+srp+"','"+stateid+"') ";
stmt.executeUpdate(sqll);
response.sendRedirect("./addcity2.jsp");
}
}
catch(Exception e)
{
System.out.print(e);
e.printStackTrace();
}
%>