<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

 <%@page import="java.sql.*,java.util.*"%>

<%
	try
	{
		String sname=request.getParameter("name");
		String spass=request.getParameter("password");
		if(sname.equals("")){
			out.write("alert('Enter Username !!')");
		}else if(spass.equals("")){
			out.write("alert('Enter Password !!')");
		}else if(!sname.equals(spass)) {
			out.write("alert('Wrong Credentials !!')");
		}else if(!sname.equals("") && !spass.equals("")) {
			Class.forName("com.mysql.jdbc.Driver");
			Connection con=DriverManager.getConnection(  
			"jdbc:mysql://localhost:3306/covid","root","");  
			Statement stmt=con.createStatement();  
			String sql="select * from state where name='"+sname+"' ";
			ResultSet rs= stmt.executeQuery(sql);
			while(rs.next()){
				int status=rs.getInt("status");
				if(status==0){
					response.sendRedirect("./login.jsp");
				}
				if(status==1){
					session.setAttribute("username",sname);
					session.setAttribute("statusAdmin",1);
					response.sendRedirect("./index.jsp");
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