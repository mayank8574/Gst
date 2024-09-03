<%@ page import="java.sql.*" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%
String month="",year="",id;
id=String.valueOf(session.getAttribute("id"));
if(request.getParameter("month")!=null)
  month=request.getParameter("month");

if(request.getParameter("year")!=null)
  year=request.getParameter("year");

Connection con;
ResultSet rs;
String query;
PreparedStatement ps;
%>

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
    </tr>
  </thead>
  <tbody>
  
  <%
    
      try
      {
          response.setContentType("application/vnd.ms-excel");
          response.setHeader("Content-Disposition", "inline; filename=sample.xls");
          Class.forName("com.mysql.jdbc.Driver");
          con = DriverManager.getConnection("jdbc:mysql://localhost:3306/gst?zeroDateTimeBehavior=convertToNull", "root", "");
          query="select sno,gstno,invoice_date,tax_value,cgst,sgst,gst_amount,total_value,invoice_no from invoice_detail where id='"+id+"' and month like '"+month+"%' and year='"+year+"' order by sno";
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
        