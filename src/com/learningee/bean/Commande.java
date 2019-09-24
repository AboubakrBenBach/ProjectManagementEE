package com.learningee.bean;

public class Commande {

    private Client client;
    private String date;
    private String montantCommande;
    private String modePaiementCommande;
    private String statutPaiementCommande;
    private String modeLivraisonCommande;
    private String statutLivraisonCommande;

    public String getDate() {
        return date;
    }

    public void setDate( String date ) {
        this.date = date;
    }

    public String getMontantCommande() {
        return montantCommande;
    }

    public void setMontantCommande( String montant ) {
        this.montantCommande = montant;
    }

    public String getModePaiementCommande() {
        return modePaiementCommande;
    }

    public void setModePaiementCommande( String modePaiementCommande ) {
        this.modePaiementCommande = modePaiementCommande;
    }

    public String getStatutPaiementCommande() {
        return statutPaiementCommande;
    }

    public void setStatutPaiementCommande( String statutPaiementCommande ) {
        this.statutPaiementCommande = statutPaiementCommande;
    }

    public String getModeLivraisonCommande() {
        return modeLivraisonCommande;
    }

    public void setModeLivraisonCommande( String modeLivraisonCommande ) {
        this.modeLivraisonCommande = modeLivraisonCommande;
    }

    public String getStatutLivraisonCommande() {
        return statutLivraisonCommande;
    }

    public void setStatutLivraisonCommande( String statutLivraisonCommande ) {
        this.statutLivraisonCommande = statutLivraisonCommande;
    }

    public Client getClient() {
        return client;
    }

    public void setClient( Client client ) {
        this.client = client;
    }

}
