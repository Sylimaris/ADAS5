with ada.text_io, ada.integer_text_io,ada.Float_Text_IO,types;
use ada.text_io, ada.integer_text_io,ada.Float_Text_IO,types;

Package body cuisinier is

---------------------------------------------------------

	Procedure Saisie_cook (cook_prenom,cook_nom: OUT nomination; cook_specialite: OUT T_specialite) is
	k:integer;
	Begin
	    	Put("Saisir un prenom: ");
	    	get_line(cook_prenom,k);
		new_line;
	    	Put("Saisir un nom: ");
	    	get_line(cook_nom,k);
		new_line;
	  	saisie_specialite(cook_specialite);
	end Saisie_cook;

---------------------------------------------------------

	Procedure saisie_specialite (cook_specialite : OUT T_specialite) is
	s:string(1..33);k:integer;

	begin
	Put("Saisir une spécialité:");
		get_line(s,k);
		cook_specialite:=T_specialite'value(s(1..k));
		--ERREUR à rajouter si le neuneu écrit mal
	End saisie_specialite;

---------------------------------------------------------

	Procedure recrutement (Tableau_Cuisinier: IN OUT T_club) is
		existe : boolean := false;
		ecrit : boolean := false;
		cook_nom,cook_prenom: nomination := ('*',others =>' ');
		cook_specialite: T_specialite;
	Begin
		Saisie_cook(cook_prenom,cook_nom,cook_specialite);		
		for i in T_club'range loop
			if cook_nom=Tableau_Cuisinier(i).nom and cook_prenom=Tableau_Cuisinier(i).prenom then
				put_line("Un cuisinier existe deja pour ce nom & prenom");
				existe:=true;
			end if;
		end loop;
		if existe/=true then
			for i in Tableau_Cuisinier'range loop
				if Tableau_Cuisinier(i).existe=false then
				    Tableau_Cuisinier(i).nom:=cook_nom;
				    Tableau_Cuisinier(i).prenom:=cook_prenom;
				    Tableau_Cuisinier(i).specialite:=cook_specialite;
				    Tableau_Cuisinier(i).forfait_cuisinier:=30;
				    Tableau_Cuisinier(i).chiffre_affaire:=0;
				    Tableau_Cuisinier(i).existe:=true;
					Tableau_Cuisinier(i).somme_note_semaine:=0.0;
					Tableau_Cuisinier(i).nb_prestations_semaine:=0;
					Tableau_Cuisinier(i).nb_repas:=0;
					ecrit:=true;
					exit;
		        end if;
		    end loop;
			if ecrit /=true then
		    	put_line("Le nombre maximal de cuisiniers est déjà atteint");
			end if;
		end if;
	End recrutement;

--------------------------------------------------------


	Procedure affichage_club(Tableau_Cuisinier:IN T_club) is
	Begin
		Put("Cuisiniers du club en ce moment:");
		new_line;new_line;
		for i in T_club'range loop
			if Tableau_Cuisinier(i).existe=true then
				put("Nom: ");put(Tableau_Cuisinier(i).nom);new_line;
				put("Prénom: ");put(Tableau_Cuisinier(i).prenom);new_line;
				put("Spécialité: ");put(Tableau_Cuisinier(i).specialite'image);new_line;
				put("Forfait actuel: ");put(Tableau_Cuisinier(i).forfait_cuisinier, width=>0);new_line;
				put("Chiffre affaire total: ");put(Tableau_Cuisinier(i).chiffre_affaire, width=>0);new_line;
				put("Somme note de la semaine:");put(Tableau_Cuisinier(i).somme_note_semaine,aft=>0,exp=>0);new_line;		
				put("Nb prestations cette semaine: ");put(Tableau_Cuisinier(i).nb_prestations_semaine, width=>0);new_line;
				put("Nb repas au total: ");put(Tableau_Cuisinier(i).nb_repas, width=>0);new_line;
				new_line;
			end if;
		end loop;
	end affichage_club;		
	
--------------------------------------------------------
	
	Procedure affichage_chiffre_affaire (Tableau_Cuisinier: IN T_club; cook_nom, cook_prenom: IN nomination) is
		Begin
			for i in Tableau_Cuisinier'range loop
				if Tableau_Cuisinier(i).existe=true then
					if cook_nom=Tableau_Cuisinier(i).nom and cook_prenom=Tableau_Cuisinier(i).prenom then
						put("Le chiffre d'affaire de ");
						put(nom_cook);put(" ");
						put(prenom_cook);
						put(" est de :");
						put(Tableau_Cuisinier(i).chiffre_affaire);
						put_line("€");
						exit;
					end if;
				end if;
			end loop;
			put_line("Ce cuisinier n'existe pas, il n'a donc pas de chiffre d'affaire");
	End affichage_chiffre_affaire;
	
--------------------------------------------------------

	Procedure chiffre_affaire (Tableau_Cuisinier: IN OUT T_club;  cook_nom, cook_prenom: IN nomination; cout_prestation: IN integer) is
		existe : boolean := false;
		Begin
			for i in Tableau_Cuisinier'range loop
				if Tableau_Cuisinier(i).existe=true then
					if cook_nom=Tableau_Cuisinier(i).nom and cook_prenom=Tableau_Cuisinier(i).prenom then
						existe:=true;
						Tableau_Cuisinier(i).chiffre_affaire:=Tableau_Cuisinier(i).chiffre_affaire + cout_prestation;
						exit;
					end if;
				end if
			end loop;
			if existe = false then
				put_line("ERREUR: Gros probleme on a un cuisinier qui vient de faire une prestation qui n'est pas dans la base");
			end if;
	End chiffre_affaire;	
	
--------------------------------------------------------
	
	Function cout_prestation (Tableau_Cuisinier: T_club; Prestation: T_prestation) return integer is
		cout_prestation:integer;
		Begin
			for i in Tableau_Cuisinier'range loop
				if Tableau_Cuisinier(i).existe=true then
					if Prestation.nom_cuisinier=Tableau_Cuisinier(i).nom and Prestation.prenom_cuisinier=Tableau_Cuisinier(i).prenom then
						if Prestation.nb_convives > 25 then
							cout_prestation:=Prestation.nb_convives*33+Tableau_Cuisinier(i).forfait_cuisinier;
						elsif Prestation.nb_convives > 10 then
							cout_prestation:=Prestation.nb_convives*35+Tableau_Cuisinier(i).forfait_cuisinier;
						elsif Prestation.nb_convives > 5 then
							cout_prestation:=Prestation.nb_convives*40+Tableau_Cuisinier(i).forfait_cuisinier;
						elsif Prestation.nb_convives > 0 then
							cout_prestation:=Prestation.nb_convives*45+Tableau_Cuisinier(i).forfait_cuisinier;
						else
							put_line("ERREUR: 0 personnes ou moins à la prestation");
						end if;
						return(cout_prestation);
					end if;
				end if;
			end loop;
	End cout_prestation;	
	

--------------------------------------------------------


	Procedure depart (Tableau_Cuisinier: IN OUT T_club; cook_nom, cook_prenom: IN nomination; Registre:IN OUT T_demande) is
		existe : boolean := false;
		Begin
			for i in Tableau_Cuisinier'range loop
				if Tableau_Cuisinier(i).existe=true then
					if cook_nom=Tableau_Cuisinier(i).nom and cook_prenom=Tableau_Cuisinier(i).prenom then
						existe:=true;
					    Tableau_Cuisinier(i).existe:=false;
						reatribution_commande(cook_nom, cook_prenom, Registre);
						exit;
					end if;
				end if;
			end loop;
			if existe = false then
				put_line("Ce cuisinier n'existe pas il ne peut donc pas etre supprimé");
			end if;
	end depart;
						
	End cuisinier;
