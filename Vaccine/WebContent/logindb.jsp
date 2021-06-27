<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

 <%@page import="java.sql.*,java.util.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  
<%
try
{
String sname=request.getParameter("name");
String spass=request.getParameter("password");
if(sname.equals("")){
	out.write("alert('Enter Username !!')");
}
if(spass.equals("")){
	out.write("alert('Enter Password !!')");
}
if(!sname.equals("") && !spass.equals(""))
{
Class.forName("com.mysql.jdbc.Driver");
Connection con=DriverManager.getConnection(  
"jdbc:mysql://localhost:3306/covid","root","");  
Statement stmt=con.createStatement();  
String sql="select * from login_data where username='"+sname+"' and password ='"+spass+"'";
ResultSet rs= stmt.executeQuery(sql);
while(rs.next()){
	int status=rs.getInt("status");
	if(status==0){
	 session.setAttribute("username",sname);
	 session.setAttribute("statusAdmin",0);
	 response.sendRedirect("./index.jsp");
	}
	if(status==1){
	response.sendRedirect("./slogin.jsp");
	}
	if(status==2){
	response.sendRedirect("./clogin.jsp");
	}
}
if(!rs.next()){
	out.write("alert('Invalid Username or Password !!')");
}
}
}
catch(Exception e)
{
System.out.print(e);
e.printStackTrace();
}
%>