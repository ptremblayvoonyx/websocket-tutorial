<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec"	uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="t" tagdir="/WEB-INF/tags"%>

<t:layout pageTitle="Echo">

	<jsp:attribute name="header">
    </jsp:attribute>
    
	<jsp:attribute name="footer">
    </jsp:attribute>
    
	<jsp:body>
	<div class="container">
		<div class="jumbotron">
			<div class="row">
				<div class="col-lg-12">
					<div class="page-header">
						<h1 id="taches">
							Tâches pour
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
	
	 var headerName = "${_csrf.headerName}";
	 var token = "${_csrf.token}";
	 var headers = {};
	 headers[headerName] = token;
	
	 var socket = new SockJS("${pageContext.request.contextPath}/stomp");
	 var stompClient = Stomp.over(socket);

     stompClient.connect(headers, function(frame) {
       			console.log('Connected: ' + frame);
                stompClient.subscribe('/user/queue/echo', function(){
                    location.reload()
                });
     });
	
	</script>
    </jsp:body>

</t:layout>