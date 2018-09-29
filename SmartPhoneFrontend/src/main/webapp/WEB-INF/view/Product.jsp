<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" isELIgnored="false"%>
    <%@include file="header.jsp"  %>
    <%@taglib uri="http://www.springframework.org/tags/form" prefix="spring" %>
    <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

</head>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<body background="resources/images/sam1.jpg">
<div class="container">
<h2 align="center">Add Product</h2><hr>
<spring:form action="${pageContext.request.contextPath}/adminaddProduct" modelAttribute="productOBJ" method="POST">
<div class="form-group">
<c:if test="${not empty productOBJ.productName}">
<label for="pid">Product ID:</label>
<spring:input type="text" path="productId" class="form-control" id="pid"  readonly="true" disabled="true"/>
<spring:hidden path="productId"/>
</c:if>
</div>
<div class="form-group">
<label for="pname">Product Name:</label>
 <spring:input type="text" class="form-control" id="pname" path="productName"/>
 </div>
 <div class="form-group">
 <label for="pdesc">Product Description:</label>
<spring:input type="text" class="form-control" id="pdesc" path="productDesc"/>
</div>
 <div class="form-group">
 <label for="pprice">Product price:</label>
<spring:input type="number" class="form-control" id="pprice" path="price"/>
</div>
<div class="form-group">
<label for="pQty">Product Quantity:</label>
<spring:input type="number" class="form-control" id="pQty" path="quantity"/>
</div>



<div class="form-group">
  <label for="sel1">Select Category (select one):</label>
<spring:select path="categoryId" class="form-control" id="sel1">
<c:forEach items="${categoryList}" var="catObj">
<option value="${catObj.categoryId }">${catObj.categoryName }</option>
</c:forEach>
</spring:select>
</div>

<c:if test="${empty productOBJ.productName}"><button type="submit" class="btn btn-outline-success my-2 my-sm-0">ADD</button></c:if>
<c:if test="${not empty productOBJ.productName}"><button type="submit" class="btn btn-outline-success my-2 my-sm-0">Update</button></c:if>


</spring:form>
</div>







<c:if test="${not empty productList}">

<table class="table table-hover" >
 <thead>
<tr><th>ProductId</th>
<th>Product Name</th>
<th>Product Description</th>
<th>Product Price</th>
<th>Product Quantity</th>
<th>Edit</th>
<th>delete</th>

</tr>
</thead>
<c:forEach items="${productList}" var="pro">
<tbody>
<tr>
<td>${pro.productId}</td>
<td>${pro.productName}</td>
<td>${pro.productDesc}</td>
<td>${pro.price}</td>
<td>${pro.quantity}</td>
<td><a href="editProduct/${pro.productId}">Edit</a></td>

<td><a href="deleteProduct/${pro.productId}">delete</a></td>
</tr>
</tbody>
</c:forEach>
</table>

</c:if>

</body>
</html>