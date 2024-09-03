<html>
<body>

<%@ page import="java.sql.*" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.Date" %>
<%

String id,gstno,ino,idate,tvalue,cgst,sgst,tamt,doe,month,year,tax_amt,type,sn;
int sno=0;
id=month=year=sn=" ";
gstno=request.getParameter("gstno");
ino=request.getParameter("ino");
idate=request.getParameter("idate");
tvalue=request.getParameter("tvalue");
cgst=request.getParameter("cgst");
sgst=request.getParameter("sgst");
tamt=request.getParameter("tamt");

id=String.valueOf(session.getAttribute("id"));
String rec=String.valueOf(session.getAttribute("rec"));

int p2=idate.lastIndexOf("-");
int p1=idate.indexOf("-");
idate=idate.substring(p2+1)+"/"+idate.substring(p1+1,p2)+"/"+idate.substring(0,p1);

int tax=Integer.parseInt(cgst)+Integer.parseInt(sgst);
double a=Integer.parseInt(tvalue)*(double)tax/100;
tax_amt=(int)a+"";
if(rec.equals("new"))
{
	java.text.SimpleDateFormat ff = new SimpleDateFormat("dd/MM/yyyy");
	java.util.Date d = new java.util.Date();
	doe = ff.format(d);
}
else
{
	doe=String.valueOf(session.getAttribute("doe"));
	sn=String.valueOf(session.getAttribute("sno"));
	sno=Integer.parseInt(sn);
}

SimpleDateFormat f=new SimpleDateFormat("dd/MM/yyyy");  
Date dat=f.parse(idate); 
f = new SimpleDateFormat("MMM");
month=f.format(dat); 
f = new SimpleDateFormat("yyyy");
year=f.format(dat);

if(gstno.equals("Nil"))
	type="B2C";
else
	type="B2B";
out.println("abc" + "<br>");
Connection con;
ResultSet rs;
String query;
PreparedStatement ps;

try
{

	Class.forName("com.mysql.jdbc.Driver");
	con = DriverManager.getConnection("jdbc:mysql://localhost:3306/gst", "root", "");
	if(rec.equals("new"))
	{
		query="select sno from invoice_detail order by sno desc";
		ps=con.prepareStatement(query);
		rs=ps.executeQuery();

		if(rs.next())
		{
		      sno=rs.getInt(1);
		}
		sno++;
		out.println("New");
		query="insert into invoice_detail values(?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
	}
	else
	{
		out.println("Update");
		query="update invoice_detail set sno=?,id=?,invoice_no=?,gstno=?,invoice_date=?,tax_value=?,cgst=?,sgst=?,gst_amount=?,total_value=?,month=?,year=?,type=?,doe=? where sno="+sn;
	}
	ps=con.prepareStatement(query);
out.println(sno+"\t"+id+"\t"+gstno+"\t"+idate+"\t"+tvalue+"\t"+cgst+"\t"+sgst+"\t"+rec + "<br>");
	ps.setInt(1,sno);

	ps.setString(2,id);
	ps.setString(3,ino);
	ps.setString(4,gstno);

	ps.setString(5,idate);
	ps.setString(6,tvalue);
	ps.setString(7,cgst);
	ps.setString(8,sgst);
	ps.setString(9,tax_amt);
	ps.setString(10,tamt);
	ps.setString(11,month);
	ps.setString(12,year);
	ps.setString(13,type);
	ps.setString(14,doe);
	ps.executeUpdate();
	
	session.setAttribute("msg", "Invoice is Successfully added");
	if(rec.equals("new"))
	{
		if(type.equals("B2B"))
			response.sendRedirect("gstr1_b2b.jsp");
		else
			response.sendRedirect("gstr1_b2c.jsp");
	}
	else
		response.sendRedirect("gstreturn.jsp?pid=1");
}
catch(Exception e)
{
	System.out.println(e.getMessage());
    
}

%>

</body>
</html>