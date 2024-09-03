<html>
<body>

<%@ page import="java.sql.*" %>

<%

String opass,npass,id;

opass=request.getParameter("opass");
npass=request.getParameter("npass");
id=(String)session.getAttribute("id");

Connection con;
ResultSet rs;
String query;
PreparedStatement ps;

try
{
    Class.forName("com.mysql.jdbc.Driver");
    con = DriverManager.getConnection("jdbc:mysql://localhost:3306/digital_diary", "root", "");
    query="select * from login where id="+id+" and password='"+opass+"'";
    ps=con.prepareStatement(query);
    rs=ps.executeQuery();
    if(rs.next())
    {
        query="update login set password='"+npass+"' where id="+id;
        ps=con.prepareStatement(query);
        //ps.setString(1,npass);
        ps.executeUpdate();
        session.setAttribute("msg", "Password Updated Successfully");
        response.sendRedirect("change_password.jsp");
    }
    else
    {
        session.setAttribute("msg", "Invalid Old Password");
        response.sendRedirect("change_password.jsp");
    }
}
catch(Exception e)
{
    System.out.println(e.getMessage());
}

%>

</body>
</html>