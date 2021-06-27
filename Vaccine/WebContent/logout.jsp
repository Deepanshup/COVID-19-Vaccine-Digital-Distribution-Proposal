<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
 <%@page import="java.sql.*,java.util.*"%>
   <%
   		response.sendRedirect("./login.jsp");
        session.removeAttribute("username");
        session.invalidate();
    %>