with ada.text_io, ada.integer_text_io,ada.Float_Text_IO,types,ada.characters.handling;
use ada.text_io, ada.integer_text_io,ada.Float_Text_IO,types,ada.characters.handling;

Package body client is




----------------------------------------------------------

Procedure saisie_prestation (Planning : IN OUT T_planning; Tableau_cuisinier: IN T_club) is

	prenom_client,nom_client,prenom_cook,nom_cook:nomination;
	nb_convives:positive;
	cook_specialite:T_specialite;
	jour:T_semaine;
	semaine:integer range 1..2; 
	k:integer;
	s:string(1..33);
	sjour:string(1..9);
	ajout,travaille,dispo:boolean:=false;
	compteurCook:integer:=0;
	choix:character;
	
		
begin

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
		if Tableau_Cuisinier(k).nom = Planning(semaine)(jour,j).nom_cuisinier and Tableau_Cuisinier(k).prenom = Planning(semaine)(jour,j).prenom_cuisinier and Planning(semaine)(jour,j).existe=false then
			put ("Nom:");put(Tableau_Cuisinier(k).nom);new_line;
			put ("Prénom:");put(Tableau_Cuisinier(k).prenom);new_line;new_line;
			dispo:=true;
		end if;
	end if;
end loop; --gérer la partie précédente, elle ne permet pas de voir les cuisiniers ne travaillant pas et de les afficher
			
if dispo then
	put ("Aucun cuisinier de la spécialité recherchée n'est disponible, recommencez");
	new_line;new_line;
	exit; -- il faut sortir de la procédure et retourner au menu, l'user ne doit pas aller dans l'interface de choix qui suit
end if;

--- ENREGISTREMENT : Mise à jour du planning ---
		 	
loop			
	put("Voulez-vous choisir un des cuisiniers présentés spécifiquement?");new_line;
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
			
	saisie_cook(nom_cook,prenom_cook);
			
	for j in Tableau_cuisinier'range loop
		if nom_cook=Tableau_cuisinier(i).nom and prenom_cook=Tableau_cuisinier(i).prenom and Tableau_cuisinier(i).existe and Tableau_cuisinier(i).specialite=cook_specialite then -- vérif qu'on est bien sur un vrai cuisinier + bonne orthographe + bonne spé
			
-- Ajouter la vérification si on a choisi un vrai cuisinier de la même spé mais déjà occupé? --Oui obligé
			
			if Planning(semaine)(jour,j).existe=false then
				Planning(semaine)(jour,j).nom_client:=nom_client;
				Planning(semaine)(jour,j).prenom_client:=prenom_client;
				Planning(semaine)(jour,j).nb_convives:=nb_convives;
				Planning(semaine)(jour,j).specialite:=cook_specialite;
					--Planning(h)(i,j).jour --PAS SUR
					--Planning(h)(i,j).note --Non définie pour le moment lors de la création
				Planning(semaine)(jour,j).nom_cuisinier:=nom_cook;
				Planning(semaine)(jour,j).prenom_cuisinier:=prenom_cook;
				Planning(semaine)(jour,j).existe:=true;
				new_line; put("Réservation ajoutée..");new_line;
				Planning(semaine)(jour,j).cout_prestation:=cout_prestation(Tableau_cuisinier,Planning(semaine)(jour,j));
				ajout:=true;
				exit;
			end if;
		end if;
		if ajout then
			exit;
		end if;
	end loop;
	if ajout then
		exit;
	end if;
	put_line("Erreur dans l'écriture du cuisinier (nom et/ou prénom)"); 
end loop;

		when '2' => -- Sélection du cuisinier de la spé ayant le moins fait de repas	
			report_sur_novice(Tableau_Cuisinier,Planning,semaine,jour,j,specialite,nom_client,prenom_client,nb_convives);
			
		when others => put("Erreur saisie");									 
	end case;
end saisie_prestation;

-----------------------------------------------------
-- procédure à revoir, incohérences dans le code variables + if, pas de message si réatribution impossible 
	Procedure reatribution_commande(Tableau_Cuisinier: IN T_club; cook_nom, cook_prenom : IN nomination; cook_specialite : IN T_specialite; Planning : IN OUT T_planning) is
		nom_client : nomination;
		prenom_client : nomination;
		nb_convives : positive;		
		
		Begin
			for semaine in Planning'range loop
				for jour in T_semaine'range loop --- ça c'est faux mais il faudra que l'on revoit la déclaration du tab en deux dimention demain
					for j in Tableau_cuisinier'range loop
						if Planning(semaine)(jour,j).nom=cook_nom and Planning(semaine)(jour,j).prenom=cook_prenom and Planning(semaine)(jour,j).existe then 
							put_line("report necessaire");
							Planning(semaine)(jour,j).existe:=false;
							nom_client:=Planning(semaine)(jour,j).nom_client;
							prenom_client:=Planning(semaine)(jour,j).prenom_client;
							nb_convives:=Planning(semaine)(jour,j).nb_convives;
							report_sur_novice(Tableau_Cuisinier,Planning,semaine,jour,j,specialite,nom_client,prenom_client,nb_convives);
							exit;
						end if;
					end loop;
				end loop;
			end loop;
	End reatribution_commande;
	
---------------------------------------------------
	
	Procedure report_sur_novice(Tableau_Cuisinier: IN T_club; Planning: IN OUT T_planning; semaine, j : IN integer; jour : IN T_semaine; specialite : IN T_specialite; nom_client,prenom_client : IN nomination; nb_convives : IN positive) is

		nb_repas_minimum:integer:=integer'last;
		cook_nom,cook_prenom: nomination := ('*',others =>' ');
		ajout:boolean:=false;
		Begin
			--enregistrement du cuisinier avec le - de repas ET ne travaillant pas
			for i in Tableau_cuisinier'range loop
				if Tableau_cuisinier(i).nb_repas < nb_repas_minimum and Planning(semaine)(jour,i).existe=false and Tableau_cuisinier(i).specialite=cook_specialite then
					nom_cook:=Tableau_cuisinier(i).nom;
					prenom_cook:=Tableau_cuisinier(i).prenom;
					nb_repas_minimum:=Tableau_cuisinier(i).nb_repas;	
					ajout:= true;			
				end if;
			end loop;
			
			--mise en place du nouveau bon cuisinier 

			if ajout then
				for j in Tableau_cuisinier'range loop	
					if Planning(semaine)(jour,j).nom=cook_nom and Planning(semaine)(jour,j).prenom=cook_prenom then
						Planning(semaine)(jour,j).nom_client:=nom_client;
						Planning(semaine)(jour,j).prenom_client:=prenom_client;
						Planning(semaine)(jour,j).nb_convives:=nb_convives;
						Planning(semaine)(jour,j).specialite:=cook_specialite;
					--Planning(h)(i,j).jour --PAS SUR
					--Planning(h)(i,j).note --Non définie pour le moment lors de la création
						Planning(semaine)(jour,j).nom_cuisinier:=nom_cook;
						Planning(semaine)(jour,j).prenom_cuisinier:=prenom_cook;
						Planning(semaine)(jour,j).existe:=true;
						Planning(semaine)(jour,j).cout_prestation:=cout_prestation(Tableau_cuisinier,Planning(semaine)(jour,j));
						new_line; put("La reservation sera effectuée par ");
						put(nom_cook);
						put(prenom_cook);new_line;
						ajout:=true;
						exit;	
					end if;
				end loop;
			else
				put("Notre equipe n'est pas en mesure d'assurer cette reservation et doit donc l'annuler");
			end if;
	End report_sur_novice;

---------------------------------

Procedure affichage_planning (Planning : IN T_Planning) is
	
begin
	for i in T'Planning'range loop
		put("Semaine : ");
		put(i);new_line;
		for j in T_Semaine'range loop
			put("Jour : ");
			put(T_semaine'image(j));new_line;
			for k in 1..NbC'range loop
				if Planning(i)(j,k).existe then
					new_line;
					put(Planning(i)(j,k).nom_client); new_line;
					put(Planning(i)(j,k).prenom_client); new_line;
					put(Planning(i)(j,k).nb_convives); new_line;
					put(T_specialite'image(Planning(i)(j,k).specialite)); new_line;
					put(Planning(i)(j,k).nom_cuisinier); new_line;
					put(Planning(i)(j,k).prenom_cuisinier); new_line;
					put(Planning(i)(j,k).cout_prestation); new_line;new_line;
				end if;
			end loop;
		end loop;
	end loop;
end affichage_planning;


--------------------------------

Procedure annulation (Planning: IN OUT T_Planning) is
semaine is integer range 1..2;
sjour:T_semaine;
prenom_annulation,nom_annulation:nomination;
specialite_annulation:T_specialite;
k:integer;

begin
	Put("Saisir semaine prestation (semaine 1 ou semaine 2): ");
	get(semaine);
	skip_line;

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

	Procedure passage_au_lendemain(date_du_jour IN OUT: sjour; Tableau_Cuisinier: IN OUT T_club; Planning : IN OUT T_planning) is
		note:notation;
		Begin
			for i in Tableau_cuisinier'range loop
				if Planning(0)(date_du_jour,i).existe then				
					saisie_note(Planning, date_du_jour, i);
					actualisation_cuisinier(Tableau_Cuisinier, Planning, date_du_jour, i);
					archivage_prestation();
					suppression_prestation();
					actualisation_date_du_jour();
				end if;
			end loop;
			
	End passage_au_lendemain;
	
---------------------------------------------------
		
	Procedure saisie_note(Planning : IN OUT T_planning; date_du_jour IN : sjour; cuisto : IN integer) is
		note:notation;
		Begin
			put("Saisir la note à attribuer par");
			put(Planning(0)(date_du_jour,cuisto).nom_client);
			put(Planning(0)(date_du_jour,cuisto).prenom_client);
			get(note);skip_line;
			----saisi securisée
			Planning(0)(date_du_jour,cuisto).note:=note;
	End saisie_note;
	
---------------------------------------------------


	Procedure actualisation_cuisinier(Tableau_Cuisinier: IN OUT T_club; Planning : IN T_planning; date_du_jour IN sjour; cuisto : IN integer);
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
				end if;
			end loop;
			if existe = false then
			put_line("ERREUR: Gros probleme on a un cuisinier qui vient de faire une prestation qui n'est pas dans la base");
			end if;
	End actualisation_cuisinier;
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	


end client;
