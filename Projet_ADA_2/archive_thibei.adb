With Ada.Text_IO, ada.integer_text_io, ada.float_text_io,projet,ada.Sequential_io;
use Ada.Text_Io, Ada.Integer_Text_Io, Ada.Float_Text_Io,projet;

Package body archive is
   use Fichier_T_Prestation;
procedure Archiveprestation(Planning : in T_Planning; semaine:in Integer; Jour : in T_Jour; Nump : in Integer) is
   
  Prestation:T_Prestation;
  use Fichier_T_Prestation;
  File:Fichier_T_Prestation.file_type;

begin
   begin
    open(File,append_file,"Prestation.txt");
    exception
       when others=>Create(File,Name=>"Prestation.txt");
      end; 
      Prestation:=Planning(Semaine)(Jour)(Nump);
    if Planning(semaine)(Jour)(Nump).Nbconvive>0 then
      Write(File,Prestation);
    end if;
    close(File);

 
 end Archiveprestation;
---------------------------------------------------
procedure LectureArchivePrestaton is
   Prestation:T_Prestation;
   File:Fichier_T_Prestation.file_type;
   spe:T_specialite;
   begin
begin
    open(File,in_file,"Prestation.txt");
   end;
   while not End_Of_File(File) loop
      Read(File,Prestation);
   Put(Prestation.Nomcuisinier);
   Put(Prestation.Prenomcuisinier);
   
   Put(T_specialite'IMAGE(Prestation.SpeDemander));Put(" commender par ");
   Put(Prestation.NomP);
   Put(Prestation.Prenomp);New_line;
   end loop;
   close(File);
end LectureArchivePrestaton ;
--------------------------------------------------------
procedure Prestationcuisinier is
   Nomc,Prenomc,S:String(1..20):=(others=>' ');
   k,argent:integer:=20;
   Prestation:T_Prestation;
   File:Fichier_T_Prestation.file_type;
   check:boolean:=False;
   begin
   begin
      Put("Nom cuisinier ");Get_Line(S,K);Nomc:=S;New_line;
      Put("Prenom Cuisinier ");Get_Line(S,K);PrenomC:=S;New_line;   
      open(File,in_file,"Prestation.txt");
   end;
   argent:=0;
   while not End_Of_File(File) loop
      Read(File,Prestation);
      if Prestation.nomCuisinier=Nomc then
         Put(Prestation.NomCuisinier);
         Put(Prestation.PrenomCuisinier);
         Put(T_specialite'IMAGE(Prestation.SpeDemander));Put(" commender par ");
         Put(Prestation.NomP);
         Put(Prestation.Prenomp);New_line;
         argent:=argent+Prestation.cout;
         Check:=True;
      end if;
   end loop;
   if Check=False then
      Put("Cuisinier non trouvee");New_Line;
   else 
      Put("Le montant totale encaisses est :");put(argent);New_line;
   end if;
Close(File);

end Prestationcuisinier ;
---------------------------------------------------
procedure Statdesspecialite is
   --S:String(1..28):=(others=>' ');
   k,argent:integer:=28;
   Prestation:T_Prestation;
   File:Fichier_T_Prestation.file_type;
   --Spe:T_Specialite;
   Spetable:T_Tabl_Specialite:=(others=>0);
   ArgenSpe:T_Tabl_Specialite:=(others=>0);
   begin
begin
    open(File,in_file,"Prestation.txt");
end;

--   Put("Quelle est sa specialite ? : ");Get_Line(S,k);New_Line;
--   Spe:=T_Specialite'Value(S(1..K));


   while not End_Of_File(File) loop
      Read(File,Prestation);
      Spetable(Prestation.Spedemander):=1+Spetable(Prestation.Spedemander);
      --ArgenSpe(Prestation.Cout):=1+Spetable(Prestation.Cout);
   end loop;

   for I in Spetable'range loop
   Put(Spetable(I));New_Line;
   --Put(ArgenSpe(I));New_Line;
    end loop;   

   close(File);
end StatDesSpecialite;



end archive;

