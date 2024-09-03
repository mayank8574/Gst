<%@ include file="header.jsp" %>
<main class="app-content">
      <div class="app-title">
        <div>
          <h1><i class="fa fa-dashboard"></i>Home Page</h1>
          <p>A Personal Digital Diary</p>
        </div>
        <ul class="app-breadcrumb breadcrumb">
          <li class="breadcrumb-item"><i class="fa fa-home fa-lg"></i></li>
          <li class="breadcrumb-item"><a href="#">Dashboard</a></li>
        </ul>
      </div>
<div class="row">
        <div class="col-md-12">
          <div class="tile">
            <div class="tile-body">
              <table class="table table-hover table-bordered" id="sampleTable">
                <thead>
                  <tr>
                    <th>Sno.</th>  
                    <th>Name</th>
                    <th>Email-Id</th>
                    <th>Contact No.</th>
                    <th>Gender</th>
                    <th>City</th>
                    <th>DOB</th>
                    <th>Select</th>
                  </tr>
                </thead>
                <tbody>
                <%@ page import="java.sql.*" %>
                <%@ page import="java.text.SimpleDateFormat" %>
                <%
                    String uid=(String)session.getAttribute("id");
                    int id=Integer.parseInt(uid);
                    Connection con;
                    ResultSet rs;
                    String query;
                    PreparedStatement ps;

                    try
                    {
                        Class.forName("com.mysql.jdbc.Driver");

                        con = DriverManager.getConnection("jdbc:mysql://localhost:3306/digital_diary", "root", "");

                        query="select sno,name,email,cno,gender,city,dob from friends_detail where id="+id+" order by name";
                        ps=con.prepareStatement(query);
                        rs=ps.executeQuery();
                        int n1=0;
                        while(rs.next())
                        {
                            n1++;
                              %>
                              <tr>
                                <td><%=n1%></td>  
                                <td><%=rs.getString(2)%></td>
                                <td><%=rs.getString(3)%></td>
                                <td><%=rs.getString(4)%></td>
                                <td><%=rs.getString(5)%></td>
                                <td><%=rs.getString(6)%></td>
                                <td><%=rs.getString(7)%></td>
                                <td><div align="center"><a href="friend_del.jsp?s_no=<%=rs.getString(1)%>" style="text-decoration:none"><img src="Images/del.png" alt="Delete Record" title="Delete Record" border="0" /></a>
                                 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="friend_update?s_no=<%=rs.getString(1)%>"  style="text-decoration:none"><img src="Images/edit.png" alt="Display Record" title="Display Record" border="0" /></a></div></td>
                              </tr>
                        <%
                        }
                    }
                    catch(Exception e)
                    {
                        
                    }
                    %>
                </tbody>
              </table>
            </div>
          </div>
        </div>
      </div>
<%@ include file="footer.jsp" %>
<script type="text/javascript" src="js/plugins/jquery.dataTables.min.js"></script>
    <script type="text/javascript" src="js/plugins/dataTables.bootstrap.min.js"></script>
    <script type="text/javascript">$('#sampleTable').DataTable();</script>
    <!-- Google analytics script-->
    <script type="text/javascript">
      if(document.location.hostname == 'pratikborsadiya.in') {
      	(function(i,s,o,g,r,a,m){i['GoogleAnalyticsObject']=r;i[r]=i[r]||function(){
      	(i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o),
      	m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m)
      	})(window,document,'script','//www.google-analytics.com/analytics.js','ga');
      	ga('create', 'UA-72504830-1', 'auto');
      	ga('send', 'pageview');
      }
    </script>
