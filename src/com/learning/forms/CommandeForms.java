package com.learning.forms;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.joda.time.DateTime;
import org.joda.time.format.DateTimeFormat;
import org.joda.time.format.DateTimeFormatter;

import com.learningee.bean.Client;
import com.learningee.bean.Commande;

public final class CommandeForms {

    public static final String  CHAMP_DATE            = "dd/MM/yyyy HH:mm:ss";
    public static final String  CHAMP_MONTANT         = "montantCommande";
    public static final String  CHAMP_MODEPAIEMENT    = "modePaiementCommande";
    public static final String  CHAMP_STATUTPAIEMENT  = "statutPaiementCommande";
    public static final String  CHAMP_MODELIVRAISON   = "modeLivraisonCommande";
    public static final String  CHAMP_STATUTLIVRAISON = "statutLivraisonCommande";

    public String               resultat;
    private Map<String, String> erreurs               = new HashMap<String, String>();

    public String getResultat() {
        return resultat;
    }

    public Map<String, String> getErreurs() {
        return erreurs;
    }

    // la logique de validationù
    public Commande insertCommande( HttpServletRequest request ) {

        /*
         * L'objet métier pour valider la création d'un client existe déjà, il
         * est donc déconseillé de dupliquer ici son contenu ! À la place, il
         * suffit de passer la requête courante à l'objet métier existant et de
         * récupérer l'objet Client créé.
         */
        ClientForms clientForms = new ClientForms();
        Client client = clientForms.insertClient( request );

        // on recupere l'objet erreurs
        erreurs = clientForms.getErreurs();

        // on recupere les données du form
        DateTime dt = new DateTime();
        DateTimeFormatter formatter = DateTimeFormat.forPattern( CHAMP_DATE );
        String date = dt.toString( formatter );

        String montant = getValeurChamp( request, CHAMP_MONTANT );
        String modePaiement = getValeurChamp( request, CHAMP_MODEPAIEMENT );
        String statutPaiement = getValeurChamp( request, CHAMP_STATUTPAIEMENT );
        String modeLivraison = getValeurChamp( request, CHAMP_MODELIVRAISON );
        String statutLivraison = getValeurChamp( request, CHAMP_STATUTLIVRAISON );

        // on crée l'instance de commande
        Commande commande = new Commande();
        commande.setClient( client );
        commande.setDate( date );

        double valeurMontant = -1;

        // on fait la validation des diffrents champs Montant
        try {
            valeurMontant = validationMontant( montant );
        } catch ( Exception e ) {
            setErreur( CHAMP_MONTANT, e.getMessage() );
        }
        commande.setMontantCommande( montant );

        // champs mode paiement
        try {
            validationModePaiement( modePaiement );
        } catch ( Exception e ) {
            setErreur( CHAMP_MODEPAIEMENT, e.getMessage() );
        }
        commande.setModePaiementCommande( modePaiement );

        // champs sattu paiement
        try {
            validationStatuPaiement( statutPaiement );
        } catch ( Exception e ) {
            setErreur( CHAMP_STATUTPAIEMENT, e.getMessage() );
        }
        commande.setStatutPaiementCommande( statutPaiement );

        // mode livraison
        try {
            validationModeLivraison( modeLivraison );
        } catch ( Exception e ) {
            setErreur( CHAMP_MODELIVRAISON, e.getMessage() );
        }
        commande.setModeLivraisonCommande( modeLivraison );

        // statut livraison
        try {
            validationStatutLivraison( statutLivraison );
        } catch ( Exception e ) {
            setErreur( CHAMP_STATUTLIVRAISON, e.getMessage() );
        }
        commande.setStatutLivraisonCommande( statutLivraison );

        // verification de la validtion total
        if ( erreurs.isEmpty() ) {
            resultat = " Creation de la commande avec succès";
        } else
            resultat = "Echec lors de la creation de la commande";

        return commande;

    }

    private void validationStatuPaiement( String statutPaiement ) throws Exception {
        if ( statutPaiement != null && statutPaiement.length() < 2 ) {
            throw new Exception( "Le statut de paiement doit contenir au moins 2 caractères." );
        }

    }

    // verification des methodes de validation
    private void validationStatutLivraison( String statutLivraison ) throws Exception {
        if ( statutLivraison != null && statutLivraison.length() < 2 ) {
            throw new Exception( "Le statut de livraison doit contenir au moins 2 caractères." );
        }

    }

    private void validationModeLivraison( String modeLivraison ) throws Exception {
        if ( modeLivraison != null ) {
            if ( modeLivraison.length() < 2 ) {
                throw new Exception( "Le mode de livraison doit contenir au moins 2 caractères." );
            }
        } else {
            throw new Exception( "Merci d'entrer un mode de livraison." );
        }

    }

    private void validationModePaiement( String modePaiement ) throws Exception {

        if ( modePaiement != null ) {
            if ( modePaiement.length() < 2 ) {
                throw new Exception( "Le mode de paiement doit contenir au moins 2 caractères." );
            }
        } else {
            throw new Exception( "Merci d'entrer un mode de paiement." );
        }

    }

    private double validationMontant( String montant ) throws Exception {

        double temp;
        if ( montant != null ) {
            try {
                temp = Double.parseDouble( montant );
                if ( temp < 0 ) {
                    throw new Exception( "Le montant doit être un nombre positif." );
                }
            } catch ( NumberFormatException e ) {
                temp = -1;
                throw new Exception( "Le montant doit être un nombre." );
            }
        } else {
            temp = -1;
            throw new Exception( "Merci d'entrer un montant." );
        }
        return temp;
    }

    /*
     * Ajoute un message correspondant au champ spécifié à la map des erreurs.
     */
    private void setErreur( String champ, String message ) {
        erreurs.put( champ, message );
    }

    /*
     * Méthode utilitaire qui retourne null si un champ est vide, et son contenu
     * sinon.
     */
    private static String getValeurChamp( HttpServletRequest request, String nomChamp ) {
        String valeur = request.getParameter( nomChamp );
        if ( valeur == null || valeur.trim().length() == 0 ) {
            return null;
        } else {
            return valeur;
        }
    }

}
