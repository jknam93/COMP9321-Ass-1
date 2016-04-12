<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="beans.*, java.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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
		<span>
			<h3>
				Results
				<c:choose>
					<c:when test="${param.a eq 1}">
						<c:set var="albums" scope="session"
							value="${search.searchAlbums(param.q)}" />
						- by Album
					</c:when>
					<c:when test="${param.a eq 2}">
						<c:set var="songs" scope="session"
							value="${search.searchSongArtists(param.q)}" />
						<c:set var="albums" scope="session"
							value="${search.searchAlbumArtists(param.q)}" />
						- by Artist
					</c:when>
					<c:when test="${param.a eq 3}">
						<c:set var="songs" scope="session"
							value="${search.searchSongs(param.q)}" />
						- by Song
					</c:when>
					<c:otherwise>
						<c:set var="songs" scope="session"
							value="${search.searchSongs(param.q)}" />
						<c:set var="albums" scope="session"
							value="${search.searchAlbums(param.q)}" />
						 - by All
					</c:otherwise>
				</c:choose>
			</h3>
		</span>
		<c:choose>
			<c:when test="${empty songs and empty albums}">
				No results found
			</c:when>
			<c:otherwise>
				<form method="POST" action="addCart">
					<c:if test="${param.a ne 3}">
						<h4>Albums (${albums.size()})</h4>
						<%@include file="/albumTable.jsp"%>
					</c:if>
					<c:if test="${param.a ne 1}">
						<h4>Songs (${songs.size()})</h4>
						<%@include file="/songTable.jsp"%>
					</c:if>
					<button class="btn btn-default" action="submit">Add to
						Cart</button>
				</form>
			</c:otherwise>
		</c:choose>
		<!-- %@include file="/resultTable.jsp"%-->
	</div>
	<!-- row -->
</body>
<script>
	function checkDuplicates(id) {
		if(document.getElementById(id).checked == true){
			if(document.cookie.indexOf(id) != -1){
				alert("This item is already in your cart");
			}
		}
	}
	function checkAlbum(id, albumID) {
		if(document.getElementById(id).checked == true){
			if(document.cookie.indexOf(albumID) != -1){
				alert("The album containing this song is already in the cart");
			}
		}
	}
</script>
</html>