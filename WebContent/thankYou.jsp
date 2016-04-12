<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="beans.*, java.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
		<h2>
			Thank you for 
			<c:choose>
				<c:when test="${param.confirmation eq 'Yes' }">
				purchasing
				</c:when>
				<c:otherwise>
				shopping
				</c:otherwise>
			</c:choose>
			 at jTunes
		</h2>
	</div>
</body>
</html>