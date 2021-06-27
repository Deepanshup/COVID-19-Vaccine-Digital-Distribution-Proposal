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
		}else if(spass.equals("")){
			out.write("alert('Enter Password !!')");
		}else if(!sname.equals("") && !spass.equals("")) {
			Class.forName("com.mysql.jdbc.Driver");
			Connection con=DriverManager.getConnection(  
			"jdbc:mysql://localhost:3306/covid","root","");  
			Statement stmt=con.createStatement();  
			String sql="select * from hospital where name='"+sname+"' and ward='"+spass+"' ";
			ResultSet rs= stmt.executeQuery(sql);
			while(rs.next()){
				int status=rs.getInt("status");
				String sward=rs.getString("ward");
				if(status==0){
					response.sendRedirect("./login.jsp");
				}
				if(status==1){
					response.sendRedirect("./slogin.jsp");
				}
				if(status==2){
					response.sendRedirect("./clogin.jsp");
				}
				if(status==3){
					session.setAttribute("username",sname);
					session.setAttribute("ward",sward);
					session.setAttribute("statusAdmin",3);
					response.sendRedirect("./index.jsp");
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