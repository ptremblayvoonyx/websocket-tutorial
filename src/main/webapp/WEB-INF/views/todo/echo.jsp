<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<%@ page session="true"%>
<c:set var="req" value="${pageContext.request}" />
<c:set var="url">${req.requestURL}</c:set>
<c:set var="uri" value="${req.requestURI}" />
<!DOCTYPE html>
<html lang="en">
<head>

<title>Echo<c:out value="${pageTitle}" />
</title>
<meta http-equiv="content-type" content="text/html;charset=utf-8" />
<c:url var="cssUrl" value="/resources/css/bootstrap.min.css" />
<link href="${cssUrl}" rel="stylesheet" />

<style>
</style>


</head>
<body>
	<div class="navbar navbar-inverse">
		<div class="navbar-header">
			<button type="button" class="navbar-toggle" data-toggle="collapse"
				data-target=".navbar-inverse-collapse">
				<span class="icon-bar"></span> <span class="icon-bar"></span> <span
					class="icon-bar"></span>
			</button>
			<c:url var="welcomeUrl" value="/" />
			<a class="navbar-brand" href="${welcomeUrl}">Websocket</a>
		</div>

		<div class="navbar-collapse collapse navbar-inverse-collapse">
			<ul class="nav navbar-nav navbar-right">

				<sec:authorize access="authenticated" var="authenticated" />
				<c:choose>
					<c:when test="${authenticated}">
						<c:url var="logoutUrl" value="/logout" />
						<li><a id="navLogoutLink" href="${logoutUrl}">Logout</a></li>
					</c:when>
					<c:otherwise>
						<c:url var="loginUrl" value="/login" />
						<li><a id="navLoginLink" href="${loginUrl}">Login</a></li>
					</c:otherwise>
				</c:choose>
			</ul>
		</div>
	</div>

	<div class="container">
		<div class="jumbotron">
			<div class="row">
				<div class="col-lg-12">

					<!-- 						<a class="btn btn-primary btn-lg" onclick="myFunction()">Refresh</a> -->

				</div>
			</div>
			<div class="row">
				<div class="col-lg-12">
					<div class="page-header">
						<h1 id="taches">
							Tâche pour
							<sec:authentication property="name" />
							:
						</h1>
					</div>
				</div>
			</div>

			<div class="row">
				<div class="col-lg-12">
					<c:forEach items="${tasks}" var="task">
						<h2>
							<c:out value="${task.name}" />
						</h2>
					</c:forEach>
				</div>
			</div>


		</div>

	</div>


	<script src="<c:url value="/resources/js/jquery.min.js"/>"></script>
	<script src="<c:url value="/resources/js/bootstrap.min.js"/>"></script>
	<script src="<c:url value="/resources/js/sockjs.min.js"/>"></script>
	<script src="<c:url value="/resources/js/stomp.min.js"/>"></script>
	<script>
	
	// var contextPath = "${pageContext.request.contextPath}";
	 var socket = new SockJS("${pageContext.request.contextPath}/stomp");
	 var stompClient = Stomp.over(socket);

     stompClient.connect({}, function(frame) {
       			console.log('Connected: ' + frame);
                stompClient.subscribe('/user/queue/echo', function(){
                    location.reload()
                });
     });
	
	</script>
</body>
</html>