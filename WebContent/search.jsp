<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="beans.*, java.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:useBean id="search" class="beans.SearchBean" scope="session" />
<!DOCTYPE html PUBulC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/theme.css" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/bootstrap.min.css" />

</head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Welcome to jTunes</title>
</head>
<body>
	<div class="row">
		<div class="jumbotron">
			<h1>Welcome to jTune</h1>
			<p>Our slogan here</p>
		</div>
		<div class="frnt-search">
			<form class="input-group" action="results">
				<input type="text" class="form-control"
					placeholder="Search for your favourite songs!" name="q"> <span
					class="input-group-btn"> <select
					class="form-control btn btn-default srch-options" name="a">
						<option value="0" selected>All</option>
						<option value="1">Album</option>
						<option value="2">Artist</option>
						<option value="3">Songs</option>
				</select>
					<button class="btn btn-default" type="submit">Go!</button>
				</span>
			</form>
		</div>
		<!-- /.col-lg-6 -->
		<div class="cart button">
			<a href="cart" class="center">
				Check out your cart
				<button class="btn btn-primary" style="height: 33px;" href="cart">
			    	<span class="glyphicon glyphicon-shopping-cart" aria-hidden="true"></span>
			    </button>
			</a>
		</div>
		<div class="recomendations">
			<p>Why not give these tunes a go</p>
			<c:set var="songs" value="${search.random(10) }" scope="session"/>
			<div class="col-md-6 col-sm-8">
				<ul>
					<c:forEach var="i" begin="0" end="4">
					<li><a>
						${songs.get(i).getChildNodes().item(3).getTextContent() } - 
						${songs.get(i).getChildNodes().item(1).getTextContent() }
					</a></li>
					</c:forEach>
				</ul>
			</div>
			<div class="col-md-6 col-sm-8">
				<ul>
					<c:forEach var="i" begin="5" end="9">
					<li><a>
						${songs.get(i).getChildNodes().item(3).getTextContent() } - 
						${songs.get(i).getChildNodes().item(1).getTextContent() }
					</a></li>
					</c:forEach>
				</ul>
			</div>
		</div>
	</div>
	<!-- /.row -->
</body>
</html>