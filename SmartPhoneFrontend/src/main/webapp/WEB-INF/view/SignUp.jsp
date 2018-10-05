<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" isELIgnored="false"%>
    <%@taglib uri="http://www.springframework.org/tags/form" prefix="spring" %>
    <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <%@include file="header.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<style type="text/css">
.form-heading { color:#fff; font-size:23px;}
.panel h2{ color:#444444; font-size:18px; margin:0 0 8px 0;}
.panel p { color:#777777; font-size:14px; margin-bottom:30px; line-height:24px;}
.SignUp-form .form-control {
  background: #f7f7f7 none repeat scroll 0 0;
  border: 1px solid #d4d4d4;
  border-radius: 4px;
  font-size: 14px;
  height: 50px;
  line-height: 50px;
}
.main-div {
  background: #ffffff none repeat scroll 0 0;
  border-radius: 2px;
  margin: 10px auto 30px;
  max-width: 38%;
  padding: 50px 70px 70px 71px;
}

.SignUp-form .form-group {
  margin-bottom:10px;
}
.SignUp-form{ text-align:center;}
.forgot a {
  color: #777777;
  font-size: 14px;
  text-decoration: underline;
}
.SignUp-form  .btn.btn-primary {
  background: #f0ad4e none repeat scroll 0 0;
  border-color: #f0ad4e;
  color: #ffffff;
  font-size: 14px;
  width: 100%;
  height: 50px;
  line-height: 50px;
  padding: 0;
}
.forgot {
  text-align: left; margin-bottom:30px;
}
.botto-text {
  color: #ffffff;
  font-size: 14px;
  margin: auto;
}
.SignUp-form .btn.btn-primary.reset {
  background: #ff9900 none repeat scroll 0 0;
}
.back { text-align: left; margin-top:10px;}
.back a {color: #444444; font-size: 13px;text-decoration: none;}







</style>
</head>
<body id="SignUpForm" >
<div class="container">
<br>
<div class="SignUp-form">
<div class="main-div">
    <div class="panel">
   <h2>User Registration</h2>
   <p>Please enter your Details</p>
   </div>
    <spring:form action ="${pageContext.request.contextPath}/addCustomer" modelAttribute="user" method="POST" id="SignUp">

        <div class="form-group">


            <spring:input type="text" class="form-control" id="inputName" placeholder="Enter your Name" path="CustomerName" required="required"/>

        </div>
 <div class="form-group">


            <spring:input type="Email" class="form-control" id="inputEmail" placeholder="Enter your Email" path="emailId" required="required"/>

        </div>

        <div class="form-group">

            <spring:input type="password" class="form-control" id="inputPassword" placeholder="Password" path="password" required="required"/>

        </div>
         <div class="form-group">

            <spring:input type="text" class="form-control" id="inputAddress" placeholder="Enter your Address" path="address" required="required"/>

        </div>
         <div class="form-group">

            <spring:input type="number" class="form-control" id="inputContact" placeholder="Enter your Contact No." path="contactNo" required="required"/>

        </div>
        <div class="form-group">

            <spring:input type="date" class="form-control" id="inputDob" placeholder="Enter your Date Of Birth" path="dob" required="required"/>

        </div>
        
        <button type="submit" class="btn btn-primary">Register</button>
        .

    </spring:form>
    </div>

</div></div>


</body>
</html>