<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
 <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
 <%@ taglib uri="http://java.sun.com/jsp/jstl/xml" prefix="x" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	  <head>
        <meta charset="utf-8" />
        <title>Affichage d'une commande</title>
        <link type="text/css" rel="stylesheet" href='<c:url value="/inc/style.css"/>' />
    </head>
<body>
	<c:import url="/inc/menu.jsp" />

	<%-- Affichage de la chaîne "message" transmise par la servlet --%>
	<p class="info">${ message }</p>
	<%-- Puis affichage des données enregistrées dans le bean "commande" transmis par la servlet --%>
	
	<c:if test="${!erreur}">
	<p>Client</p>
	<%-- Les 5 expressions suivantes accèdent aux propriétés du client, qui est lui-même une propriété du bean commande --%>
      <p>Nom :<c:out value="${ client.nomClient }"/></p>
      <p>Prénom :<c:out value="${ client.prenomClient }"/></p>
      <p>Adresse :<c:out value="${ client.adresseClient }"/></p>
      <p>Numéro de téléphone :<c:out value="${ client.telephoneClient }"/></p>
      <p>Email :<c:out value="${ client.emailClient }"/></p><br/>
        
	<p>Commande</p>
	<p>Date :<c:out value="${ commande.date }"/></p>
	<p>Montant :<c:out value="${ commande.montantCommande }"/></p>
	<p>Mode de paiement :<c:out value="${ commande.modePaiementCommande }"/></p>
	<p>Statut du paiement :<c:out value="${ commande.statutPaiementCommande }"/></p>
	<p>Mode de livraison :<c:out value="${ commande.modeLivraisonCommande }"/></p>
	<p>Statut de la livraison :<c:out value="${ commande.statutLivraisonCommande }"/></p>
	</c:if>

</body>
</html>