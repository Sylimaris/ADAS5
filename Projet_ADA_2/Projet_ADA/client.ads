with types;
use types;


Package client is

	Procedure saisie_prestation (Planning: IN OUT T_planning;Tableau_cuisinier: IN T_club);

	Procedure annulation (Planning: IN OUT T_Planning);
	Procedure affichage_planning (Planning : IN T_Planning);
	

	--Procedure lendemain (J: IN OUT T_semaine; D: IN OUT T_demande; C: IN OUT T_club);

	--Procedure recherche_disponibilite (cook_prenom, cook_nom: IN nomination; D: IN T_demande);
	
	Procedure report_sur_novice(Tableau_Cuisinier: IN T_club; Planning: IN OUT T_planning; semaine, j : IN integer; jour : IN T_semaine; specialite IN T_specialite; nom_client,prenom_client : IN nomination; nb_convives : IN positive);
	
	Procedure reatribution_commande(Tableau_Cuisinier: IN T_club; cook_nom, cook_prenom : IN nomination; cook_specialite : IN T_specialite; Planning : IN OUT T_planning);
	
	

end client;
