with ada.text_io, ada.integer_text_io,ada.Float_Text_IO,types,ada.characters.handling;
use ada.text_io, ada.integer_text_io,ada.Float_Text_IO,types,ada.characters.handling;

Package body client is

Procedure saisie_prestation (Planning : IN OUT T_planning, Tableau_cuisinier: IN T_club) is

	prenom_client,nom_client,cook_prenom,cook_nom:nomination;
	nb_convives:positive;
	cook_specialite:T_specialite;
	jour:T_semaine
	semaine:integer range 1..2;
	k:integer;
	s:string(1..33);
	sjour:string(1..9);
	travaille:boolean:=false;
	compteurCook:integer:=0;
	choix:character;
	nb_repas_minimum:integer:=integer'last;
		
begin

---SAISIE--- ada.characters.handling --> to_upper to_lower

	put ("Saisir votre nom:");
	get_line(prenom_client,k);
	new_line;

	put ("Saisir votre prénom:");
	get_line(nom_client,k);
	new_line;

	put ("Saisir le nombre de convives:");
	get_line(nb_convives);
	new_line;

	put ("Saisir la spécialité que vous voulez (cuisine_francaise_traditionnelle, cuisine_vegetarienne, cuisine_asiatique, cuisine_du_maghreb, buffet)  :");
	get_line(s,k);
	To_Lower (s); -- Eviter des majuscules
	cook_specialite:=T_specialite'value(s(1..k));
			
	Put("Saisir la semaine visée (1 = semaine prochaine | 2 = dans deux semaines): ")
	get(semaine);skip_line;
	new_line;

	Put("Saisir le jour voulu (mardi, mercredi, jeudi, vendredi ou samedi): ");
	get_line(sjour,k);
	To_Lower (sjour); -- Eviter des majuscules
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
	travaille:=false;
	if Tableau_Cuisinier(k).specialite=cook_specialite then 	-- si le cuisinier est de la bonne spé
		for h in Planning'range loop
			if h=semaine then 				-- si la semaine est la bonne				
				for i in T_semaine'range loop 
					if i=jour then 			-- si le jour est le bon
						for j in 1..NbC loop	-- on parcourt les 8 cases à vérifier		
							if Tableau_Cuisinier(k).nom = Planning(h)(i,j).nom and Tableau_Cuisinier(k).prenom = 								Planning(h)(i,j).prenom and Planning(h)(i,j).existe then 
								travaille:=true;
--si cuisinier déjà présent pour une des cases, ce jour et cette semaine, alors travaille = 'true'
							end if;
						end loop;
						if travaille=false then
							compteurCook:=compteurCook+1;
							put ("Nom:");put(Tableau_Cuisinier(k).nom);new_line;
							put ("Prénom:");put(Tableau_Cuisinier(k).prenom);new_line;new_line;
						end if;
					end if;
				end loop;
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
		put("Voulez-vous choisir un des cuisiniers présentés spécifiquement?");new_line
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
			
	put("Nom:");get(cook_nom);
	put("Prénom:");get(cook_prenom);
			
	for i in Tableau_cuisinier'range loop
		if cook_nom=Tableau_cuisinier(i).nom and cook_prenom=Tableau_cuisinier(i).prenom and Tableau_cuisinier(i).existe and Tableau_cuisinier(i).specialite=cook_specialite then -- vérif qu'on est bien sur un vrai cuisinier + bonne orthographe + bonne spé

--Ajouter la vérification qu'on a pas choisi un vrai cuisinier de la même spé mais déjà occupé?
			
			for i in T_semaine'range loop 
				if i=jour then -- si le jour est le bon
					for j in 1..NbC loop	
						if Planning(h)(i,j).existe=false then
							Planning(h)(i,j).nom_client=nom_client;
							Planning(h)(i,j).prenom_client=prenom_client;
							Planning(h)(i,j).nb_convives=nb_convives;
							Planning(h)(i,j).specialite=cook_specialite
							--Planning(h)(i,j).jour --PAS SUR
							--Planning(h)(i,j).note --Non définie pour le moment lors de la création
							Planning(h)(i,j).nom_cuisinier=nom_cook
							Planning(h)(i,j).prenom_cuisinier=prenom_cook
							Planning(h)(i,j).existe:=true;
							new_line; put("Réservation ajoutée..");new_line;
							cout_prestation:=cout_prestation(Tableau_cuisinier,Planning(h)(i,j));
							-- Planning(h)(i,j) prestation de la semaine <h> au jour <i> et à l'emplacement <j>
							exit;	
						end if;
					end loop;
				end if;
			end loop;	
		end if;
	end loop;
			Put("Erreur dans l'écriture du cuisinier (nom et/ou prénom)");
			new_line;
	end loop;

		when '2' => -- Sélection du cuisinier de la spé ayant le moins fait de repas	
			for i in 1..NbC loop
				if Tableau_cuisinier(i).nb_repas < nb_repas_minimum and Tableau_cuisinier(i).specialite=cook_specialite then
					cook_nom=Tableau_cuisinier(i).nom;
					cook_prenom=Tableau_cuisinier(i).prenom;
					nb_repas_minimum=Tableau_cuisinier(i).nb_repas;
				end if;
			end loop;
			for i in T_semaine'range loop 
				if i=jour then -- si le jour est le bon
					for j in 1..NbC loop	
						if Planning(h)(i,j).existe=false then
							Planning(h)(i,j).nom_client=nom_client;
							Planning(h)(i,j).prenom_client=prenom_client;
							Planning(h)(i,j).nb_convives=nb_convives;
							Planning(h)(i,j).specialite=cook_specialite
							--Planning(h)(i,j).jour --PAS SUR
							--Planning(h)(i,j).note --Non définie pour le moment lors de la création
							Planning(h)(i,j).nom_cuisinier=nom_cook
							Planning(h)(i,j).prenom_cuisinier=prenom_cook
							Planning(h)(i,j).existe:=true;
							new_line; put("Réservation ajoutée..");new_line;
							cout_prestation:=cout_prestation(Tableau_cuisinier,Planning(h)(i,j));
							-- Planning(h)(i,j) prestation de la semaine <h> au jour <i> et à l'emplacement <j>
						exit;	
					end loop;
				end if;
			end loop;									 
	end case;

end saisie_prestation;					
		
		
		
		
		

end client;
