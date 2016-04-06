<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<%@taglib prefix="t" tagdir="/WEB-INF/tags"%>

<t:layout pageTitle="Welcome">

	<jsp:attribute name="header">
		<t:navbar />
    </jsp:attribute>

	<jsp:attribute name="footer">
    </jsp:attribute>

	<jsp:body>
		<div class="container">
			<div class="panel panel-info">
			  <div class="panel-heading">
			    <h1 class="panel-title">Exemple d'utilisation des WebSocket</h1>
			  </div>
			  <div class="panel-body">
			    <p>Cette application implémente le pattern Publish/Subscribe en utilisant le protocole des WebSocket (<span><a href=https://tools.ietf.org/html/rfc6455>rfc6455</a></span>).</p>
				<p>Elle contient deux pages : <strong>Tâches</strong> et <strong>Echo</strong>. Lorsqu'on ajoute une tâche dans la page <strong>Tâches</strong>, le contrôleur sur le serveur ajoute un message dans une queue. La page <strong>Echo</strong>, qui est abonnée à la même queue va recevoir le message et rafraîchir pour afficher le changement.</p>
				<p>Dans cet exemple, les queues de message sont propres à chaque session, ce qui fait que chaque utilisateur ne verra que ses propres tâches.</p>
			  </div>
			</div>
		</div>
    </jsp:body>

</t:layout>