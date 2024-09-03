<%@ page import="java.sql.*" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%
String id="-1",pid="";
id=request.getParameter("id");
pid=request.getParameter("pid");
Connection con;
ResultSet rs;
String query;
PreparedStatement ps;
try
{
    Class.forName("com.mysql.jdbc.Driver");
    con = DriverManager.getConnection("jdbc:mysql://localhost:3306/gst?zeroDateTimeBehavior=convertToNull", "root", "");
    if(pid.trim().equals("3"))
    {
      
      query="Update registration set status='B' where id="+id.trim();
      ps=con.prepareStatement(query);
      ps.executeUpdate();
      pid="1";
    }
    else if(pid.trim().equals("2"))
    {
      query="select * from registration where id="+id.trim();
      ps=con.prepareStatement(query);
      rs=ps.executeQuery();
      rs.next();
      session.setAttribute("id", rs.getString(1));
      session.setAttribute("cname", rs.getString(2));
      session.setAttribute("name", rs.getString(3));
      session.setAttribute("fname", rs.getString(4));
      session.setAttribute("email", rs.getString(5));
      session.setAttribute("cno", rs.getString(6));
      session.setAttribute("gen", rs.getString(7));
      session.setAttribute("add", rs.getString(8));
      session.setAttribute("aadhar", rs.getString(9));
      session.setAttribute("pan", rs.getString(10));
      session.setAttribute("image", rs.getString(11));
      session.setAttribute("dor", rs.getString(12));
      session.setAttribute("rid", rs.getString(13));
    }
}
catch(Exception e){}
%>

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
  <% if(pid.trim().equals("1")){ %>
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
                <th>PAN No.</th>
                <th>Aadhar No.</th>
                <th>Select</th>
              </tr>
            </thead>
            <tbody>
            
            <%
              
                try
                {
                    Class.forName("com.mysql.jdbc.Driver");

                    con = DriverManager.getConnection("jdbc:mysql://localhost:3306/gst?zeroDateTimeBehavior=convertToNull", "root", "");
                    query="select id,name,email_id,panno,aadharno from registration where status='U' order by id";
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
                            <td><div align="center">
                              <a href="index.jsp?id=<%=rs.getString(1)%>&pid=2"  style="text-decoration:none"><img src="Images/edit.png" alt="Display Record" title="Display Record" border="0" /></a>
                              &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                              <a href="index.jsp?id=<%=rs.getString(1)%>&pid=3" style="text-decoration:none"><img src="Images/del.png" alt="Delete Record" title="Delete Record" border="0" /></a>
                             </div></td>
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
  <% } else { %>
  
  <div class="row">
          <div class="col-md-12">
          <div class="tile">
            <div class="row">
            <div class="col" style="margin: 0;">
              <form method="post" onsubmit="return validate();" name="form" class="row">
                <div class="col-lg-6">
                    
                  <div class="form-group">
                    <label for="exampleInputEmail1">Name</label>
                    <input class="form-control" id="exampleInputEmail1" type="text" name="name" aria-describedby="emailHelp" value="<%=(String)session.getAttribute("name")%>" readonly>
                    <small class="error" id="n"></small>
                  </div>
    
                  <div class="form-group">
                    <label for="exampleInputPassword1">Email Id</label>
                    <input class="form-control" id="exampleInputPassword1" name="email" type="email" value="<%=(String)session.getAttribute("email")%>" readonly>
                  </div>
                  <div class="form-group">
                    <label for="exampleInputPassword1">Contact Number</label>
                    <input class="form-control" id="exampleInputPassword1" name="cno" type="text" value="<%=(String)session.getAttribute("cno")%>" readonly>
                  </div>
                  <div class="form-group">
                    <label for="exampleInputPassword1">Gender</label>
                    <input class="form-control" id="exampleInputPassword1" name="gen" type="text" value="<%=(String)session.getAttribute("gen")%>" readonly>
                  </div>
                  <div class="form-group">
                    <label for="exampleInputPassword1">Reference Id</label>
                    <input class="form-control" id="exampleInputPassword1" name="rid" type="text" value="<%=(String)session.getAttribute("rid")%>" readonly>
                  </div>
                  
                  
                  <div class="form-group">
                    <label for="exampleTextarea">Address</label>
                    <textarea class="form-control" id="exampleTextarea" name="add" rows="3" readonly><%=(String)session.getAttribute("add")%></textarea>
                  </div>
                  
                  
                  
                        <div class="tile-footer">
              <button class="btn btn-primary" type="submit">Submit</button>
              <a href="index.jsp?id=<%=(String)session.getAttribute("id")%>&pid=3" class="btn btn-danger">Reject</a>
              <a href="index.jsp?id=-1&pid=1" class="btn btn-warning">Back</a>
            </div>
                    
                    
              </div>
              <div class="col-lg-4 offset-1">
                  <div class="form-group">
                    <fieldset>
                      <label class="control-label" for="readOnlyInput">Compnay</label>
                      <input class="form-control" id="cname" type="text" name="cname" value="<%=(String)session.getAttribute("cname")%>" readonly>
                    </fieldset>
                  </div>
                  <div class="form-group">
                    <label for="exampleInputPassword1">PAN Number</label>
                    <input class="form-control" id="pan" name="pan" type="text" value="<%=(String)session.getAttribute("pan")%>" readonly>
                  </div>
                  
                  <div class="form-group">
                    <label for="exampleInputPassword1">Aadhar Number</label>
                    <input class="form-control" id="aadhar" name="aadhar" type="text" value="<%=(String)session.getAttribute("aadhar")%>" readonly>
                  </div>
                  <div class="form-group">
                    <label for="exampleInputFile">Profile Image</label><br>
                    <img class="app-sidebar__user-avatar" src="../profile/<%=(String)session.getAttribute("image")%>" alt="User Image" title="<%=(String)session.getAttribute("uname")%>" height="100px" width="100px">
                  </div>
                  
                  
              </div>
        </form>   
</div>
                            </div>
          </div>
</div>
</div>
  <% } %>  
</main>
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
<script type="text/javascript">
  function validate()
  {
    document.form.action="index_check.jsp";
    document.form.submit();
    return true;  
  }
</script>