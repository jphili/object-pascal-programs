unit MNotiz1;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, MDialog1, MZettel1, ExtCtrls;

type
  TNotiz = class(TForm)
    BtNeuerZettel: TButton;
    BtZettelloeschen: TButton;
    BtAlleloeschen: TButton;
    BtZettelliste: TButton;
    BtEnde: TButton;
    LBoxZettelliste: TListBox;
    LbZettelliste: TLabel;
    Timer: TTimer;
    procedure BtEndeClick(Sender: TObject);
    procedure BtNeuerZettelClick(Sender: TObject);
    procedure BtAlleloeschenClick(Sender: TObject);
    procedure TimerTimer(Sender: TObject);
    procedure BtZettelloeschenClick(Sender: TObject);
    procedure BtZettellisteClick(Sender: TObject);
  private
    { Private-Deklarationen }
  public
    { Public-Deklarationen }
    nummer : Integer;
    procedure Zettelloeschen (nummer : Integer);
    
  end;

var
  Notiz: TNotiz;
  Dialog : TDialog1;
  Zettel : TZettel;

implementation

{$R *.DFM}





/// Programm beenden
procedure TNotiz.BtEndeClick(Sender: TObject);
begin
  Notiz.Close;
end;





/// Zettel löschen
procedure TNotiz.Zettelloeschen (nummer : Integer);
VAR s : String[255];
    i, n : Integer;
begin
  s := TZettel(Components[nummer]).Caption;
  TZettel(Components[nummer]).Free;
  n := -1;
  FOR i:= 0 TO LBoxZettelliste.Items.Count -1 DO
    IF s = LBoxZettelliste.Items[i] THEN
       n:= i;
  IF n <> -1 THEN
     LBoxZettelliste.Items.Delete(n);
  
end;





/// Neuen Notizzettel erstellen
procedure TNotiz.BtNeuerZettelClick(Sender: TObject);
VAR n, i : Integer;
    s : String[255];
begin
  Dialog := TDialog1.Create(Self);

   IF Dialog.ShowModal = mrOK THEN
      begin
         s := Dialog.Edname.Text;
         n := -1;

  FOR i:= 0 TO ComponentCount -1 DO
     IF Components[i] is TZettel THEN
        IF TZettel(Components[i]).Caption = s THEN
           n := i;
        IF n <> -1 THEN
  begin
    ShowMessage('Name schon vorhanden!');
  end
  else
  begin

          Zettel := TZettel.Create(Self);
          Zettel.Caption := Dialog.Edname.Text;
          LBoxZettelliste.Items.Add(Dialog.Edname.Text);
          Zettel.Show;
          BtZettelloeschen.Enabled := True;
          BtAlleloeschen.Enabled := True;
    end;
    end;
end;






/// Button "Alle Notizzettel löschen"
procedure TNotiz.BtAlleloeschenClick(Sender: TObject);
begin
  WHILE LBoxZettelliste.Items.Count > 0 DO
  begin
    LBoxZettelliste.ItemIndex := 0;
    BtZettelLoeschenClick(Self);
  end;
BtZettelloeschen.Enabled := False;
BtAlleloeschen.Enabled := False;
LBoxZettelliste.Items.Clear;
end;






/// der Timer
procedure TNotiz.TimerTimer(Sender: TObject);
begin
  Timer.Enabled:= False;
  Zettelloeschen(nummer);
end;






/// Notizzetteleintrag aus Zettelliste einzelnd löschen
procedure TNotiz.BtZettelloeschenClick(Sender: TObject);
VAR s : String[255];
    i, n : Integer;
begin
  IF LBoxZettelliste.ItemIndex > -1 THEN
     s := LBoxZettelliste.Items[LBoxZettelliste.ItemIndex];
  n := -1;
  FOR i:= 0 TO ComponentCount -1 DO
    IF Components[i] is TZettel THEN
      IF TZettel(Components[i]).Caption = s THEN
         n := i;
  IF n <> -1 THEN
  begin
    TZettel(Components[n]).Free;
    LBoxZettelliste.Items.Delete(LBoxZettelliste.ItemIndex);
  end;
end;






/// Zettelliste verbergen und anzeigen
procedure TNotiz.BtZettellisteClick(Sender: TObject);
begin
IF LBoxZettelliste.visible = True THEN
  begin LBoxZettelliste.visible := False;
        BtZettelliste.Caption := 'Zettelliste anzeigen';
        LbZettelliste.visible := False;
  end
  else

IF LBoxZettelliste.visible = False THEN
  begin LBoxZettelliste.visible := True;
        BtZettelliste.Caption := 'Zettelliste verbergen';
        LbZettelliste.visible := True;
  end;
end;

end.
