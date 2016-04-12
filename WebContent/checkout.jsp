<%@ page language="java" contentType="text/html; charset=US-ASCII"
	pageEncoding="US-ASCII"%>
<%@ page import="beans.*, java.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/theme.css" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/bootstrap.min.css" />
<meta http-equiv="Content-Type" content="text/html; charset=US-ASCII">
<title>jTunes - Checkout</title>
</head>
<body>
	<%@include file="/navbar.html"%>
	<div class="row">
		<h3>ConfirmPurchase</h3>
		<form method="POST" action="thankyou">
			<c:set var="total" value="0" />
			<table class="table table-striped">
				<thead>
					<tr>
						<th>Title</th>
						<th>Artist</th>
						<th>Type</th>
						<th>Publisher</th>
						<th>Price</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="id" items="${paramValues.id}">
						<c:set var="item" value="${search.searchByID(id)}" />
						<c:set var="artist"
							value="${item.getChildNodes().item(1).getTextContent()}" />
						<c:set var="title"
							value="${item.getChildNodes().item(3).getTextContent()}" />
						<c:choose>
							<c:when test="${item.getNodeName() eq 'songList' }">
								<c:set var="publisher"
									value="${item.getParentNode().getChildNodes().item(9).getTextContent()}" />
								<c:set var="price"
									value="${item.getChildNodes().item(7).getTextContent()}" />
								<c:set var="type" value="${'Song'}" />
							</c:when>
							<c:otherwise>
								<c:set var="publisher"
									value="${item.getChildNodes().item(9).getTextContent()}" />
								<c:set var="price"
									value="${item.getLastChild().getPreviousSibling().getTextContent()}" />
								<c:set var="type" value="${'Album'}" />
							</c:otherwise>
						</c:choose>
						<c:set var="total" value="${total + price}"/>
						<tr>
							<th>${title}</th>
							<th>${artist}</th>
							<th>${type}</th>
							<th>${publisher}</th>
							<th><fmt:formatNumber value="${price}" type="CURRENCY" /></th>
						</tr>
					</c:forEach>
				</tbody>
			</table>
			<div class="col-md 6 col-sm-8">
				<b>Total <fmt:formatNumber value="${total}" type="CURRENCY" /></b>
			</div>
			<div class="col-md 6 col-sm-8">
				<input type="submit" class="btn btn-success" value="Yes"
					name="confirmation"/>
				 <input type="submit" class="btn btn-danger" value="No" 
				 	name="confirmation1"/>
			</div>

		</form>
	</div>
</body>
</html>