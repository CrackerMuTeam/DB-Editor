program Project1;

uses
  Forms,
  MainUnit in 'MainUnit.pas' {Form1},
  VaultUnit in 'VaultUnit.pas' {VaultForm},
  GlobalVar in 'GlobalVar.pas' {VarForm};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TMainForm, MainForm);
  Application.CreateForm(TVaultForm, VaultForm);
  Application.CreateForm(TVarForm, VarForm);
  Mainform.Initialize;
  Application.Run;
end.
