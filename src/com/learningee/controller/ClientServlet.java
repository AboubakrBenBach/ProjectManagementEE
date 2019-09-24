package com.learningee.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.learning.forms.ClientForms;
import com.learningee.bean.Client;

/**
 * Servlet implementation class ClientServlet
 */
@WebServlet( "/ClientServlet" )
public class ClientServlet extends HttpServlet {
    private static final long  serialVersionUID = 1L;
    // les attribut
    public static final String ATT_CLIENT       = "client";
    public static final String ATT_FORM         = "form";

    public static final String VU_SUCCESS       = "/WEB-INF/afficherClient.jsp";
    public static final String VU_FORM          = "/WEB-INF/InsertClient.jsp";

    /**
     * Default constructor.
     */
    public ClientServlet() {
        // TODO Auto-generated constructor stub
    }

    /**
     * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
     *      response)
     */
    protected void doGet( HttpServletRequest request, HttpServletResponse response )
            throws ServletException, IOException {
        // TODO Auto-generated method stub

        /* Transmission � la page JSP en charge de l'affichage des donn�es */
        this.getServletContext().getRequestDispatcher( VU_FORM ).forward( request, response );
    }

    /**
     * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
     *      response)
     */
    protected void doPost( HttpServletRequest request, HttpServletResponse response )
            throws ServletException, IOException {

        // on creer une instance de metier
        ClientForms form = new ClientForms();

        /*
         * Appel au traitement et � la validation de la requ�te, et r�cup�ration
         * du bean en r�sultant
         */
        Client client = form.insertClient( request );

        /* Stockage du r�sultat et des messages d'erreur dans l'objet request */
        request.setAttribute( ATT_CLIENT, client );
        request.setAttribute( ATT_FORM, form );

        if ( form.getErreurs().isEmpty() ) {
            /* Si aucune erreur, alors affichage de la fiche r�capitulative */
            this.getServletContext().getRequestDispatcher( VU_SUCCESS ).forward( request, response );
        } else {
            /* Sinon, r�-affichage du formulaire de cr�ation avec les erreurs */
            this.getServletContext().getRequestDispatcher( VU_FORM ).forward( request, response );
        }
    }

}
