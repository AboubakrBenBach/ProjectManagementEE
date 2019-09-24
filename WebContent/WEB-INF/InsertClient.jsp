<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>   
<%@ taglib uri="http://java.sun.com/jsp/jstl/xml" prefix="x" %>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	
	 <head>
        <meta charset="utf-8" />
        <title>Création d'un client</title>
        <link type="text/css" rel="stylesheet" href="/inc/style.css" />
         <!-- Bootstrap CSS  -->
    <link rel="stylesheet" href="bootstrap.min.css">

   
    </head>
    <body>
              <c:import url="/inc/menu.jsp" />
        <div>
            <form method="post" action="<c:url value="/ClientServlet"/>">
                <fieldset>
                    <legend>Informations client</legend>
                    <c:import url="formClient.jsp" />
                </fieldset>
 
       <p class="info">${form.resultat}</p>
       <input type="submit" value="Valider"  />
       <input type="reset" value="Remettre à zéro" /> <br />
       
       
    </body>
</html>