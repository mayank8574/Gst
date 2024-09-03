<!DOCTYPE html>
<%
    if((String)session.getAttribute("refid")=="" || (String)session.getAttribute("refid")==null)
    {
    	session.setAttribute("refid","");
        /*session.setAttribute("uname","");
        session.setAttribute("pass","");
        session.setAttribute("gstno","");*/
    }
    
    if((String)session.getAttribute("msg")=="" || (String)session.getAttribute("msg")==null)
    {
    	session.setAttribute("msg", "");
    	session.setAttribute("uname","");
        session.setAttribute("pass","");
        session.setAttribute("gstno","");
    	
    }
%>
<%@ include file="header.jsp" %>
<main class="app-content">
  <div class="app-title">
    <div>
      <h1><i class="fa fa-dashboard"></i>Track your GST Registration status</h1>
      <h4><%=(String)session.getAttribute("msg")%></h4>
    </div>
    <ul class="app-breadcrumb breadcrumb">
      <li class="breadcrumb-item"><i class="fa fa-home fa-lg"></i></li>
      <li class="breadcrumb-item"><a href="index.jsp">Login</a></li>
    </ul>
  </div>
  
  
  <div class="row">
          <div class="col-md-12">
          <div class="tile">
            <div class="row">
            <div class="col" style="margin: 0;">
              <form method="post" onsubmit="return validate();" name="form" class="row" >
                <div class="col-lg-6">
                    
                  <div class="form-group">
                    <label for="exampleInputEmail1">Reference Id</label>
                    <input class="form-control" id="rid" type="text" name="rid" aria-describedby="emailHelp" value="<%=(String)session.getAttribute("refid")%>" >
                    <small class="error" id="r"></small>
                  </div>
    			  <% if(session.getAttribute("flag")=="1"){%>
    			  <div class="form-group">
                    <label for="exampleInputEmail1">User Id</label>
                    <input class="form-control" id="email" name="email" type="email" value="<%=(String)session.getAttribute("uname")%>" >
                    
                  </div>
                  <div class="form-group">
                    <label for="exampleInputPassword1">Password</label>
                    <input class="form-control" value="<%=(String)session.getAttribute("pass")%>" >
                  </div>
                  
                  <div class="form-group">
                    <label for="exampleInputPassword1">GST No</label>
                    <input class="form-control" value="<%=(String)session.getAttribute("gstno")%>" >
                  </div>
                  <% }%>
                <div class="tile-footer">
              		<button class="btn btn-primary" type="submit">Submit</button>
            	</div>
                    
                    
              </div>
              <div class="col-md-6">
                  <div class="form-group">
                    
                  </div>
              </div>
        	</form>   
		</div>
    </div>
  </div>
</div>
</div>
</main>

<script type="text/javascript">
	
	var chk_rid=/^[0-9\-]{9,9}$/;
	function validate()
	{
		var rid=form.rid.value;
		
        flag=1;
		
		if(!chk_rid.test(rid))
		{
			document.getElementById("r").innerHTML="Enter a valid Reference Id";
			if(flag==1){
				form.rid.focus;
				flag=0;
			}
		}
		else{
			document.getElementById("r").innerHTML="";
		}
		
        if(flag==1)
        {
            document.form.action="track_check.jsp";
            document.form.submit();
            return true;	
        }
        else
        {
            
            <%
				//session.removeAttribute("msg");
				session.setAttribute("msg", "Please fill the detail properly");
			%>
			return false;
        }
	}
	
</script>
