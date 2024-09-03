<html>
<body>
<%@ page import="java.sql.*" %>
<%
String email,pass;
email=request.getParameter("email");
pass=request.getParameter("password");

Connection con;
ResultSet rs;
String query;
PreparedStatement ps;

try
{

    //Class.forName("oracle.jdbc.driver.OracleDriver");
    //con=DriverManager.getConnection("jdbc :oracle:thin:@127.0.0.1:8081:xe","institute","abcd");

    Class.forName("com.mysql.jdbc.Driver");

    con = DriverManager.getConnection("jdbc:mysql://localhost:3306/gst?zeroDateTimeBehavior=convertToNull", "root", "");

    query="select a.id,email_id,name,image,profile,b.status,gstno from user_detail a,login b where a.id=b.id and email_id='"+email+"' and password='"+pass+"'";

    ps=con.prepareStatement(query);
    rs=ps.executeQuery();


    if(rs.next())
    {
        session.setAttribute("id", rs.getString(1));
        session.setAttribute("uid", email);
        session.setAttribute("uname", rs.getString(3));
        session.setAttribute("img", rs.getString(4));
        String up= rs.getString(5);
        String status= rs.getString(6);
        session.setAttribute("gno", rs.getString(7));
        if(status.equals("Active"))
        {
            if(up.equals("A"))
            {
                session.setAttribute("up", "Admin");
                response.sendRedirect("user/admin/index.jsp?id=-1&pid=1");
            }
            else
            {
                session.setAttribute("up", "User");
                response.sendRedirect("user/client/gstreturn.jsp?pid=1&id=-1");
            }
        }
        else
        {
            session.setAttribute("uid", email);
            session.setAttribute("msg", "You are blocked. Please contact Admin");
            response.sendRedirect("index.jsp");
        }
    }
    else
    {
        session.setAttribute("uid", email);
        session.setAttribute("msg", "Invalid User Id / Password");
        response.sendRedirect("index.jsp");
    }
}
catch(Exception e)
{
    session.setAttribute("msg", "Something went wrong");
    System.out.println(e.getMessage());
}

%>

</body>
</html>