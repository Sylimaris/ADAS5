with ada.text_io, ada.integer_text_io,ada.Float_Text_IO,ada.characters.handling,types,cuisinier,client,data;	--,archive;  A MODIFIER POUR TEST
use ada.text_io, ada.integer_text_io,ada.Float_Text_IO,ada.characters.handling,types,cuisinier,client,data;	--,archive;   A MODIFIER POUR TEST

Procedure main_projet is

	Tableau_Cuisinier:T_club; -- Tableau de nos cuisiniers -- 
	Planning:T_planning; -- planning de nos prestations
	option:character; -- pour menu --
	date_du_jour:T_semaine:=mardi; -- on commence un mardi --

Procedure Menu(option:out character) is
	begin
		loop
			new_line;
			put_line("     _ __ ___   ___ _ __  _   _ ");
			put_line("    | '_ ` _ \ / _ \ '_ \| | | |");
			put_line("    | | | | | |  __/ | | | |_| |");
			put_line("    |_| |_| |_|\___|_| |_|\__,_|");		
			new_line;
			Put_Line("Pour l'instant vous pouvez:");
			new_line;
			Put_line("0 => Initialisation selon les users stories /!\ dangereux remet tout au départ");
			new_line;
			Put_line("1 => Enregistrer un cuisinier");
			Put_line("2 => Visualiser club");
			Put_line("3 => Entrer prestation");
			Put_line("4 => Visualiser Planning");
			Put_line("5 => Supprimer un cuisinier");
			Put_line("6 => Passer au jour suivant");
			Put_line("7 => Supprimer une prestation");
 			Put_line("8 => Exit");
			Put(" Choix :");
			get(option);skip_line;
			exit when option='0' or option='1' or option='2' or option='3' or option='4' or option='5' or option='6'or option='7' or option='8';
			put("Erreur saisie");
		end loop;
end Menu;

begin
	loop
		Menu(option);
		case option is
			when '0' =>init(Tableau_Cuisinier,Planning);			

			when '1' =>recrutement(Tableau_Cuisinier);

			when '2' =>affichage_club(Tableau_cuisinier);
			
			when '3' =>saisie_prestation(Planning,Tableau_Cuisinier);

			when '4' =>affichage_planning(Planning);

			when '5' =>depart(Tableau_Cuisinier,Planning);			
			
			when '6' =>passage_au_lendemain(date_du_jour,Tableau_cuisinier,Planning);
			
			when '7' =>annulation (Planning);

			when '8' =>exit;

			when others => put ("C'EST IMPOSSIBLE -> problème dans procédure MENU");
		end case;
	end loop;
end main_projet;
