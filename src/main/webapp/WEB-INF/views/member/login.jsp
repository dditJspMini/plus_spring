<%@page import="com.nonage.dto.MemberVO"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>

<!DOCTYPE html>
<html>
<title>Sign Up</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="http://www.w3schools.com/lib/w3.css">
<body>

	<div class="w3-card-4">
		<div class="w3-container w3-brown">
			<h2>Login to Your Account</h2>
		</div>
		<form class="w3-container" name="form">
			<p>
				<label class="w3-label w3-text-brown"><b>ID</b></label> <input
					class="w3-input w3-border w3-sand" name="id" type="text"
					value="${id}">
			</p>
			<p>
				<label class="w3-label w3-text-brown"><b>PASSWORD</b></label> <input
					class="w3-input w3-border w3-sand" name="pwd" type="password">
			</p>
			<p>
				<button class="w3-btn w3-brown" type="button"
					onclick="send(this.form)" name="login" value="Login">Register</button>
			</p>
		</form>
	</div>
</body>
<script type="text/javascript">
  
    function send(form) {
    	
   	//alert("${loginDir}");
  	form.action="<%=request.getContextPath()%>/member/login";
    form.target = opener.window.name;
  	form.method="post";
  	form.submit();
  	
  	self.close();
  	
 	//form.target="_parent";
  	
 	//form.target="index"; 
   	//opener.parent.location.reload();
   	//window.opener.location.reload(true);
   	//setTimeout(window.close(), 2000);
	//window.close();
	
    
    
    }
    
    function join(form2){
    	
    	form2.action="<%=request.getContextPath()%>/joinForm.did";
    	form2.method="get";
      	form2.submit();
       	form2.target="index";
       	
       	/* window.close(); */
       	
      /*  	window.close(); */
    	
    	
    }
    
   
   	
   <%--  opener.top.location.href="<%=request.getContextPath()%>/index.did"; --%>
    
</script>
</html>


<%-- 
		<div class="login">
			<h1>Login to Your Account</h1>
			<br>
			<form method="post" action="login.did" name="form">
				<input type="text" name="id" placeholder="USER ID" value="${id}">
				
				<input type="password" name="pwd" placeholder="Password"> 
				<input
					type="submit" name="login" class="login loginmodal-submit"
					value="Login" onclick="send(this.form)">
			</form>
		</div>

 --%>

















