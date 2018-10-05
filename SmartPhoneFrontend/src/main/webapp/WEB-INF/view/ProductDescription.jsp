<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" isELIgnored="false"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib prefix="security" uri="http://www.springframework.org/security/tags"%>
<style type="text/css">
.hStyle {
	color: red;
	font-family: Georgia;
	font-style: italic;
	font-weight: bold;
}
.thumbnail {
	height: 100%;
	width: 100%;
	display: table-cell;
	vertical-align: middle;
}
.contentHeadStyle {
	color: black;
	font-family: Palatino Linotype;
	font-size: 1.4em;
}
.contentStyle {
	color: black;
	font-family: Palatino Linotype;
	font-size: 1.2em;
}
</style>
	<%@include file="header.jsp"%>

	<br>
	<br>
	<br>
	<br>

	<div class="container" align="center">

	<div class="page-header hStyle">
	<h1>Product Details</h1>
	</div>

	<div class="col-md-8">
	<a href="#" class="thumbnail"> <img
	src="<c:url value="/resources/images/${prdDesc.productId}.jpg"/>"
	alt="product" />
	</a>
	</div>

	<div class="col-md-4">
	<div class="row contentHeadStyle">
	<div align="center">
	<p>
	<b>${prdDesc.productName}</b>
	</p>
	</div>
	</div>
	<div class="row contentStyle">
	<div align="left">
	<p>${prdDesc.productDesc}</p>
	</div>
	</div>
	<div class="row contentStyle">
	<div align="left">
	<p>
	<b>PRICE:</b> Rs. ${prdDesc.price}/-
	</p>
	</div>
	</div>
	</div>

	<!-- Button -->
	<div class="row">
	<div align="center">
	<security:authorize access="isAnonymous()">
	<a href="${pageContext.request.contextPath}/myCart/addToCart/${prdDesc.productId}"
	class="btn btn-success"> <i class="glyphicon glyphicon-heart"></i>
	Add to CART
	</a>
	</security:authorize>
	</div>
	</div>
	</div>