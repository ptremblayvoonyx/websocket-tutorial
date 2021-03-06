<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="t" tagdir="/WEB-INF/tags"%>

<t:layout pageTitle="T�ches">

	<jsp:attribute name="header">
      <t:navbar />
    </jsp:attribute>
    
	<jsp:attribute name="footer">
    </jsp:attribute>
    
	<jsp:body>
		<div class="container">
			<div class="well well-sm">
				<h2>Bonjour <sec:authentication property="name" /></h2>
			</div>
			<div class="panel panel-default">
	
				<div class="panel-body">
	
					<c:url var="todoAddAction" value="/todo/add" />
					<form:form class="form-horizontal" action="${todoAddAction}"
							method="post" commandName="task">
						<fieldset>
							<legend>Gestion des t�ches</legend>
							<div class="form-group">
								<label for="inputTask" class="col-lg-2 control-label">T�che</label>
								<div class="col-lg-10">
									<form:input path="name" type="text" class="form-control"
											id="inputTask" placeholder="nom de t�che" />
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
						<div class="panel-heading">Liste des t�ches</div>
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
		<script>
		
		</script>
    </jsp:body>

</t:layout>