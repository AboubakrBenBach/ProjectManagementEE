<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
 <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
 <%@ taglib uri="http://java.sun.com/jsp/jstl/xml" prefix="x" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	    <head>
        <meta charset="utf-8" />
        <title>Affichage d'un client</title>
        <link type="text/css" rel="stylesheet" href='<c:url value="/inc/style.css"/>' />
        <link rel="stylesheet" href="bootstrap.min.css">
    </head>
    <body>
       <c:import url="/inc/menu.jsp" />
    
        <%-- Affichage de la chaîne "message" transmise par la servlet --%>
        <div id="corps">
        <p class="info">${ form.resultat }</p>
        <%-- Puis affichage des données enregistrées dans le bean "client" transmis par la servlet --%>
        <p>Nom :<c:out value="${ client.nomClient}"/></p>
        <p>Prénom :<c:out value="${ client.prenomClient}"/></p>
        <p>Adresse :<c:out value="${ client.adresseClient}"/></p>
        <p>Numéro de téléphone :<c:out value="${ client.telephoneClient}"/></p>
        <p>Email :<c:out value="${ client.emailClient}"/></p><br/>
        
        <a href='<c:url value="welcom.jsp"/>' role="button">Welcom</a>
        </div>
        
        
    </body>
</html>