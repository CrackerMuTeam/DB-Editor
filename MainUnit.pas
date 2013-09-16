unit MainUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, RzButton, StdCtrls, RzCmboBx, RzLabel, ExtCtrls, RzPanel,
  GlobalVar, DB, ADODB, VaultUnit;

type
  TMainForm = class(TForm)
    RzGroupBox1: TRzGroupBox;
    RzLabel1: TRzLabel;
    RzComboBox1: TRzComboBox;
    RzBitBtn4: TRzBitBtn;
    RzGroupBox2: TRzGroupBox;
    RzLabel2: TRzLabel;
    RzComboBox2: TRzComboBox;
    RzBitBtn11: TRzBitBtn;
    RzBitBtn15: TRzBitBtn;
    MainADOQuery1: TADOQuery;
    MainADOQuery2: TADOQuery;
    procedure RzComboBox1Change(Sender: TObject);
    procedure ListarAccounts;
    procedure RzBitBtn4Click(Sender: TObject);
    procedure Initialize;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  MainForm: TMainForm;

implementation

{$R *.dfm}

Procedure TMainForm.ListarAccounts;
begin
  Mainform.RzComboBox1.Items.Clear;
  Mainform.MainADOQuery1.SQL.Clear;
  Mainform.MainADOQuery1.SQL.Add('Select '+memb___id+' from '+memb_info);
  Mainform.MainADOQuery1.Open;
  While not(Mainform.MainADOQuery1.Eof) do
  begin
    Mainform.RzComboBox1.Items.Add(Mainform.MainADOQuery1.Fields[0].AsString);
    Mainform.MainADOQuery1.Next;
  end;
  Mainform.MainADOQuery1.Close;
  Mainform.RzComboBox1.ItemIndex:=-1;
 // Mainform.RzBitBtn4.Enabled:=False;
  Mainform.RzBitBtn11.Enabled:=False;
  Mainform.RzBitBtn15.Enabled:=False;
end;

procedure TMainForm.RzBitBtn4Click(Sender: TObject);
var
  b:boolean;
  i,t,j:byte;
  s:string;
begin
  if MainForm.RzComboBox1.Text<>'' then
  begin
    AccountSel:=MainForm.RzComboBox1.Text;
    MainForm.MainADOQuery2.SQL.clear;
    MainForm.MainADOQuery2.SQL.Add('select * from '+warehouse+' where '+AccountID2+'='''+accountsel+'''' );
    MainForm.MainADOQuery2.Open;
    if (MainForm.MainADOQuery2.Eof) and (MainForm.MainADOQuery2.Bof) then b:=true
      else b:=false;
    MainForm.MainADOQuery2.Close;
    if b=true then
    begin
      MainForm.MainADOQuery2.SQL.clear;
      s:='0x';
      for I := 0 to 14 do
      for t := 0 to 7 do
        for j := 1 to itemhexcount do
          if j<3 then s:=s+'F'
            else s:=s+'0';
      MainForm.MainADOQuery2.SQL.Add('Insert into '+warehouse+' ('+AccountID2+','+money+','+DbVersion2+')VALUES('''+accountsel+''',0,1)');
      MainForm.MainADOQuery2.execsql;
      MainForm.MainADOQuery2.SQL.clear;
      MainForm.MainADOQuery2.SQL.Add('Update '+warehouse+' set '+items+'='+s+' where '+AccountID2+'='''+accountsel+'''');
      MainForm.MainADOQuery2.execsql;
    end;
    //tlength(vaultvar.ExtraVaults,MultiVaultTotal);
    VaultForm.RzTabControl1.Tabs.Clear;
    VaultForm.RzTabControl1.Tabs.Add.Caption:=('Vault');
    for I := 1 to MultiVaultTotal do
    begin
      VaultForm.RzTabControl1.Tabs.Add.Caption:=('Vault'+GlobalConfig.to2char(i));
      VaultVar.ExtraVaults[i].Zen:='0';
      VaultVar.ExtraVaults[i].Edit:=false;
    end;
    VaultVar.ExtraVaults[255].Edit:=false;
    VaultVar.VaultOn:=True;
    VaultVar.VaultAtual:=0;
    VaultForm.Iniciar;
    VaultVar.ExtraVaults[255].Edit:=true;

    VaultForm.Enabled:=true;
    VaultForm.Show;
  end else application.MessageBox(pchar(MainError2),pchar(MainErrorCaption));
end;

procedure TMainForm.RzComboBox1Change(Sender: TObject);
begin
  //SelecionarAccount;
end;

procedure TMainForm.Initialize;
begin
  GlobalConfig.ExcellentTypes;
  GlobalConfig.BasePk;
  GlobalConfig.BaseChartype;
  GlobalConfig.BaseStatus;
  GlobalConfig.BaseQuests;
  GlobalConfig.LerMdb;
  GlobalConfig.ArrayExp;
  Mainform.MainADOQuery1.ConnectionString:='Provider=MSDASQL.1;Password='+memupwd+';Persist Security Info=True;User ID='+memuid+';Data Source='+memudsn+';Initial Catalog='+mecatalog;
  Mainform.MainADOQuery2.ConnectionString:='Provider=MSDASQL.1;Password='+mupwd+';Persist Security Info=True;User ID='+muid+';Data Source='+mudsn+';Initial Catalog='+catalog;
  Mainform.ListarAccounts;
end;

end.
