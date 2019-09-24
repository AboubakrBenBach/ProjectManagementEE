package com.learning.forms;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import com.learningee.bean.Client;

public final class ClientForms {

    public static final String  CHAMP_NOM     = "nomClient";
    public static final String  CHAMP_PRENOM  = "prenomClient";
    public static final String  CHAMP_ADRESSE = "adresseClient";
    public static final String  CHAMP_TEL     = "telephoneClient";
    public static final String  CHAMP_EMAIL   = "emailClient";

    private String              resultat;
    private Map<String, String> erreurs       = new HashMap<String, String>();

    // les get resultats et erreur
    public String getResultat() {
        return resultat;
    }

    public Map<String, String> getErreurs() {
        return erreurs;
    }

    // la logique de validationù
    public Client insertClient( HttpServletRequest request ) {

        String nom = getValeurChamp( request, CHAMP_NOM );
        String prenom = getValeurChamp( request, CHAMP_PRENOM );
        String adresse = getValeurChamp( request, CHAMP_ADRESSE );
        String telephone = getValeurChamp( request, CHAMP_TEL );
        String email = getValeurChamp( request, CHAMP_EMAIL );

        Client client = new Client();

        // la verification avec try

        // validatio de nom
        try {
            validationNom( nom );
        } catch ( Exception e ) {
            erreurs.put( CHAMP_NOM, e.getMessage() );
        }
        client.setNomClient( nom );

        // validation de prenom
        try {
            validationPrenom( prenom );
        } catch ( Exception e ) {
            erreurs.put( CHAMP_PRENOM, e.getMessage() );
        }
        client.setPrenomClient( prenom );

        // validation adresse
        try {
            validationAdresse( adresse );
        } catch ( Exception e ) {
            erreurs.put( CHAMP_ADRESSE, e.getMessage() );
        }
        client.setAdresseClient( adresse );

        // validation telephone
        try {
            validationTelephone( telephone );
        } catch ( Exception e ) {
            erreurs.put( CHAMP_TEL, e.getMessage() );
        }
        client.setTelephoneClient( telephone );

        // validation email
        try {
            validationEmail( email );
        } catch ( Exception e ) {
            erreurs.put( CHAMP_EMAIL, e.getMessage() );
        }

        client.setEmailClient( email );

        // le resultat

        if ( erreurs.isEmpty() ) {
            resultat = "Succès de la création du client.";
        } else {
            resultat = "Échec de la création du client.";
        }

        return client;

    }

    // le champ telephone
    private void validationTelephone( String telephone ) throws Exception {
        if ( telephone != null ) {
            if ( !telephone.matches( "^\\d+$" ) ) {
                throw new Exception( "Le numéro de téléphone doit uniquement contenir des chiffres." );
            } else if ( telephone.length() < 4 ) {
                throw new Exception( "Le numéro de téléphone doit contenir au moins 4 chiffres." );
            }
        } else {
            throw new Exception( "Merci d'entrer un numéro de téléphone." );
        }

    }

    // le champs mail doit avoir une adresse valide
    private void validationEmail( String email ) throws Exception {
        if ( email != null && email.trim().length() != 0 ) {
            if ( !email.matches( "([^.@]+)(\\.[^.@]+)*@([^.@]+\\.)+([^.@]+)" ) ) {
                throw new Exception( "Merci de saisir une adresse mail valide." );
            }
        } else {
            throw new Exception( "Merci de saisir une adresse mail." );
        }

    }

    // le champ adresse
    private void validationAdresse( String adresse ) throws Exception {
        if ( adresse != null ) {
            if ( adresse.length() < 10 ) {
                throw new Exception( "L'adresse de livraison doit contenir au moins 10 caractères." );
            }
        } else {
            throw new Exception( "Merci d'entrer une adresse de livraison." );
        }

    }

    // le champ prenom doit contenir au moins 2 caractere
    private void validationPrenom( String prenom ) throws Exception {
        if ( prenom != null && prenom.trim().length() < 2 ) {
            throw new Exception( "Le nom d'utilisateur doit contenir au moins 2 caractères." );
        }

    }

    // le champ nom doit contenir au moins 2 caracteres
    private void validationNom( String nom ) throws Exception {
        if ( nom != null ) {
            if ( nom.length() < 2 ) {
                throw new Exception( "Le nom d'utilisateur doit contenir au moins 2 caractères." );
            }
        } else {
            throw new Exception( "Merci d'entrer un nom d'utilisateur." );
        }

    }

    // setteur erreur
    public void setErreurs( String champ, String message ) {
        erreurs.put( champ, message );
    }

    private String getValeurChamp( HttpServletRequest request, String nomChamp ) {
        String valeur = request.getParameter( nomChamp );
        if ( valeur == null || valeur.trim().length() == 0 ) {
            return null;
        } else {
            return valeur.trim();
        }

    }

}
