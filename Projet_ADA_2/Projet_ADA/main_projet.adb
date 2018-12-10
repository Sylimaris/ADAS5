with ada.text_io, ada.integer_text_io,ada.Float_Text_IO,ada.characters.handling,types,cuisinier;--,cuisinier,client,archive;  A MODIFIER POUR TEST
use ada.text_io, ada.integer_text_io,ada.Float_Text_IO,ada.characters.handling,types,cuisinier;--,cuisinier,client,archive;   A MODIFIER POUR TEST

Procedure main_projet is

	Tableau_Cuisinier:T_club;
	--Registre:T_demande;
	--Jour:T_semaine;
	--Prestation: T_prestation;
	
	option:character;

begin

	loop
		new_line;
		Put_Line("Menu - Pour l'instant vous pouvez:");
		Put_line("1 => Enregistrer un cuisinier");
		Put_line("2 => Visualiser club");
		Put_line("3 => Rien");
		Put_line("4 => Rien");
		Put_line("5 => Rien");
		Put(" Choix :");
		get(option);skip_line;
		exit when option='1' or option='2' or option='3' or option='4' or option='5';
		put("Erreur saisie");
	end loop;
	loop
		case option is
			when '1' =>recrutement(Tableau_Cuisinier);

			when '2' =>affichage_club(Tableau_cuisinier);
	
			when '3' =>exit;
	
			when '4' =>exit;

			when '5' => exit;

			when others => put ("OULALA IMPOSSIBLE -> problème dans procédure MENU");
		end case;
	end loop;

end main_projet;
