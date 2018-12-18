with ada.text_io,ada.integer_text_io,ada.float_text_io,types,cuisinier,ada.Sequential_io;
use ada.text_io, ada.integer_text_io,ada.float_text_io,types,cuisinier;

Package body archive is
   
	use P_Fichier_archive;

procedure Archivage (Prestation: IN T_Prestation) is
	
	use P_Fichier_archive;
	File:P_Fichier_archive.file_type;

	begin
		begin
		open(File,append_file,"Archive.txt"); 
		exception
			when others=>create(File,name=>"Archive.sortie");
		end;
	if Prestation.existe then
		Write(File,Prestation);
	end if;
	close(File);
end Archivage;






procedure Lecture_client is
	Prestation : T_prestation;
	File:P_Fichier_archive.file_type;
	nom_client,prenom_client:nomination:=('*',others =>' ');
	compteur:integer:=0;

begin
	begin
		open(File,in_file,"Archive.txt");
	end;

new_line;
Put("Nom et prénom du client à chercher:");
new_line;
saisie_cook(prenom_client,nom_client);

while not End_Of_File(File) loop
	Read(File,Prestation);
		if Prestation.nom_client=nom_client and Prestation.prenom_client=prenom_client then
			compteur:=compteur+1;
			put("Prestation ");put(compteur);new_line;
			put("Nombre de convives: ");put(Prestation.nb_convives,width=>0); new_line;
			put("Spécialité: ");put(T_specialite'image(Prestation.specialite)); new_line;
			put("Nom cuisinier: ");put(Prestation.nom_cuisinier); new_line;
			put("Prénom cuisinier: ");put(Prestation.prenom_cuisinier); new_line;
			put("Coût: ");put(Prestation.cout_prestation,width=>0); new_line;
			put("Note attribuée: ");put(Prestation.note,aft=>0,exp=>0);new_line;new_line;
		end if;
end loop;
close(File);
if compteur=0 then
new_line;
put("Client non trouvé : CAUSES POSSIBLES -> Faute orthographe / Faute majuscule-minuscule / Client pas encore archivé");
new_line;
end if;

end Lecture_client;








procedure Lecture_cuisinier is
	Prestation : T_prestation;
	File:P_Fichier_archive.file_type;
	nom_cuisinier,prenom_cuisinier:nomination:=('*',others =>' ');
	compteur:integer:=0;
	total:integer:=0;

begin
	begin
		open(File,in_file,"Archive.txt");
	end;

new_line;
Put("Nom et prénom du cuisinier à chercher:");
new_line;
saisie_cook(prenom_cuisinier,nom_cuisinier);

while not End_Of_File(File) loop
	Read(File,Prestation);
		if Prestation.nom_cuisinier=nom_cuisinier and Prestation.prenom_cuisinier=prenom_cuisinier then
			compteur:=compteur+1;			
			total:=total+Prestation.cout_prestation;
			put("Prestation ");put(compteur);new_line;
			put("Nombre de convives: ");put(Prestation.nb_convives,width=>0); new_line;
			put("Spécialité: ");put(T_specialite'image(Prestation.specialite)); new_line;
			put("Nom cuisinier: ");put(Prestation.nom_cuisinier); new_line;
			put("Prénom cuisinier: ");put(Prestation.prenom_cuisinier); new_line;
			put("Coût: ");put(Prestation.cout_prestation,width=>0); new_line;
			put("Note attribuée: ");put(Prestation.note,aft=>0,exp=>0);new_line;new_line;
		end if;
end loop;
close(File);
if compteur=0 then
	new_line;
	put("Cuisinier non trouvé : CAUSES POSSIBLES -> Faute orthographe / Faute majuscule-minuscule / Client pas encore archivé");
	new_line;
else
	put("Total encaissé par ce cuisinier sur l'ensemble de ses prestations effectuées: ");
	put(total,width=>0);
	new_line;
end if;

end Lecture_cuisinier;





procedure Specialite_info is
	Prestation : T_prestation;
	File:P_Fichier_archive.file_type;
	specialite : T_specialite;
	compteur:integer:=0;
	total_note:float:=0.0;
	nb_repas:integer:=0;
	note_moyenne:float:=0.0;


begin

for i in cuisine_francaise_traditionnelle..buffet loop
specialite:=i;
compteur:=0;
nb_repas:=0;
note_moyenne:=0.0;
total_note:=0.0;
	begin
		open(File,in_file,"Archive.txt");
	end;

	while not End_Of_File(File) loop
		Read(File,Prestation);
		if Prestation.specialite=specialite then
			compteur:=compteur+1;
			nb_repas:=nb_repas+Prestation.nb_convives;
			total_note:=total_note+Prestation.note;
		end if;
	end loop;
	close(File);

	new_line;
	put("------- ");
	Put("Spécialite :");Put(T_specialite'image(specialite));
	new_line;
	new_line;

	put("Nombre de prestations réalisées: ");
	put(compteur,width=>0);
	new_line;

	put("Nombre total de repas servis: ");
	put(nb_repas,width=>0);
	new_line;

	put("Note moyenne: ");
	note_moyenne:=total_note/float(compteur);
	put(note_moyenne,aft=>0,exp=>0);
	new_line;
	new_line;
end loop;

end Specialite_info;

Procedure Menu_archive(option:out character) is
begin
	loop
		new_line;
		put_line("    ╦  ┌─┐┌─┐┌┬┐┬ ┬┬─┐┌─┐  ┌┬┐┌─┐  ┌─┐┬┌─┐┬ ┬┬┌─┐┬─┐");
		put_line("    ║  ├┤ │   │ │ │├┬┘├┤    ││├┤   ├┤ ││  ├─┤│├┤ ├┬┘");
		put_line("    ╩═╝└─┘└─┘ ┴ └─┘┴└─└─┘  ─┴┘└─┘  └  ┴└─┘┴ ┴┴└─┘┴└─");
		new_line;
		Put_line("1 => Anciennes prestations d'un client précis");
		Put_line("2 => Anciennes prestations pour un cuisinier précis");
		Put_line("3 => Informations pour chaques spécialités");
		Put_line("4 => Sortir du sous-menu lecture de fichier");
		Put(" Choix :");
		get(option);skip_line;
		exit when option='1' or option='2' or option='3' or option='4';
		put("Erreur saisie");
	end loop;
end menu_archive;


end archive;





