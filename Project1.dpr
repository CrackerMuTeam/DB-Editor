program Project1;

uses
  Forms,
  MainUnit in 'MainUnit.pas' {Form4},
  AccountUnit in 'AccountUnit.pas' {Form1},
  FindUnit in 'FindUnit.pas' {Form2},
  NCharUnit in 'NCharUnit.pas' {Form3},
  ECharUnit in 'ECharUnit.pas' {Form5},
  NGuildUnit in 'NGuildUnit.pas' {NGuildForm},
  EGuildUnit in 'EGuildUnit.pas' {Form6},
  GlobalVar in 'GlobalVar.pas' {Form7},
  VaultUnit in 'VaultUnit.pas' {VaultForm};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TMainForm, MainForm);
  Application.CreateForm(TVarForm, VarForm);
  Application.CreateForm(TVaultForm, VaultForm);
  Mainform.Iniciar;
  Application.CreateForm(TAccountForm, AccountForm);
  Application.CreateForm(TFindForm, FindForm);
  Application.CreateForm(TNCharForm, NCharForm);
  Application.CreateForm(TECharForm, ECharForm);
  Application.CreateForm(TNGuildForm, NGuildForm);
  Application.CreateForm(TEGuildForm, EGuildForm);
 // Application.CreateForm(TVaultForm, VaultForm);
  Application.Run;
end.















