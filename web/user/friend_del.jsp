<%@ include file="header.jsp"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%
        String sno= request.getParameter("s_no");
        Connection con;
        ResultSet rs;
        String query;
        PreparedStatement ps;
        String name="",gen="";
	if(sno==null)
            response.sendRedirect("user_home.jsp");
        else
        {
		

                try
                {
                    Class.forName("com.mysql.jdbc.Driver");

                    con = DriverManager.getConnection("jdbc:mysql://localhost:3306/digital_diary", "root", "");

                    query="select * from friends_detail where sno="+sno;
                    ps=con.prepareStatement(query);
                    rs=ps.executeQuery();
                    rs.next();
                    name=rs.getString(3);
                    gen=rs.getString(4);
                    if(gen.equals("M"))
                        gen="Male";
                    else
                        gen="Female";
                    
                }
                catch(Exception e){name="abcd";}
        }
            %>
<main class="app-content">
      <div class="app-title">
        <div>
          <h1><i class="fa fa-dashboard"></i> New Friend's Detail</h1>
          <p>A free and modular admin template</p>
        </div>
        <ul class="app-breadcrumb breadcrumb">
          <li class="breadcrumb-item"><i class="fa fa-home fa-lg"></i></li>
          <li class="breadcrumb-item"><a href="#">Dashboard</a></li>
        </ul>
      </div>
<div class="row">
          <div class="col-md-12">
          <div class="tile">
            <div class="row">
<div class="col" style="margin: 0;">
<form method="post" onsubmit="return validate();" name="form1" class="row">
                <div class="col-lg-6">
                    
                  <div class="form-group">
                    <label for="exampleInputEmail1">Name</label>
                    <input class="form-control" id="exampleInputEmail1" type="text" name="name" aria-describedby="emailHelp" value="<%=name%>" readonly="">
                    <small class="error" id="n"></small>
                  </div>
    
                  <div class="form-group">
                    <label for="exampleInputPassword1">Email Id</label>
                    <input class="form-control" id="exampleInputPassword1" name="email" type="email" value="<%=sno%>" readonly="">
                  </div>
                  <div class="form-group">
                    <label for="exampleInputPassword1">Contact Number</label>
                    <input class="form-control" id="exampleInputPassword1" name="cno" type="text" placeholder="Contact Number">
                  </div>
                  <div class="form-group">
                    <label for="exampleInputPassword1">Date Of Birth</label>
                    <input class="form-control" id="exampleInputPassword1" name="dob" type="date" placeholder="Date Of Birth">
                  </div>
                  <div class="form-group">
                    <label for="exampleInputPassword1">Living City</label>
                    <input class="form-control" id="exampleInputPassword1" name="city" type="text" placeholder="Living City">
                  </div>
                  <div class="form-group">
                    <label for="exampleSelect1">Select Blood Group</label>
                    <select class="form-control" id="exampleSelect1" name="bg">
                        <option value="A+">A+</option>
                        <option value="A-">A-</option>
                        <option value="B+">B+</option>
                        <option value="B-">B-</option>
                        <option value="AB+">AB+</option>
                        <option value="AB-">AB-</option>
                        <option value="O+">O+</option>
                        <option value="O-">O-</option>
                        
                      </select>
                  </div>
                  
                  <div class="form-group">
                    <label for="exampleTextarea">Address</label>
                    <textarea class="form-control" id="exampleTextarea" name="add" rows="3"></textarea>
                  </div>
                  <div class="form-group">
                    <label for="exampleInputPassword1">Gender</label>
                    <input class="form-control" id="exampleInputPassword1" name="city" type="text" value="<%=gen%>" readonly="">
                  </div>
                  
                  
                        <div class="tile-footer">
              <button class="btn btn-primary" type="submit">Submit</button>
              &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="user_home.jsp"> Back</a>
            </div>
                    
                    
              </div>
              <div class="col-lg-4 offset-1">
                  
                  <div class="form-group">
                    <label for="exampleSelect1">Select Profession</label>
                    <select class="form-control" id="exampleSelect1" name="profession">
                        <option value="Student">Student</option>
                        <option value="Employee">Employee</option>
                        <option value="Business">Business</option>
                      </select><div id="p"></div>
                  </div>
                  <div class="form-group">
                    <fieldset>
                      <label class="control-label" for="readOnlyInput">Compnay</label>
                      <input class="form-control" id="readOnlyInput" type="text" name="company" placeholder="Company Name">
                    </fieldset>
                  </div>
                  <div class="form-group">
                    <label for="exampleInputPassword1">Living Country</label>
                    <input class="form-control" id="exampleInputPassword1" name="country" type="text" placeholder="Living Country">
                  </div>
                  <div class="form-group">
                    <label for="exampleSelect1">Select Marital Status</label>
                    <select class="form-control" id="exampleSelect1" name="ms">
                        <option value="Unmarried">Unmarried</option>
                        <option value="Married">Married</option>
                        
                      </select>
                  </div>
                  <div class="form-group">
                    <label for="exampleInputPassword1">Date Of Anniversary</label>
                    <input class="form-control" id="exampleInputPassword1" name="doa" type="date">
                  </div>
                  <div class="form-group">
                    <label for="exampleInputFile">Select Image</label>
                    <input class="form-control-file" id="exampleInputFile" type="file" aria-describedby="fileHelp">
                  </div>
                  
                  
              </div>
        </form>   
</div>
                            </div>
          </div>
</div>
</div>
<%@ include file="footer.jsp" %>
