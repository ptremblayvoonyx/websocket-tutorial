<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page session="true"%>
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
	<div class="alert alert-warning">
		<h4>Oups! Accès refusé...</h4>
		<p>${msg}</p>
	</div>

</body>
</html>