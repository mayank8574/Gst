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

String name,fname,email,gen,img,cname,cno,add,pan,aadhar,dor,treg,ext="",fileName="";
int sn=0,id;
treg=cname=name=fname=email=cno=gen=img=pan=aadhar=add=" ";
email=request.getParameter("email");
cname=request.getParameter("cname");
java.text.SimpleDateFormat ff = new SimpleDateFormat("dd-MMM-yyyy");
java.util.Date d = new java.util.Date();
dor = ff.format(d);
Random numGen =new Random();
treg=Integer.toString(Math.abs((1000)+numGen.nextInt(1000)))+"-"+Integer.toString(Math.abs((1000)+numGen.nextInt(1000)));

gen="Male";
Connection con;
ResultSet rs;
String query;
PreparedStatement ps;
boolean flag=true;
try
{
    Class.forName("com.mysql.jdbc.Driver");

    con = DriverManager.getConnection("jdbc:mysql://localhost:3306/gst?zeroDateTimeBehavior=convertToNull", "root", "");
    
    if(flag)
    {
        query="select id from registration order by id desc";
        ps=con.prepareStatement(query);
        rs=ps.executeQuery();

        if(rs.next())
        {
              sn=rs.getInt(1);
        }
        sn++;
    }
}
catch(Exception e){}
out.println("abc" + "<br>");

String fn="";
if(gen.equals("Male"))
    fn="male.jpg";
else
    fn="female.jpg";
FileItem fi;
File file ;
int maxFileSize = 5000 * 1024;
int maxMemSize = 5000 * 1024;
ServletContext context = pageContext.getServletContext();
String filePath = context.getInitParameter("upload_profile");

// Verify the content type
String contentType = request.getContentType();
if ((contentType.indexOf("multipart/form-data") >= 0)) 
{

  DiskFileItemFactory factory = new DiskFileItemFactory();
  // maximum size that will be stored in memory
  factory.setSizeThreshold(maxMemSize);
  // Location to save data that is larger than maxMemSize.
  factory.setRepository(new File("c:\\temp"));

  // Create a new file upload handler
  ServletFileUpload upload = new ServletFileUpload(factory);
  // maximum file size to be uploaded.
  upload.setSizeMax( maxFileSize );
  try
  { 
     // Parse the request to get file items.
     List fileItems = upload.parseRequest(request);

     // Process the uploaded file items
     Iterator i = fileItems.iterator();

     
     String fieldName;
     while ( i.hasNext () ) 
     {
        fi = (FileItem)i.next();
        fieldName = fi.getFieldName();
        if ( !fi.isFormField () )   
        {
            // Get the uploaded file parameters
            //fieldName = fi.getFieldName();
        
            fileName = fi.getName();
            boolean isInMemory = fi.isInMemory();
            long sizeInBytes = fi.getSize();
            ext=fileName.substring(fileName.lastIndexOf(".")+1);
            // Write the file
            
            fileName=pan+"."+ext;
            if( fileName.lastIndexOf("\\") >= 0 )
            {
                //file = new File( filePath +fileName.substring( fileName.lastIndexOf("\\"))) ;
                file = new File( filePath +fileName) ;
            }
            else
            {
                //file = new File( filePath +fileName.substring(fileName.lastIndexOf("\\")+1)) ;
                file = new File( filePath +fileName) ;
            }
            if(ext.toLowerCase().equals("jpg")==true || ext.toLowerCase().equals("png")==true || ext.toLowerCase().equals("jpeg")==true)
               fi.write( file ) ;
            out.println("Uploaded Filename: " + fn + "<br>");
            out.println("Uploaded Filename: " + filePath + fileName + "<br>");
        }
        else
        {
            if(fieldName.equals("cname"))
                cname=(String)fi.getString();
            else if(fieldName.equals("name"))
                name=(String)fi.getString();
            else if(fieldName.equals("fname"))
                fname=(String)fi.getString();
            else if(fieldName.equals("email"))
                email=(String)fi.getString();
            else if(fieldName.equals("cno"))
                cno=(String)fi.getString();
            else if(fieldName.equals("address"))
                add=(String)fi.getString();
            else if(fieldName.equals("gen"))
                gen=(String)fi.getString();
            else if(fieldName.equals("aadhar"))
                aadhar=(String)fi.getString();
            else if(fieldName.equals("pan"))
                pan=(String)fi.getString();

        }
     }
  }
  catch(Exception ex) 
  {
     System.out.println(ex);

  }
}
    out.println("Name: " + name + "<br>");
    out.println("Vinod"+ "<br>");
try
{
    Class.forName("com.mysql.jdbc.Driver");

    con = DriverManager.getConnection("jdbc:mysql://localhost:3306/gst?zeroDateTimeBehavior=convertToNull", "root", "");
    query="select id from registration where companyname='"+cname+"'";
    ps=con.prepareStatement(query);
    rs=ps.executeQuery();

    if(rs.next())
    {
          flag=false;
          session.setAttribute("msg", "Company name already registered");
    }
    if(flag)
    {
        query="select id from registration where email_id='"+email+"'";
        ps=con.prepareStatement(query);
        rs=ps.executeQuery();

        if(rs.next())
        {
              flag=false;
              session.setAttribute("msg", "Email-Id already registered");
        }    
    }  
    if(flag)
    {
        query="select id from registration where panno='"+pan+"'";
        ps=con.prepareStatement(query);
        rs=ps.executeQuery();

        if(rs.next())
        {
              flag=false;
              session.setAttribute("msg", "PAN number already registered");
        }    
    }                              
    if(flag)
    {
        query="insert into registration values(?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
        ps=con.prepareStatement(query);
        gen=gen.substring(0,1);
        ps.setInt(1,sn);
        ps.setString(2,cname.toUpperCase());
        ps.setString(3,name.toUpperCase());
        ps.setString(4,fname.toUpperCase());
        ps.setString(5,email.toLowerCase());
        ps.setString(6,cno);
        ps.setString(7,gen);
        ps.setString(8,add.toUpperCase());
        ps.setString(9,aadhar);
        ps.setString(10,pan.toUpperCase());
        ps.setString(11,fileName);
        ps.setString(12,dor);
        ps.setString(13,treg);
        ps.setString(14,"U");
        ps.executeUpdate();
        session.setAttribute("cname","");
        session.setAttribute("name","");
        session.setAttribute("email","");
        session.setAttribute("cno","");
        session.setAttribute("add","");
        session.setAttribute("gen","");
        session.setAttribute("pan","");
        session.setAttribute("aadhar","");
        session.setAttribute("msg", "Registration is Successfully");
        session.setAttribute("rid", "Reference Id-"+treg);
        response.sendRedirect("registration.jsp");
    }
    else
    {
        session.setAttribute("cname",cname);
        session.setAttribute("name",name);
        session.setAttribute("email",email);
        session.setAttribute("cno",cno);
        session.setAttribute("add",add);
        session.setAttribute("gen",gen);
        session.setAttribute("pan",pan);
        session.setAttribute("aadhar",aadhar);
        response.sendRedirect("registration.jsp");
    }
}
catch(Exception e)
{
    out.println(e.getMessage());
}


%>

</body>
</html>