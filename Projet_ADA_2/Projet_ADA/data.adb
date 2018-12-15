with types;
use types;

Package Body data is
Procedure init(Tableau_cuisinier: IN OUT T_club; Planning : IN OUT T_planning) is

begin
-- -- TABLEAU DE CUISINIERS -- --

Tableau_cuisinier(1).nom:=('B','o','n','g','r','i','n',others=>' ');
Tableau_cuisinier(1).prenom:=('M','a','r','c',others=>' ');
Tableau_cuisinier(1).specialite:=cuisine_francaise_traditionnelle;
Tableau_cuisinier(1).existe:=true;

Tableau_cuisinier(2).nom:=('G','u','s','t','i','n','e',others=>' ');
Tableau_cuisinier(2).prenom:=('J','u','l','i','e',others=>' ');
Tableau_cuisinier(2).specialite:=cuisine_francaise_traditionnelle;
Tableau_cuisinier(2).existe:=true;

Tableau_cuisinier(3).nom:=('T','a','l','a','v','e','n','t',others=>' ');
Tableau_cuisinier(3).prenom:=('P','i','e','r','r','e',others=>' ');
Tableau_cuisinier(3).specialite:=cuisine_francaise_traditionnelle;
Tableau_cuisinier(3).existe:=true;

Tableau_cuisinier(4).nom:=('V','e','r','d','e',others=>' ');
Tableau_cuisinier(4).prenom:=('H','e','l','e','n','e',others=>' ');
Tableau_cuisinier(4).specialite:=cuisine_vegetarienne;
Tableau_cuisinier(4).existe:=true;

Tableau_cuisinier(5).nom:=('T','r','a','n',others=>' ');
Tableau_cuisinier(5).prenom:=('V','i','n','c','e','n','t',others=>' ');
Tableau_cuisinier(5).specialite:=cuisine_asiatique;
Tableau_cuisinier(5).existe:=true;

Tableau_cuisinier(6).nom:=('B','e','a','u','c','h','a','m','p',others=>' ');
Tableau_cuisinier(6).prenom:=('S','y','l','v','i','e',others=>' ');
Tableau_cuisinier(6).specialite:=buffet;
Tableau_cuisinier(6).existe:=true;

Tableau_cuisinier(7).nom:=('M','i','n','c','k',others=>' ');
Tableau_cuisinier(7).prenom:=('A','r','n','a','u','d',others=>' ');
Tableau_cuisinier(7).specialite:=buffet;
Tableau_cuisinier(7).existe:=true;


-- -- PRESTATIONS -- --

	-- MARC BONGRIN --

-- S0 --
Planning(0)(mercredi,1).nom_client:=('P','e','r','s','o','n','n','e',others=>' ');
Planning(0)(mercredi,1).prenom_client:=('P','a','u','l',others=>' ');
Planning(0)(mercredi,1).nb_convives:=8;
Planning(0)(mercredi,1).specialite:=cuisine_francaise_traditionnelle;
Planning(0)(mercredi,1).nom_cuisinier:=('B','o','n','g','r','i','n',others=>' ');
Planning(0)(mercredi,1).prenom_cuisinier:=('M','a','r','c',others=>' ');
Planning(0)(mercredi,1).cout_prestation:=350;
Planning(0)(mercredi,1).existe:=true;

Planning(0)(jeudi,1).nom_client:=('B','o','n','t','e','m','p','s',others=>' ');
Planning(0)(jeudi,1).prenom_client:=('A','n','a','e','l','l','e',others=>' ');
Planning(0)(jeudi,1).nb_convives:=12;
Planning(0)(jeudi,1).specialite:=cuisine_francaise_traditionnelle;
Planning(0)(jeudi,1).nom_cuisinier:=('B','o','n','g','r','i','n',others=>' ');
Planning(0)(jeudi,1).prenom_cuisinier:=('M','a','r','c',others=>' ');
Planning(0)(jeudi,1).cout_prestation:=510;
Planning(0)(jeudi,1).existe:=true;


-- S1 --
Planning(1)(mercredi,1).nom_client:=('G','o','u','r','m','a','n','d',others=>' ');
Planning(1)(mercredi,1).prenom_client:=('L','u','c','i','e','n',others=>' ');
Planning(1)(mercredi,1).nb_convives:=5;
Planning(1)(mercredi,1).specialite:=cuisine_francaise_traditionnelle;
Planning(1)(mercredi,1).nom_cuisinier:=('B','o','n','g','r','i','n',others=>' ');
Planning(1)(mercredi,1).prenom_cuisinier:=('M','a','r','c',others=>' ');
Planning(1)(mercredi,1).cout_prestation:=255;
Planning(1)(mercredi,1).existe:=true;


Planning(1)(vendredi,1).nom_client:=('P','e','r','s','o','n','n','e',others=>' ');
Planning(1)(vendredi,1).prenom_client:=('P','a','u','l',others=>' ');
Planning(1)(vendredi,1).nb_convives:=4;
Planning(1)(vendredi,1).specialite:=cuisine_francaise_traditionnelle;
Planning(1)(vendredi,1).nom_cuisinier:=('B','o','n','g','r','i','n',others=>' ');
Planning(1)(vendredi,1).prenom_cuisinier:=('M','a','r','c',others=>' ');
Planning(1)(vendredi,1).cout_prestation:=210;
Planning(1)(vendredi,1).existe:=true;


-- S2 --
Planning(2)(mercredi,1).nom_client:=('G','o','u','r','m','a','n','d',others=>' ');
Planning(2)(mercredi,1).prenom_client:=('L','u','c','i','e','n',others=>' ');
Planning(2)(mercredi,1).nb_convives:=5;
Planning(2)(mercredi,1).specialite:=cuisine_francaise_traditionnelle;
Planning(2)(mercredi,1).nom_cuisinier:=('B','o','n','g','r','i','n',others=>' ');
Planning(2)(mercredi,1).prenom_cuisinier:=('M','a','r','c',others=>' ');
Planning(2)(mercredi,1).cout_prestation:=255;
Planning(2)(mercredi,1).existe:=true;


Planning(2)(vendredi,1).nom_client:=('V','i','v','a','n','t',others=>' ');
Planning(2)(vendredi,1).prenom_client:=('J','u','l','i','e','n',others=>' ');
Planning(2)(vendredi,1).nb_convives:=12;
Planning(2)(vendredi,1).specialite:=cuisine_francaise_traditionnelle;
Planning(2)(vendredi,1).nom_cuisinier:=('B','o','n','g','r','i','n',others=>' ');
Planning(2)(vendredi,1).prenom_cuisinier:=('M','a','r','c',others=>' ');
Planning(2)(vendredi,1).cout_prestation:=510;
Planning(2)(vendredi,1).existe:=true;


	-- JULIE GUSTINE --

-- S0 --
Planning(0)(mercredi,2).nom_client:=('Q','u','e','e','n',others=>' ');
Planning(0)(mercredi,2).prenom_client:=('C','h','r','i','s','t','i','n','e',others=>' ');
Planning(0)(mercredi,2).nb_convives:=8;
Planning(0)(mercredi,2).specialite:=cuisine_francaise_traditionnelle;
Planning(0)(mercredi,2).nom_cuisinier:=('G','u','s','t','i','n','e',others=>' ');
Planning(0)(mercredi,2).prenom_cuisinier:=('J','u','l','i','e',others=>' ');
Planning(0)(mercredi,2).cout_prestation:=350;
Planning(0)(mercredi,2).existe:=true;


Planning(0)(jeudi,2).nom_client:=('B','o','n','p','a','i','n',others=>' ');
Planning(0)(jeudi,2).prenom_client:=('B','e','r','n','a','r','d',others=>' ');
Planning(0)(jeudi,2).nb_convives:=4;
Planning(0)(jeudi,2).specialite:=cuisine_francaise_traditionnelle;
Planning(0)(jeudi,2).nom_cuisinier:=('G','u','s','t','i','n','e',others=>' ');
Planning(0)(jeudi,2).prenom_cuisinier:=('J','u','l','i','e',others=>' ');
Planning(0)(jeudi,2).cout_prestation:=210;
Planning(0)(jeudi,2).existe:=true;


Planning(0)(vendredi,2).nom_client:=('P','i','e','r','r','e',others=>' ');
Planning(0)(vendredi,2).prenom_client:=('P','a','u','l',others=>' ');
Planning(0)(vendredi,2).nb_convives:=3;
Planning(0)(vendredi,2).specialite:=cuisine_francaise_traditionnelle;
Planning(0)(vendredi,2).nom_cuisinier:=('G','u','s','t','i','n','e',others=>' ');
Planning(0)(vendredi,2).prenom_cuisinier:=('J','u','l','i','e',others=>' ');
Planning(0)(vendredi,2).cout_prestation:=165;
Planning(0)(vendredi,2).existe:=true;


-- S1 --
Planning(1)(vendredi,2).nom_client:=('Q','u','e','e','n',others=>' ');
Planning(1)(vendredi,2).prenom_client:=('C','h','r','i','s','t','i','n','e',others=>' ');
Planning(1)(vendredi,2).nb_convives:=4;
Planning(1)(vendredi,2).specialite:=cuisine_francaise_traditionnelle;
Planning(1)(vendredi,2).nom_cuisinier:=('G','u','s','t','i','n','e',others=>' ');
Planning(1)(vendredi,2).prenom_cuisinier:=('J','u','l','i','e',others=>' ');
Planning(1)(vendredi,2).cout_prestation:=210;
Planning(1)(vendredi,2).existe:=true;


-- S2 --
Planning(2)(mercredi,2).nom_client:=('J','e','f','a','i','n',others=>' ');
Planning(2)(mercredi,2).prenom_client:=('H','u','g','o',others=>' ');
Planning(2)(mercredi,2).nb_convives:=3;
Planning(2)(mercredi,2).specialite:=cuisine_francaise_traditionnelle;
Planning(2)(mercredi,2).nom_cuisinier:=('G','u','s','t','i','n','e',others=>' ');
Planning(2)(mercredi,2).prenom_cuisinier:=('J','u','l','i','e',others=>' ');
Planning(2)(mercredi,2).cout_prestation:=165;
Planning(2)(mercredi,2).existe:=true;


	-- PIERRE TALAVENT --
	
	-- Vide --

	-- HELENE VERDE --

-- S0 --
Planning(0)(jeudi,4).nom_client:=('V','e','r','d','u','r','e','t','t','e',others=>' ');
Planning(0)(jeudi,4).prenom_client:=('L','u','c','e','t','t','e',others=>' ');
Planning(0)(jeudi,4).nb_convives:=4;
Planning(0)(jeudi,4).specialite:=cuisine_vegetarienne;
Planning(0)(jeudi,4).nom_cuisinier:=('V','e','r','d','e',others=>' ');
Planning(0)(jeudi,4).prenom_cuisinier:=('H','e','l','e','n','e',others=>' ');
Planning(0)(jeudi,4).cout_prestation:=210;
Planning(0)(jeudi,4).existe:=true;


Planning(0)(vendredi,4).nom_client:=('F','r','u','c','t','i','s',others=>' ');
Planning(0)(vendredi,4).prenom_client:=('R','o','b','e','r','t',others=>' ');
Planning(0)(vendredi,4).nb_convives:=7;
Planning(0)(vendredi,4).specialite:=cuisine_vegetarienne;
Planning(0)(vendredi,4).nom_cuisinier:=('V','e','r','d','e',others=>' ');
Planning(0)(vendredi,4).prenom_cuisinier:=('H','e','l','e','n','e',others=>' ');
Planning(0)(vendredi,4).cout_prestation:=310;
Planning(0)(vendredi,4).existe:=true;


Planning(0)(samedi,4).nom_client:=('N','o','c','a','r','n','e',others=>' ');
Planning(0)(samedi,4).prenom_client:=('R','a','y','m','o','n','d',others=>' ');
Planning(0)(samedi,4).nb_convives:=5;
Planning(0)(samedi,4).specialite:=cuisine_vegetarienne;
Planning(0)(samedi,4).nom_cuisinier:=('V','e','r','d','e',others=>' ');
Planning(0)(samedi,4).prenom_cuisinier:=('H','e','l','e','n','e',others=>' ');
Planning(0)(samedi,4).cout_prestation:=255;
Planning(0)(samedi,4).existe:=true;


-- S1 --
Planning(1)(jeudi,4).nom_client:=('V','e','r','d','u','r','e','t','t','e',others=>' ');
Planning(1)(jeudi,4).prenom_client:=('L','u','c','e','t','t','e',others=>' ');
Planning(1)(jeudi,4).nb_convives:=2;
Planning(1)(jeudi,4).specialite:=cuisine_vegetarienne;
Planning(1)(jeudi,4).nom_cuisinier:=('V','e','r','d','e',others=>' ');
Planning(1)(jeudi,4).prenom_cuisinier:=('H','e','l','e','n','e',others=>' ');
Planning(1)(jeudi,4).cout_prestation:=120;
Planning(1)(jeudi,4).existe:=true;


Planning(1)(samedi,4).nom_client:=('P','a','q','u','e','r','e','t','t','e',others=>' ');
Planning(1)(samedi,4).prenom_client:=('C','l','o','t','i','l','d','e',others=>' ');
Planning(1)(samedi,4).nb_convives:=4;
Planning(1)(samedi,4).specialite:=cuisine_vegetarienne;
Planning(1)(samedi,4).nom_cuisinier:=('V','e','r','d','e',others=>' ');
Planning(1)(samedi,4).prenom_cuisinier:=('H','e','l','e','n','e',others=>' ');
Planning(1)(samedi,4).cout_prestation:=210;
Planning(1)(samedi,4).existe:=true;


-- S2 --
Planning(2)(jeudi,4).nom_client:=('V','e','r','d','u','r','e','t','t','e',others=>' ');
Planning(2)(jeudi,4).prenom_client:=('L','u','c','e','t','t','e',others=>' ');
Planning(2)(jeudi,4).nb_convives:=5;
Planning(2)(jeudi,4).specialite:=cuisine_vegetarienne;
Planning(2)(jeudi,4).nom_cuisinier:=('V','e','r','d','e',others=>' ');
Planning(2)(jeudi,4).prenom_cuisinier:=('H','e','l','e','n','e',others=>' ');
Planning(2)(jeudi,4).cout_prestation:=255;
Planning(2)(jeudi,4).existe:=true;


Planning(2)(samedi,4).nom_client:=('R','u','p','e','s','t','r','e',others=>' ');
Planning(2)(samedi,4).prenom_client:=('S','y','l','v','e','t','t','e',others=>' ');
Planning(2)(samedi,4).nb_convives:=14;
Planning(2)(samedi,4).specialite:=cuisine_vegetarienne;
Planning(2)(samedi,4).nom_cuisinier:=('V','e','r','d','e',others=>' ');
Planning(2)(samedi,4).prenom_cuisinier:=('H','e','l','e','n','e',others=>' ');
Planning(2)(samedi,4).cout_prestation:=520;
Planning(2)(samedi,4).existe:=true;


	-- VINCENT TRAN --

-- S1 --
Planning(1)(jeudi,5).nom_client:=('P','e','r','s','o','n','n','e',others=>' ');
Planning(1)(jeudi,5).prenom_client:=('P','a','u','l',others=>' ');
Planning(1)(jeudi,5).nb_convives:=4;
Planning(1)(jeudi,5).specialite:=cuisine_asiatique;
Planning(1)(jeudi,5).nom_cuisinier:=('T','r','a','n',others=>' ');
Planning(1)(jeudi,5).prenom_cuisinier:=('V','i','n','c','e','n','t',others=>' ');
Planning(1)(jeudi,5).cout_prestation:=210;
Planning(1)(jeudi,5).existe:=true;


Planning(1)(samedi,5).nom_client:=('R','u','p','e','s','t','r','e',others=>' ');
Planning(1)(samedi,5).prenom_client:=('S','y','l','v','e','t','t','e',others=>' ');
Planning(1)(samedi,5).nb_convives:=12;
Planning(1)(samedi,5).specialite:=cuisine_asiatique;
Planning(1)(samedi,5).nom_cuisinier:=('T','r','a','n',others=>' ');
Planning(1)(samedi,5).prenom_cuisinier:=('V','i','n','c','e','n','t',others=>' ');
Planning(1)(samedi,5).cout_prestation:=450;
Planning(1)(samedi,5).existe:=true;


-- S2 --
Planning(2)(jeudi,5).nom_client:=('V','i','v','a','n','t',others=>' ');
Planning(2)(jeudi,5).prenom_client:=('J','u','l','i','e','n',others=>' ');
Planning(2)(jeudi,5).nb_convives:=4;
Planning(2)(jeudi,5).specialite:=cuisine_asiatique;
Planning(2)(jeudi,5).nom_cuisinier:=('T','r','a','n',others=>' ');
Planning(2)(jeudi,5).prenom_cuisinier:=('V','i','n','c','e','n','t',others=>' ');
Planning(2)(jeudi,5).cout_prestation:=210;
Planning(2)(jeudi,5).existe:=true;


Planning(2)(vendredi,5).nom_client:=('R','u','p','e','s','t','r','e',others=>' ');
Planning(2)(vendredi,5).prenom_client:=('S','y','l','v','e','t','t','e',others=>' ');
Planning(2)(vendredi,5).nb_convives:=14;
Planning(2)(vendredi,5).specialite:=cuisine_asiatique;
Planning(2)(vendredi,5).nom_cuisinier:=('T','r','a','n',others=>' ');
Planning(2)(vendredi,5).prenom_cuisinier:=('V','i','n','c','e','n','t',others=>' ');
Planning(2)(vendredi,5).cout_prestation:=520;
Planning(2)(vendredi,5).existe:=true;


Planning(2)(samedi,5).nom_client:=('C','h','i','n','e',others=>' ');
Planning(2)(samedi,5).prenom_client:=('A','l','a','i','n',others=>' ');
Planning(2)(samedi,5).nb_convives:=7;
Planning(2)(samedi,5).specialite:=cuisine_asiatique;
Planning(2)(samedi,5).nom_cuisinier:=('T','r','a','n',others=>' ');
Planning(2)(samedi,5).prenom_cuisinier:=('V','i','n','c','e','n','t',others=>' ');
Planning(2)(samedi,5).cout_prestation:=310;
Planning(2)(samedi,5).existe:=true;


	-- SYLVIE BEAUCHAMP --

-- S0 --
Planning(0)(mercredi,6).nom_client:=('J','e','f','a','i','n',others=>' ');
Planning(0)(mercredi,6).prenom_client:=('H','u','g','o',others=>' ');
Planning(0)(mercredi,6).nb_convives:=30;
Planning(0)(mercredi,6).specialite:=buffet;
Planning(0)(mercredi,6).nom_cuisinier:=('B','e','a','u','c','h','a','m','p',others=>' ');
Planning(0)(mercredi,6).prenom_cuisinier:=('S','y','l','v','i','e',others=>' ');
Planning(0)(mercredi,6).cout_prestation:=1020;
Planning(0)(mercredi,6).existe:=true;

Planning(0)(vendredi,6).nom_client:=('L','e','g','r','o','u','p','e',others=>' ');
Planning(0)(vendredi,6).prenom_client:=('J','u','s','t','i','n','e',others=>' ');
Planning(0)(vendredi,6).nb_convives:=10;
Planning(0)(vendredi,6).specialite:=buffet;
Planning(0)(vendredi,6).nom_cuisinier:=('B','e','a','u','c','h','a','m','p',others=>' ');
Planning(0)(vendredi,6).prenom_cuisinier:=('S','y','l','v','i','e',others=>' ');
Planning(0)(vendredi,6).cout_prestation:=430;
Planning(0)(vendredi,6).existe:=true;


Planning(0)(samedi,6).nom_client:=('Q','u','e','e','n',others=>' ');
Planning(0)(samedi,6).prenom_client:=('C','h','r','i','s','t','i','n','e',others=>' ');
Planning(0)(samedi,6).nb_convives:=18;
Planning(0)(samedi,6).specialite:=buffet;
Planning(0)(samedi,6).nom_cuisinier:=('B','e','a','u','c','h','a','m','p',others=>' ');
Planning(0)(samedi,6).prenom_cuisinier:=('S','y','l','v','i','e',others=>' ');
Planning(0)(samedi,6).cout_prestation:=660;
Planning(0)(samedi,6).existe:=true;


-- S1 --
Planning(1)(samedi,6).nom_client:=('P','o','m','p','e','t','t','e',others=>' ');
Planning(1)(samedi,6).prenom_client:=('J','u','l','i','e','t','t','e',others=>' ');
Planning(1)(samedi,6).nb_convives:=14;
Planning(1)(samedi,6).specialite:=buffet;
Planning(1)(samedi,6).nom_cuisinier:=('B','e','a','u','c','h','a','m','p',others=>' ');
Planning(1)(samedi,6).prenom_cuisinier:=('S','y','l','v','i','e',others=>' ');
Planning(1)(samedi,6).cout_prestation:=520;
Planning(1)(samedi,6).existe:=true;


-- S2 --
Planning(2)(mardi,6).nom_client:=('V','e','r','d','u','r','e','t','t','e',others=>' ');
Planning(2)(mardi,6).prenom_client:=('L','u','c','e','t','t','e',others=>' ');
Planning(2)(mardi,6).nb_convives:=14;
Planning(2)(mardi,6).specialite:=buffet;
Planning(2)(mardi,6).nom_cuisinier:=('B','e','a','u','c','h','a','m','p',others=>' ');
Planning(2)(mardi,6).prenom_cuisinier:=('S','y','l','v','i','e',others=>' ');
Planning(2)(mardi,6).cout_prestation:=520;
Planning(2)(mardi,6).existe:=true;


Planning(2)(jeudi,6).nom_client:=('P','i','e','r','r','e',others=>' ');
Planning(2)(jeudi,6).prenom_client:=('P','a','u','l',others=>' ');
Planning(2)(jeudi,6).nb_convives:=24;
Planning(2)(jeudi,6).specialite:=buffet;
Planning(2)(jeudi,6).nom_cuisinier:=('B','e','a','u','c','h','a','m','p',others=>' ');
Planning(2)(jeudi,6).prenom_cuisinier:=('S','y','l','v','i','e',others=>' ');
Planning(2)(jeudi,6).cout_prestation:=870;
Planning(2)(jeudi,6).existe:=true;


Planning(2)(samedi,6).nom_client:=('B','o','n','t','e','m','p','s',others=>' ');
Planning(2)(samedi,6).prenom_client:=('A','n','a','e','l','l','e',others=>' ');
Planning(2)(samedi,6).nb_convives:=47;
Planning(2)(samedi,6).specialite:=buffet;
Planning(2)(samedi,6).nom_cuisinier:=('B','e','a','u','c','h','a','m','p',others=>' ');
Planning(2)(samedi,6).prenom_cuisinier:=('S','y','l','v','i','e',others=>' ');
Planning(2)(samedi,6).cout_prestation:=1581;
Planning(2)(samedi,6).existe:=true;


	-- ARNAUD MINCK --

-- S1 --
Planning(1)(samedi,7).nom_client:=('F','e','s','t','i','f',others=>' ');
Planning(1)(samedi,7).prenom_client:=('V','i','n','c','e','n','t',others=>' ');
Planning(1)(samedi,7).nb_convives:=30;
Planning(1)(samedi,7).specialite:=buffet;
Planning(1)(samedi,7).nom_cuisinier:=('M','i','n','c','k',others=>' ');
Planning(1)(samedi,7).prenom_cuisinier:=('A','r','n','a','u','d',others=>' ');
Planning(1)(samedi,7).cout_prestation:=1020;
Planning(1)(samedi,7).existe:=true;


	end init;
end data;




