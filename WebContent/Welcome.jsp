<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBulC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/css/theme.css" />
	<link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.min.css" />
	
</head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<div class="row">
		<div class="jumbotron">
			<h1>Welcome to jTune</h1>
			<!-- PLACEHOLDER -->
			<p>Some sort of slogan</p>
			<!-- /PLACEHOLDER -->
		</div>
		<div class="frnt-search">
	    	<form class="input-group" action="search" >
	      		<input type="text" class="form-control" placeholder="Search for your favourite songs!" name="query">
	      		<span class="input-group-btn">
	      			 <select class="form-control btn btn-default srch-options" name="extraQuery">
                    	<option value="0" selected>All</option>
                        <option value="1">Artist</option>
                        <option value="2">Title</option>
                        <option value="3">Album</option>
                        <option value="4">Songs</option>
                    </select>
	        		<button class="btn btn-default" type="submit">Go!</button>
	      		</span>
	    	</form><!-- /input-group -->
	    	<!-- <a href="/advancedSearch" id="adv-srch" >Advanced Search</a> -->
	  	</div><!-- /.col-lg-6 -->
	  	<div class="recomendations">
		  	<p>Why not give these tunes a go</p>
			<!-- PLACEHOLDER -->
			<div class="col-md-6 col-sm-8">
				<ul>
					<li><a>Let it be - The Beatles</a></li>
					<li><a>Bad - Michael Jackson</a></li>
					<li><a>Hound Dog - Elvis Presley</a></li>
					<li><a>Never Going To - Rick Astley</a></li>
					<li><a>Can't Touch This - MC Hammer</a></li>
				</ul>
			</div>
			<div class="col-md-6 col-sm-8">
				<ul>
					<li><a>Let it be - The Beatles</a></li>
					<li><a>Bad - Michael Jackson</a></li>
					<li><a>Hound Dog - Elvis Presley</a></li>
					<li><a>Never Going To - Rick Astley</a></li>
					<li><a>Can't Touch This - MC Hammer</a></li>
				</ul>
			</div>
			<!-- /PLACEHOLDER -->
		</div>
	</div><!-- /.row -->
</body>
</html>