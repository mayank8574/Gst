<%
if((String)session.getAttribute("uid")=="" || (String)session.getAttribute("uid")==null)
    {
      session.setAttribute("msg", "");
      session.setAttribute("uid", "");
    }
%>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- Main CSS-->
    <link rel="stylesheet" type="text/css" href="css/main.css">
    <!-- Font-icon css-->
    <link rel="stylesheet" type="text/css" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
    <title>Login - GST Application</title>
    <style>
    .msg {
            color: #ff0000;
            font-style: italic;
            font-weight: bold;
            font-size: 18px;
            text-align: left;
    }
    </style>
  </head>
  <body>
    <section class="material-half-bg">
      <div class="cover"></div>
    </section>
    <section class="login-content">
      <div class="logo">
        <h1>GST Application</h1>
      </div>
      <div class="login-box">
        <form class="login-form" method="post" onsubmit="return validate();" name="form">
          <h3 class="login-head"><i class="fa fa-lg fa-fw fa-user"></i>SIGN IN</h3>
          <h5 align="center"><%=session.getAttribute("msg")%></h5>
          <div class="form-group">
            <label class="control-label">USERNAME</label>
            <input class="form-control" name="email" id="email" type="text" placeholder="User Id" value="<%=(String)session.getAttribute("uid")%>" autofocus>
            <div id="u" class="error"></div>
          </div>
          <div class="form-group">
            <label class="control-label">PASSWORD</label>
            <input class="form-control" name="password" type="password" placeholder="Password">
            <div id="p" class="error"></div>
          </div>
          <div class="form-group">
            <div class="utility">
              <div class="animated-checkbox">
                <label>
                  <a href="track.jsp"><span class="label-text">Track Status</span></a>
                </label>
              </div>
              <!-- <p class="semibold-text mb-2"><a href="#" data-toggle="flip">Forgot Password ?</a></p> -->
              <p class="semibold-text mb-2"><a href="registration.jsp">Sign Up ?</a></p>
            </div>
          </div>
          <div class="form-group btn-container">
            <button class="btn btn-primary btn-block"><i class="fa fa-sign-in fa-lg fa-fw"></i>SIGN IN</button>
          </div>
        </form>
        <form class="forget-form" action="index.html">
          <h3 class="login-head"><i class="fa fa-lg fa-fw fa-lock"></i>Forgot Password ?</h3>
          <div class="form-group">
            <label class="control-label">EMAIL</label>
            <input class="form-control" type="text" placeholder="Email">
          </div>
          <div class="form-group btn-container">
            <button class="btn btn-primary btn-block"><i class="fa fa-unlock fa-lg fa-fw"></i>RESET</button>
          </div>
          <div class="form-group mt-3">
            <p class="semibold-text mb-0"><a href="#" data-toggle="flip"><i class="fa fa-angle-left fa-fw"></i> Back to Login</a></p>
          </div>
        </form>
      </div>
    </section>
    <!-- Essential javascripts for application to work-->
    <script src="js/jquery-3.2.1.min.js"></script>
    <script src="js/popper.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <script src="js/main.js"></script>
    <!-- The javascript plugin to display page loading on top-->
    <script src="js/plugins/pace.min.js"></script>
    <script type="text/javascript">
      // Login Page Flipbox control
      $('.login-content [data-toggle="flip"]').click(function() {
      	$('.login-box').toggleClass('flipped');
      	return false;
      });
    </script>
  </body>
</html>
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