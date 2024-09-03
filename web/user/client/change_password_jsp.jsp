<html>
<body>

<%@ page import="java.sql.*" %>

<%

String opass,npass,uid;

opass=request.getParameter("opass");
npass=request.getParameter("npass");
uid=(String)session.getAttribute("uid");

Connection con;
ResultSet rs;
String query;
PreparedStatement ps;

try
{
    out.println(uid + "<br>");
    Class.forName("com.mysql.jdbc.Driver");
    con = DriverManager.getConnection("jdbc:mysql://localhost:3306/gst?zeroDateTimeBehavior=convertToNull", "root", "");
    out.println("abcd" + "<br>");
    query="select * from login where user_id='"+uid+"' and password='"+opass+"'";
    ps=con.prepareStatement(query);
    rs=ps.executeQuery();
    out.println("xyz" + "<br>");
    if(rs.next())
    {
        query="update login set password='"+npass+"' where user_id='"+uid+"'";
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