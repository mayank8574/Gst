<html>
<body>
<%@ page import="java.sql.*" %>
<%
String rid,email;
rid=request.getParameter("rid");
session.setAttribute("refid", rid);
Connection con;
ResultSet rs;
String query;
PreparedStatement ps;
email="";
try
{

    Class.forName("com.mysql.jdbc.Driver");
    con = DriverManager.getConnection("jdbc:mysql://localhost:3306/gst?zeroDateTimeBehavior=convertToNull", "root", "");

    query="select email_id,status from registration where temp_regno='"+rid+"'";
    ps=con.prepareStatement(query);
    rs=ps.executeQuery();
    
    if(rs.next())
    {
        email=rs.getString(1);
        if(rs.getString(2).equals("B")==false)
        {
            query="select name,password,gstno from user_detail a,login b where a.id=b.id and email_id='"+email+"'";
            ps=con.prepareStatement(query);
            rs=ps.executeQuery();

            if(rs.next())
            {
                
                session.setAttribute("name", rs.getString(1));
                session.setAttribute("uname", email);
                session.setAttribute("pass", rs.getString(2));
                session.setAttribute("gstno", rs.getString(3));
                session.setAttribute("flag", "1");
                session.setAttribute("msg", "Your GST Application successfully processed");
                response.sendRedirect("track.jsp");
                
            }
            else
            {
                
                session.setAttribute("flag", "0");
                session.setAttribute("msg", "Your GST Application is under process");
                response.sendRedirect("track.jsp");
            }
        }
        else
        {
            
            session.setAttribute("flag", "0");
            session.setAttribute("msg", "Your GST Application is Rejected");
            response.sendRedirect("track.jsp");
        }
    }
    else
    {
        
        session.setAttribute("flag", "0");
        session.setAttribute("msg", "Invalid Reference Id");
        response.sendRedirect("track.jsp");
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