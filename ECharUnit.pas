unit ECharUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Mask, RzEdit, RzLabel, RzGroupBar, RzButton, RzRadChk,
  ExtCtrls, RzPanel, RzCmboBx, RzSpnEdt, Globalvar, DB, ADODB;

type
  TECharForm = class(TForm)
    RzGroupBox1: TRzGroupBox;
    RzLabel11: TRzLabel;
    RzLabel12: TRzLabel;
    RzGroupBox2: TRzGroupBox;
    RzGroupBar1: TRzGroupBar;
    RzGroup1: TRzGroup;
    RzLabel1: TRzLabel;
    RzLabel2: TRzLabel;
    RzLabel3: TRzLabel;
    RzLabel4: TRzLabel;
    RzLabel5: TRzLabel;
    RzEdit1: TRzEdit;
    RzEdit2: TRzEdit;
    RzEdit3: TRzEdit;
    RzEdit4: TRzEdit;
    RzEdit5: TRzEdit;
    RzGroup2: TRzGroup;
    RzLabel6: TRzLabel;
    RzLabel7: TRzLabel;
    RzLabel8: TRzLabel;
    RzLabel9: TRzLabel;
    RzLabel10: TRzLabel;
    RzEdit6: TRzEdit;
    RzEdit7: TRzEdit;
    RzEdit8: TRzEdit;
    RzEdit9: TRzEdit;
    RzEdit10: TRzEdit;
    RzGroupBox3: TRzGroupBox;
    RzGroupBox5: TRzGroupBox;
    RzComboBox1: TRzComboBox;
    RzComboBox2: TRzComboBox;
    RzLabel13: TRzLabel;
    RzLabel14: TRzLabel;
    RzGroupBar2: TRzGroupBar;
    RzGroup3: TRzGroup;
    RzGroup4: TRzGroup;
    RzLabel15: TRzLabel;
    RzComboBox3: TRzComboBox;
    RzLabel16: TRzLabel;
    RzSpinEdit1: TRzSpinEdit;
    RzSpinEdit2: TRzSpinEdit;
    RzLabel17: TRzLabel;
    RzLabel18: TRzLabel;
    RzComboBox4: TRzComboBox;
    RzLabel19: TRzLabel;
    RzSpinEdit3: TRzSpinEdit;
    RzLabel20: TRzLabel;
    RzSpinEdit4: TRzSpinEdit;
    RzGroupBox4: TRzGroupBox;
    RzGroupBox6: TRzGroupBox;
    RzLabel21: TRzLabel;
    RzEdit11: TRzEdit;
    RzBitBtn1: TRzBitBtn;
    RzGroupBox7: TRzGroupBox;
    RzLabel22: TRzLabel;
    RzBitBtn2: TRzBitBtn;
    RzComboBox5: TRzComboBox;
    RzGroupBox8: TRzGroupBox;
    RzBitBtn3: TRzBitBtn;
    RzBitBtn4: TRzBitBtn;
    RzComboBox6: TRzComboBox;
    RzLabel23: TRzLabel;
    ECharADOQuery1: TADOQuery;
    ECharADOQuery2: TADOQuery;
    RzComboBox7: TRzComboBox;
    RzComboBox8: TRzComboBox;
    RzComboBox9: TRzComboBox;
    RzComboBox10: TRzComboBox;
    RzBitBtn5: TRzBitBtn;
    RzBitBtn6: TRzBitBtn;
    procedure RzBitBtn1Click(Sender: TObject);
    procedure RzBitBtn2Click(Sender: TObject);
    procedure SelectFreeAccounts;
    procedure Iniciar;
    procedure Editar;
    procedure k(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure RzBitBtn4Click(Sender: TObject);
    procedure RzEdit1KeyPress(Sender: TObject; var Key: Char);
    procedure RzBitBtn5Click(Sender: TObject);
    procedure RzBitBtn6Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  ECharForm: TECharForm;

implementation
uses Mainunit;
{$R *.dfm}

function ByteToHex(src: byte): string;   {byte-->hex}
begin
  setlength(result, 2);
  asm
  mov edi, [result]
  mov edi, [edi]
  mov al, src
  mov ah, al
  shr al, 4 
  add al, '0'
  cmp al, '9'
  jbe @@outcharlo
  add al, 'a'-'9'-1
@@outcharlo:
  and ah, $f
  add ah, '0'
  cmp ah, '9'
  jbe @@outchar
  add ah, 'a'-'9'-1
@@outchar:
  stosw
  end;
end;

function HexFieldToString(item:tfield):string;
var
  itemblock:array of byte;
  sWS:string;
  i:integer;
begin
  setlength(itemblock,item.DataSize);
  try
    item.GetData(itemblock);
    sws:=sws+'0x';
    for i:=2 to high(itemblock) do
      sws:=sws+uppercase(ByteToHex(itemblock[i]));

  finally
    result:=sws;
  end;
end;

procedure TECharForm.RzBitBtn1Click(Sender: TObject);
var i:integer;
begin
  if ECharForm.RzEdit11.text='' then
  begin
    application.MessageBox(pchar(CharacterError1),pchar(programname),mb_iconerror);
    exit;
  end;
  if application.MessageBox(pchar(CharacterQuestion1),pchar(programname),mb_yesno+mb_iconquestion)=id_no then exit;
  ECharForm.ECharADOQuery2.SQL.Clear;
  ECharForm.ECharADOQuery2.SQL.Add('Update '+Character+' set '+cname+'='''+ECharForm.RzEdit11.text+''' where '+cname+'='''+charactersel+'''');
  ECharForm.ECharADOQuery2.SQL.Add('Update '+AccountCharacter+' set '+Gameid1+'='''+ECharForm.RzEdit11.text+''' where '+Gameid1+'='''+charactersel+'''');
  ECharForm.ECharADOQuery2.SQL.Add('Update '+AccountCharacter+' set '+Gameid2+'='''+ECharForm.RzEdit11.text+''' where '+Gameid2+'='''+charactersel+'''');
  ECharForm.ECharADOQuery2.SQL.Add('Update '+AccountCharacter+' set '+Gameid3+'='''+ECharForm.RzEdit11.text+''' where '+Gameid3+'='''+charactersel+'''');
  ECharForm.ECharADOQuery2.SQL.Add('Update '+AccountCharacter+' set '+Gameid4+'='''+ECharForm.RzEdit11.text+''' where '+Gameid4+'='''+charactersel+'''');
  ECharForm.ECharADOQuery2.SQL.Add('Update '+AccountCharacter+' set '+Gameid5+'='''+ECharForm.RzEdit11.text+''' where '+Gameid5+'='''+charactersel+'''');
  ECharForm.ECharADOQuery2.SQL.Add('Update '+guild+' set '+G_Master+'='''+ECharForm.RzEdit11.text+''' where '+G_Master+'='''+charactersel+'''');
  ECharForm.ECharADOQuery2.SQL.Add('Update '+guildmember+' set '+Name2+'='''+ECharForm.RzEdit11.text+''' where '+Name2+'='''+charactersel+'''');
  ECharForm.ECharADOQuery2.SQL.Add('Update '+optiondata+' set '+Name3+'='''+ECharForm.RzEdit11.text+''' where '+Name3+'='''+charactersel+'''');
  if (versao='CMT') or (versao='WZ') then
  begin
    ECharForm.ECharADOQuery2.SQL.add('Update '+T_FriendMail+' set '+friendname+'='''+ECharForm.RzEdit11.text+''' where '+friendname+'='''+charactersel+'''');
    ECharForm.ECharADOQuery2.SQL.add('Update '+T_FriendMain+' set '+name4+'='''+ECharForm.RzEdit11.text+''' where '+name4+'='''+charactersel+'''');
  end;
  ECharForm.ECharADOQuery2.ExecSQL;
  charactersel:=ECharForm.RzEdit11.text;
  MainForm.SelecionarAccount;
  for i := 0 to Mainform.RzComboBox2.Items.Count-1 do
    if Mainform.RzComboBox2.Items[i]=charactersel then Mainform.RzComboBox2.ItemIndex:=i;
  Mainform.RzComboBox2.OnChange(Mainform.RzComboBox2);
  ECharForm.RzLabel11.caption:=format(AccountName,[accountsel]);
  ECharForm.RzLabel12.caption:=format(CharacterName,[Charactersel]);
end;

procedure TECharForm.RzBitBtn2Click(Sender: TObject);
var numchar,j:integer;
begin
  if ECharForm.RzComboBox5.ItemIndex=-1 then
  begin
    application.MessageBox(pchar(CharacterError2),pchar(programname),mb_iconerror);
    exit;
  end;
  if application.MessageBox(pchar(CharacterQuestion2),pchar(programname),mb_yesno+mb_iconquestion)=id_no then exit;
  ECharForm.ECharADOQuery2.SQL.clear;
  ECharForm.ECharADOQuery2.SQL.add('Select '+GameID1+','+GameID2+', '+GameID3+','+GameID4+','+GameID5+','+Id+' from '+AccountCharacter+' where '+id+'='''+ECharForm.RzComboBox5.Text+'''');
  ECharForm.ECharADOQuery2.Open;
  if not ((ECharForm.ECharADOQuery2.Bof) and (ECharForm.ECharADOQuery2.Eof)) then
  begin
    numchar:=6;
    for j := 0 to 4 do
      if (ECharForm.ECharADOQuery2.Fields[j].AsString='') and (numchar=6) then
        numchar:=j;
    if numchar=6 then
    begin
      application.MessageBox(pchar(CharacterError3),pchar(programname),mb_iconerror);
      exit;
    end;
    ECharForm.ECharADOQuery2.close;
    ECharForm.ECharADOQuery2.SQL.Clear;
    if numchar=0 then ECharForm.ECharADOQuery2.SQL.add('Update '+AccountCharacter+' set '+Gameid1+'='''+charactersel+''' where '+id+'='''+ECharForm.RzComboBox5.text+'''');
    if numchar=1 then ECharForm.ECharADOQuery2.SQL.add('Update '+AccountCharacter+' set '+Gameid2+'='''+charactersel+''' where '+id+'='''+ECharForm.RzComboBox5.text+'''');
    if numchar=2 then ECharForm.ECharADOQuery2.SQL.add('Update '+AccountCharacter+' set '+Gameid3+'='''+charactersel+''' where '+id+'='''+ECharForm.RzComboBox5.text+'''');
    if numchar=3 then ECharForm.ECharADOQuery2.SQL.add('Update '+AccountCharacter+' set '+Gameid4+'='''+charactersel+''' where '+id+'='''+ECharForm.RzComboBox5.text+'''');
    if numchar=4 then ECharForm.ECharADOQuery2.SQL.add('Update '+AccountCharacter+' set '+Gameid5+'='''+charactersel+''' where '+id+'='''+ECharForm.RzComboBox5.text+'''');
    ECharForm.ECharADOQuery2.SQL.add('Update '+AccountCharacter+' set '+Gameid1+'=null where '+Gameid1+'='''+charactersel+''' and '+id+'='''+accountsel+'''');
    ECharForm.ECharADOQuery2.SQL.add('Update '+AccountCharacter+' set '+Gameid2+'=null where '+Gameid2+'='''+charactersel+''' and '+id+'='''+accountsel+'''');
    ECharForm.ECharADOQuery2.SQL.add('Update '+AccountCharacter+' set '+Gameid3+'=null where '+Gameid3+'='''+charactersel+''' and '+id+'='''+accountsel+'''');
    ECharForm.ECharADOQuery2.SQL.add('Update '+AccountCharacter+' set '+Gameid4+'=null where '+Gameid4+'='''+charactersel+''' and '+id+'='''+accountsel+'''');
    ECharForm.ECharADOQuery2.SQL.add('Update '+AccountCharacter+' set '+Gameid5+'=null where '+Gameid5+'='''+charactersel+''' and '+id+'='''+accountsel+'''');
    ECharForm.ECharADOQuery2.SQL.add('Update '+Character+' set '+AccountID+'='''+ECharForm.RzComboBox5.text+''' where '+cname+'='''+charactersel+'''');
    ECharForm.ECharADOQuery2.ExecSQL;
    accountsel:=ECharForm.RzComboBox5.Text;
    for j := 0 to MainForm.RzComboBox1.Items.Count-1 do
      if MainForm.RzComboBox1.Items[j]=accountsel then MainForm.RzComboBox1.ItemIndex:=j;
    MainForm.SelecionarAccount;
    for j := 0 to MainForm.RzComboBox2.Items.Count-1 do
      if MainForm.RzComboBox2.Items[j]=charactersel then MainForm.RzComboBox2.ItemIndex:=j;
    MainForm.SelecionarCharacter;
    ECharForm.RzLabel11.caption:=format(AccountName,[accountsel]);
  ECharForm.RzLabel12.caption:=format(CharacterName,[Charactersel]);
  end
   else begin
     ECharForm.ECharADOQuery2.close;
     ECharForm.ECharADOQuery2.SQL.Clear;
     ECharForm.ECharADOQuery2.SQL.add('Insert Into '+AccountCharacter+' ('+Gameid1+','+Gameid2+','+Gameid3+','+Gameid4+','+Gameid5+','+id+') VALUES ('''+CharacterSel+''',null,null,null,null,'''+ECharForm.RzComboBox5.text+''')');
     ECharForm.ECharADOQuery2.SQL.add('Update '+AccountCharacter+' set '+Gameid1+'=null where '+Gameid1+'='''+charactersel+''' and '+id+'='''+accountsel+'''');
     ECharForm.ECharADOQuery2.SQL.add('Update '+AccountCharacter+' set '+Gameid2+'=null where '+Gameid2+'='''+charactersel+''' and '+id+'='''+accountsel+'''');
     ECharForm.ECharADOQuery2.SQL.add('Update '+AccountCharacter+' set '+Gameid3+'=null where '+Gameid3+'='''+charactersel+''' and '+id+'='''+accountsel+'''');
     ECharForm.ECharADOQuery2.SQL.add('Update '+AccountCharacter+' set '+Gameid4+'=null where '+Gameid4+'='''+charactersel+''' and '+id+'='''+accountsel+'''');
     ECharForm.ECharADOQuery2.SQL.add('Update '+AccountCharacter+' set '+Gameid5+'=null where '+Gameid5+'='''+charactersel+''' and '+id+'='''+accountsel+'''');
     ECharForm.ECharADOQuery2.SQL.add('Update '+Character+' set '+AccountID+'='''+ECharForm.RzComboBox5.text+''' where '+cname+'='''+charactersel+'''');
     ECharForm.ECharADOQuery2.ExecSQL;
     accountsel:=ECharForm.RzComboBox5.Text;
     for j := 0 to MainForm.RzComboBox1.Items.Count-1 do
       if MainForm.RzComboBox1.Items[j]=accountsel then MainForm.RzComboBox1.ItemIndex:=j;
     MainForm.SelecionarAccount;
     for j := 0 to MainForm.RzComboBox2.Items.Count-1 do
       if MainForm.RzComboBox2.Items[j]=charactersel then MainForm.RzComboBox2.ItemIndex:=j;
     MainForm.SelecionarCharacter;
     ECharForm.RzLabel11.caption:=format(AccountName,[accountsel]);
     ECharForm.RzLabel12.caption:=format(CharacterName,[Charactersel]);
   end;
  ECharForm.SelectFreeAccounts;

end;

procedure TECharForm.k(Sender: TObject);
begin
  ECharForm.Editar;
  ECharForm.Close;
end;

procedure TECharForm.RzBitBtn4Click(Sender: TObject);
begin
  ECharForm.Close;
end;

procedure TECharForm.RzBitBtn5Click(Sender: TObject);
begin
  rzedit3.Text:=inttostr(levelexp[strtoint(rzedit1.Text)-1]);
end;

procedure TECharForm.RzBitBtn6Click(Sender: TObject);
var i:integer;
begin
rzedit1.text:='1';
for  i:= 1 to leveltotal-1 do
  if ((strtoint(rzedit3.text)<levelexp[i+1]) and (strtoint(rzedit3.text)>=levelexp[i]))  then
    rzedit1.Text:=inttostr(i+1);
end;

procedure TECharForm.RzEdit1KeyPress(Sender: TObject; var Key: Char);
begin
If Not (Key in ['0'..'9',#8,#0]) then
Key:=#0;
end;

procedure TECharForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  MainForm.Enabled:=true;
  ECharForm.FreeOnRelease;
end;


procedure TECharForm.SelectFreeAccounts;
var
  numchar , i : byte;
begin
  ECharForm.ECharADOQuery2.SQL.Clear;
  ECharForm.ECharADOQuery2.SQL.Add('Select '+GameID1+','+GameID2+', '+GameID3+','+GameID4+','+GameID5+','+Id);
  ECharForm.ECharADOQuery2.SQL.Add('from '+AccountCharacter+'');
  ECharForm.ECharADOQuery2.Open;
  if not ((ECharForm.ECharADOQuery2.Bof) and (ECharForm.ECharADOQuery2.Eof)) then
  begin
    ECharForm.RzComboBox5.Items.Clear;
    while not(ECharForm.ECharADOQuery2.Eof) do
    begin
      numchar:=0;
      for i := 0 to 4 do
        if ECharForm.ECharADOQuery2.Fields[i].AsString<>'' then inc(numchar);
      if numchar<5 then ECharForm.RzComboBox5.Items.add(ECharForm.ECharADOQuery2.Fields[5].AsString);
      ECharForm.ECharADOQuery2.Next;
    end;
  end;
  ECharForm.ECharADOQuery2.Close;

  ECharForm.ECharADOQuery1.SQL.Clear;
  ECharForm.ECharADOQuery1.SQL.Add('Select '+Memb___id);
  ECharForm.ECharADOQuery1.SQL.Add('from '+memb_info+'');
  ECharForm.ECharADOQuery1.Open;
  while not(ECharForm.ECharADOQuery1.Eof) do
  begin
    ECharForm.ECharADOQuery2.SQL.Clear;
    ECharForm.ECharADOQuery2.SQL.Add('Select '+id);
    ECharForm.ECharADOQuery2.SQL.Add('from '+AccountCharacter+'');
    ECharForm.ECharADOQuery2.SQL.Add('where '+id+'='''+ECharForm.ECharADOQuery1.Fields[0].AsString+'''');
    ECharForm.ECharADOQuery2.Open;
    if ((ECharForm.ECharADOQuery2.Bof) and (ECharForm.ECharADOQuery2.Eof)) then
      ECharForm.RzComboBox5.Items.add(ECharForm.ECharADOQuery1.Fields[0].AsString);
    ECharForm.ECharADOQuery2.Close;
    ECharForm.ECharADOQuery1.Next;
  end;
  ECharForm.ECharADOQuery1.Close;
end;

procedure TECharForm.Editar;
var
  i:integer;
  b:boolean;
begin
  ECharForm.ECharADOQuery2.SQL.Clear;
  ECharForm.ECharADOQuery2.SQL.Add('Update '+Character);
  ECharForm.ECharADOQuery2.SQL.Add('Set '+clevel+'='+ECharForm.RzEdit1.Text+'');
  ECharForm.ECharADOQuery2.SQL.Add(' , '+leveluppoint+'='+ECharForm.RzEdit2.Text+'');
  ECharForm.ECharADOQuery2.SQL.Add(' , '+experience+'='+ECharForm.RzEdit3.Text+'');
  ECharForm.ECharADOQuery2.SQL.Add(' , '+money+'='+ECharForm.RzEdit4.Text+'');
  ECharForm.ECharADOQuery2.SQL.Add(' , '+strength+'='+ECharForm.RzEdit6.Text+'');
  ECharForm.ECharADOQuery2.SQL.Add(' , '+dexterity+'='+ECharForm.RzEdit7.Text+'');
  ECharForm.ECharADOQuery2.SQL.Add(' , '+vitality+'='+ECharForm.RzEdit8.Text+'');
  ECharForm.ECharADOQuery2.SQL.Add(' , '+energy+'='+ECharForm.RzEdit9.Text+'');
  ECharForm.ECharADOQuery2.SQL.Add(' , '+classe+'='+ECharForm.RzComboBox7.Items[ECharForm.RzComboBox2.Itemindex]+'');
  ECharForm.ECharADOQuery2.SQL.Add(' , '+CtlCode+'='+ECharForm.RzComboBox8.Items[ECharForm.RzComboBox1.Itemindex]+'');
  ECharForm.ECharADOQuery2.SQL.Add(' , '+MapNumber+'='+inttostr(ECharForm.RzComboBox3.ItemIndex)+'');
  ECharForm.ECharADOQuery2.SQL.Add(' , '+MapPosX+'='+ECharForm.RzSpinEdit1.Text+'');
  ECharForm.ECharADOQuery2.SQL.Add(' , '+MapPosY+'='+ECharForm.RzSpinEdit2.Text+'');
  ECharForm.ECharADOQuery2.SQL.Add(' , '+PkLevel+'='+ECharForm.RzComboBox9.Items[ECharForm.RzComboBox4.Itemindex]+'');
  ECharForm.ECharADOQuery2.SQL.Add(' , '+PkCount+'='+ECharForm.RzSpinEdit3.Text+'');
  ECharForm.ECharADOQuery2.SQL.Add(' , '+PkTime+'='+ECharForm.RzSpinEdit4.Text+'');
  ECharForm.ECharADOQuery2.SQL.Add(' , '+Quest+'='+ECharForm.RzComboBox10.Items[ECharForm.RzComboBox6.Itemindex]+'');
  ECharForm.ECharADOQuery2.SQL.Add('Where '+cname+'='''+Charactersel+'''');
  ECharForm.ECharADOQuery2.ExecSQL;

  if (Resets<>'') and (ResetsTable<>'') and (ResetsRef<>'') then
  begin
    ECharForm.ECharADOQuery2.SQL.Clear;
    ECharForm.ECharADOQuery2.SQL.Add('Update '+ResetsTable);
    ECharForm.ECharADOQuery2.SQL.Add('Set '+Resets+'='+ECharForm.RzEdit5.Text+'');
    ECharForm.ECharADOQuery2.SQL.Add('Where '+ResetsRef+'='''+Charactersel+'''');
    ECharForm.ECharADOQuery2.ExecSQL;
  end;

  if (LeaderShip<>'') and (leadershipTable<>'') and (leadershipRef<>'') then
  begin
    ECharForm.ECharADOQuery2.SQL.Clear;
    ECharForm.ECharADOQuery2.SQL.Add('Update '+leadershipTable);
    ECharForm.ECharADOQuery2.SQL.Add('Set '+LeaderShip+'='+ECharForm.RzEdit10.Text+'');
    ECharForm.ECharADOQuery2.SQL.Add('Where '+leadershipRef+'='''+Charactersel+'''');
    ECharForm.ECharADOQuery2.ExecSQL;
  end;
end;

procedure TECharForm.Iniciar;
var
  i,j:integer;
  b:boolean;
begin
  ECharForm.ECharADOQuery1.ConnectionString:='Provider=MSDASQL.1;Password='+memupwd+';Persist Security Info=True;User ID='+memuid+';Data Source='+memudsn+';Initial Catalog='+mecatalog;
  ECharForm.ECharADOQuery2.ConnectionString:='Provider=MSDASQL.1;Password='+mupwd+';Persist Security Info=True;User ID='+muid+';Data Source='+mudsn+';Initial Catalog='+catalog;
  ECharForm.RzLabel11.caption:=format(AccountName,[accountsel]);
  ECharForm.RzLabel12.caption:=format(CharacterName,[Charactersel]);

  ECharForm.RzEdit1.Text:='';  //Level
  ECharForm.RzEdit2.Text:='';  //LevelUp
  ECharForm.RzEdit3.Text:='';  //Exp
  ECharForm.RzEdit4.Text:='';  //Zen
  ECharForm.RzEdit5.Text:='';  //Resets
  ECharForm.RzEdit6.Text:='';  //Str
  ECharForm.RzEdit7.Text:='';  //Dex
  ECharForm.RzEdit8.Text:='';  //Vit
  ECharForm.RzEdit9.Text:='';  //Ene
  ECharForm.RzEdit10.Text:=''; //Com
  ECharForm.RzEdit11.Text:=''; //New Name

  ECharForm.RzComboBox2.Items.Clear;
  ECharForm.RzComboBox7.Items.Clear;
  for i := 0 to 100 do
    if (Chartype[i].Num<>-1) then
    begin
      ECharForm.RzComboBox2.Items.Add(Chartype[i].Nome);
      ECharForm.RzComboBox7.Items.Add(inttostr(Chartype[i].Num));
    end;

  ECharForm.RzComboBox1.Items.Clear;
  ECharForm.RzComboBox8.Items.Clear;
  for i := 0 to 100 do
    if (StatusLabel[i].Num<>-1) then
    begin
      ECharForm.RzComboBox1.Items.Add(StatusLabel[i].Nome);
      ECharForm.RzComboBox8.Items.Add(inttostr(StatusLabel[i].Num));
    end;

  ECharForm.RzComboBox3.Items.Clear;
  for i := 0 to 100 do
    if (Maps[i]<>'') then
    begin
      ECharForm.RzComboBox3.Items.Add(Maps[i]);
    end
      else break;

  ECharForm.RzComboBox4.Items.Clear;
  ECharForm.RzComboBox9.Items.Clear;
  for i := 0 to 100 do
    if (PkLabel[i].Num<>-1) then
    begin
      ECharForm.RzComboBox4.Items.Add(PkLabel[i].Nome);
      ECharForm.RzComboBox9.Items.Add(inttostr(PkLabel[i].Num));
    end;

  ECharForm.RzComboBox6.Items.Clear;
  ECharForm.RzComboBox10.Items.Clear;
  for i := 0 to 100 do
    if (Quests[i].Code<>'') then
    begin
      ECharForm.RzComboBox6.Items.Add(Quests[i].Nome);
      ECharForm.RzComboBox10.Items.Add(Quests[i].Code);
    end;

  ECharForm.RzComboBox5.Items.Clear;  // Change Account

  ECharForm.RzSpinEdit1.Value:=0;
  ECharForm.RzSpinEdit2.Value:=0;

  ECharForm.RzSpinEdit3.Value:=0;
  ECharForm.RzSpinEdit4.Value:=0;

  ECharForm.ECharADOQuery2.SQL.Clear;
  ECharForm.ECharADOQuery2.SQL.Add('Select '+clevel+','+leveluppoint+','+experience+','+money);
  ECharForm.ECharADOQuery2.SQL.Add('From '+Character);
  ECharForm.ECharADOQuery2.SQL.Add('Where '+cname+'='''+Charactersel+'''');
  ECharForm.ECharADOQuery2.Open;
  ECharForm.RzEdit1.Text:=ECharForm.ECharADOQuery2.Fields[0].AsString;  //Level
  ECharForm.RzEdit2.Text:=ECharForm.ECharADOQuery2.Fields[1].AsString;  //LevelUp
  ECharForm.RzEdit3.Text:=ECharForm.ECharADOQuery2.Fields[2].AsString;  //Exp
  ECharForm.RzEdit4.Text:=ECharForm.ECharADOQuery2.Fields[3].AsString;  //Zen
  ECharForm.ECharADOQuery2.Close;

  if (Resets<>'') and (ResetsTable<>'') and (ResetsRef<>'') then
  begin
    ECharForm.ECharADOQuery2.SQL.Clear;
    ECharForm.ECharADOQuery2.SQL.Add('Select '+Resets);
    ECharForm.ECharADOQuery2.SQL.Add('From '+ResetsTable);
    ECharForm.ECharADOQuery2.SQL.Add('Where '+ResetsRef+'='''+Charactersel+'''');
    ECharForm.ECharADOQuery2.Open;
    ECharForm.RzEdit5.Text:=ECharForm.ECharADOQuery2.Fields[0].AsString;;  //Resets
    ECharForm.ECharADOQuery2.Close;
  end;

  ECharForm.ECharADOQuery2.SQL.Clear;
  ECharForm.ECharADOQuery2.SQL.Add('Select '+strength+','+dexterity+','+vitality+','+energy);
  ECharForm.ECharADOQuery2.SQL.Add('From '+Character);
  ECharForm.ECharADOQuery2.SQL.Add('Where '+cname+'='''+Charactersel+'''');
  ECharForm.ECharADOQuery2.Open;
  ECharForm.RzEdit6.Text:=ECharForm.ECharADOQuery2.Fields[0].AsString;  //Str
  ECharForm.RzEdit7.Text:=ECharForm.ECharADOQuery2.Fields[1].AsString;  //Dex
  ECharForm.RzEdit8.Text:=ECharForm.ECharADOQuery2.Fields[2].AsString;  //Vit
  ECharForm.RzEdit9.Text:=ECharForm.ECharADOQuery2.Fields[3].AsString;  //Ene
  ECharForm.ECharADOQuery2.Close;

  if (LeaderShip<>'') and (leadershipTable<>'') and (leadershipRef<>'') then
  begin
    ECharForm.ECharADOQuery2.SQL.Clear;
    ECharForm.ECharADOQuery2.SQL.Add('Select '+LeaderShip);
    ECharForm.ECharADOQuery2.SQL.Add('From '+leadershipTable);
    ECharForm.ECharADOQuery2.SQL.Add('Where '+leadershipRef+'='''+Charactersel+'''');
    ECharForm.ECharADOQuery2.Open;
    ECharForm.RzEdit10.Text:=ECharForm.ECharADOQuery2.Fields[0].AsString;  //Com
    ECharForm.ECharADOQuery2.Close;
  end;

  ECharForm.ECharADOQuery2.SQL.Clear;
  ECharForm.ECharADOQuery2.SQL.Add('Select '+classe);
  ECharForm.ECharADOQuery2.SQL.Add('From '+Character);
  ECharForm.ECharADOQuery2.SQL.Add('Where '+cname+'='''+Charactersel+'''');
  ECharForm.ECharADOQuery2.Open;
  for i := 0 to ECharForm.RzComboBox7.Items.Count-1 do
    if ECharForm.RzComboBox7.Items[i]=ECharForm.ECharADOQuery2.Fields[0].AsString then
      ECharForm.RzComboBox2.ItemIndex:=i; //Class
  ECharForm.ECharADOQuery2.Close;

  ECharForm.ECharADOQuery2.SQL.Clear;
  ECharForm.ECharADOQuery2.SQL.Add('Select '+CtlCode);
  ECharForm.ECharADOQuery2.SQL.Add('From '+Character);
  ECharForm.ECharADOQuery2.SQL.Add('Where '+cname+'='''+Charactersel+'''');
  ECharForm.ECharADOQuery2.Open;
  for i := 0 to ECharForm.RzComboBox8.Items.Count-1 do
    if ECharForm.RzComboBox8.Items[i]=ECharForm.ECharADOQuery2.Fields[0].AsString then
      ECharForm.RzComboBox1.ItemIndex:=i; //CtlCode
  ECharForm.ECharADOQuery2.Close;

  ECharForm.ECharADOQuery2.SQL.Clear;
  ECharForm.ECharADOQuery2.SQL.Add('Select '+MapNumber+','+MapPosX+','+MapPosY);
  ECharForm.ECharADOQuery2.SQL.Add('From '+Character);
  ECharForm.ECharADOQuery2.SQL.Add('Where '+cname+'='''+Charactersel+'''');
  ECharForm.ECharADOQuery2.Open;
  ECharForm.RzComboBox3.ItemIndex:=ECharForm.ECharADOQuery2.Fields[0].AsInteger; //MapNumber
  ECharForm.RzSpinEdit1.Value:=ECharForm.ECharADOQuery2.Fields[1].AsInteger; //MapPosX
  ECharForm.RzSpinEdit2.Value:=ECharForm.ECharADOQuery2.Fields[2].AsInteger; //MapPosY
  ECharForm.ECharADOQuery2.Close;

  ECharForm.ECharADOQuery2.SQL.Clear;
  ECharForm.ECharADOQuery2.SQL.Add('Select '+PkLevel+','+PkCount+','+PkTime);
  ECharForm.ECharADOQuery2.SQL.Add('From '+Character);
  ECharForm.ECharADOQuery2.SQL.Add('Where '+cname+'='''+Charactersel+'''');
  ECharForm.ECharADOQuery2.Open;
  for i := 0 to ECharForm.RzComboBox9.Items.Count-1 do
    if ECharForm.RzComboBox9.Items[i]=ECharForm.ECharADOQuery2.Fields[0].AsString then
      ECharForm.RzComboBox4.ItemIndex:=i; //PkLevel
  ECharForm.RzSpinEdit3.Value:=ECharForm.ECharADOQuery2.Fields[1].AsInteger; //PkCount
  ECharForm.RzSpinEdit4.Value:=ECharForm.ECharADOQuery2.Fields[2].AsInteger; //PkTime
  ECharForm.ECharADOQuery2.Close;

  ECharForm.ECharADOQuery2.SQL.Clear;
  ECharForm.ECharADOQuery2.SQL.Add('Select '+Quest);
  ECharForm.ECharADOQuery2.SQL.Add('From '+Character);
  ECharForm.ECharADOQuery2.SQL.Add('Where '+cname+'='''+Charactersel+'''');
  ECharForm.ECharADOQuery2.Open;
  for i := 0 to ECharForm.RzComboBox10.Items.Count-1 do
  begin
    if ECharForm.RzComboBox10.Items[i]=HexFieldToString(ECharForm.ECharADOQuery2.Fields[0]) then
    begin
      b:=true;
      j:=i;
    end;
  end;
  if b=true then
    ECharForm.RzComboBox6.ItemIndex:=j //Quest
      else ECharForm.RzComboBox6.ItemIndex:=0;
  ECharForm.ECharADOQuery2.Close;
  ECharForm.SelectFreeAccounts;

end;

end.
