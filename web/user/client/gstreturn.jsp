<%@ page import="java.sql.*" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%
String id="-1",pid="1",sno="",month="Select Month",year="2022",cm;
int type=1;
if(request.getParameter("pid")!=null)
  pid=request.getParameter("pid");
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
session.setAttribute("rec","new");
if(pid.trim().equals("2"))
{
  sno=request.getParameter("sno");
  Class.forName("com.mysql.jdbc.Driver");
  con = DriverManager.getConnection("jdbc:mysql://localhost:3306/gst?zeroDateTimeBehavior=convertToNull", "root", "");
  query="select sno,gstno,invoice_date,tax_value,cgst,sgst,gst_amount,total_value,invoice_no,doe from invoice_detail where sno="+sno;
  ps=con.prepareStatement(query);
  rs=ps.executeQuery();
  rs.next();
  String idate=String.valueOf(rs.getString(3));
  int p2=idate.lastIndexOf("/");
  int p1=idate.indexOf("/");
  idate=idate.substring(p2+1)+"-"+idate.substring(p1+1,p2)+"-"+idate.substring(0,p1);
  //idate=idate.replace("/","-");
  session.setAttribute("sno",rs.getString(1));
  session.setAttribute("gstno",rs.getString(2));
  session.setAttribute("idate",idate);
  session.setAttribute("tvalue",rs.getString(4));
  session.setAttribute("cgst",rs.getString(5));
  session.setAttribute("sgst",rs.getString(6));
  session.setAttribute("tamt",rs.getString(8));
  session.setAttribute("ino",rs.getString(9));
  session.setAttribute("doe",rs.getString(10));
  if(rs.getString(2).equals("Nil"))
    type=2;
  session.setAttribute("rec","update");
}
%>

<%@ include file="header.jsp" %>
<main class="app-content">
  <div class="app-title">
    <div>
      <h1><i class="fa fa-dashboard"></i>GST Invoice Detail</h1>
      <p>A Personal Digital Diary</p>
    </div>
    <ul class="app-breadcrumb breadcrumb">
      <li class="breadcrumb-item"><i class="fa fa-home fa-lg"></i></li>
      <li class="breadcrumb-item"><a href="gstreturn.jsp?pid=1&id=-1">Dashboard</a></li>
    </ul>
  </div>
  <div class="clearix"></div>
  <% if(pid.trim().equals("1")){ %>
  <div class="row">
    <div class="col-md-12">
      <div class="tile">
        <h3 class="tile-title">Search</h3>
        <div class="tile-body">
          <form class="row" method="post">
            <div class="form-group  col-md-3" >
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
              <a class="btn btn-primary" href="gstreport.jsp?month=<%=cm%>&year=<%=year%>">Print Report</a>
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
          <table class="table table-hover table-bordered" id="sampleTable">
            <thead>
              <tr>
                <th>Sno.</th> 
                <th>Invoice No.</th> 
                <th>GST No.</th>
                <th>Invoice Date</th>
                <th>Amount</th>
                <th>CGST</th>
                <th>SGST</th>
                <th>GST Amount</th>
                <th>Bill Amount</th>
                <th>Select</th>
              </tr>
            </thead>
            <tbody>
            
            <%
              
                try
                {
                    Class.forName("com.mysql.jdbc.Driver");

                    con = DriverManager.getConnection("jdbc:mysql://localhost:3306/gst?zeroDateTimeBehavior=convertToNull", "root", "");
                    query="select sno,gstno,invoice_date,tax_value,cgst,sgst,gst_amount,total_value,invoice_no from invoice_detail where id='"+id+"' and month like '"+cm+"%' and year='"+year+"' order by sno desc";
                    ps=con.prepareStatement(query);
                    rs=ps.executeQuery();
                    int n1=0;
                    while(rs.next())
                    {
                        n1++;
                          %>
                          <tr>
                            <td><%=n1%></td>  
                            <td><%=rs.getString(9)%></td>
                            <td><%=rs.getString(2)%></td>
                            <td><%=rs.getString(3)%></td>
                            <td><%=rs.getString(4)%></td>
                            <td><%=rs.getString(5)%></td>
                            <td><%=rs.getString(6)%></td>
                            <td><%=rs.getString(7)%></td>
                            <td><%=rs.getString(8)%></td>
                            <td><div align="center">
                              <a href="gstreturn.jsp?sno=<%=rs.getString(1)%>&pid=2"  style="text-decoration:none"><img src="Images/edit.png" alt="Display Record" title="Display Record" border="0" /></a>
                              
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
                  <label for="exampleInputEmail1">GST Number</label>
                  <input class="form-control" id="gstno" type="text" name="gstno" placeholder="Enter GST Number" aria-describedby="emailHelp" value="<%=(String)session.getAttribute("gstno")%>"<%if(type==2){%>readonly<%}%>>
                  <small class="error" id="gn"></small>
                </div>
                <div class="form-group">
                  <label for="exampleInputEmail1">Invoice Number</label>
                  <input class="form-control" id="ino" type="text" 
                  name="ino" placeholder="Enter Invoice Number" aria-describedby="emailHelp" value="<%=(String)session.getAttribute("ino")%>" <%if(type==2){%>readonly<%}%>>
                  <small class="error" id="in"></small>
                </div>
                <div class="form-group">
                  <label for="exampleInputEmail1">Invoice Date</label>
                  <input class="form-control" id="idate" type="date" 
                  name="idate" value="<%=(String)session.getAttribute("idate")%>" >
                  <small class="error" id="id"></small>
                </div>
                <%if(type==2){%>
                <div class="tile-footer">
                  <button class="btn btn-primary" type="submit">Submit</button>
                </div>
                <%}else {%>
                <div class="tile-footer">
                  <button class="btn btn-primary" type="submit">Update</button>
                </div>
                <%}%>
              </div>
              <div class="col-md-6">
                <div class="form-group">
                  <label for="exampleInputPassword1">Tax Value</label>
                  <input class="form-control" id="tvalue" name="tvalue" placeholder="Enter Tax Value" type="text" onchange="calc(this)" value="<%=(String)session.getAttribute("tvalue")%>" >
                  <small class="error" id="tv"></small>
                </div>
                
                <div class="form-group">
                  <label for="exampleInputPassword1">CGST</label>
                  <input class="form-control" id="cgst" name="cgst" type="text" placeholder="Enter CGST %" onchange="calc(this)" value="<%=(String)session.getAttribute("cgst")%>" >
                  <small class="error" id="cg"></small>
                </div>
                <div class="form-group">
                  <label for="exampleInputPassword1">SGST</label>
                  <input class="form-control" id="sgst" name="sgst" type="text" placeholder="Enter sGST %" onchange="calc(this)" value="<%=(String)session.getAttribute("sgst")%>" >
                  <small class="error" id="sg"></small>
                </div>
                <div class="form-group">
                  <label for="exampleInputPassword1">Total Value</label>
                  <input class="form-control" id="tamt" name="tamt" type="text" value="<%=(String)session.getAttribute("tamt")%>" readonly>
                  <small class="error" id="t"></small>
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
  var chk_gst=/^[0-9]{16,16}$/;
  var chk_ino=/^[0-9]{1,10}$/;
  function validate()
  {
    var gstno=form.gstno.value;
    var ino=form.ino.value;
    var tvalue=form.tvalue.value;
    var cgst=form.cgst.value;
    var sgst=form.sgst.value;
    var idate=form.idate.value;
    
    flag=1;
    <%if(type==1){%>
    if(!chk_gst.test(gstno))
    {
      document.getElementById("gn").innerHTML="Enter a valid GST Number";
      if(flag==1){
        form.gstno.focus;
        flag=0;
      }
    }
    else{
      document.getElementById("gn").innerHTML="";
    }
    if(!chk_ino.test(ino))
    {
      document.getElementById("in").innerHTML="Enter a valid Invoice Number";
      if(flag==1){
        form.ino.focus;
        flag=0;
      }
    }
    else{
      document.getElementById("in").innerHTML="";
    }
    if(idate=="")
    {
      document.getElementById("id").innerHTML="Enter Invoice Date";
      if(flag==1){
        form.idate.focus;
        flag=0;
      }
    }
    else{
      document.getElementById("id").innerHTML="";
    }
    <%}%>
    if(!chk_ino.test(tvalue))
    {
      document.getElementById("tv").innerHTML="Enter a valid Tax Value";
      if(flag==1){
        form.tvalue.focus;
        flag=0;
      }
    }
    else{
      document.getElementById("tv").innerHTML="";
    }
    if(!chk_ino.test(cgst))
    {
      document.getElementById("cg").innerHTML="Enter a valid CGST Value";
      if(flag==1){
        form.cgst.focus;
        flag=0;
      }
    }
    else{
      document.getElementById("cg").innerHTML="";
    }
    if(!chk_ino.test(sgst))
    {
      document.getElementById("sg").innerHTML="Enter a valid SGST Value";
      if(flag==1){
        form.sgst.focus;
        flag=0;
      }
    }
    else{
      document.getElementById("sg").innerHTML="";
    }
        if(flag==1)
        {
            document.form.action="gstr1_b2b_save.jsp";
            document.form.submit();
            return true;  
        }
        else
        {
            
            <%
        //session.removeAttribute("msg");
        session.setAttribute("msg", "Please fill the detail properly");
      %>
      return false;
        }
  }
  function calc(v){
    var tv = parseInt(v.form.tvalue.value);
    var per = parseInt(v.form.cgst.value)+parseInt(v.form.sgst.value);
    var tamt=tv+tv*(per/100);
    if(tamt>0)
      v.form.tamt.value=tamt;
    //alert(tamt);
 } 
</script>