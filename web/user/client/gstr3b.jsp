<%@ page import="java.sql.*" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%
String id="-1",month="Select Month",year="2022",cm,gstamt="0",gstrefund="0",gstno="",bal="";
gstno=String.valueOf(session.getAttribute("gno"));
id=String.valueOf(session.getAttribute("id"));
session.setAttribute("cy",year);
if(request.getParameter("month")!=null)
  month=request.getParameter("month");
session.setAttribute("cm",month);
if(month.equals("Select Month"))
  cm="";
else
  cm=month;
Connection con;
ResultSet rs;
String query;
PreparedStatement ps;
try
{
    Class.forName("com.mysql.jdbc.Driver");

    con = DriverManager.getConnection("jdbc:mysql://localhost:3306/gst?zeroDateTimeBehavior=convertToNull", "root", "");
    query="select gst_amount from invoice_detail where id='"+id+"' and month like '"+cm+"%' and year='"+year+"'";
    ps=con.prepareStatement(query);
    rs=ps.executeQuery();
    int s1=0,s2=0;
    while(rs.next())
    {
      s1+=Integer.parseInt(rs.getString(1));
    }
    gstamt=String.valueOf(s1);
    
    query="select gst_amount from invoice_detail where gstno='"+gstno+"' and month like '"+cm+"%' and year='"+year+"'";
    ps=con.prepareStatement(query);
    rs=ps.executeQuery();
    s2=0;
    while(rs.next())
    {
      s2+=Integer.parseInt(rs.getString(1));
    }
    gstrefund=String.valueOf(s2);
    int gstbal=s1-s2;
    bal=String.valueOf(gstbal);
}
catch(Exception e)
{
    
}
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
      <li class="breadcrumb-item"><a href="gstreturn.jsp?pid=1&id=-1">Dashboard</a></li>
    </ul>
  </div>
  
  <div class="row">
    <div class="col-md-12">
      <div class="tile">
        <h3 class="tile-title">Search</h3>
        <div class="tile-body">
          <form class="row" method="post">
            <div class="form-group col-md-3">
              <label for="exampleSelect1">Month</label>
              <select class="form-control" id="month" name="month">
                <option><%=(String)session.getAttribute("cm")%></option>
                <option>Jan</option>
                <option>Feb</option>
                <option>Mar</option>
                <option>Apr</option>
                <option>May</option>
                <option>Jun</option>
                <option>Jul</option>
                <option>Aug</option>
                <option>Sep</option>
                <option>Oct</option>
                <option>Nov</option>
                <option>Dec</option>
              </select>
            </div>
            <div class="form-group col-md-3">
              <label class="control-label">Year</label>
              <input class="form-control" type="text" placeholder="Enter Year" value="<%=(String)session.getAttribute("cy")%>">
            </div>
            <div class="form-group col-md-4 align-self-end">
              <button class="btn btn-primary" type="submit"><i class="fa fa-fw fa-lg fa-check-circle"></i>Search</button>

            </div>
          </form>
        </div>
      </div>
    </div>  
  </div>
  
  <div class="row">

    <div class="col-md-12">
      <div class="tile">
        <div class="tile-body">
          <h3 class="tile-title">GST for the momth of <%=cm%> &nbsp;&nbsp;<%=year%></h3>
          <div class="tile-body">
            <form method="post" name="form" class="row">
              <div class="form-group col-md-3">
                <label class="control-label">GST Paid</label>
                <input class="form-control" id="paid" name="paid" type="text" value="<%=gstamt%>" >
              </div>
              <div class="form-group col-md-3">
                <label class="control-label">GST Refund</label>
                <input class="form-control" id="refund" name="refund" type="text" value="<%=gstrefund%>">
              </div>
              <div class="form-group col-md-3">
                <label class="control-label">GST Amount to be paid</label>
                <input class="form-control" type="text" name="bal" id="bal" value="<%=bal%>">
              </div>
              <div class="form-group col-md-4 align-self-end">
                <button class="btn btn-primary" type="submit"><i class="fa fa-fw fa-lg fa-check-circle"></i>Search</button>

              </div>
            </form>
          </div>
        </div>
      </div>
    </div>
  </div>
  
   
</main>
<%@ include file="footer.jsp" %>
<script type="text/javascript" src="js/plugins/jquery.dataTables.min.js"></script>
    <script type="text/javascript" src="js/plugins/dataTables.bootstrap.min.js"></script>
    <script type="text/javascript">$('#sampleTable').DataTable();</script>
    <!-- Google analytics script-->
    
<script type="text/javascript">
  function calc(v){
    
    var paid = parseInt(v.form.paid.value);
    var refund = parseInt(v.form.refund.value);
    var bal = paid-refund;
    if(bal>0)
      v.form.bal.value=bal;
    else
      v.form.bal.value="Nil";
    
 } 
</script>