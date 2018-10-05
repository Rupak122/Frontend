
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
	<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@include file="header.jsp" %>
<style type="text/css">
.hStyle {
	color: red;
	font-family: Georgia;
	font-style: italic;
	font-family: Georgia;
}
.subStyle {
	font-family: Trebuchet MS Bold;
	color: black;
}
.thumbnail {
	height: 350px;
	width: 350px;
	vertical-align: middle;
}
</style>
	<br>
	<br>
	<br>
	<br>

	<div class="container" align="center">
		<c:if test="${not empty productL}">
			<div class="page-header">
				<h1 class="hStyle">All Products</h1>
			</div>

			<c:forEach var="pr" items="${productL}">
				<div class="row" align="center">
					<div class="thumbnail">
						<a
							href="${pageContext.request.contextPath}/productDesc/${pr.productId}"
							class="thumbnail"> <img
							src="<c:url value="/resources/images/${pr.productId}.jpg"/>"
							alt="..." />
						</a>
					</div>
					<div class="caption subStyle">
						<h3><b>${pr.productName}</b></h3>
						<h4>Price : Rs.${pr.price}</h4>
						<p>
							<a
								href="${pageContext.request.contextPath}/productDesc/${pr.productId}">See
								More</a>
						</p>
					</div>
				</div>
			</c:forEach>
		</c:if>
		<c:if test="${empty productL}">
			<h3>Sorry! No Products to show</h3>
		</c:if>
	</div>

	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
