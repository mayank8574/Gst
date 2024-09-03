<%@ include file="header.jsp" %>
<main class="app-content">
  <div class="app-title">
    <div>
      <h1><i class="fa fa-dashboard"></i>Home Page</h1>
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
                    <label for="exampleInputPassword1">Old Password</label>
                    <input class="form-control" id="exampleInputPassword1" name="opass" type="password" placeholder="Password">
                    <div id="op" class="error"></div>
                  </div>
                  <div class="form-group">
                    <label for="exampleInputPassword1">New Password</label>
                    <input class="form-control" id="exampleInputPassword1" name="npass" type="password" placeholder="Password">
                    <div id="np" class="error"></div>
                  </div>
                  <div class="form-group">
                    <label for="exampleInputPassword1">Confirm Password</label>
                    <input class="form-control" id="exampleInputPassword1" name="cpass" type="password" placeholder="Password">
                    <div id="cp" class="error"></div>
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

  var chk_pass=/^(?=.*[a-z])(?=.*[A-Z])(?=.*[0-9])(?=.*[!@#$%^&*])[a-zA-Z0-9!@#$%^&*]{5,16}$/;
  
  function validate()
  {
    var opass=form.opass.value;
    var npass=form.npass.value;
    var cpass=form.cpass.value;
    flag=1;
    if(opass=="")
    {
      document.getElementById("op").innerHTML="Old password is compulsorry.";
      if(flag==1){
        form.opass.focus;
        flag=0;
      }
    }
    else{
      document.getElementById("op").innerHTML="";
    }
    if(!chk_pass.test(npass))
    {
      document.getElementById("np").innerHTML="Enter a valid password.";
      if(flag==1){
        form.npass.focus;
        flag=0;
      }
    }
    else{
      document.getElementById("np").innerHTML="";
    }
    if(npass!=cpass){
        document.getElementById("cp").innerHTML="New password and Confrm password mismatched.";
      if(flag==1){
        form.cpass.focus;
        flag=0;
      }
    }
    else{
      document.getElementById("cp").innerHTML="";
    }
    if(flag==1)
    {
        document.form.action="change_password_jsp.jsp";
        document.form.submit();
        return true;
    }
    else
      return false;
  }
</script>
