<%
if((String)session.getAttribute("uid")=="" || (String)session.getAttribute("uid")==null)
    {
      session.setAttribute("msg", "");
      session.setAttribute("uid", "");
    }
%>
<%@ include file="header.jsp" %>
<main class="app-content">
  <div class="app-title">
    <div>
      <h1><i class="fa fa-dashboard"></i>Login Page</h1>
      <p><div id="msg" class="error">
          <h4><%=(String)session.getAttribute("msg")%></h4>
      </div></p>
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
              <form method="post" onsubmit="return validate();" name="form" class="row">
                <div class="col-lg-6">
                    
                  <div class="form-group">
                    <label for="exampleInputPassword1">User Id</label>
                    <input class="form-control" id="exampleInputPassword1" name="email" id="email" type="text" placeholder="User Id" value="<%=(String)session.getAttribute("uid")%>">
                    <div id="u" class="error"></div>
                  </div>
                  <div class="form-group">
                    <label for="exampleInputPassword1">Password</label>
                    <input class="form-control" id="exampleInputPassword1" name="password" type="password" placeholder="Password">
                    <div id="p" class="error"></div>
                  </div>
                 
                  <div class="tile-footer">
                    <button class="btn btn-primary" type="submit">Submit</button>
                  </div>
                </div>
                <div class="col-lg-4 offset-1">
                  <div class="form-group">
                    <label for="exampleInputFile">Valid Password</label><br>
                    Password must contain min 5 characters. Password should have a capital letter, a small letter, a digit and a symbol.
                  </div>
                </div>
              </form>   
            </div>
          </div>
        </div>
      </div>
    </div>

</main>
<%@ include file="footer.jsp" %>
<script type="text/javascript">
	function validate()
	{
		var email=form.email.value;
		var pass=form.password.value;
        flag=1;
		if(email=="")
	    {
	      document.getElementById("u").innerHTML="User Id is compulsorry.";
	      if(flag==1){
	        form.email.focus;
	        flag=0;
	      }
	    }
	    else{
	      document.getElementById("u").innerHTML="";
	    }
	    if(pass=="")
	    {
	      document.getElementById("p").innerHTML="Password is compulsorry.";
	      if(flag==1){
	        form.password.focus;
	        flag=0;
	      }
	    }
	    else{
	      document.getElementById("p").innerHTML="";
	    }
	    if(flag==1)
	    {
	        document.form.action="login_check.jsp";
	        document.form.submit();
	        return true;	
	    }
	    else
	        return false;
	}
	
</script>