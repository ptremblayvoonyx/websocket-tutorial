<%@ tag description="Layout de base pour toutes les pages"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="t" tagdir="/WEB-INF/tags"%>
<%@ attribute name="header" fragment="true"%>
<%@ attribute name="footer" fragment="true"%>
<%@ attribute name="pageTitle" required="true"%>
<!DOCTYPE html>
<html>
<head>

<title>${pageTitle}</title>
<meta http-equiv="content-type" content="text/html;charset=utf-8" />
<c:url var="cssUrl" value="/resources/css/bootstrap.min.css" />
<link href="${cssUrl}" rel="stylesheet" />

<style>
</style>

</head>
<body>
	<div id="pageheader">
		<jsp:invoke fragment="header" />
	</div>
	<div id="body">
		<jsp:doBody />
	</div>
	<div id="pagefooter">
		<jsp:invoke fragment="footer" />
	</div>
</body>
</html>