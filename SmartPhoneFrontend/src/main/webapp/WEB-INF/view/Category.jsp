 <%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" isELIgnored="false"%>
    <%@include file="header.jsp"  %>
    <%@taglib uri="http://www.springframework.org/tags/form" prefix="spring" %>
    <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Add Category</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

</head>
<body>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>


<div class="container">
<h2 align="center">Add Category</h2><hr>
<spring:form action="${pageContext.request.contextPath}/adminaddCategory" modelAttribute="cat" method="POST">
<div class="form-group">
<c:if test="${not empty cat.categoryName}">
<label for="cid">Category ID:</label>
<spring:input type="text" path="categoryId" class="form-control" id="cid" readonly="true" disabled="true"/>
<spring:hidden path="categoryId"/>
</c:if>
</div>
<div class="form-group">
<label for="cname">Category Name:</label>
<spring:input type="text" class="form-control" id="cname" path="categoryName" required="required"/>
 </div>
 
 <div class="form-group">
<label for="cdesc">Category Description:</label>
 <spring:input type="text" class="form-control" id="cdesc" path="categoryDesc" required="required"/>
</div>


<c:if test="${empty cat.categoryName}">
<button type="submit" class="btn btn-outline-success my-2 my-sm-0">ADD</button></c:if>
<c:if test="${not empty cat.categoryName}"><button type="submit" class="btn btn-outline-success my-2 my-sm-0">Update</button></c:if>

</spring:form>
</div>



<c:if test="${not empty categoryList}">

<table class="table table-hover" >
 <thead>
<tr><th>CategoryId</th>
<th>Category Name</th>
<th>category Description</th>

<th>Edit</th>
<th>delete</th>
</tr>
</thead>
<c:forEach items="${categoryList}" var="cate">
<tbody>
<tr>
<td>${cate.categoryId}</td>
<td>${cate.categoryName}</td>
<td>${cate.categoryDesc}</td>

<td><a href="admineditCategory/${cate.categoryId}">Edit</a></td>

<td><a href="admindeleteCategory/${cate.categoryId}">delete</a></td>
</tr>
</tbody>
</c:forEach>
</table>

</c:if>

</body>
</html>