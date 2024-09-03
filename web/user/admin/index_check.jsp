<html>
<body>

<%@ page import="java.sql.*" %>
<%@ page import="java.io.*,java.util.*, javax.servlet.*" %>
<%@ page import="javax.servlet.http.*" %>
<%@ page import="org.apache.commons.fileupload.*" %>
<%@ page import="org.apache.commons.fileupload.disk.*" %>
<%@ page import="org.apache.commons.fileupload.servlet.*" %>
<%@ page import="org.apache.commons.io.output.*" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%

String gstno,dor,pass;
gstno=dor=" ";
java.text.SimpleDateFormat ff = new SimpleDateFormat("dd-MMM-yyyy");
java.util.Date d = new java.util.Date();
dor = ff.format(d);
Random numGen =new Random();
gstno=Integer.toString(Math.abs((1000)+numGen.nextInt(1000)))+Integer.toString(Math.abs((1000)+numGen.nextInt(1000)))+Integer.toString(Math.abs((1000)+numGen.nextInt(1000)))+Integer.toString(Math.abs((1000)+numGen.nextInt(1000)));

String s= "ABCDEFGHIJKLMNOPQRSTUVWXYZ";
String AlphaNumericString = s+"0123456789"+s.toLowerCase();
int n=8;
StringBuilder sb = new StringBuilder(n);
for (int i = 0; i < n; i++) 
{
    int index= (int)(AlphaNumericString.length()* Math.random());
    sb.append(AlphaNumericString.charAt(index));
}
pass=sb.toString();
Connection con;
ResultSet rs;
String query;
PreparedStatement ps;
boolean flag=true;
int sn=0;
try
{
    Class.forName("com.mysql.jdbc.Driver");

    con = DriverManager.getConnection("jdbc:mysql://localhost:3306/gst?zeroDateTimeBehavior=convertToNull", "root", "");
    String id=(String)session.getAttribute("id");
    
    query="select id from login order by id desc";
    ps=con.prepareStatement(query);
    rs=ps.executeQuery();
    
    if(rs.next())
    {
          sn=rs.getInt(1);
    }
    sn++;


    query="select * from registration where id="+id;
    ps=con.prepareStatement(query);
    rs=ps.executeQuery();
    rs.next(); 
    String email=rs.getString(5);         
    //int sn=Integer.parseInt(rs.getString(1));
    query="insert into user_detail values(?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
    ps=con.prepareStatement(query);
    ps.setInt(1,sn);
    ps.setString(2,rs.getString(2));
    ps.setString(3,rs.getString(3));
    ps.setString(4,rs.getString(4));
    ps.setString(5,rs.getString(5));
    ps.setString(6,rs.getString(6));
    ps.setString(7,rs.getString(7).substring(0,1));
    ps.setString(8,rs.getString(8));
    ps.setString(9,rs.getString(9));
    ps.setString(10,rs.getString(10));
    ps.setString(11,rs.getString(11));
    ps.setString(12,dor);
    ps.setString(13,gstno);
    ps.setString(14,"Active");
    ps.executeUpdate();

    query="insert into login values(?,?,?,?,?)";
    ps=con.prepareStatement(query);
    ps.setInt(1,sn);
    ps.setString(2,email);
    ps.setString(3,pass);
    ps.setString(4,"U");
    ps.setString(5,"Active");
    ps.executeUpdate();
    
    query="update registration set status=? where id="+id;
    ps=con.prepareStatement(query);
    ps.setString(1,"R");
    ps.executeUpdate();
    response.sendRedirect("index.jsp?id=-1&pid=1");
}
catch(Exception e)
{
    out.println(e.getMessage());
}


%>

</body>
</html>