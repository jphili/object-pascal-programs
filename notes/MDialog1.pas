unit MDialog1;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls;

type
  TDialog1 = class(TForm)
    LbName: TLabel;
    EdName: TEdit;
    BtOk: TButton;
    BtAbbruch: TButton;

  
  private
    { Private-Deklarationen }
  public
    { Public-Deklarationen }
    ok : Boolean;
  end;

implementation

uses MNotiz1;

{$R *.DFM}




end.


