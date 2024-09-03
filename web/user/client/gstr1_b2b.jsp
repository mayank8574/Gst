<!DOCTYPE html>
<%
    
        session.setAttribute("gstno","");
        session.setAttribute("ino","");
        session.setAttribute("tvalue","");
        session.setAttribute("idate","");
        session.setAttribute("cgst","");
        session.setAttribute("sgst","");
        session.setAttribute("tamt","");
    
    if((String)session.getAttribute("msg")=="" || (String)session.getAttribute("msg")==null)
    {
    	session.setAttribute("msg", "");
    }
    session.setAttribute("rec", "new");
%>
<%@ include file="header.jsp" %>
<main class="app-content">
  <div class="app-title">
    <div>
      <h1><i class="fa fa-dashboard"></i>GSTR-1 Detail</h1>
      <h4><%=(String)session.getAttribute("msg")%></h4>
    </div>
    <ul class="app-breadcrumb breadcrumb">
      <li class="breadcrumb-item"><i class="fa fa-home fa-lg"></i></li>
      <li class="breadcrumb-item"><a href="gstreturn.jsp?pid=1&id=-1">Dashboard</a></li>
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
                    <label for="exampleInputEmail1">GST Number</label>
                    <input class="form-control" id="gstno" type="text" name="gstno" placeholder="Enter GST Number" aria-describedby="emailHelp" value="<%=(String)session.getAttribute("gstno")%>" >
                    <small class="error" id="gn"></small>
                  </div>
    			  <div class="form-group">
                    <label for="exampleInputEmail1">Invoice Number</label>
                    <input class="form-control" id="ino" type="text" 
                    name="ino" placeholder="Enter Invoice Number" aria-describedby="emailHelp" value="<%=(String)session.getAttribute("ino")%>" >
                    <small class="error" id="in"></small>
                  </div>
                  <div class="form-group">
                    <label for="exampleInputEmail1">Invoice Date</label>
                    <input class="form-control" id="idate" type="date" 
                    name="idate" pattern="\d{2}-\d{2}-\d{4}" value="<%=(String)session.getAttribute("idate")%>" >
                    <small class="error" id="id"></small>
                  </div>
                  
                <div class="tile-footer">
              		<button class="btn btn-primary" type="submit">Submit</button>
            	</div>
                    
                    
              </div>
              <div class="col-md-6">
          
                  
                  <div class="form-group">
                    <label for="exampleInputPassword1">Tax Value</label>
                    <input class="form-control" id="tvalue" name="tvalue" placeholder="Enter Tax Value" type="text" onchange="calc(this)" value="<%=(String)session.getAttribute("tvalue")%>" >
                    <small class="error" id="tv"></small>
                  </div>
                  
                  <div class="form-group">
                    <label for="exampleInputPassword1">CGST</label>
                    <input class="form-control" id="cgst" name="cgst" type="text" placeholder="Enter CGST %" onchange="calc(this)" value="<%=(String)session.getAttribute("cgst")%>" >
                    <small class="error" id="cg"></small>
                  </div>
                  <div class="form-group">
                    <label for="exampleInputPassword1">SGST</label>
                    <input class="form-control" id="sgst" name="sgst" type="text" placeholder="Enter sGST %" onchange="calc(this)" value="<%=(String)session.getAttribute("sgst")%>" >
                    <small class="error" id="sg"></small>
                  </div>
                  <div class="form-group">
                    <label for="exampleInputPassword1">Total Value</label>
                    <input class="form-control" id="tamt" name="tamt" type="text" value="<%=(String)session.getAttribute("tamt")%>" readonly>
                    <small class="error" id="t"></small>
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
	var chk_gst=/^[0-9]{16,16}$/;
	var chk_ino=/^[0-9]{1,10}$/;
	function validate()
	{
		var gstno=form.gstno.value;
		var ino=form.ino.value;
		var tvalue=form.tvalue.value;
		var cgst=form.cgst.value;
		var sgst=form.sgst.value;
		var idate=form.idate.value;
		
        flag=1;
		
		if(!chk_gst.test(gstno))
		{
			document.getElementById("gn").innerHTML="Enter a valid GST Number";
			if(flag==1){
				form.gstno.focus;
				flag=0;
			}
		}
		else{
			document.getElementById("gn").innerHTML="";
		}
		if(!chk_ino.test(ino))
		{
			document.getElementById("in").innerHTML="Enter a valid Invoice Number";
			if(flag==1){
				form.ino.focus;
				flag=0;
			}
		}
		else{
			document.getElementById("in").innerHTML="";
		}
		if(idate=="")
		{
			document.getElementById("id").innerHTML="Enter Invoice Date";
			if(flag==1){
				form.idate.focus;
				flag=0;
			}
		}
		else{
			document.getElementById("id").innerHTML="";
		}
		if(!chk_ino.test(tvalue))
		{
			document.getElementById("tv").innerHTML="Enter a valid Tax Value";
			if(flag==1){
				form.tvalue.focus;
				flag=0;
			}
		}
		else{
			document.getElementById("tv").innerHTML="";
		}
		if(!chk_ino.test(cgst))
		{
			document.getElementById("cg").innerHTML="Enter a valid CGST Value";
			if(flag==1){
				form.cgst.focus;
				flag=0;
			}
		}
		else{
			document.getElementById("cg").innerHTML="";
		}
		if(!chk_ino.test(sgst))
		{
			document.getElementById("sg").innerHTML="Enter a valid SGST Value";
			if(flag==1){
				form.sgst.focus;
				flag=0;
			}
		}
		else{
			document.getElementById("sg").innerHTML="";
		}
        if(flag==1)
        {
            document.form.action="gstr1_b2b_save.jsp";
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
	function calc(v){
    var tv = parseInt(v.form.tvalue.value);
    var per = parseInt(v.form.cgst.value)+parseInt(v.form.sgst.value);
    var tamt=tv+tv*(per/100);
    if(tamt>0)
    	v.form.tamt.value=tamt;
    //alert(tamt);
 } 
</script>
