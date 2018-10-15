unit MZettel1;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls;

type
  TZettel = class(TForm)
    MemMemo: TMemo;
    BtLoeschMich: TButton;
    procedure BtLoeschMichClick(Sender: TObject);
  private
    { Private-Deklarationen }
  public
    { Public-Deklarationen }
  end;


implementation

uses MNotiz1;


{$R *.DFM}




/// Zettel löschen
procedure TZettel.BtLoeschMichClick(Sender: TObject);
VAR i, zettelnummer : Integer;
begin
  FOR i := 0 To Self.Owner.ComponentCount -1 DO
    IF Self.Owner.Components[i] IS TZettel THEN
      IF Self.Caption = TZettel(Self.Owner.Components[i]).Caption THEN
      zettelnummer := i;
  TNotiz(Self.Owner).nummer := zettelnummer;
  TNotiz(Self.Owner).Timer.Enabled := True;
end;

end.
