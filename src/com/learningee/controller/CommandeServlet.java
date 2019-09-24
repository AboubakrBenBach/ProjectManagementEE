package com.learningee.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.learning.forms.CommandeForms;
import com.learningee.bean.Commande;

/**
 * Servlet implementation class CommandeServlet
 */
@WebServlet( "/CommandeServlet" )
public class CommandeServlet extends HttpServlet {
    private static final long  serialVersionUID = 1L;

    // les attribut
    public static final String ATT_COMMANDE     = "commande";
    public static final String ATT_FORM         = "form";

    public static final String VU_SUCCES        = "/WEB-INF/afficherCommande.jsp";
    public static final String VU_FORM          = "/WEB-INF/InsertCommande.jsp";

    /**
     * @see HttpServlet#HttpServlet()
     */
    public CommandeServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

    /**
     * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
     *      response)
     */
    protected void doGet( HttpServletRequest request, HttpServletResponse response )
            throws ServletException, IOException {
        // TODO Auto-generated method stub

        /* Transmission à la page JSP en charge de l'affichage des données */
        this.getServletContext().getRequestDispatcher( VU_FORM ).forward( request, response );

    }

    /**
     * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
     *      response)
     */
    protected void doPost( HttpServletRequest request, HttpServletResponse response )
            throws ServletException, IOException {

        // on creer une instnace metier
        CommandeForms form = new CommandeForms();

        /*
         * Appel au traitement et à la validation de la requête, et récupération
         * du bean en résultant
         */
        Commande commande = form.insertCommande( request );

        // ajout du bean et de l'objet metier a l'objet request
        request.setAttribute( ATT_COMMANDE, commande );
        request.setAttribute( ATT_FORM, form );

        // on verifie s'il n'ya pas l'erreur a la fin pour pouvoir afficher la
        // commande crée
        if ( form.getErreurs().isEmpty() ) {
            this.getServletContext().getRequestDispatcher( VU_SUCCES ).forward( request, response );

        } else
            this.getServletContext().getRequestDispatcher( VU_FORM ).forward( request, response );

    }

}
