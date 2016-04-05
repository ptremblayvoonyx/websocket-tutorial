<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<%@taglib prefix="t" tagdir="/WEB-INF/tags"%>
<%@ page session="false"%>
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

	<div class="container">
		<div class="jumbotron">
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