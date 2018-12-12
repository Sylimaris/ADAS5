with ada.text_io, ada.integer_text_io,ada.Float_Text_IO,types,ada.characters.handling;
use ada.text_io, ada.integer_text_io,ada.Float_Text_IO,types,ada.characters.handling;

Package body client is

Procedure saisie_prestation (Planning : IN OUT T_planning; Tableau_cuisinier: IN T_club) is

	prenom_client,nom_client,prenom_cook,nom_cook:nomination;
	nb_convives:positive;
	cook_specialite:T_specialite;
	jour:T_semaine;
	semaine:integer range 1..2; ---- wtf?
	k:integer;
	s:string(1..33);
	sjour:string(1..9);
	ajout,travaille:boolean:=false;
	compteurCook:integer:=0;
	choix:character;
	
		
begin

---SAISIE--- ada.characters.handling --> to_upper to_lower

	put ("Saisir votre nom:");
	get_line(prenom_client,k);
	new_line;

	put ("Saisir votre prénom:");
	get_line(nom_client,k);
	new_line;

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
	
	Put("Les cuisiniers disponibles pour cette spécialité le ");
	put(T_semaine'image(jour));
	put(" de la semaine ");
	put(semaine);
	put(" sont :");
	new_line;new_line;
			
For k in 1..Nbc loop -- parcourir la liste des cuisiniers
	if Tableau_Cuisinier(k).specialite=cook_specialite then 	-- si le cuisinier est de la bonne spé
		for j in 1..NbC loop					-- on parcourt les cuisiniers du tableau T_demande
			if Tableau_Cuisinier(k).nom = Planning(semaine)(jour,j).nom_cuisinier and Tableau_Cuisinier(k).prenom = Planning(semaine)(jour,j).prenom_cuisinier and Planning(semaine)(jour,j).existe=false then 
				compteurCook:=compteurCook+1; -- Un compteur est inutile on peux mettre un simple boolean
				put ("Nom:");put(Tableau_Cuisinier(k).nom);new_line;
				put ("Prénom:");put(Tableau_Cuisinier(k).prenom);new_line;new_line;
			end if;
		end loop;
	end if;
end loop;
			
if compteurCook=0 then
	put ("Nous sommes surbookés pour ce jour là, aucun cuisinier de la spécialité recherchée n'est disponible");
	new_line;new_line;
end if;

--- ENREGISTREMENT : Mise à jour du planning ---
		 	
	loop			
		put("Voulez-vous choisir un des cuisiniers présentés spécifiquement?");new_line;
		put("1 - OUI");new_line;
		put("2 - NON");new_line;
		put("Choix ==> 1 ou 2 :");
		get(choix);skip_line;
		exit when choix = '1' or choix = '2';
		put ("Erreur de choix, recommencez..");
		new_line;
	end loop;
		
	case choix is
		when '1' =>	
		
loop
			
	saisie_cook(cook_prenom,cook_nom);
			
	for i in Tableau_cuisinier'range loop
		if nom_cook=Tableau_cuisinier(i).nom and prenom_cook=Tableau_cuisinier(i).prenom and Tableau_cuisinier(i).existe and Tableau_cuisinier(i).specialite=cook_specialite then -- vérif qu'on est bien sur un vrai cuisinier + bonne orthographe + bonne spé

-- Ajouter la vérification si on a pas choisi un vrai cuisinier de la même spé mais déjà occupé? OUAIS OBLIGé
			for j in 1..NbC loop	
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
			end loop;	
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

	Procedure reatribution_commande(Tableau_Cuisinier: IN T_club; cook_nom, cook_prenom : IN nomination; cook_specialite : IN T_specialite; Planning : IN OUT T_planning) is
		nom_client : nomination;
		prenom_client : nomination;
		nb_convives : positive;
		Begin
			for semaine in semaine'range loop
				for jour in mardi..samedi'range loop --- ça c'est faux mais il faudra que l'on revoit la déclaration du tab en deux dimention demain
					for j in 1..NbC loop
						if Planning(semaine)(jour,j).nom and Planning(semaine)(jour,j).prenom and Planning(semaine)(jour,j).existe then 
							put_line("report necessaire");
							Planning(semaine)(jour,j).existe:=false;
							
							nom_client:=Planning(semaine)(jour,j).nom_client;
							prenom_client:=Planning(semaine)(jour,j).prenom_client;
							nb_convives:=Planning(semaine)(jour,j).nb_convives;
							
							report_sur_novice(Tableau_Cuisinier,Planning,semaine,jour,j,specialite,nom_client,prenom_client,nb_convives);
						end if;
					end loop;
				end loop;
			end loop;
	End reatribution_commande;
	
---------------------------------------------------
	
	Procedure report_sur_novice(Tableau_Cuisinier: IN T_club; Planning: IN OUT T_planning; semaine, j : IN integer; jour : IN T_semaine; specialite IN T_specialite; nom_client,prenom_client : IN nomination; nb_convives : IN positive) is
		nb_repas_minimum:integer:=integer'last;
		cook_nom,cook_prenom: nomination := ('*',others =>' ');
		ajout:boolean:=false;
		Begin
			for i in 1..NbC loop
				if Tableau_cuisinier(i).nb_repas < nb_repas_minimum and Tableau_cuisinier(i).specialite=cook_specialite then
					nom_cook:=Tableau_cuisinier(i).nom;
					prenom_cook:=Tableau_cuisinier(i).prenom;
					nb_repas_minimum:=Tableau_cuisinier(i).nb_repas;
				end if;
			end loop;
			
			for j in 1..NbC loop	
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
					Planning(semaine)(jour,j).cout_prestation:=cout_prestation(Tableau_cuisinier,Planning(semaine)(jour,j));
					new_line; put("La reservation sera effectuée par");
					put(nom_cook);
					put(prenom_cook);
					ajout:=true;
					exit;	
				end if;
			end loop;
			if ajout:=false then
				put("Notre equipe n'est pas en mesure d'assurer cette reservation et doit donc l'annuler")
			end if;
	End report_sur_novice;


end client;
