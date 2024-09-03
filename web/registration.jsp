<!DOCTYPE html>
<%
    if((String)session.getAttribute("cname")=="" || (String)session.getAttribute("cname")==null)
    {
        //session.setAttribute("msg", "");
        session.setAttribute("cname","");
        session.setAttribute("name","");
        session.setAttribute("email","");
        session.setAttribute("cno","");
        session.setAttribute("add","");
        session.setAttribute("gen","Please Select Your Gender");
        session.setAttribute("pan","");
        session.setAttribute("aadhar","");
        //session.setAttribute("rid","");
    }
    if((String)session.getAttribute("msg")=="" || (String)session.getAttribute("msg")==null)
    {
    	session.setAttribute("msg", "");
    	session.setAttribute("rid","");
    }
%>
<%@ include file="header.jsp" %>
<main class="app-content">
  <div class="app-title">
    <div>
      <h1><i class="fa fa-dashboard"></i>GST Registration Page</h1>
      <h4><%=(String)session.getAttribute("msg")%>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<%=(String)session.getAttribute("rid")%></h4>
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
              <form method="post" onsubmit="return validate();" name="form" class="row" enctype="multipart/form-data">
                <div class="col-lg-6">
                    
                  <div class="form-group">
                    <label for="exampleInputEmail1">Company Name</label>
                    <input class="form-control" id="cname" type="text" name="cname" aria-describedby="emailHelp" value="<%=(String)session.getAttribute("cname")%>" >
                    <small class="error" id="cn"></small>
                  </div>
    			  <div class="form-group">
                    <label for="exampleInputEmail1">Name</label>
                    <input class="form-control" id="name" type="text" 
                    name="name" placeholder="Enter Your Name" aria-describedby="emailHelp" value="<%=(String)session.getAttribute("name")%>" >
                    <small class="error" id="n"></small>
                  </div>
                  <div class="form-group">
                    <label for="exampleInputPassword1">Email Id</label>
                    <input class="form-control" id="email" name="email" type="email" value="<%=(String)session.getAttribute("email")%>" >
                    <small class="error" id="e"></small>
                  </div>
                  <div class="form-group">
                    <label for="exampleInputPassword1">Contact Number</label>
                    <input class="form-control" id="cno" name="cno" placeholder="Enter Contact Number" type="text" value="<%=(String)session.getAttribute("cno")%>" >
                    <small class="error" id="c"></small>
                  </div>
                  
                  <div class="form-group">
                    <label for="exampleTextarea">Address</label>
                    <textarea class="form-control" id="address" name="address" placeholder="Your address here..." rows="3" ><%=(String)session.getAttribute("add")%></textarea>
                    <small class="error" id="a"></small>
                  </div>
                <div class="tile-footer">
              		<button class="btn btn-primary" type="submit">Submit</button>
            	</div>
                    
                    
              </div>
              <div class="col-md-6">
          
                  
                  <div class="form-group">
                    <label for="exampleInputPassword1">PAN Number</label>
                    <input class="form-control" id="pan" name="pan" type="text" value="<%=(String)session.getAttribute("pan")%>" >
                    <small class="error" id="pn"></small>
                  </div>
                  
                  <div class="form-group">
                    <label for="exampleInputPassword1">Aadhar Number</label>
                    <input class="form-control" id="aadhar" name="aadhar" type="text" value="<%=(String)session.getAttribute("aadhar")%>" >
                    <small class="error" id="an"></small>
                  </div>
                  <div class="form-group row">
                  <label class="control-label col-md-3">Gender</label>
                  <div class="col-md-9">
                    <div class="form-check">
                      <label class="form-check-label">
                        <input class="form-check-input" type="radio" name="gen">Male
                      </label>
                    </div>
                    <div class="form-check">
                      <label class="form-check-label">
                        <input class="form-check-input" type="radio" name="gen">Female
                      </label>
                    </div>
                    <small class="error" id="g"></small>
                  </div>
                  
                </div>
                <div class="form-group row">
                  <label class="control-label col-md-3">Identity Proof</label>
                  <div class="col-md-8">
                    <input class="form-control" type="file" accept="image/*" name="image" id="image"  onchange="loadFile(event)">
                    <small class="error" id="i"></small>
                  </div>
                  
                </div>
                  <div class="form-group">
                    <label for="exampleInputFile">Profile Image</label><br>
                    <img id="output" width="100" />
                  </div>
                  
                  
              </div>
        	</form>   
		</div>
    </div>
  </div>
</div>
</div>
</main>
<script>
		var loadFile = function(event) {
		  var image = document.getElementById('output');
		  image.src = URL.createObjectURL(event.target.files[0]);
		};
	</script>
<script type="text/javascript">
	var chk_email=/^([a-zA-Z0-9\.])+\@(([a-zA-Z0-9])+\.)+([a-zA-Z0-9]{2,3})+$/;
    var chk_msg=/^[A-Za-z0-9?,&\n%()=!.\-? ]{10,500}$/;
	var chk_name=/^[A-Za-z ]{2,40}$/;
	var chk_cno=/^[0-9]{10,12}$/;
	var chk_pan=/^[0-9a-zA-Z]{10,10}$/;
	var chk_aadhar=/^[0-9]{12,12}$/;
	function validate()
	{
		var email=form.email.value;
		var name=form.name.value;
		var cname=form.cname.value;
		var cno=form.cno.value;
		var pan=form.pan.value;
		var aadhar=form.aadhar.value;
		var add=form.address.value;
		var gen=form.gen.value;
		var image=form.image.value;
        flag=1;
		
		if(!chk_name.test(cname))
		{
			document.getElementById("cn").innerHTML="Enter a valid Company Name";
			if(flag==1){
				form.cname.focus;
				flag=0;
			}
		}
		else{
			document.getElementById("cn").innerHTML="";
		}
		if(!chk_name.test(name))
		{
			document.getElementById("n").innerHTML="Enter a valid Client Name";
			if(flag==1){
				form.name.focus;
				flag=0;
			}
		}
		else{
			document.getElementById("n").innerHTML="";
		}
		if(!chk_email.test(email))
		{
			document.getElementById("e").innerHTML="Enter a valid Email-Id";
			if(flag==1){
				form.email.focus;
				flag=0;
			}
		}
		else{
			document.getElementById("e").innerHTML="";
		}
		if(!chk_cno.test(cno))
		{
			document.getElementById("c").innerHTML="Enter a valid Contact Number";
			if(flag==1){
				form.cno.focus;
				flag=0;
			}
		}
		else{
			document.getElementById("c").innerHTML="";
		}
		if(!chk_msg.test(add))
		{
			document.getElementById("a").innerHTML="Please enter a valid address";
			if(flag==1){
				form.address.focus;
				flag=0;
			}
		}
		else{
			document.getElementById("a").innerHTML="";
		}
		if(!chk_pan.test(pan))
		{
			document.getElementById("pn").innerHTML="Enter a valid PAN Number";
			if(flag==1){
				form.pan.focus;
				flag=0;
			}
		}
		else{
			document.getElementById("pn").innerHTML="";
		}
		if(!chk_aadhar.test(aadhar))
		{
			document.getElementById("an").innerHTML="Enter a valid Aadhar Number";
			if(flag==1){
				form.aadhar.focus;
				flag=0;
			}
		}
		else{
			document.getElementById("an").innerHTML="";
		}
		if(gen=="")
		{
			document.getElementById("g").innerHTML="Please Select a Gender";
			if(flag==1){
				form.gen.focus;
				flag=0;
			}
		}
		else{
			document.getElementById("g").innerHTML="";
		}
		if(image=="")
		{
			document.getElementById("i").innerHTML="Please Select a Image";
			if(flag==1){
				form.image.focus;
				flag=0;
			}
		}
		else{
			document.getElementById("i").innerHTML="";
		}
        if(flag==1)
        {
            document.form.action="registration_save.jsp";
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
