<!DOCTYPE html>
<%
    if((String)session.getAttribute("msg")==null)
        {
        session.setAttribute("msg", "");
        }
%>
<html lang="en">
  <head>
    
    <!-- Main CSS-->
    <link rel="stylesheet" type="text/css" href="css/main.css">
    <link href="css/my_style.css" rel="stylesheet" type="text/css"/>
    <!-- Font-icon css-->
    <link rel="stylesheet" type="text/css" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
  </head>
  <body class="app sidebar-mini rtl">
    <!-- Navbar-->
    <header class="app-header"><a class="app-header__logo" href="user_home.jsp">GST Application</a>
      <!-- Sidebar toggle button--><a class="app-sidebar__toggle" href="#" data-toggle="sidebar" aria-label="Hide Sidebar"></a>
      <!-- Navbar Right Menu-->
      
    </header>
    <!-- Sidebar menu-->
    <div class="app-sidebar__overlay" data-toggle="sidebar"></div>
    <aside class="app-sidebar">
        
      <ul class="app-menu">
        <li><a class="app-menu__item active" href="index.jsp"><i class="app-menu__icon fa fa-dashboard"></i><span class="app-menu__label">Login</span></a></li>
        <li><a class="app-menu__item active" href="registration.jsp"><i class="app-menu__icon fa fa-dashboard"></i><span class="app-menu__label">GST Application</span></a></li>
        <li><a class="app-menu__item active" href="track.jsp"><i class="app-menu__icon fa fa-dashboard"></i><span class="app-menu__label">Track Status</span></a></li>
      </ul>
    </aside>
    
      
              