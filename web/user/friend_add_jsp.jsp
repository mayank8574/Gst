<html>
<body>

<%@ page import="java.sql.*" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%

String name,email,gen,dob,doa,img,profession,cno,add,country,city,bg,ms,company,dor,uid;
int sn=0,id;
name=request.getParameter("name");
email=request.getParameter("email");
cno=request.getParameter("cno");
dob=request.getParameter("dob");
city=request.getParameter("city");
bg=request.getParameter("bg");
add=request.getParameter("add");
gen=request.getParameter("gen");
profession=request.getParameter("profession");
company=request.getParameter("company");
country=request.getParameter("country");
ms=request.getParameter("ms");
doa=request.getParameter("doa");
uid=(String)session.getAttribute("id");
id=Integer.parseInt(uid);

img="";
java.text.SimpleDateFormat ff = new SimpleDateFormat("dd-MMM-yyyy");
java.util.Date d = new java.util.Date();
dor = ff.format(d);

Connection con;
ResultSet rs;
String query;
PreparedStatement ps;

try
{
    Class.forName("com.mysql.jdbc.Driver");

    con = DriverManager.getConnection("jdbc:mysql://localhost:3306/digital_diary", "root", "");

    query="select sno from friends_detail order by sno desc";
    ps=con.prepareStatement(query);
    rs=ps.executeQuery();

    if(rs.next())
    {
          sn=rs.getInt(1);
    }
    sn++;
    out.println("Name: " + name + "<br>");
    out.println("Profession: " + profession + "<br>");
    out.println("Id " + id + "<br>");
    out.println("DOA " + doa + "<br>");
    img=gen.toLowerCase()+".jpg";    
    query="insert into friends_detail values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
    ps=con.prepareStatement(query);

    ps.setInt(1,sn);
    ps.setInt(2,id);
    ps.setString(3,name.toUpperCase());
    ps.setString(4,gen);
    ps.setString(5,dob);
    ps.setString(6,img);
    ps.setString(7,cno);
    ps.setString(8,email);
    ps.setString(9,bg);
    ps.setString(10,profession);
    ps.setString(11,ms);
    ps.setString(12,doa);
    ps.setString(13,company);
    ps.setString(14,city);
    ps.setString(15,add);
    ps.setString(16,country);
    ps.setString(17,dor);
    ps.executeUpdate();
    session.setAttribute("msg", "Friend's Detail saved Successfully");
    response.sendRedirect("friend_add.jsp");
}
catch(Exception e)
{
    out.println(e.getMessage());
}
%>

</body>
</html>