<%@tag description="User Page template" pageEncoding="UTF-8"%>
<%@taglib prefix="t" tagdir="/WEB-INF/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>

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
			<c:url var="listUrl" value="/todo/list" />
			<li><a href="${listUrl}">Tâches</a></li>
		</ul>
		<ul class="nav navbar-nav">
			<c:url var="echoUrl" value="/todo/echo" />
			<li><a href="${echoUrl}" target="_blank">Echo</a></li>
		</ul>
		<ul class="nav navbar-nav navbar-right">

			<sec:authorize access="authenticated" var="authenticated" />
			<c:choose>
				<c:when test="${authenticated}">
					<li><a href="#logoutModal" data-toggle="modal">Logout</a></li>
				</c:when>
				<c:otherwise>
					<c:url var="loginUrl" value="/login" />
					<li><a id="navLoginLink" href="${loginUrl}">Login</a></li>
				</c:otherwise>
			</c:choose>
		</ul>
	</div>
	<div id="logoutModal" class="modal">
		<div class="modal-dialog">
			<div class="modal-content">
				<c:url var="logoutUrl" value="/logout" />
				<form action="${logoutUrl}" method="post">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal"
							aria-hidden="true">&times;</button>
						<h4 class="modal-title">Fin de session</h4>
					</div>
					<div class="modal-body">
						<p>Désirez-vous mettre fin à cette session?</p>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-default" data-dismiss="modal">Non
							(Fermer cette fenêtre)</button>
						<button type="submit" class="btn btn-primary">Oui
							(Logout)</button>
						<sec:csrfInput/>
					</div>
				</form>
			</div>

		</div>
	</div>
</div>
