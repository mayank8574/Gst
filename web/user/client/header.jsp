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
    <header class="app-header"><a class="app-header__logo" href="gstreturn.jsp?pid=1&id=-1"><%=(String)session.getAttribute("uid")%></a>
      <!-- Sidebar toggle button--><a class="app-sidebar__toggle" href="#" data-toggle="sidebar" aria-label="Hide Sidebar"></a>
      <!-- Navbar Right Menu-->
      <ul class="app-nav">
        
        <li class="dropdown"><a class="app-nav__item" href="#" data-toggle="dropdown" aria-label="Open Profile Menu"><i class="fa fa-user fa-lg"></i></a>
          <ul class="dropdown-menu settings-menu dropdown-menu-right">
              <li><a class="dropdown-item" href="change_password.jsp"><i class="fa fa-sign-out fa-lg"></i> Change Password</a></li>
            <li><a class="dropdown-item" href="../../index.jsp"><i class="fa fa-sign-out fa-lg"></i> Logout</a></li>
          </ul>
        </li>
      </ul>
    </header>
    <!-- Sidebar menu-->
    <div class="app-sidebar__overlay" data-toggle="sidebar"></div>
    <aside class="app-sidebar">
        <div class="app-sidebar__user"><img class="app-sidebar__user-avatar" src="../profile/<%=(String)session.getAttribute("img")%>" alt="User Image" title="<%=(String)session.getAttribute("uname")%>" height="50px" width="50px">
        <div>
            <p class="app-sidebar__user-designation"><font style="font-size: 10px"><%=(String)session.getAttribute("uname")%></font></p>
          <p class="app-sidebar__user-designation"><%=(String)session.getAttribute("up")%></p>
        </div>
      </div>
      <ul class="app-menu">
        <li><a class="app-menu__item" href="gstreturn.jsp?pid=1&id=-1"><i class="app-menu__icon fa fa-pie-chart"></i><span class="app-menu__label">GST Returns</span></a></li>
        <li class="treeview"><a class="app-menu__item" href="#" data-toggle="treeview"><i class="app-menu__icon fa fa-th-list"></i><span class="app-menu__label">GSTR-1</span><i class="treeview-indicator fa fa-angle-right"></i></a>
          <ul class="treeview-menu">
            <li><a class="treeview-item" href="gstr1_b2b.jsp"><i class="icon fa fa-circle-o"></i> B2B</a></li>
            <li><a class="treeview-item" href="gstr1_b2c.jsp"><i class="icon fa fa-circle-o"></i> B2C</a></li>
          </ul>
        </li>
        <li><a class="app-menu__item" href="gstr3b.jsp"><i class="app-menu__icon fa fa-pie-chart"></i><span class="app-menu__label">GSTR-3B</span></a></li>
        
        <li><a class="app-menu__item" href="change_password.jsp"><i class="app-menu__icon fa fa-pie-chart"></i><span class="app-menu__label">Change Password</span></a></li>
        <li><a class="app-menu__item" href="../../index.jsp"><i class="app-menu__icon fa fa-pie-chart"></i><span class="app-menu__label">Logout</span></a></li>
        
      </ul>
    </aside>
    
      
              