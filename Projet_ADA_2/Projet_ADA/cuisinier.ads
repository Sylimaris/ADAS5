with types;
use types;

Package Cuisinier is

	Procedure saisie_cook (cook_prenom, cook_nom: OUT nomination);

	Procedure saisie_specialite(cook_specialite: OUT T_specialite);

	Procedure recrutement(Tableau_Cuisinier: IN OUT T_club);

	Procedure affichage_club(Tableau_Cuisinier:IN T_club);

	Procedure affichage_chiffre_affaire (Tableau_Cuisinier: IN T_club; cook_nom, cook_prenom: IN nomination);

	Function cout_prestation (Tableau_Cuisinier: T_club; Prestation: T_prestation) return integer;

	Procedure depart (Tableau_Cuisinier: IN OUT T_club; Planning:IN OUT T_planning);

end cuisinier;


