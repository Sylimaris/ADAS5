with types;
use types;

Package Cuisinier is

	Procedure saisie_cook (cook_prenom, cook_nom: OUT nomination); -- Saisie d'un nom et d'un prenom (sert pour la saisie d'un client)  -- Thomas

	Procedure saisie_specialite(cook_specialite: OUT T_specialite); -- Saisie d'une specialité  -- Thomas

	Procedure recrutement(Tableau_Cuisinier: IN OUT T_club); -- ajout d'un nouveau cuisinier n'existant pas déja / Appelle saisie_cook, saisie_specialite -- Pierre-Baptiste

	Procedure affichage_club(Tableau_Cuisinier:IN T_club); -- affiche les cuisiners existants et leurs informations -- Thomas

	Function cout_prestation (Tableau_Cuisinier: T_club; Prestation: T_prestation) return integer; -- retourne le cout d'une prestation -- Pierre-Baptiste

	Procedure depart (Tableau_Cuisinier: IN OUT T_club; Planning:IN OUT T_planning); --suppression d'un cuisinier / Appelle saisie_cuisinier , reatribution_commande  -- Pierre-Baptiste

end cuisinier;


