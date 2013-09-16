unit AccountUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, RzPanel, StdCtrls, Mask, RzEdit, RzLabel, Buttons, RzButton,Globalvar,
  DB, ADODB;

type
  TAccountForm = class(TForm)
    RzGroupBox1: TRzGroupBox;
    RzLabel1: TRzLabel;
    RzEdit1: TRzEdit;
    RzLabel2: TRzLabel;
    RzEdit2: TRzEdit;
    RzEdit3: TRzEdit;
    RzLabel3: TRzLabel;
    RzEdit4: TRzEdit;
    RzLabel4: TRzLabel;
    RzEdit5: TRzEdit;
    RzLabel5: TRzLabel;
    RzEdit6: TRzEdit;
    RzLabel6: TRzLabel;
    RzEdit7: TRzEdit;
    RzLabel7: TRzLabel;
    RzGroupBox2: TRzGroupBox;
    RzBitBtn1: TRzBitBtn;
    RzBitBtn2: TRzBitBtn;
    RzLabel8: TRzLabel;
    RzLabel9: TRzLabel;
    AccountADOQuery1: TADOQuery;
    AccountADOQuery2: TADOQuery;
    procedure Iniciar(Nova:boolean);
    procedure RzBitBtn1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure RzBitBtn2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  AccountForm: TAccountForm;
  Nova2:boolean;
implementation
uses MainUnit;

{$R *.dfm}
procedure AccountLang;
begin
  AccountForm.RzLabel1.Caption:=AccountIDText;
  AccountForm.RzLabel2.Caption:=PasswordText;
  AccountForm.RzLabel3.Caption:=NameText;
  AccountForm.RzLabel4.Caption:=SQuesText;
  AccountForm.RzLabel5.Caption:=SAnswText;
  AccountForm.RzLabel6.Caption:=EmailText;
  AccountForm.RzLabel7.Caption:=PersonalIdText;
  if EncPass=True then AccountForm.RzLabel8.Caption:=Encripton
    else AccountForm.RzLabel8.Caption:=Encriptoff;
  AccountForm.RzBitBtn1.Caption:=Okbtn;
  AccountForm.RzBitBtn2.Caption:=Cancelbtn;
end;

procedure IniciarCriar;
begin
  AccountForm.RzEdit1.Text:='';
  AccountForm.RzEdit2.Text:='';
  AccountForm.RzEdit3.Text:='';
  AccountForm.RzEdit4.Text:='';
  AccountForm.RzEdit5.Text:='';
  AccountForm.RzEdit6.Text:='';
  AccountForm.RzEdit7.Text:='';
  AccountForm.RzLabel9.Caption:=CreatingAccount;
  AccountForm.Caption:=AccountForm.RzLabel9.Caption;
end;

procedure IniciarEditar;
begin
  AccountForm.RzEdit1.Text:='';
  AccountForm.RzEdit2.Text:='';
  AccountForm.RzEdit3.Text:='';
  AccountForm.RzEdit4.Text:='';
  AccountForm.RzEdit5.Text:='';
  AccountForm.RzEdit6.Text:='';
  AccountForm.RzEdit7.Text:='';

  AccountForm.AccountADOQuery1.SQL.Clear;
  if EncPass=true  then
    if nonEncriptedCollumn='' then
      AccountForm.AccountADOQuery1.SQL.Add('SELECT '+memb_name+','+fpas_ques+','+fpas_answ+','+mail_addr+','+sno__numb)
        else AccountForm.AccountADOQuery1.SQL.Add('SELECT '+memb_name+','+fpas_ques+','+fpas_answ+','+mail_addr+','+sno__numb+','+NonEncriptedCollumn);
  if EncPass=false  then
    AccountForm.AccountADOQuery1.SQL.Add('SELECT '+memb_name+','+fpas_ques+','+fpas_answ+','+mail_addr+','+sno__numb+','+memb__pwd);
  AccountForm.AccountADOQuery1.SQL.Add('FROM '+MEMB_INFO+'');
  AccountForm.AccountADOQuery1.SQL.Add('WHERE '+memb___id+'='''+accountsel+'''');
  AccountForm.AccountADOQuery1.Open;
  if (nonEncriptedCollumn<>'') or (EncPass=false) then  AccountForm.RzEdit2.Text:=AccountForm.AccountADOQuery1.Fields[5].AsString
    else AccountForm.RzEdit2.Text:='';
  AccountForm.RzEdit1.Text:=AccountSel;
  AccountForm.RzEdit3.Text:=AccountForm.AccountADOQuery1.Fields[0].AsString;
  AccountForm.RzEdit4.Text:=AccountForm.AccountADOQuery1.Fields[1].AsString;
  AccountForm.RzEdit5.Text:=AccountForm.AccountADOQuery1.Fields[2].AsString;
  AccountForm.RzEdit6.Text:=AccountForm.AccountADOQuery1.Fields[3].AsString;
  AccountForm.RzEdit7.Text:=AccountForm.AccountADOQuery1.Fields[4].AsString;
  AccountForm.AccountADOQuery1.Close;

  AccountForm.RzLabel9.Caption:=format(EditingAccount,[AccountSel]);
  AccountForm.Caption:=AccountForm.RzLabel9.Caption;
end;

procedure Criar;
var j:integer;
begin
  if AccountForm.RzEdit2.Text='' then
  begin
    application.MessageBox(pchar(accounterror2),pchar(accounterrorcaption),mb_iconerror+mb_ok);
    exit;
  end;
  AccountForm.AccountADOQuery1.SQL.Clear;
  AccountForm.AccountADOQuery1.SQL.Add('SELECT *');
  AccountForm.AccountADOQuery1.SQL.Add('FROM '+MEMB_INFO);
  AccountForm.AccountADOQuery1.SQL.Add('WHERE '+memb___id+'='''+Accountform.RzEdit1.Text+'''');
  AccountForm.AccountADOQuery1.Open;
  if AccountForm.AccountADOQuery1.Fields[0].AsString<>'' then
  begin
    application.MessageBox(pchar(accounterror3),pchar(accounterrorcaption),mb_iconerror+mb_ok);
    AccountForm.AccountADOQuery1.close;
    exit;
  end;
  AccountForm.AccountADOQuery1.Close;
  if EncPass=true  then
  begin
    AccountForm.AccountADOQuery1.SQL.Clear;
    if nonEncriptedCollumn='' then
    begin
        AccountForm.AccountADOQuery1.SQL.Add('INSERT INTO '+MEMB_INFO);
        AccountForm.AccountADOQuery1.SQL.Add('('+memb___id+','+memb__pwd+','+memb_name+','+sno__numb+','+addr_info+','+mail_addr+','+appl_days+','+modi_days+','+phon_numb+','+fpas_ques+','+fpas_answ+','+out__days+','+true_days+','+mail_chek+','+bloc_code+','+ctl1_code+')');
        AccountForm.AccountADOQuery1.SQL.Add('VALUES ('''+AccountForm.RzEdit1.Text+''',CONVERT(varbinary(16),''0x00''),'''+AccountForm.RzEdit3.Text+''','''+AccountForm.RzEdit7.Text+''','''','''+AccountForm.RzEdit6.Text+''',getdate(),getdate(),'''','''+AccountForm.RzEdit4.Text+''','''+AccountForm.RzEdit5.Text+''',getdate(),getdate(),''0'',''0'',''0'')');
    end
      else begin
        AccountForm.AccountADOQuery1.SQL.Add('INSERT INTO '+MEMB_INFO);
        AccountForm.AccountADOQuery1.SQL.Add('('+memb___id+','+memb__pwd+','+memb_name+','+sno__numb+','+addr_info+','+mail_addr+','+appl_days+','+modi_days+','+phon_numb+','+fpas_ques+','+fpas_answ+','+out__days+','+true_days+','+mail_chek+','+bloc_code+','+ctl1_code+','+NonEncriptedCollumn+')');
        AccountForm.AccountADOQuery1.SQL.Add('VALUES ('''+AccountForm.RzEdit1.Text+''',CONVERT(varbinary(16),''0x00''),'''+AccountForm.RzEdit3.Text+''','''+AccountForm.RzEdit7.Text+''','''','''+AccountForm.RzEdit6.Text+''',getdate(),getdate(),'''','''+AccountForm.RzEdit4.Text+''','''+AccountForm.RzEdit5.Text+''',getdate(),getdate(),''0'',''0'',''0'','''+AccountForm.RzEdit2.Text+''')');
      end;
    AccountForm.AccountADOQuery1.ExecSQL;
    AccountForm.AccountADOQuery1.SQL.Clear;
    AccountForm.AccountADOQuery1.SQL.Add('Update '+MEMB_INFO+' set '+Memb__pwd+'=[dbo].[fn_CMT_Enc] ('''+AccountForm.RzEdit1.Text+''', '''+AccountForm.RzEdit2.Text+''') where '+memb___id+'='''+AccountForm.RzEdit1.Text+'''');
    AccountForm.AccountADOQuery1.ExecSQL;
  end;
  if EncPass=false  then
  begin
    AccountForm.AccountADOQuery1.SQL.Clear;
    AccountForm.AccountADOQuery1.SQL.Add('INSERT INTO '+MEMB_INFO+'');
    AccountForm.AccountADOQuery1.SQL.Add('('+memb___id+','+memb__pwd+','+memb_name+','+sno__numb+','+addr_info+','+mail_addr+','+appl_days+','+modi_days+','+phon_numb+','+fpas_ques+','+fpas_answ+','+out__days+','+true_days+','+mail_chek+','+bloc_code+','+ctl1_code+')');
    AccountForm.AccountADOQuery1.SQL.Add('VALUES ('''+AccountForm.RzEdit1.Text+''','''+AccountForm.RzEdit2.Text+''','''+AccountForm.RzEdit3.Text+''','''+AccountForm.RzEdit7.Text+''','''','''+AccountForm.RzEdit6.Text+''',getdate(),getdate(),'''','''+AccountForm.RzEdit4.Text+''','''+AccountForm.RzEdit5.Text+''',getdate(),getdate(),''0'',''0'',''0'')');
    AccountForm.AccountADOQuery1.ExecSQL;
  end;
  AccountForm.AccountADOQuery1.SQL.Clear;
  AccountForm.AccountADOQuery1.SQL.Add('Select '+memb_guid+' from '+MEMB_INFO+' where '+memb___id+'='''+AccountForm.RzEdit1.Text+'''');
  AccountForm.AccountADOQuery1.Open;
  j:=AccountForm.AccountADOQuery1.fields[0].AsInteger;
  AccountForm.AccountADOQuery1.Close;
  if ViCurr=true then
  begin
    AccountForm.AccountADOQuery1.SQL.Clear;
    AccountForm.AccountADOQuery1.sql.add('INSERT INTO '+VI_CURR_INFO+' ('+ends_days+','+chek_code+','+used_time+','+memb___id2+','+memb_name2+','+memb_guid2+','+sno__numb2+','+Bill_Section+','+Bill_value+','+Bill_Hour+','+Surplus_Point+','+Surplus_Minute+','+Increase_Days+' )  VALUES (''2005'',''1'',1234,'''+AccountForm.RzEdit1.Text+''','''+AccountForm.RzEdit3.Text+''','+inttostr(j)+',''7'',''6'',''3'',''6'',''6'',getdate(),''0'' )');
    AccountForm.AccountADOQuery1.ExecSQL;
  end;
  MainForm.Enabled:=true;
  MainForm.ListarAccounts;
  AccountForm.Close;
end;

procedure Editar;
var j,i:integer;
begin
  if EncPass=true  then
  begin
    AccountForm.AccountADOQuery1.SQL.Clear;
    if nonEncriptedCollumn='' then
    begin
      AccountForm.AccountADOQuery1.SQL.Add('UPDATE '+MEMB_INFO+'');
      AccountForm.AccountADOQuery1.SQL.Add('SET '+memb_name+'='''+AccountForm.RzEdit3.Text+''','+fpas_ques+'='''+AccountForm.RzEdit4.Text+''','+fpas_answ+'='''+AccountForm.RzEdit5.Text+''','+mail_addr+'='''+AccountForm.RzEdit6.Text+''','+sno__numb+'='''+AccountForm.RzEdit7.Text+'''');
      AccountForm.AccountADOQuery1.SQL.Add('WHERE '+memb___id+'='''+accountsel+'''');
    end
      else begin
        AccountForm.AccountADOQuery1.SQL.Add('UPDATE '+MEMB_INFO+'');
        AccountForm.AccountADOQuery1.SQL.Add('SET '+memb_name+'='''+AccountForm.RzEdit3.Text+''','+fpas_ques+'='''+AccountForm.RzEdit4.Text+''','+fpas_answ+'='''+AccountForm.RzEdit5.Text+''','+mail_addr+'='''+AccountForm.RzEdit6.Text+''','+sno__numb+'='''+AccountForm.RzEdit7.Text+''','+NonEncriptedCollumn+'='''+AccountForm.RzEdit2.Text+'''');
        AccountForm.AccountADOQuery1.SQL.Add('WHERE '+memb___id+'='''+accountsel+'''');
      end;
    AccountForm.AccountADOQuery1.ExecSQL;
    if AccountForm.RzEdit2.Text<>'' then
    begin
      AccountForm.AccountADOQuery1.SQL.Clear;
      AccountForm.AccountADOQuery1.SQL.Add('UPDATE '+MEMB_INFO+'');
      AccountForm.AccountADOQuery1.SQL.Add('SET '+Memb__pwd+'=[dbo].[fn_CMT_Enc] ('''+AccountForm.RzEdit1.Text+''', '''+AccountForm.RzEdit2.Text+''')');
      AccountForm.AccountADOQuery1.SQL.Add('WHERE '+memb___id+'='''+accountsel+'''');
      AccountForm.AccountADOQuery1.ExecSQL;
    end;
  end;
  if EncPass=false  then
  begin
    AccountForm.AccountADOQuery1.SQL.Clear;
    AccountForm.AccountADOQuery1.SQL.add('UPDATE '+MEMB_INFO+'');
    AccountForm.AccountADOQuery1.SQL.add('SET '+memb_name+'='''+AccountForm.RzEdit3.Text+''','+fpas_ques+'='''+AccountForm.RzEdit4.Text+''','+fpas_answ+'='''+AccountForm.RzEdit5.Text+''','+mail_addr+'='''+AccountForm.RzEdit6.Text+''','+sno__numb+'='''+AccountForm.RzEdit7.Text+''','+memb__pwd+'='''+AccountForm.RzEdit2.Text+'''');
    AccountForm.AccountADOQuery1.SQL.add('WHERE '+memb___id+'='''+accountsel+'''');
    AccountForm.AccountADOQuery1.ExecSQL;
  end;
  AccountForm.AccountADOQuery1.SQL.Clear;
  AccountForm.AccountADOQuery1.SQL.Add('SELECT '+memb_guid+'');
  AccountForm.AccountADOQuery1.SQL.Add('FROM '+MEMB_INFO+'');
  AccountForm.AccountADOQuery1.SQL.Add('WHERE '+memb___id+'='''+AccountForm.RzEdit1.Text+'''');
  AccountForm.AccountADOQuery1.Open;
  j:=AccountForm.AccountADOQuery1.fields[0].AsInteger;
  AccountForm.AccountADOQuery1.Close;
  if ViCurr=true then
  begin
    AccountForm.AccountADOQuery1.SQL.Clear;
    AccountForm.AccountADOQuery1.SQL.Add('Update '+VI_CURR_INFO+' Set '+memb___id2+'='''+AccountForm.RzEdit1.Text+''','+memb_name2+'='''+AccountForm.RzEdit3.Text+''' where '+memb_guid2+'='+inttostr(j)+'');
    AccountForm.AccountADOQuery1.ExecSQL;
  end;
  if AccountForm.RzEdit1.Text<>accountsel then
  begin
    {Verificar se Existe a account}
    AccountForm.AccountADOQuery1.SQL.Clear;
    AccountForm.AccountADOQuery1.SQL.Add('Select * from '+MEMB_INFO+' where '+memb___id+'='''+AccountForm.RzEdit1.Text+'''');
    AccountForm.AccountADOQuery1.Open;
    if AccountForm.AccountADOQuery1.Fields[0].AsString<>'' then
    begin
      application.MessageBox(pchar(accounterror3),pchar(accounterrorcaption),mb_iconerror+mb_ok);
      AccountForm.AccountADOQuery1.Close;
      exit;
    end
      else begin
        AccountForm.AccountADOQuery1.Close;
        AccountForm.AccountADOQuery1.SQL.Clear;
        AccountForm.AccountADOQuery1.SQL.Add('Update '+memb_info+' set '+memb___id+'='''+AccountForm.RzEdit1.Text+''' where '+memb___id+'='''+accountsel+'''' );
        AccountForm.AccountADOQuery1.SQL.Add('Update '+memb_stat+' set '+memb___id3+'='''+AccountForm.RzEdit1.Text+''' where '+memb___id3+'='''+accountsel+'''' );
        AccountForm.AccountADOQuery1.ExecSQL;
        AccountForm.AccountADOQuery2.SQL.Clear;
        AccountForm.AccountADOQuery2.SQL.add('Update '+accountcharacter+' set '+id+'='''+AccountForm.RzEdit1.Text+''' where '+id+'='''+accountsel+'''' );
        AccountForm.AccountADOQuery2.SQL.add('Update '+character+' set '+accountid+'='''+AccountForm.RzEdit1.Text+''' where '+accountid+'='''+accountsel+'''' );
        AccountForm.AccountADOQuery2.SQL.add('Update '+warehouse+' set '+accountid2+'='''+AccountForm.RzEdit1.Text+''' where '+accountid2+'='''+accountsel+'''' );
        AccountForm.AccountADOQuery2.ExecSQL;
      end;
  end;
  mainform.Enabled:=true;
  mainform.ListarAccounts;
  for i := 0 to mainform.RzComboBox1.Items.Count-1 do
    if mainform.RzComboBox1.Items[i]=accountsel then mainform.RzComboBox1.ItemIndex:=i;
  mainform.SelecionarAccount;
  AccountForm.Close;

end;

procedure TAccountForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
AccountForm.FreeOnRelease;
MainForm.Enabled:=true;
end;

procedure TAccountForm.Iniciar(Nova:boolean);
begin
  AccountForm.AccountADOQuery1.ConnectionString:='Provider=MSDASQL.1;Password='+memupwd+';Persist Security Info=True;User ID='+memuid+';Data Source='+memudsn+';Initial Catalog='+mecatalog;
  AccountForm.AccountADOQuery2.ConnectionString:='Provider=MSDASQL.1;Password='+mupwd+';Persist Security Info=True;User ID='+muid+';Data Source='+mudsn+';Initial Catalog='+catalog;
  AccountLang;
  if Nova=True then IniciarCriar
    else IniciarEditar;
  Nova2:=Nova;
end;

procedure TAccountForm.RzBitBtn1Click(Sender: TObject);
begin
  if AccountForm.RzEdit1.Text='' then
  begin
    application.MessageBox(pchar(accounterror1),pchar(accounterrorcaption),mb_iconerror+mb_ok);
    exit;
  end;
  if AccountForm.RzEdit3.Text='' then
    AccountForm.RzEdit3.Text:='name';
  if nova2=true then Criar
    else Editar;
end;

procedure TAccountForm.RzBitBtn2Click(Sender: TObject);
begin
  AccountForm.Close;
end;

end.
