package types is

	NbC :constant natural :=8; 			-- NB cuisiniers 
	taille_demande : constant natural := 15*NbC; 	-- NB cuisiniers * nb possibilités

	Subtype notation is float range 1.0..6.0;
	Subtype intSemaine is integer range 0..2;
	Subtype nomination is string (1..20);

	Type T_semaine is (lundi, mardi, mercredi, jeudi, vendredi, samedi, dimanche);
	Type T_specialite is (cuisine_francaise_traditionnelle, cuisine_vegetarienne, cuisine_asiatique, cuisine_du_maghreb, buffet);


	Type T_Cuisinier is record
		nom: nomination := ('*',others =>' ');
		prenom: nomination := ('*',others =>' ');
		specialite : T_specialite;
		forfait_cuisinier:integer:=30;
		existe:boolean:= false; 		--test pour savoir si le cuisinier existe
		somme_note_semaine: float; 		-- notes de la semaine
		nb_repas_semaine:integer:=0;
		nb_repas:integer:=0;
		chiffre_affaire : integer:=0;   
	end record;	

	Type T_club is array (1..NbC) of T_Cuisinier;

	Type T_prestation is record
		nom_client : nomination;
		prenom_client : nomination;
		nb_convives : positive;
		specialite : T_specialite;
		jour : T_semaine;
		note: notation;
		nom_cuisinier: nomination;
		prenom_cuisinier: nomination;
	end record;

	Type T_demande is array (T_semaine'pos(mardi)..T_semaine'pos(samedi),1..NbC) of T_prestation; 
	
	Type T_planning is array (0..3) of T_demande;

end types;
