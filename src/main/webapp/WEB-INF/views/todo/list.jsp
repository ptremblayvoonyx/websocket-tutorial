<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<%@ page session="false"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>Tâches<c:out value="${pageTitle}" />
</title>
<meta http-equiv="content-type" content="text/html;charset=utf-8" />
<%-- <c:url var="faviconUrl" value="/resources/images/favicon.ico" /> --%>
<%-- <link rel="shortcut icon" href="${faviconUrl}" /> --%>
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
			<ul class="nav navbar-nav">
				<c:url var="echoUrl" value="/todo/echo" />
				<li class="active"><a href="${echoUrl}">Echo</a></li>
			</ul>
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
		Current user :
		<sec:authentication property="name" />
	</H1>
	<div class="container">
		<div class="panel panel-default">

			<div class="panel-body">


				<form:form class="form-horizontal"
					action="/atmosphere-tutorial/todo/add" method="post"
					commandName="task">
					<fieldset>
						<legend>Gestion des tâches</legend>
						<div class="form-group">
							<label for="inputTask" class="col-lg-2 control-label">Tâche</label>
							<div class="col-lg-10">
								<form:input path="name" type="text" class="form-control"
									id="inputTask" placeholder="nom de tâche" />
							</div>
						</div>
						<div class="form-group">
							<div class="col-lg-10 col-lg-offset-2">
								<button type="submit" class="btn btn-primary">Ajouter</button>
							</div>
						</div>
					</fieldset>
				</form:form>

				<div class="panel panel-default">
					<div class="panel-heading">Liste des tâches</div>
					<div class="panel-body">
						<ul>
							<c:forEach items="${tasks}" var="task">
								<li><c:out value="${task.name}" /></li>
							</c:forEach>
						</ul>
					</div>
				</div>

			</div>

		</div>



	</div>

	<script src="<c:url value="/resources/js/jquery.min.js"/>"></script>
	<script src="<c:url value="/resources/js/bootstrap.min.js"/>"></script>
	<script src="<c:url value="/resources/js/sockjs.min.js"/>"></script>
	<script src="<c:url value="/resources/js/stomp.min.js"/>"></script>
	<script>
	
	
	</script>
</body>
</html>