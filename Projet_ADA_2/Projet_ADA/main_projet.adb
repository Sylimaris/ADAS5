with ada.text_io, ada.integer_text_io,ada.Float_Text_IO,ada.characters.handling,types,cuisinier;--,cuisinier,client,archive;  A MODIFIER POUR TEST
use ada.text_io, ada.integer_text_io,ada.Float_Text_IO,ada.characters.handling,types,cuisinier;--,cuisinier,client,archive;   A MODIFIER POUR TEST

Procedure main_projet is

	Tableau_Cuisinier:T_club;
	--Registre:T_demande;
	--Jour:T_semaine;
	--Prestation: T_prestation;
	
	option:character; -- pour menu

begin
	loop
		Menu(option);
		case option is
			when '1' =>	recrutement(Tableau_Cuisinier);

			when '2' =>affichage_club(Tableau_cuisinier);
			
			when '3' =>exit;

			when others => put ("OULALA IMPOSSIBLE -> problème dans procédure MENU");
		end case;
	end loop;
end main_projet;
