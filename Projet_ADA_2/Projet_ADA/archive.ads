with types,ada.Sequential_io;
use types;


Package archive is
	package P_Fichier_archive is new ada.Sequential_io(T_Prestation);
	use P_Fichier_archive;
	
	procedure Archivage (Prestation: IN T_Prestation); -- Archive la prestation -- Thomas
	
	procedure Lecture_client; -- recherche & affiche les prestations archivées d'un client -- Thomas
	
	procedure Lecture_cuisinier; -- recherche & affiche les prestations archivées d'un cuisinier + chiffre affaire total -- Thomas
	
	procedure Specialite_info; -- parcours les archives de chaque spécialité et affiche le nombre de prestation + le nombre de repas servis + la note moyenne -- Thomas
	
	procedure Menu_archive(option:out character); -- affiche le menu archive -- Thomas

end archive;
