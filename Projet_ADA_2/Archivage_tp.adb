with ada.text_io, ada.integer_text_io,ada.Float_Text_IO,ada.characters.handling,ada.Sequential_io;
use ada.text_io, ada.integer_text_io,ada.Float_Text_IO,ada.characters.handling;

Package body Gestion_chaine is

-- Manque des procédures ici -- 

  procedure EnregistrementSeq(ch:IN ch120) is
  A,T,C,G:integer;
  Memo:T_ADN;

  package P_Fichier_T_ADN is new ada.Sequential_io(T_ADN);
  use P_Fichier_T_ADN;
  File:P_fichier_T_ADN.file_type;

  begin
    begin
    open(File,append_file,"TestSortie.txt");
    exception
      when others=>create(File,name=>"TestSortie.txt");
    end;

  Analyse(ch,A,T,C,G);
  Memo.ch:=ch;
  Memo.A:=A;
  Memo.T:=T;
  Memo.C:=C;
  Memo.G:=G;

  write(File,Memo);
  close(File);

  end EnregistrementSeq;
  
end Gestion_chaine;
