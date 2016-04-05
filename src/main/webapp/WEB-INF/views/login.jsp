<?xml version="1.0" encoding="ISO-8859-1" ?>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>

<c:url value="/login" var="loginUrl" />
<!DOCTYPE html>
<html lang="en">
<head>
<title>innkeeper: <c:out value="${pageTitle}" />
</title>
<meta http-equiv="content-type" content="text/html;charset=utf-8" />
<c:url var="bootstrapcssUrl" value="/resources/css/bootstrap.min.css" />
<link href="${bootstrapcssUrl}" rel="stylesheet" />
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

	<H1>
		<sec:authentication property="name" />
	</H1>
	<div class="container">

		<c:if test="${message != null}">
			<div class="alert alert-success" id="message">
				<c:out value="${message}" />
			</div>
		</c:if>
		<div class="panel panel-default"
			style="width: 50%; margin-left: auto; margin-right: auto;">
			<div class="panel-body">
				<form class="form-horizontal" action="${loginUrl}" method="post">
					<fieldset>
						<legend>Please login</legend>
						<c:if test="${param.error != null}">
							<div class="alert alert-danger">
								Failed to login.
								<c:if test="${SPRING_SECURITY_LAST_EXCEPTION != null}">
              Reason: <c:out
										value="${SPRING_SECURITY_LAST_EXCEPTION.message}" />
								</c:if>
							</div>
						</c:if>
						<c:if test="${param.logout != null}">
							<div class="alert alert-success">You have been logged out.</div>
						</c:if>
						<div class="form-group">
							<label for="username" class="col-lg-2 control-label">Username</label>
							<div class="col-lg-10">
								<input type="text" class="form-control" id="username"
									name="username" placeholder="Username">
							</div>
						</div>
						<div class="form-group">
							<label for="password" class="col-lg-2 control-label">Password</label>
							<div class="col-lg-10">
								<input type="password" class="form-control" id="password"
									name="password" placeholder="Password">
							</div>
						</div>
						<div class="form-group">
							<div class="col-lg-10 col-lg-offset-2">
								<button type="submit" class="btn btn-primary">Login</button>
							</div>
						</div>
					</fieldset>
				</form>
			</div>
		</div>

	</div>
	<script src="<c:url value="/resources/js/jquery.min.js"/>"></script>
<script src="<c:url value="/resources/js/bootstrap.min.js"/>"></script>
</body>
</html>