<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<%@taglib prefix="t" tagdir="/WEB-INF/tags"%>

<t:layout pageTitle="Denied">

	<jsp:attribute name="header">
    </jsp:attribute>

	<jsp:attribute name="footer">
    </jsp:attribute>

	<jsp:body>
		<div class="container">
			<div class="alert alert-warning col-lg-6">
			<h4>Oups! Accès refusé...</h4>
			<p>${msg}</p>
			</div>
		</div>
    </jsp:body>

</t:layout>