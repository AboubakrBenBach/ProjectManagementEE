<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
 <%@ taglib uri="http://java.sun.com/jsp/jstl/xml" prefix="x" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link rel="stylesheet" href="bootstrap.min.css">
<link rel="stylesheet" href="style.css">
 <!--icone-->
    <link rel="icon" type="image/png" href="logo.png" />

<title>Insert title here</title>
</head>
<body>

 <!--le menu navbar-->

    <nav class="navbar navbar-expand-lg navbar-dark bg-dark" id="nav-main">
    <a class="navbar-brand" href="#">Navbar</a>
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>

    <div class="collapse navbar-collapse" id="navbarSupportedContent">
      <ul class="navbar-nav mr-auto">
        <li class="nav-item active">
          <a class="nav-link" href="<c:url value="../welcom.jsp"/>">Home <span class="sr-only">(current)</span></a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="<c:url value = "/inc/menu.jsp"/>">Commande</a>
        </li>
        <li class="nav-item dropdown">
          <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
            Dropdown
          </a>
          <div class="dropdown-menu" aria-labelledby="navbarDropdown">
            <a class="dropdown-item" href="#">Action</a>
            <a class="dropdown-item" href="#">Another action</a>
            <div class="dropdown-divider"></div>
            <a class="dropdown-item" href="#">Something else here</a>
          </div>
        </li>
        <li class="nav-item">
          <a class="nav-link disabled" href="#" tabindex="-1" aria-disabled="true">Disabled</a>
        </li>
      </ul>
      <form class="form-inline my-2 my-lg-0">
        <input class="form-control mr-sm-2" type="search" placeholder="Search" aria-label="Search">
        <button class="btn btn-outline-success my-2 my-sm-0" type="submit">Search</button>
      </form>
    </div>
</nav>
    
    
    <section id="cover">
      <div id="cover-caption">
        <div class="container">
          <div class="col-sm-15 col-sm-offset-1">
            <h1 class="display">Faire vos commande comme vous voulez!</h1>
            <p>Veuillez vous<a href="InsertClient.jsp">inscrire </a> pour pouvoir passer vos comandes
            	 ou <a href="connection.jsp">connectez</a> vous sur votre compte</p>
            	 
            	 
            	 <a href="<c:url value="WEB-INF/inscriptionclient"/>">Créer un nouveau client</a>
            	 <a href="<c:url value="WEB-INF/inscriptionCommande"/>">Créer une nouvelle commande</a><br/>
            	 <a href="<c:url value="WEB-INF/listerClient"/>">lister les clients</a>
            	 <a href="<c:url value="WEB-INF/listerCommande"/>">lister les commandes</a>
            

      
          </div>
        </div>
      </div>
    </section>

</body>
</html>