<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
 <%@page import="java.sql.*,java.util.*"%>
 <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  
 <%
	 	try{
	 		if(session.getAttribute("username") == null) {
	 	       response.sendRedirect("login.jsp");
	 	       return ;
	 	    }
    	 	String username=session.getAttribute("username").toString();
            int status = Integer.parseInt(session.getAttribute("statusAdmin").toString());
            pageContext.setAttribute("status", status);
 %>
 <c:set var="status" scope="session" value="${status}"/>    
 <%
	  try
	  {
	    Class.forName("com.mysql.jdbc.Driver");
	    Connection conn=DriverManager.getConnection(  
	    "jdbc:mysql://localhost:3306/covid","root","");  
	    Statement stmt1=conn.createStatement();  
	    String sqll ="select * from vaccine";
	    ResultSet rss= stmt1.executeQuery(sqll);
	    while(rss.next()){
%>	

<!DOCTYPE html>
<html lang="en">
<!-- BEGIN HEAD -->
<head>
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta content="width=device-width, initial-scale=1" name="viewport" />
    <meta name="description" content="Responsive Admin Template" />
    <meta name="author" content="SmartUniversity" />
    <title>COVID-19 | Vaccine</title>
    <!-- google font -->
    <link href="https://fonts.googleapis.com/css?family=Poppins:300,400,500,600,700" rel="stylesheet" type="text/css" />
	<!-- icons -->
    <link href="assets/plugins/simple-line-icons/simple-line-icons.min.css" rel="stylesheet" type="text/css" />
    <link href="assets/plugins/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css"/>
	<!--bootstrap -->
	<link href="assets/plugins/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
    <!-- Material Design Lite CSS -->
	<link rel="stylesheet" href="assets/plugins/material/material.min.css">
	<link rel="stylesheet" href="assets/css/material_style.css">
	<!-- animation -->
	<link href="assets/css/pages/animate_page.css" rel="stylesheet">
	<!-- data tables -->
    <link href="assets/plugins/datatables/plugins/bootstrap/dataTables.bootstrap4.min.css" rel="stylesheet" type="text/css"/>
	<!-- Template Styles -->
    <link href="assets/css/style.css" rel="stylesheet" type="text/css" />
    <link href="assets/css/plugins.min.css" rel="stylesheet" type="text/css" />
    <link href="assets/css/responsive.css" rel="stylesheet" type="text/css" />
	<link href="assets/css/theme-color.css" rel="stylesheet" type="text/css" />
	<!-- dropzone -->
    <link href="assets/plugins/dropzone/dropzone.css" rel="stylesheet" media="screen">
    <link rel="stylesheet" href="assets/plugins/material-datetimepicker/bootstrap-material-datetimepicker.css" />
	<!-- favicon -->
    <link rel="shortcut icon" href="assets/img/favicon.ico" /> 
</head>
<!-- END HEAD -->
<body class="page-header-fixed sidemenu-closed-hidelogo page-content-white page-md header-white dark-sidebar-color logo-dark">
    <div class="page-wrapper" >
        <!-- start header -->
		<div class="page-header navbar navbar-fixed-top">
            <div class="page-header-inner ">
                <!-- logo start -->
                <div class="page-logo">
                    <a href="index.html">
                    <img alt="" src="assets/img/fla.webp" >
                    <!-- <span class="logo-default" >Spice</span> --> </a>
                </div>
                <!-- logo end -->
				<ul class="nav navbar-nav navbar-left in">
					<li><a href="#" class="menu-toggler sidebar-toggler"><i class="icon-menu"></i></a></li>
				</ul>
                 <form class="search-form-opened" action="#" method="GET">
                    <div class="input-group">
                        <input type="text" class="form-control" placeholder="Search..." name="query">
                        <span class="input-group-btn search-btn">
                          <a href="javascript:;" class="btn submit">
                             <i class="icon-magnifier"></i>
                           </a>
                        </span>
                    </div>
                </form>
                
                <!-- start mobile menu -->
                <a href="javascript:;" class="menu-toggler responsive-toggler" data-toggle="collapse" data-target=".navbar-collapse">
                    <span></span>
                </a>
               <!-- end mobile menu -->
                <!-- start header menu -->
                
            </div>
        </div>
        <!-- end header -->
        <!-- start page container -->
        <div class="page-container">
 			<!-- start sidebar menu -->
 			<div class="sidebar-container">
                <div class="sidemenu-container navbar-collapse collapse fixed-menu">
                    <div id="remove-scroll">
                        <ul class="sidemenu page-header-fixed p-t-20" data-keep-expanded="false" data-auto-scroll="true" data-slide-speed="200">
                            <li class="sidebar-toggler-wrapper hide">
                                <div class="sidebar-toggler">
                                    <span></span>
                                </div>
                            </li>
                            <li class="sidebar-user-panel">
                                <div class="user-panel">
                                    <div class="row">
                                            <div class="sidebar-userpic">
                                                <img src="assets/img/dp.jpg" class="img-responsive" alt=""> </div>
                                        </div>
                                        <div class="profile-usertitle">
                                            <div class="sidebar-userpic-name">Admin Name </div>
                                            <div class="profile-usertitle-job"> <%out.println(session.getAttribute("username").toString()); %> </div>
                                        </div>
                                </div>
                            </li>
                            <li class="nav-item start">
                                <a href="index.jsp" class="nav-link nav-toggle">
                                    <i class="material-icons">dashboard</i>
                                    <span class="title">Home</span>
                                </a>
                            </li>
                            <c:if test="${status == 0}">
                                 <li class="nav-item start">
                                    <a href="addvaccine.html" class="nav-link nav-toggle">
                                        <i class="material-icons">dashboard</i>
                                        <span class="title">Add Vaccine</span>
                                    </a>
                                </li>
                            </c:if> 
                            <c:if test="${status == 0}">
                                <li class="nav-item start">
                                    <a href="dist_vaccine.jsp" class="nav-link nav-toggle">
                                        <i class="material-icons">dashboard</i>
                                        <span class="title">Universal Distribution</span>
                                    </a>
                                </li>
                            </c:if> 
                            <c:if test="${status != 2 && status !=3}">
                                <li class="nav-item start">
                                    <a href="dist_state.jsp?sid=1" class="nav-link nav-toggle">
                                        <i class="material-icons">dashboard</i>
                                        <span class="title">State-wise Distribution</span>
                                    </a>
                                </li>
                            </c:if> 
                             <c:if test="${status != 3}">
                             <li class="nav-item start">
                                <a href="dist_city.jsp?sid=1&cid=1" class="nav-link nav-toggle">
                                    <i class="material-icons">dashboard</i>
                                    <span class="title">City-wise Distribution</span>
                                </a>
                            </li>
                            </c:if>
                            <c:if test="${status == 0 }">
                                <li class="nav-item start">
                                    <a href="addstate.html" class="nav-link nav-toggle">
                                        <i class="material-icons">dashboard</i>
                                        <span class="title">Add State</span>
                                    </a>
                                </li>
                            </c:if> 
                            <c:if test="${status != 2 && status != 3}">
                                <li class="nav-item start">
                                    <a href="addcity2.jsp" class="nav-link nav-toggle">
                                        <i class="material-icons">dashboard</i>
                                        <span class="title">Add City</span>
                                    </a>
                                </li>
                            </c:if> 
                            <c:if test="${status != 3}">
                            <li class="nav-item start">
                                <a href="addhospital.jsp" class="nav-link nav-toggle">
                                    <i class="material-icons">dashboard</i>
                                    <span class="title">Add hospital</span>
                                </a>
                            </li>
                             </c:if>
                            <c:if test="${status == 3}">
                                <li class="nav-item start">
                                    <a href="userlist.jsp" class="nav-link nav-toggle">
                                        <i class="material-icons">dashboard</i>
                                        <span class="title">User List</span>
                                    </a>
                                </li>
                            </c:if> 
                            <li class="nav-item start">
                                <a href="logout.jsp" class="nav-link nav-toggle">
                                    <i class="material-icons">dashboard</i>
                                    <span class="title">Logout</span>
                                </a>
                            </li>
                        </ul>
                    </div>
                </div>
            </div>
			 <!-- end sidebar menu -->
			<!-- start page content -->
            <div class="page-content-wrapper">
                <div class="page-content">
                    <div class="page-bar">
                        <div class="page-title-breadcrumb">
                            
                            <ol class="breadcrumb page-breadcrumb pull-right">
                                <li><i class="fa fa-home"></i>&nbsp;<a class="parent-item" href="index.html">Home</a>&nbsp;<i class="fa fa-angle-right"></i>
                                </li>
                                <li><a class="parent-item" href="#">Vaccine</a>&nbsp;<i class="fa fa-angle-right"></i>
                                </li>
                                <li class="active">Home Page</li>
                            </ol>
                        </div>
                    </div>
                    <div class="state-overview">
						<div class="row">
							<div class="col-lg-4 col-sm-6">
								<div class="overview-panel purple">
									<div class="symbol">
										<i class="fa fa-users usr-clr"></i>
									</div>
									<div class="value white">
										<p class="sbold addr-font-h1" data-counter="counterup">
										<% out.println(rss.getString("no_of_vaccine")); %>
										</p>
										<p>Currently vaccine in Stock</p>
										<%
									    }
									  }
								 catch(Exception e)
								 {
								 System.out.print(e);
								 e.printStackTrace();
								 }
								%>
									</div>
								</div>
							</div>
							<div class="col-lg-4 col-sm-6">
								<div class="overview-panel deepPink-bgcolor">
									<div class="symbol">
										<i class="fa fa-user"></i>
									</div>
									<div class="value white">
										<p class="sbold addr-font-h1" data-counter="counterup">
										<%
										try
										{
										    Class.forName("com.mysql.jdbc.Driver");
										    Connection conn1=DriverManager.getConnection(  
										    "jdbc:mysql://localhost:3306/covid","root","");  
										    Statement stmt9=conn1.createStatement();  
										    String sqlli ="select sum(total_vaccine) from state";
										    ResultSet rss0= stmt9.executeQuery(sqlli);
										    while(rss0.next()){
										    	String rs=rss0.getString(1);
												out.println(rs);
										    }
											} 
											catch (Exception e) {
												e.printStackTrace();
												}
										%>
									</p>
										<p>Total Vaccine distributed</p>
									</div>
								</div>
							</div>
						</div>
					</div>
                     <div class="row">
						<div class="col-sm-12">
							 <div class="row">
                        <div class="col-md-12">
                            <div class="card card-topline-aqua">
                                <div class="card-head">
                                    <header>STATE TABLE</header>
                                    <div class="tools">
                                        <a class="fa fa-repeat btn-color box-refresh" href="javascript:;"></a>
	                                    <a class="t-collapse btn-color fa fa-chevron-down" href="javascript:;"></a>
	                                    <a class="t-close btn-color fa fa-times" href="javascript:;"></a>
                                    </div>
                                </div>
                                <div class="card-body ">
                                  <div class="table-scrollable">
                                    <table id="example1" class="display full-width">
                                        <thead>
                                            <tr>
                                                <th>Name</th>
                                                <th>Active Cases</th>
                                                <th>Corona Warrior</th>
                                                <th>Other people</th>
                                                <th>Total Vaccine Sent</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                        <%
	                                        try
	                                        {
	                                        	Class.forName("com.mysql.jdbc.Driver");
	                                        	Connection con=DriverManager.getConnection(  
	                                        	"jdbc:mysql://localhost:3306/covid","root","");  
	                                        	Statement stmt=con.createStatement();  
	                                        	String sql ="select * from state";
	                                        	ResultSet rs= stmt.executeQuery(sql);
	                                        	while(rs.next()){
	                                        %>
                                            <tr>
                                                <td><%= rs.getString("name") %></td>
                                                <td><%= rs.getString("cp") %></td>
                                                <td><%= rs.getString("cw") %></td>
                                                <td><%= rs.getString("op") %></td>
                                                <td><%= rs.getString("total_vaccine") %></td>
                                            </tr>
                                 		    <%
												}
											
												} catch (Exception e) {
												e.printStackTrace();
												}
												%>
                                        </tbody>
                                    </table>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
						</div>
					</div> 
                     <div class="row">
                        <div class="col-sm-12">
                             <div class="row">
                        <div class="col-md-12">
                            <div class="card card-topline-aqua">
                                <div class="card-head">
                                    <header>CITY TABLE</header>
                                    <div class="tools">
                                        <a class="fa fa-repeat btn-color box-refresh" href="javascript:;"></a>
                                        <a class="t-collapse btn-color fa fa-chevron-down" href="javascript:;"></a>
                                        <a class="t-close btn-color fa fa-times" href="javascript:;"></a>
                                    </div>
                                </div>
                                <div class="card-body ">
                                  <div class="table-scrollable">
                                    <table id="example4" class="display full-width">
                                        <thead>
                                            <tr>
                                                <th>Name</th>
                                                <th>Active Cases</th>
                                                <th>Corona Warrior</th>
                                                <th>Other people</th>
                                                <th>Total Vaccine Sent</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                        <%
                                            try
                                            {
                                                Class.forName("com.mysql.jdbc.Driver");
                                                Connection con=DriverManager.getConnection(  
                                                "jdbc:mysql://localhost:3306/covid","root","");  
                                                Statement stmt=con.createStatement();  
                                                String sql ="select * from city";
                                                ResultSet rs= stmt.executeQuery(sql);
                                                while(rs.next()){
                                            %>
                                            <tr>
                                                <td><%= rs.getString("name") %></td>
                                                <td><%= rs.getString("cp") %></td>
                                                <td><%= rs.getString("cw") %></td>
                                                <td><%= rs.getString("op") %></td>
                                                <td><%= rs.getString("total_vaccine") %></td>
                                            </tr>
                                            <%
                                                }
                                            
                                                } catch (Exception e) {
                                                e.printStackTrace();
                                                }
                                                %>
                                        </tbody>
                                    </table>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- end page content -->
            <!-- start chat sidebar -->
            <div class="chat-sidebar-container" data-close-on-body-click="false">
                <div class="chat-sidebar">
                    <ul class="nav nav-tabs">
                    	<li class="nav-item">
                            <a href="#quick_sidebar_tab_1" class="nav-link active tab-icon"  data-toggle="tab">Theme
                                </a>
                        </li>
                        <li class="nav-item">
                            <a href="#quick_sidebar_tab_2" class="nav-link tab-icon"  data-toggle="tab"> Chat
                                </a>
                        </li>
                        <li class="nav-item">
                            <a href="#quick_sidebar_tab_3" class="nav-link tab-icon"  data-toggle="tab">  Settings
                            </a>
                        </li>
                    </ul>
                    <div class="tab-content">
                    	<div class="tab-pane chat-sidebar-settings in show active animated shake" role="tabpanel" id="quick_sidebar_tab_1">
							<div class="slimscroll-style">
								<div class="theme-light-dark">
									<h6>Sidebar Theme</h6>
									<button type="button" data-theme="white" class="btn lightColor btn-outline btn-circle m-b-10 theme-button">Light Sidebar</button>
									<button type="button" data-theme="dark" class="btn dark btn-outline btn-circle m-b-10 theme-button">Dark Sidebar</button>
								</div>
								<div class="theme-light-dark">
									<h6>Sidebar Color</h6>
									<ul class="list-unstyled">
										<li class="complete">
											<div class="theme-color sidebar-theme">
												<a href="#" data-theme="white"><span class="head"></span><span class="cont"></span></a>
												<a href="#" data-theme="dark"><span class="head"></span><span class="cont"></span></a>
												<a href="#" data-theme="blue"><span class="head"></span><span class="cont"></span></a>
												<a href="#" data-theme="indigo"><span class="head"></span><span class="cont"></span></a>
												<a href="#" data-theme="cyan"><span class="head"></span><span class="cont"></span></a>
												<a href="#" data-theme="green"><span class="head"></span><span class="cont"></span></a>
												<a href="#" data-theme="red"><span class="head"></span><span class="cont"></span></a>
											</div>
										</li>
									</ul>
									<h6>Header Brand color</h6>
									<ul class="list-unstyled">
										<li class="theme-option">
											<div class="theme-color logo-theme">
								             	<a href="#" data-theme="logo-white"><span class="head"></span><span class="cont"></span></a>
												<a href="#" data-theme="logo-dark"><span class="head"></span><span class="cont"></span></a>
												<a href="#" data-theme="logo-blue"><span class="head"></span><span class="cont"></span></a>
												<a href="#" data-theme="logo-indigo"><span class="head"></span><span class="cont"></span></a>
												<a href="#" data-theme="logo-cyan"><span class="head"></span><span class="cont"></span></a>
												<a href="#" data-theme="logo-green"><span class="head"></span><span class="cont"></span></a>
												<a href="#" data-theme="logo-red"><span class="head"></span><span class="cont"></span></a>
								           	</div>
								        </li>
									</ul>
									<h6>Header color</h6>
									<ul class="list-unstyled">
										<li class="theme-option">
											<div class="theme-color header-theme">
								             	<a href="#" data-theme="header-white"><span class="head"></span><span class="cont"></span></a>
								             	<a href="#" data-theme="header-dark"><span class="head"></span><span class="cont"></span></a>
								             	<a href="#" data-theme="header-blue"><span class="head"></span><span class="cont"></span></a>
								             	<a href="#" data-theme="header-indigo"><span class="head"></span><span class="cont"></span></a>
								             	<a href="#" data-theme="header-cyan"><span class="head"></span><span class="cont"></span></a>
								             	<a href="#" data-theme="header-green"><span class="head"></span><span class="cont"></span></a>
								             	<a href="#" data-theme="header-red"><span class="head"></span><span class="cont"></span></a>
								          	</div>
								        </li>
									</ul>
								</div>
							</div>
						</div>
                       
 						<!-- Start Setting Panel --> 
 						
                    </div>
                </div>
            </div>
            <!-- end chat sidebar -->
        </div>
        
        <!-- end page container -->
        <!-- start footer -->
        <div class="page-footer">
            <div class="page-footer-inner"> 2020 &copy; Deepanshu Pathak
            </div>
            <div class="scroll-to-top">
                <i class="icon-arrow-up"></i>
            </div>
        </div>
        <!-- end footer -->
    </div>
    <!-- start js include path -->
    <script src="assets/plugins/jquery/jquery.min.js" ></script>
    <script src="assets/plugins/popper/popper.min.js" ></script>
    <script src="assets/plugins/jquery-blockui/jquery.blockui.min.js" ></script>
	<script src="assets/plugins/jquery-slimscroll/jquery.slimscroll.min.js"></script>
    <!-- bootstrap -->
    <script src="assets/plugins/bootstrap/js/bootstrap.min.js" ></script>
    <!-- Common js-->
	<script src="assets/js/app.js" ></script>
    <script src="assets/js/layout.js" ></script>
	<script src="assets/js/theme-color.js" ></script>
	<!-- Material -->
	<script src="assets/plugins/material/material.min.js"></script>
    <script src="assets/js/pages/material_select/getmdl-select.js" ></script>
    <script  src="assets/plugins/material-datetimepicker/moment-with-locales.min.js"></script>
	<script  src="assets/plugins/material-datetimepicker/bootstrap-material-datetimepicker.js"></script>
	<script  src="assets/plugins/material-datetimepicker/datetimepicker.js"></script>
    <!-- dropzone -->
    <script src="assets/plugins/dropzone/dropzone.js" ></script>
    <script src="assets/plugins/dropzone/dropzone-call.js" ></script>
	<!-- animation -->
	<script src="assets/js/pages/ui/animations.js" ></script>
    <!-- end js include path -->
    <!-- data tables -->
    <script src="assets/plugins/datatables/jquery.dataTables.min.js"></script>
 	<script src="assets/plugins/datatables/plugins/bootstrap/dataTables.bootstrap4.min.js" ></script>
    <script src="assets/js/pages/table/table_data.js" ></script>
</body>

<% 
 	}
	catch(Exception e)
		 {
		System.out.print(e);
		e.printStackTrace();
	}
%>
</html>
