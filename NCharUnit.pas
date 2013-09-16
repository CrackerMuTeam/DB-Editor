unit NCharUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, RzButton, RzRadChk, StdCtrls, Mask, RzEdit, ExtCtrls, RzPanel,GlobalVar,
  DB, ADODB, RzLabel, RzCmboBx, ECharUnit;

type

  TNCharForm = class(TForm)
    RzGroupBox1: TRzGroupBox;
    RzEdit1: TRzEdit;
    RzGroupBox2: TRzGroupBox;
    RzGroupBox3: TRzGroupBox;
    RzBitBtn1: TRzBitBtn;
    RzBitBtn2: TRzBitBtn;
    RzBitBtn3: TRzBitBtn;
    NCharADOQuery1: TADOQuery;
    NCharADOQuery2: TADOQuery;
    RzComboBox1: TRzComboBox;
    RzLabel1: TRzLabel;
    RzComboBox2: TRzComboBox;
    Procedure Iniciar;
    function CriarCharacter : boolean;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure RzBitBtn1Click(Sender: TObject);
    procedure RzBitBtn3Click(Sender: TObject);
    procedure RzBitBtn2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;



var
  NCharForm: TNCharForm;

implementation
uses MainUnit;
{$R *.dfm}


function TNCharform.CriarCharacter: boolean;
var num:string;
i:integer;
begin
  if NCharform.RzEdit1.Text='' then
  begin
    application.MessageBox(pchar(CharacterError1),pchar(charactererrorcaption),mb_iconerror+mb_ok);
    Result:=false;
    exit;
  end;
  NCharform.NCharADOQuery2.SQL.Clear;
  NCharform.NCharADOQuery2.SQL.Add('SELECT '+cname);
  NCharform.NCharADOQuery2.SQL.Add('FROM '+character);
  NCharform.NCharADOQuery2.SQL.Add('WHERE '+cname+'='''+NCharform.RzEdit1.Text+'''');
  NCharform.NCharADOQuery2.Open;
  if not((NCharform.NCharADOQuery2.Bof) and (NCharform.NCharADOQuery2.Eof)) then
  begin
    application.MessageBox(pchar(CharacterError5),pchar(charactererrorcaption),mb_iconerror+mb_ok);
    Result:=false;
    exit;
  end;
  NCharform.NCharADOQuery2.Close;
  NCharform.NCharADOQuery2.SQL.Clear;
  for i := 0 to NCHarform.RzComboBox2.Items.Count-1 do
    if NCHarform.RzComboBox2.Items[NCHarform.RzComboBox1.ItemIndex]=inttostr(Chartype[i].num) then
      num:=inttostr(Chartype[i].num);
  NCharform.NCharADOQuery2.SQL.Add('[dbo].['+WZcreatecharacter+'] '''+accountsel+''','''+NCharform.RzEdit1.Text+''','+num+'');
  NCharform.NCharADOQuery2.ExecSQL;
  Result:=true;
  Mainform.SelecionarAccount;
end;

procedure TNCharForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Mainform.Enabled:=true;
  NCharForm.FreeOnRelease;
end;

Procedure TNCharform.Iniciar;
var i:integer;
begin
  NCharform.NCharADOQuery1.ConnectionString:='Provider=MSDASQL.1;Password='+memupwd+';Persist Security Info=True;User ID='+memuid+';Data Source='+memudsn+';Initial Catalog='+mecatalog;
  NCharform.NCharADOQuery2.ConnectionString:='Provider=MSDASQL.1;Password='+mupwd+';Persist Security Info=True;User ID='+muid+';Data Source='+mudsn+';Initial Catalog='+catalog;
  NCharform.RzGroupBox1.Caption:=NCharName;
  NCharform.RzGroupBox2.Caption:=NCharClass;
  NCharform.RzComboBox1.Items.Clear;
  NCharform.RzComboBox2.Items.Clear;
  for i := 0 to 100 do
    if (Chartype[i].nome<>'') and (Chartype[i].inicial=0) then
    begin
      NCharform.RzComboBox1.Items.Add(Chartype[i].nome);
      NCharform.RzComboBox2.Items.Add(inttostr(Chartype[i].num));
    end;
  NCharform.Caption:=NCharTitle;
  NCharform.RzBitBtn1.Caption:=NCharCreate;
  NCharform.RzBitBtn2.Caption:=NCharCreateEdit;
  NCharform.RzBitBtn3.Caption:=NCharCancel;
  NCharform.RzComboBox1.ItemIndex:=0;
  NCharform.RzEdit1.Text:='';
end;


procedure TNCharForm.RzBitBtn1Click(Sender: TObject);
begin
  if NCharform.CriarCharacter=true then
    NCharform.Close;
end;

procedure TNCharForm.RzBitBtn2Click(Sender: TObject);
begin
 if NCharform.CriarCharacter=true then
 begin
   NCharform.Close;
   CharacterSel:=NCharform.RzEdit1.Text;
   Echarform.Iniciar;
   Echarform.show;
   MainForm.Enabled:=false;
 end;
end;

procedure TNCharForm.RzBitBtn3Click(Sender: TObject);
begin
  NCharform.Close;
end;

end.
