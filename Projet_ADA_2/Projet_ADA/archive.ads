with types,ada.Sequential_io;
use types;


Package archive is
	package P_Fichier_archive is new ada.Sequential_io(T_Prestation);
	use P_Fichier_archive;
	procedure Archivage (Prestation: IN T_Prestation);
	procedure Lecture_client;
	procedure Lecture_cuisinier;
	procedure Specialite_info;
	procedure Menu_archive(option:out character);

end archive;
