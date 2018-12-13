with ada.text_io, ada.integer_text_io,ada.Float_Text_IO,ada.characters.handling,types,cuisinier;
use ada.text_io, ada.integer_text_io,ada.Float_Text_IO,ada.characters.handling,types,cuisinier;

Package body client is




----------------------------------------------------------

Procedure saisie_prestation (Planning : IN OUT T_planning; Tableau_cuisinier: IN T_club) is

	prenom_client,nom_client,prenom_cook,nom_cook:nomination:= ('*',others =>' ');
	nb_convives:positive;
	cook_specialite:T_specialite;
	jour:T_semaine;
	semaine:integer range 1..2; 
	k:integer;
	sjour:string(1..9);
	ajout,travaille,dispo:boolean:=false;
	compteurCook:integer:=0;
	choix:character;
	
		
	Begin

	--SAISIE--- ada.characters.handling --> to_upper to_lower

	saisie_cook(nom_client,prenom_client);
	

	put ("Saisir le nombre de convives:");
	get(nb_convives);skip_line;
	new_line;

	saisie_specialite(cook_specialite);
			
	Put("Saisir la semaine visée (1 = semaine prochaine | 2 = dans deux semaines): ");
	get(semaine);skip_line;
	new_line;

	Put("Saisir le jour voulu (mardi, mercredi, jeudi, vendredi ou samedi): ");
	get_line(sjour,k);
	--To_Lower (sjour); -- Eviter des majuscules
	jour:=T_semaine'value(sjour(1..k));

	--- FIN DES SAISIES --- 

	-- Les parties suivantes permettent de
	--	1 - chercher les cuisiniers de la spécialité
	--	2 - Vérifier qu'ils n'ont pas de travail le jour donné et la semaine donnée (vérifier toutes les cases)
	--	3 - Afficher les possibilités (ou un message si il n'y en a pas)
	--	4 - Mettre à jour le planning en insérant la demande
	
	new_line;new_line;
	Put("Les cuisiniers disponibles pour cette spécialité le ");
	put(T_semaine'image(jour));
	put(" de la semaine ");
	put(semaine);
	put(" sont :");
	new_line;new_line;
			
	For k in 1..Nbc loop -- parcourir la liste des cuisiniers
		travaille:=false;
		if Tableau_Cuisinier(k).specialite=cook_specialite then 	-- si le cuisinier est de la bonne spé
			if Planning(semaine)(jour,k).existe=false then
				put ("Nom:");put(Tableau_Cuisinier(k).nom);new_line;
				put ("Prénom:");put(Tableau_Cuisinier(k).prenom);new_line;new_line;
				dispo:=true;
			end if;
		end if;
	end loop; --gérer la partie précédente, elle ne permet pas de voir les cuisiniers ne travaillant pas et de les afficher
			
	if dispo=false then
		put ("Aucun cuisinier de la spécialité recherchée n'est disponible, recommencez");
		new_line;new_line;
	else

--- ENREGISTREMENT : Mise à jour du planning ---
		 	
		loop			
			put("Voulez-vous choisir le/un de(s) cuisinier(s) présenté(s) spécifiquement?");new_line;
			put("1 - OUI");new_line;
			put("2 - NON");new_line;
			put("Choix ==> 1 ou 2 :");
			get(choix);skip_line;
			exit when choix = '1' or choix = '2';
			new_line;	
			put ("Erreur de choix, recommencez..");
			new_line;
		end loop;
	
		case choix is
			when '1' =>
			loop	
				saisie_cook(prenom_cook,nom_cook);
				for j in 1..NbC loop
					if nom_cook=Tableau_cuisinier(j).nom and prenom_cook=Tableau_cuisinier(j).prenom and Tableau_cuisinier(j).existe and Tableau_cuisinier(j).specialite=cook_specialite  and Planning(semaine)(jour,j).existe=false then -- vérif qu'on est bien sur un vrai cuisinier + bonne orthographe + bonne spé + pas en travail		
						Planning(semaine)(jour,j).nom_client:=nom_client;
						Planning(semaine)(jour,j).prenom_client:=prenom_client;
						Planning(semaine)(jour,j).nb_convives:=nb_convives;
						Planning(semaine)(jour,j).specialite:=cook_specialite;
						--Planning(h)(i,j).jour --PAS SUR
						--Planning(h)(i,j).note --Non définie pour le moment lors de la création
						Planning(semaine)(jour,j).nom_cuisinier:=nom_cook;
						Planning(semaine)(jour,j).prenom_cuisinier:=prenom_cook;
						Planning(semaine)(jour,j).existe:=true;
						new_line; put("Réservation ajoutée!");new_line;
						Planning(semaine)(jour,j).cout_prestation:=cout_prestation(Tableau_cuisinier,Planning(semaine)(jour,j));
						ajout:=true;
						exit;
					end if;
				end loop;
			if ajout then
				exit;
			end if;
			put_line("Erreur dans l'écriture du cuisinier (nom et/ou prénom)"); 
			end loop;

		when '2' => -- Sélection du cuisinier de la spé ayant le moins fait de repas	
			report_sur_novice(Tableau_Cuisinier,Planning,semaine,jour,cook_specialite,nom_client,prenom_client,nb_convives);
			new_line; put("Réservation ajoutée!");new_line;
		when others => put("Erreur saisie");									 
		end case;
	end if;
end saisie_prestation;

-----------------------------------------------------
	Procedure reatribution_commande(Tableau_Cuisinier: IN T_club; cook_nom, cook_prenom : IN nomination; cook_specialite : IN T_specialite; Planning : IN OUT T_planning) is
		nom_client : nomination;
		prenom_client : nomination;
		nb_convives : positive;		
		
		Begin
			for semaine in Planning'range loop
				for jour in T_semaine'range loop --Faux?
					for j in Tableau_cuisinier'range loop
						if Planning(semaine)(jour,j).nom_cuisinier=cook_nom and Planning(semaine)(jour,j).prenom_cuisinier=cook_prenom and Planning(semaine)(jour,j).existe then 
							put_line("report necessaire");
							Planning(semaine)(jour,j).existe:=false;
							nom_client:=Planning(semaine)(jour,j).nom_client;
							prenom_client:=Planning(semaine)(jour,j).prenom_client;
							nb_convives:=Planning(semaine)(jour,j).nb_convives;
							report_sur_novice(Tableau_Cuisinier,Planning,semaine,jour,cook_specialite,nom_client,prenom_client,nb_convives);
							exit;
						end if;
					end loop;
				end loop;
			end loop;
	End reatribution_commande;
	
---------------------------------------------------
	
	Procedure report_sur_novice(Tableau_Cuisinier: IN T_club; Planning: IN OUT T_planning; semaine: IN integer; jour : IN T_semaine; cook_specialite : IN T_specialite; nom_client,prenom_client : IN nomination; nb_convives : IN positive) is

		nb_repas_minimum:integer:=integer'last;
		cook_nom,cook_prenom: nomination;
		ajout:boolean:=false;
		Begin
			--enregistrement du cuisinier avec le - de repas ET ne travaillant pas
			for i in 1..NbC loop
				if Tableau_cuisinier(i).nb_repas < nb_repas_minimum and Planning(semaine)(jour,i).existe=false and Tableau_cuisinier(i).specialite=cook_specialite and Tableau_cuisinier(i).existe then
					cook_nom:=Tableau_cuisinier(i).nom;
					cook_prenom:=Tableau_cuisinier(i).prenom;
					nb_repas_minimum:=Tableau_cuisinier(i).nb_repas;	
					ajout:= true;		
				end if;
			end loop;
			--mise en place du nouveau bon cuisinier 
			if ajout then
				for j in 1..NbC loop	
					if Tableau_cuisinier(j).nom=cook_nom and Tableau_cuisinier(j).prenom=cook_prenom then
						Planning(semaine)(jour,j).nom_client:=nom_client;
						Planning(semaine)(jour,j).prenom_client:=prenom_client;
						Planning(semaine)(jour,j).nb_convives:=nb_convives;
						Planning(semaine)(jour,j).specialite:=cook_specialite;
						Planning(semaine)(jour,j).nom_cuisinier:=cook_nom;
						Planning(semaine)(jour,j).prenom_cuisinier:=cook_prenom;
						Planning(semaine)(jour,j).existe:=true;
						Planning(semaine)(jour,j).cout_prestation:=cout_prestation(Tableau_cuisinier,Planning(semaine)(jour,j));
						new_line; put("La reservation sera effectuée par ");
						put(cook_nom);
						put(cook_prenom);
						new_line;
						exit;	
					end if;
				end loop;
			else
				put("Notre equipe n'est pas en mesure d'assurer la réservation et doit donc l'annuler -- Récap réservation annulée:");
				put(nom_client);put(" ");put(prenom_client);put(" Semaine:");put(semaine);put(" ");put(T_semaine'image(jour));
				new_line;
			end if;
	End report_sur_novice;

---------------------------------

Procedure affichage_planning (Planning : IN T_Planning) is
	
begin
	for i in Planning'range loop
		put("Semaine : ");
		put(i, width=>0);new_line;
		for j in mardi..samedi loop
			put("Jour : ");
			put(T_semaine'image(j));new_line;
			for k in 1..NbC loop
				if Planning(i)(j,k).existe then
					put("Nom Client: ");put(Planning(i)(j,k).nom_client); new_line;
					put("Prénom client: ");put(Planning(i)(j,k).prenom_client); new_line;
					put("Nombre de convives: ");put(Planning(i)(j,k).nb_convives,width=>0); new_line;
					put("Spécialité: ");put(T_specialite'image(Planning(i)(j,k).specialite)); new_line;
					put("Nom cuisinier: ");put(Planning(i)(j,k).nom_cuisinier); new_line;
					put("Prénom cuisinier: ");put(Planning(i)(j,k).prenom_cuisinier); new_line;
					put("Coût: ");put(Planning(i)(j,k).cout_prestation,width=>0); new_line;new_line;
				end if;
			end loop;
		end loop;
	end loop;
end affichage_planning;


--------------------------------

Procedure annulation (Planning: IN OUT T_Planning) is
sjour:string(1..9);
prenom_annulation,nom_annulation:nomination;
specialite_annulation:T_specialite;
k:integer;
semaine:integer;
jour:T_semaine;

begin

	loop
		Put("Saisir semaine prestation (semaine 1 ou semaine 2): ");
		get(semaine);skip_line;
		exit when semaine = 1 or semaine =2;
		new_line;
		put("Erreur saisie semaine, recommencez: ");
	end loop;

	new_line;

	Put("Saisir le jour de la prestation à annuler (mardi, mercredi, jeudi, vendredi ou samedi): ");
	get_line(sjour,k);
	jour:=T_semaine'value(sjour(1..k));

	new_line;

	saisie_cook(prenom_annulation,nom_annulation);

	saisie_specialite(specialite_annulation);
	
	For j in 1..NbC loop
		if Planning(semaine)(jour,j).nom_client = nom_annulation and Planning(semaine)(jour,j).prenom_client = prenom_annulation and Planning(semaine)(jour,j).existe then
			Planning(semaine)(jour,j).existe:=false;
			Put("Prestation annulée");
			new_line;
			new_line;
		end if;
	end loop;
end annulation;

---------------------------------------------------

	Procedure passage_au_lendemain(date_du_jour : IN OUT T_semaine; Tableau_Cuisinier : IN OUT T_club; Planning : IN OUT T_planning) is
		Begin
			for i in Tableau_cuisinier'range loop
				if Planning(0)(date_du_jour,i).existe then				
					saisie_note(Planning, date_du_jour, i);
					actualisation_cuisinier(Tableau_Cuisinier, Planning, date_du_jour, i);
--					archivage_prestation();
					actualisation_date_du_jour(Tableau_Cuisinier, Planning, date_du_jour);
				end if;
			end loop;
			
	End passage_au_lendemain;
	
---------------------------------------------------
		
	Procedure saisie_note(Planning : IN OUT T_planning; date_du_jour : IN T_semaine; cuisto : IN integer) is
		note:notation;
		Begin
			put("Saisir la note à attribuer par");
			put(Planning(0)(date_du_jour,cuisto).nom_client);
			put(Planning(0)(date_du_jour,cuisto).prenom_client);
			get(note);skip_line;
			----saisie securisée
			Planning(0)(date_du_jour,cuisto).note:=note;
	End saisie_note;
	
---------------------------------------------------


	Procedure actualisation_cuisinier(Tableau_Cuisinier: IN OUT T_club; Planning : IN T_planning; date_du_jour : IN T_semaine; cuisto : IN integer) is
	existe : boolean := false;
		Begin
			for i in Tableau_cuisinier'range loop
				if Planning(0)(date_du_jour,cuisto).existe and Tableau_Cuisinier(cuisto).existe=true then
					existe:=true;
					Tableau_Cuisinier(cuisto).somme_note_semaine:=Tableau_Cuisinier(cuisto).somme_note_semaine + Planning(0)(date_du_jour,cuisto).note;
					Tableau_Cuisinier(cuisto).chiffre_affaire:=Tableau_Cuisinier(cuisto).chiffre_affaire + Planning(0)(date_du_jour,cuisto).cout_prestation;
					Tableau_Cuisinier(cuisto).nb_repas:=Tableau_Cuisinier(cuisto).nb_repas + Planning(0)(date_du_jour,cuisto).nb_convives;
					Tableau_Cuisinier(cuisto).nb_prestations_semaine:=Tableau_Cuisinier(cuisto).nb_prestations_semaine+1;				
					exit;
				end if;
			end loop;
			if existe = false then
			put_line("ERREUR: Gros probleme on a un cuisinier qui vient de faire une prestation qui n'est pas dans la base");
			end if;
	End actualisation_cuisinier;
	
	Procedure actualisation_date_du_jour(Tableau_Cuisinier: IN OUT T_club; Planning : IN OUT T_planning; date_du_jour : IN OUT T_semaine) is
		var:integer;
		note_moyenne:float;
		Begin
			if date_du_jour=samedi then
				--- Mise à jour des notes
				for i in Tableau_Cuisinier'range loop
					if Tableau_Cuisinier(i).existe=true then
						note_moyenne:=Tableau_Cuisinier(i).somme_note_semaine/float(Tableau_Cuisinier(i).nb_prestations_semaine);
						if note_moyenne<=2.0 and Tableau_Cuisinier(i).forfait_cuisinier>25 then
							Tableau_Cuisinier(i).forfait_cuisinier:=Tableau_Cuisinier(i).forfait_cuisinier-5;
						elsif note_moyenne>=5.0 and Tableau_Cuisinier(i).forfait_cuisinier<100 then
							Tableau_Cuisinier(i).forfait_cuisinier:=Tableau_Cuisinier(i).forfait_cuisinier+5;
						end if;
					end if;
				end loop;
				
				--- Mise à jour du planning
				for s in 1..2 loop
					for j in mardi..samedi loop
						for c in 1..NbC loop
							var:=c-1;
							Planning(var)(j,c):=Planning(s)(j,c);
						end loop;
					end loop;
				end loop;
				for j in mardi..samedi loop
					for c in 1..NbC loop
						Planning(2)(j,c).existe:=false;
					end loop;
				end loop;
			end if;
			
			--- Mise à jour du jour
			if date_du_jour=T_semaine(date_du_jour)'last then
				date_du_jour:=T_semaine(date_du_jour)'first;
			else
				date_du_jour:=T_semaine(date_du_jour)'succ;
			end if;
		
	End actualisation_date_du_jour;
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	


end client;
