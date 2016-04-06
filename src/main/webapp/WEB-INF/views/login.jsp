<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<%@taglib prefix="t" tagdir="/WEB-INF/tags"%>

<t:layout pageTitle="Login">

	<jsp:attribute name="header">
		<t:navbar />
    </jsp:attribute>
    
	<jsp:attribute name="footer">
    </jsp:attribute>
    
	<jsp:body>
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
							<sec:csrfInput/>
						</fieldset>
					</form>
				</div>
			</div>
	
		</div>
		<script src="<c:url value="/resources/js/jquery.min.js"/>"></script>
		<script src="<c:url value="/resources/js/bootstrap.min.js"/>"></script>
    </jsp:body>

</t:layout>