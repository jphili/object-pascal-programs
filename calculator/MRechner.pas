unit MRechner;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls;

type
  TFTaschenrechner = class(TForm)
    Edit: TEdit;
    Bt7: TButton;
    Bt8: TButton;
    Bt9: TButton;
    Bt4: TButton;
    Bt5: TButton;
    Bt6: TButton;
    Bt1: TButton;
    Bt2: TButton;
    Bt3: TButton;
    Bt0: TButton;
    BtKomma: TButton;
    BtVorzeichen: TButton;
    BtGleich: TButton;
    BtPlus: TButton;
    BtMinus: TButton;
    BtMal: TButton;
    BtDurch: TButton;
    BtAnzeigeLoeschen: TButton;
    BtAllesLoeschen: TButton;
    BtKehrwert: TButton;
    procedure FormCreate(Sender: TObject);
    procedure BtKommaClick(Sender: TObject);
    procedure BtAllesLoeschenClick(Sender: TObject);
    procedure BtAnzeigeLoeschenClick(Sender: TObject);
    procedure Bt0Click(Sender: TObject);
    procedure BtPlusClick(Sender: TObject);
    procedure BtMinusClick(Sender: TObject);
    procedure BtMalClick(Sender: TObject);
    procedure BtDurchClick(Sender: TObject);
    procedure BtGleichClick(Sender: TObject);
    procedure BtVorzeichenClick(Sender: TObject);
    procedure BtKehrwertClick(Sender: TObject);


  private
    { Private-Deklarationen }
  public
    { Public-Deklarationen }
  end;

var
  FTaschenrechner: TFTaschenrechner;
  zahl1, zahl2, ergebnis, x: Extended;
  operator: Char;
  KommaGesetzt, DisplayLeeren: Boolean;

implementation

{$R *.DFM}



// FormCreate

procedure TFTaschenrechner.FormCreate(Sender: TObject);
 begin
  KommaGesetzt := false;
  operator := 'ü';
  DisplayLeeren := true;
 end;




// Kommasetzung

procedure TFTaschenrechner.BtKommaClick(Sender: TObject);
 begin
   if KommaGesetzt = false then
     begin Edit.Text := Edit.Text + ',';
         KommaGesetzt := true;
     end;
 end;




// Button Alles Löschen

procedure TFTaschenrechner.BtAllesLoeschenClick(Sender: TObject);
 begin
  KommaGesetzt := false;
  Edit.Clear ;
  operator := 'ü';

 end;




// Button Anzeige Löschen

procedure TFTaschenrechner.BtAnzeigeLoeschenClick(Sender: TObject);
 begin
  KommaGesetzt := false;
  Edit.Clear;
  DisplayLeeren := true;
 end;




// Eingabe der mit zu rechnenden Zahlen durch die Buttons (die Beschriftung der Buttons = Zahl)

procedure TFTaschenrechner.Bt0Click(Sender: TObject);
  begin
   if DisplayLeeren = True then
       Edit.Text :='';
       Edit.Text := Edit.text + TButton(Sender).Caption;
       DisplayLeeren := False;
  end;




// Addition

procedure TFTaschenrechner.BtPlusClick(Sender: TObject);
 begin
  zahl1 := StrToFloat(Edit.Text);
  operator:= '+';
  Edit.Text := '';
  KommaGesetzt := False;
end;




// Subtraktion

procedure TFTaschenrechner.BtMinusClick(Sender: TObject);
begin
  zahl1 := StrToFloat(Edit.Text);
  operator:= '-';
  Edit.Text := '';
  KommaGesetzt := False;
end;




// Multiplikation

procedure TFTaschenrechner.BtMalClick(Sender: TObject);
begin
  zahl1 := StrToFloat(Edit.Text);
  operator:= 'x';
  Edit.Text := '';
  KommaGesetzt := False;
end;




// Division

procedure TFTaschenrechner.BtDurchClick(Sender: TObject);
begin
  zahl1 := StrToFloat(Edit.Text);
  operator:= '/';
  Edit.Text := '';
  KommaGesetzt := False;  
end;




// Rechnungen bis hin zum Ergebnis (Rechenarten: + , - , * , / )

procedure TFTaschenrechner.BtGleichClick(Sender: TObject);
 begin
  zahl2 := StrToFloat(Edit.Text);

    if operator = '+' then
      begin
       ergebnis := zahl1 + zahl2;
       Edit.Text := FloatToStr(ergebnis);
       operator := 'ü';
       DisplayLeeren := true;
      end;


     if operator = '-' then
      begin
       ergebnis := zahl1 - zahl2;
       Edit.Text := FloatToStr(ergebnis);
       operator := 'ü';
       DisplayLeeren := true;
      end;


     if operator = 'x' then
      begin
       ergebnis := zahl1 * zahl2;
       Edit.Text := FloatToStr(ergebnis);
       operator := 'ü';
       DisplayLeeren := true;
      end;


     if operator = '/' then
       begin
         if zahl2 <> 0 then
           begin
             ergebnis := zahl1 / zahl2;
             Edit.Text := FloatToStr(ergebnis);
             operator := 'ü';
             DisplayLeeren := true;
           end
           else ShowMessage('nicht durch 0 teilen');
      end;
 end;




// Vorzeichenwechselprocedure (x ist jede beliebig eingegebende Zahl)

procedure TFTaschenrechner.BtVorzeichenClick(Sender: TObject);
  begin

    x := StrToFloat (Edit.Text);
    Edit.Text := FloatToStr (x * (-1));

  end;




// Kehrwertprocedure (x ist jede beliebig eingegebende Zahl)

procedure TFTaschenrechner.BtKehrwertClick(Sender: TObject);
begin
   x := StrToFloat(Edit.Text);
     if x <> 0 then
       begin
        x := 1/x;
        Edit.Text := FloatToStr(x);
       end
       else ShowMessage('0 ist kein gültiger Wert')
end;



end.
