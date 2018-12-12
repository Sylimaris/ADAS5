with ada.text_io, ada.integer_text_io,ada.Float_Text_IO,types;
use ada.text_io, ada.integer_text_io,ada.Float_Text_IO,types;

Package body cuisinier is

---------------------------------------------------------

	Procedure saisie_cook (cook_prenom,cook_nom: OUT nomination) is
	k:integer;
	Begin
	    	Put("Saisir le prenom: ");
	    	get_line(cook_prenom,k);
		new_line;
	    	Put("Saisir le nom: ");
	    	get_line(cook_nom,k);
		new_line;
		--Les vérifs sont à faire dans la procédure utilisant cette procédure, avec le tableau des T_cuisiniers.
	end saisie_cook;

---------------------------------------------------------

	Procedure saisie_specialite (cook_specialite : OUT T_specialite) is
	s:string(1..33);k:integer;

	begin
	Put("Saisir une spécialité (cuisine_francaise_traditionnelle, cuisine_vegetarienne, cuisine_asiatique, cuisine_du_maghreb, buffet)");
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
		saisie_cook(cook_prenom,cook_nom);
		saisie_specialite(cook_specialite);	
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


	Procedure depart (Tableau_Cuisinier: IN OUT T_club; Registre:IN OUT T_demande) is
		cook_nom,cook_prenom: nomination := ('*',others =>' ');
		cook_specialite: T_specialite;
		existe : boolean := false;
		Begin
			put_line("Saisir le cuisinier sortant");
			saisie_cook (cook_prenom,cook_nom);
			
			for i in Tableau_Cuisinier'range loop
				if Tableau_Cuisinier(i).existe=true then
					if cook_nom=Tableau_Cuisinier(i).nom and cook_prenom=Tableau_Cuisinier(i).prenom then
						existe:=true;
						cook_specialite:=Tableau_Cuisinier(i).cook_specialite;
					    Tableau_Cuisinier(i).existe:=false;
						reatribution_commande(Tableau_Cuisinier, cook_nom, cook_prenom, cook_specialite, Registre);
						exit;
					end if;
				end if;
			end loop;
			if existe = false then
				put_line("Ce cuisinier n'existe pas il ne peut donc pas etre supprimé");
			end if;
	end depart;
	
-------------------------------

Procedure note (Tableau_Cuisinier: IN OUT T_club; cook_nom, cook_prenom: IN nomination; note : IN notation) is 
	existe : boolean := false; 
Begin 
	for i in Tableau_Cuisinier'range loop 
		if Tableau_Cuisinier(i).existe=true and cook_nom=Tableau_Cuisinier(i).nom and cook_prenom=Tableau_Cuisinier(i).prenom then
			Tableau_Cuisinier(i).somme_note_semaine:=Tableau_Cuisinier(i).somme_note_semaine+note; 
			existe:=true; 
			Tableau_Cuisinier(i).nb_prestations_semaine:=Tableau_Cuisinier(i).nb_prestations_semaine+1; 
			exit; 
		end if; 
	end loop; 

	if existe = false then 
		put_line("ERREUR: Gros probleme on a un cuisinier qui vient de faire une prestation qui n'est pas dans la base"); 
	end if; 

End note;
--------------------------------

End cuisinier;
