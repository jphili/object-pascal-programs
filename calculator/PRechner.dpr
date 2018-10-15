program PRechner;

uses
  Forms,
  MRechner in 'MRechner.pas' {FTaschenrechner};

{$R *.RES}

begin
  Application.Initialize;
  Application.CreateForm(TFTaschenrechner, FTaschenrechner);
  Application.Run;
end.
