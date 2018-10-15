program PNotiz1;

uses
  Forms,
  MNotiz1 in 'MNotiz1.pas' {Notiz},
  MDialog1 in 'MDialog1.pas' {Dialog1},
  MZettel1 in 'MZettel1.pas' {Zettel};

{$R *.RES}

begin
  Application.Initialize;
  Application.CreateForm(TNotiz, Notiz);
  Application.Run;
end.
