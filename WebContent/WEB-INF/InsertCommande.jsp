<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="utf-8" />
<title>Cr�ation d'une commande</title>
<link type="text/css" rel="stylesheet" href="/inc/style.css" />
</head>
<body>


	<c:import url="/inc/menu.jsp" />
	<div>
		<form method="post" action='<c:url value="/CommandeServlet"/>'>
			<fieldset>
				<legend>Informations client</legend>

				<%-- Si et seulement si la Map des clients en session n'est pas vide, alors on propose un choix � l'utilisateur --%>
				<c:if test="${ !empty sessionScope.clients }">
					<label for="choixNouveauClient">Nouveau client ? <span
						class="requis">*</span></label>
					<input type="radio" id="choixNouveauClient"
						name="choixNouveauClient" value="nouveauClient" checked /> Oui
                        <input type="radio" id="choixNouveauClient"
						name="choixNouveauClient" value="ancienClient" /> Non
                        <br />
					<br />
				</c:if>

				<%--on affiche les information a	 saisir dans le cas d'un nouveau client --%>
				<c:set var="client" value="${ commande.client }" scope="request" />
				<div id="nouveauClient">
					<c:import url="formClient.jsp" />
				</div>

				<%-- Si et seulement si la Map des clients en session n'est pas vide, alors on cr�e la liste d�roulante --%>
				<c:if test="${ !empty sessionScope.clients }">
					<div id="ancienClient">
						<select name="listeClients" id="listeClients">
							<option value="">Choisissez un client...</option>
							<%-- Boucle sur la map des clients --%>
							<c:forEach items="${ sessionScope.clients }" var="mapClients">
								<%--  L'expression EL ${mapClients.value} permet de cibler l'objet Client stock� en tant que valeur dans la Map, 
                                  et on cible ensuite simplement ses propri�t�s nom et prenom comme on le ferait avec n'importe quel bean. --%>
                                  
								<option value="${ mapClients.value.nom }">${ mapClients.value.prenom }
									${ mapClients.value.nom }</option>
							</c:forEach>
						</select>
					</div>
				</c:if>
			</fieldset>

			<fieldset>

				<legend>Informations commande</legend>

				<label for="dateCommande">Date <span class="requis">*</span></label>
				<input type="text" id="dateCommande" name="dateCommande"
					value="<c:out value="${commande.date}"/>" size="20" maxlength="20"
					disabled /> <span class="erreur">${form.erreurs['dateCommande']}</span>
				<br /> <label for="montantCommande">Montant <span
					class="requis">*</span></label> <input type="text" id="montantCommande"
					name="montantCommande"
					value="<c:out value="${commande.montantCommande}"/>" size="20"
					maxlength="20" /> <span class="erreur">${form.erreurs['montantCommande']}</span>
				<br /> <label for="modePaiementCommande">Mode de paiement <span
					class="requis">*</span></label> <input type="text"
					id="modePaiementCommande" name="modePaiementCommande"
					value="<c:out value="${commande.modePaiementCommande}"/>" size="20"
					maxlength="20" /> <span class="erreur">${form.erreurs['modePaiementCommande']}</span>
				<br /> <label for="statutPaiementCommande">Statut du
					paiement</label> <input type="text" id="statutPaiementCommande"
					name="statutPaiementCommande"
					value="<c:out value="${commande.statutPaiementCommande}"/>"
					size="20" maxlength="20" /> <span class="erreur">${form.erreurs['statutPaiementCommande']}</span>
				<br /> <label for="modeLivraisonCommande">Mode de livraison
					<span class="requis">*</span>
				</label> <input type="text" id="modeLivraisonCommande"
					name="modeLivraisonCommande"
					value="<c:out value="${commande.modeLivraisonCommande}"/>"
					size="20" maxlength="20" /> <span class="erreur">${form.erreurs['modeLivraisonCommande']}</span>
				<br /> <label for="statutLivraisonCommande">Statut de la
					livraison</label> <input type="text" id="statutLivraisonCommande"
					name="statutLivraisonCommande"
					value="<c:out value="${commande.statutLivraisonCommande}"/>"
					size="20" maxlength="20" /> <span class="erreur">${form.erreurs['statutLivraisonCommande']}</span>
				<br />
			</fieldset>
			<p class="info">${form.resultat}</p>
			<input type="submit" value="Valider" /> <input type="reset"
				value="Remettre � z�ro" /> <br />
		</form>
	</div>
	
	 <script src="<c:url value="/inc/jquery.js"/>"></script>
        
        <%-- Petite fonction jQuery permettant le remplacement de la premi�re partie du formulaire par la liste d�roulante, au clic sur le bouton radio. --%>
        <script>
        	jQuery(document).ready(function(){
        		/* 1 - Au lancement de la page, on cache le bloc d'�l�ments du formulaire correspondant aux clients existants */
        		$("div#ancienClient").hide();
        		/* 2 - Au clic sur un des deux boutons radio "choixNouveauClient", on affiche le bloc d'�l�ments correspondant (nouveau ou ancien client) */
                jQuery('input[name=choixNouveauClient]:radio').click(function(){
                	$("div#nouveauClient").hide();
                	$("div#ancienClient").hide();
                    var divId = jQuery(this).val();
                    $("div#"+divId).show();
                });
            });
        </script>
	
</body>