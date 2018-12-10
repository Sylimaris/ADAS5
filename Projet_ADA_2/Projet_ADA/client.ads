with types;
use types;


Package client is

	Procedure saisie_prestation (prenom_client, nom_client: OUT nomination;	cook_specialite: OUT T_specialite; cook_prenom, cook_nom : OUT nomination; nb_convives: OUT positive; jour: OUT T_semaine);

	Procedure nouvelle_prestation (D: IN OUT T_demande; prestation: IN T_prestation);

	Procedure annulation (prestation: IN T_prestation; D: IN OUT T_demande; J: IN T_semaine);

	Procedure lendemain (J: IN OUT T_semaine; D: IN OUT T_demande; C: IN OUT T_club);

	Procedure recherche_disponibilite (cook_prenom, cook_nom: IN nomination; D: IN T_demande);

end client;
