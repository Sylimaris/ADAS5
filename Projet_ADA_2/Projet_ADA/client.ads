with types;
use types;


Package client is

	Procedure saisie_prestation (Planning: IN OUT T_planning;Tableau_cuisinier: IN T_club);
	
	Procedure saisie_semaine (semaine : OUT integer);
	
	Procedure saisie_jour(jour : OUT T_semaine);

	Procedure annulation (Planning: IN OUT T_Planning);

	Procedure affichage_planning (Planning : IN T_Planning);
	
	Procedure report_sur_novice(Tableau_Cuisinier: IN T_club; Planning: IN OUT T_planning; semaine: IN integer; jour : IN T_semaine; cook_specialite : IN T_specialite; nom_client,prenom_client : IN nomination; nb_convives : IN positive);
	
	Procedure reatribution_commande(Tableau_Cuisinier: IN T_club; cook_nom, cook_prenom : IN nomination; cook_specialite : IN T_specialite; Planning : IN OUT T_planning);
	
	Procedure actualisation_cuisinier(Tableau_Cuisinier: IN OUT T_club; Planning : IN T_planning; date_du_jour : IN T_semaine; cuisto : IN integer);
	
	Procedure saisie_note(Planning : IN OUT T_planning; date_du_jour : IN T_semaine; cuisto : IN integer);
	
	Procedure passage_au_lendemain(date_du_jour : IN OUT T_semaine; Tableau_Cuisinier : IN OUT T_club; Planning : IN OUT T_planning);
	
	Procedure actualisation_date_du_jour(Tableau_Cuisinier: IN OUT T_club; Planning : IN OUT T_planning; date_du_jour : IN OUT T_semaine);

end client;
