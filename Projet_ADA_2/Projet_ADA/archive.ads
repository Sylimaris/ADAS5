with types;
use types;


Package archive is

	Procedure archivage_prestation (prestation: IN T_prestation; D: IN OUT T_demande);

	Procedure lecture_specialite_prestation(specialite: IN T_specialite);
	
	Procedure lecture_prestation_client (prenom_client, nom_client: IN nomination);

	Procedure lecture_prestation_cook (cook_prenom, cook_nom: IN nomination);

	Function lecture_nombre_repas (cook_prenom, cook_nom: nomination) return integer;

	Function lecture_nombre_prestation (cook_prenom, cook_nom: nomination) return integer;

end archive;
