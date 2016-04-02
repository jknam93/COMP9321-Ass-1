<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="beans.*, java.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="x" uri="http://java.sun.com/jsp/jstl/xml"%>
<jsp:useBean id="search" class="beans.SearchBean" scope="session" />
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/theme.css" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/bootstrap.min.css" />
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>jTunes - Results</title>
</head>
<body>


	<%@include file="/navbar.html"%>
	<div class="row">
		<b><%=request.getParameter("q")%></b> <b><%=request.getParameter("a")%></b>
		<b>${param.a}</b>
	</div>
	<div class="row">
		<h3>Results</h3>
		<c:choose>
			<c:when test="${param.a eq 1}">
				<c:set var="result" scope="session"
					value="${search.searchAlbums(param.q)}" />
			</c:when>
			<c:when test="${param.a eq 2}">
				<c:set var="result" scope="session"
					value="${search.searchArtists(param.q)}" />
			</c:when>
			<c:when test="${param.a eq 3}">
				<c:set var="result" scope="session"
					value="${search.searchSongs(param.q)}" />
			</c:when>
			<c:otherwise>
				<c:set var="result" scope="session"
					value="${search.searchAll(param.q)}" />
			</c:otherwise>
		</c:choose>
		<c:choose>
			<c:when test="${empty result}">
				NO RESULT
			</c:when>
			<c:otherwise>
				<form method="GET" action="checkOut">
					<table class="table table-striped">
						<thead>
							<tr>
								<th>Title</th>
								<th>Artist</th>
								<th>Genre</th>
								<th>Publisher</th>
								<th>Year</th>
								<th>Price</th>
								<th>Add</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="item" items="${result}">


								<c:set var="artist"
									value="${item.getChildNodes().item(1).getTextContent()}" />
								<c:set var="title"
									value="${item.getChildNodes().item(3).getTextContent()}" />
								<c:set var="id"
									value="${item.getChildNodes().item(9).getTextContent()}" />
								<c:choose>
									<c:when test="${item.getNodeName() eq 'songList' }">
										SONGS
										<c:set var="genre"
											value="${item.getParentNode().getChildNodes().item(7).getTextContent()}" />
										<c:set var="publisher"
											value="${item.getParentNode().getChildNodes().item(9).getTextContent()}" />
										<c:set var="year"
											value="${item.getParentNode().getChildNodes().item(11).getTextContent()}" />
										<c:set var="price"
											value="${item.getChildNodes().item(7).getTextContent()}" />
									</c:when>
									<c:otherwise>
										ALBUM
										<c:set var="genre"
											value="${item.getChildNodes().item(7).getTextContent()}" />
										<c:set var="publisher"
											value="${item.getChildNodes().item(9).getTextContent()}" />
										<c:set var="year"
											value="${item.getChildNodes().item(11).getTextContent()}" />
										<c:set var="price"
											value="${item.getLastChild().getPreviousSibling().getTextContent()}" />
									</c:otherwise>
								</c:choose>

								<tr>
									<th>${title}</th>
									<th>${artist}</th>
									<th>${genre}</th>
									<th>${publisher}</th>
									<th>${year}</th>
									<th>$${price}</th>
									<th><input type="checkbox" name="id" value="${id}"></th>
								</tr>
							</c:forEach>
						</tbody>
					</table>
					<button class="btn btn-default" action="submit">Add to
						Cart</button>
				</form>
			</c:otherwise>
		</c:choose>
		<!-- %@include file="/resultTable.jsp"%-->
	</div>
	<!-- row -->
</body>
</html>