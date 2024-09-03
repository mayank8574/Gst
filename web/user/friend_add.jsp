<%@ include file="header.jsp" %>
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
                    <input class="form-control" id="exampleInputEmail1" type="text" name="name" aria-describedby="emailHelp" placeholder="Enter Friend's Name">
                    <small class="error" id="n"></small>
                  </div>
    
                  <div class="form-group">
                    <label for="exampleInputPassword1">Email Id</label>
                    <input class="form-control" id="exampleInputPassword1" name="email" type="email" placeholder="Email Id">
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
                  
                  <fieldset class="form-group">
                    Gender
                    <div class="form-check">
                      <label class="form-check-label">
                          <input class="form-check-input" id="optionsRadios1" type="radio" name="gen" value="M" checked="true">Male
                      </label>
                    </div>
                    <div class="form-check">
                      <label class="form-check-label">
                        <input class="form-check-input" id="optionsRadios1" type="radio" name="gen" value="F" >Female
                      </label>
                    </div>
                    
                  </fieldset>
                  
                        <div class="tile-footer">
              <button class="btn btn-primary" type="submit">Submit</button>
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
<script>
	var chk_name=/^[a-zA-Z. ]{2,40}$/;
	var chk_cno=/^[0-9\-]{10,10}$/;
	var chk_msg=/^[A-Za-z0-9?,&\n%()=!.\- ]{10,500}$/;
	var chk_email=/^([a-zA-Z0-9.])+\@(([a-zA-Z0-9])+\.)+([a-zA-Z0-9]{2,4})+$/;
	function validate()
	{
		var name=form1.name.value;	
					
		var flag=1;
		if(!chk_name.test(name))
		{
			document.getElementById('n').innerHTML = "You Must Enter a Valid Name";
  			if(flag==1)
				form1.name.focus();
  			flag=0;
		}
		else
  			document.getElementById('n').innerHTML = "";	
		
		if(flag==1)
                {
                    document.form1.action="friend_add_jsp.jsp";
                    document.form1.submit();
                    return true;
                }
		else
			return false;
	}
</script>