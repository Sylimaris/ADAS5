with types;
use types;


Package client is

	Procedure saisie_prestation (Planning: IN OUT T_planning;Tableau_cuisinier: IN T_club); -- Saisie d'une nouvelle prestation --Thomas
	
	Procedure saisie_semaine (semaine : OUT integer); -- Saisie de la semaine : 1 ou 2 -- Thomas
	
	Procedure saisie_jour(jour : OUT T_semaine); -- Saisie du jour de la semaine : mardi à samedi -- Pierre-Baptiste

	Procedure annulation (Planning: IN OUT T_Planning); -- Annule la prestation d'un client -- Thomas

	Procedure affichage_planning (Planning : IN T_Planning); -- Affiche le planning des semaines 1, 2 & 3 jour par jour -- Thomas
	
	Procedure report_sur_novice(Tableau_Cuisinier: IN T_club; Planning: IN OUT T_planning; semaine: IN integer; jour : IN T_semaine; cook_specialite : IN T_specialite; nom_client,prenom_client : IN nomination; nb_convives : IN positive); -- Recherche le cusinier le moins experimenté et lui attribue la prestation -- Pierre-Baptiste
	
	Procedure reatribution_commande(Tableau_Cuisinier: IN T_club; cook_nom, cook_prenom : IN nomination; cook_specialite : IN T_specialite; Planning : IN OUT T_planning); -- Recherche l'ensemble des prestations à annuler / Appelle: report_sur_novice -- Pierre-Baptiste
	
	Procedure actualisation_cuisinier(Tableau_Cuisinier: IN OUT T_club; Planning : IN T_planning; date_du_jour : IN T_semaine; cuisto : IN integer); -- Mise à jour des objets cuisiniers (sauf forfait) lors du passage de jour / Appelle cout_prestation -- Pierre-Baptiste
	
	Procedure saisie_note(Planning : IN OUT T_planning; date_du_jour : IN T_semaine; cuisto : IN integer); -- Saisie de la note : 0.0 à 6.0 -- Pierre-Baptiste
	
	Procedure passage_au_lendemain(date_du_jour : IN OUT T_semaine; Tableau_Cuisinier : IN OUT T_club; Planning : IN OUT T_planning); -- Recherche les cuisiniers existant / Appelle saisie_note , actualisation_cuisinier , Archivage , actualisation_date_du_jour -- Pierre-Baptiste
	
	Procedure actualisation_date_du_jour(Tableau_Cuisinier: IN OUT T_club; Planning : IN OUT T_planning; date_du_jour : IN OUT T_semaine); -- Actualise la date du jour, calcul de la moyenne des notes de la semaine, mise à jour du forfait des cuisiniers, mise à jour de la semaine -- Pierre-Baptiste

end client;
