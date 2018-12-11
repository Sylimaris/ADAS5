with types;
use types;

Package Cuisinier is

	
	Procedure saisie_cook (cook_prenom, cook_nom: OUT nomination; cook_specialite: OUT T_specialite);
	Procedure saisie_specialite(cook_specialite: OUT T_specialite);
	Procedure recrutement(Tableau_Cuisinier: IN OUT T_club);
	Procedure affichage_club(Tableau_Cuisinier:IN T_club);

	--Function chiffre_affaire (Tableau_Cuisinier:T_club; prestation: T_prestation; cook_nom, cook_prenom: nomination) return integer;
	--Procedure depart (Tableau_Cuisinier: IN OUT T_club; cook_nom, cook_prenom: IN nomination; D:IN OUT T_demande);

end cuisinier;


