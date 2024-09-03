<%@ include file="header.jsp" %>
<main class="app-content">
      <div class="app-title">
        <div>
          <h1><i class="fa fa-dashboard"></i> Change Password</h1>
          <p></p>
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
                <div class="col-lg-6">
                  <%=(String)session.getAttribute("msg")%>
                <form  method="post" onsubmit="return validate();" name="form">
                  <div class="form-group">
                    <label for="exampleInputPassword1">Old Password</label>
                    <input class="form-control" id="exampleInputPassword1" name="opass" type="password" placeholder="Password">
                  </div>
                  <div class="form-group">
                    <label for="exampleInputPassword1">New Password</label>
                    <input class="form-control" id="exampleInputPassword1" name="npass" type="password" placeholder="Password">
                  </div>
                <div class="form-group">
                    <label for="exampleInputPassword1">Confirm Password</label>
                    <input class="form-control" id="exampleInputPassword1" name="cpass" type="password" placeholder="Password">
                  </div>
                <div class="tile-footer">
              <button class="btn btn-primary" type="submit">Submit</button>
            </div>
                </form>
            </div> 
                              </div>
          </div>
</div>
</div>
<%@ include file="footer.jsp" %>
<script type="text/javascript">

	var chk_pass=/^(?=.*[a-z])(?=.*[A-Z])(?=.*[0-9])(?=.*[!@#$%^&*])[a-zA-Z0-9!@#$%^&*]{5,16}$/;
	
	function validate()
	{
		var opass=form.opass.value;
		var npass=form.npass.value;
		var cpass=form.cpass.value;
		var arr=[];
		if(opass==""){
				arr[arr.length]="Old Password is compulsory";
			}
		if(!chk_pass.test(npass)){
				arr[arr.length]="Enter a valid User Password";
			}
		if(npass!=cpass){
				arr[arr.length]="New Password & Confirm Password mismatched";
			}
		if(arr.length>0)
		{
			var msg="Please enter following detail properly...\n";
			for(var i=0;i<arr.length;i++)
				msg+="\n"+(i+1)+". "+arr[i];
			alert(msg);
			return false;	
		}
                document.form.action="change_password_jsp.jsp";
                document.form.submit();
                return true;
	}
</script>
