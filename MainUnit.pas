unit MainUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, RzGroupBar, ExtCtrls, RzPanel, StdCtrls, RzCmboBx, RzLabel, RzButton,
  GlobalVar, DB, ADODB, AccountUnit,WSDLIntf,FindUnit,NCharUnit, ECharUnit,StrUtils,
  RzLstBox,NGuildUnit,EGuildUnit, Buttons, Grids, DBCtrls, DBGrids,VaultUnit,
  XPMan;

type
  TMainForm = class(TForm)
    ACPanel: TRzPanel;
    GPanel: TRzPanel;
    RzGroupBox2: TRzGroupBox;
    RzGroupBox1: TRzGroupBox;
    RzLabel1: TRzLabel;
    RzComboBox1: TRzComboBox;
    RzBitBtn1: TRzBitBtn;
    RzBitBtn2: TRzBitBtn;
    RzBitBtn3: TRzBitBtn;
    RzBitBtn4: TRzBitBtn;
    RzBitBtn5: TRzBitBtn;
    RzBitBtn6: TRzBitBtn;
    RzBitBtn7: TRzBitBtn;
    RzLabel2: TRzLabel;
    RzComboBox2: TRzComboBox;
    RzBitBtn8: TRzBitBtn;
    RzBitBtn9: TRzBitBtn;
    RzBitBtn10: TRzBitBtn;
    RzBitBtn11: TRzBitBtn;
    RzBitBtn12: TRzBitBtn;
    RzBitBtn13: TRzBitBtn;
    RzBitBtn14: TRzBitBtn;
    RzBitBtn15: TRzBitBtn;
    RzBitBtn16: TRzBitBtn;
    RzBitBtn17: TRzBitBtn;
    RzGroupBar1: TRzGroupBar;
    RzGroup1: TRzGroup;
    MainADOQuery1: TADOQuery;
    MainADOQuery2: TADOQuery;
    RzBitBtn18: TRzBitBtn;
    RzGroupBox3: TRzGroupBox;
    RzLabel3: TRzLabel;
    RzComboBox3: TRzComboBox;
    RzBitBtn19: TRzBitBtn;
    RzBitBtn20: TRzBitBtn;
    RzBitBtn21: TRzBitBtn;
    RzBitBtn23: TRzBitBtn;
    RzBitBtn25: TRzBitBtn;
    RzBitBtn26: TRzBitBtn;
    RzGroupBox4: TRzGroupBox;
    RzLabel4: TRzLabel;
    RzLabel5: TRzLabel;
    RzLabel6: TRzLabel;
    RzListBox1: TRzListBox;
    RzLabel7: TRzLabel;
    PaintBox1: TImage;
    RzLabel8: TRzLabel;
    XPManifest1: TXPManifest;
    procedure RzGroup1Items1Click(Sender: TObject);
    procedure RzGroup1Items0Click(Sender: TObject);
    procedure Iniciar;
    procedure ListarAccounts;
    Procedure ListarCharacters;
    procedure SelecionarAccount;
    procedure SelecionarCharacter;
    procedure SaveAccount(AccountString:String);
    Procedure BlockAccount(AccountString:String);
    procedure SaveCharacter(CharacterString:String);
    Procedure BlockCharacter(CharacterString:String);
    procedure SaveGuild(GuildString:String);
    Procedure RemCharacter(CharacterString:String);
    procedure RemAccount(AccountString:string);
    procedure RemGuild(GuildString:string);
    procedure ListarGuilds;
    procedure SelecionarGuild;
    procedure RzBitBtn1Click(Sender: TObject);
    procedure RzComboBox1Change(Sender: TObject);
    procedure RzBitBtn3Click(Sender: TObject);
    procedure RzBitBtn2Click(Sender: TObject);
    procedure RzBitBtn18Click(Sender: TObject);
    procedure RzBitBtn6Click(Sender: TObject);
    procedure RzBitBtn5Click(Sender: TObject);
    procedure RzBitBtn17Click(Sender: TObject);
    procedure RzBitBtn7Click(Sender: TObject);
    procedure RzBitBtn8Click(Sender: TObject);
    procedure RzBitBtn9Click(Sender: TObject);
    procedure RzComboBox2Change(Sender: TObject);
    procedure RzBitBtn10Click(Sender: TObject);
    procedure RzBitBtn16Click(Sender: TObject);
    procedure RzBitBtn12Click(Sender: TObject);
    procedure RzBitBtn13Click(Sender: TObject);
    procedure RzBitBtn14Click(Sender: TObject);
    procedure RzComboBox3DrawItem(Control: TWinControl; Index: Integer;
      Rect: TRect; State: TOwnerDrawState);
    procedure RzComboBox3MeasureItem(Control: TWinControl; Index: Integer;
      var Height: Integer);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure RzListBox1DrawItem(Control: TWinControl; Index: Integer;
      Rect: TRect; State: TOwnerDrawState);
    procedure RzComboBox3Change(Sender: TObject);
    procedure RzBitBtn19Click(Sender: TObject);
    procedure RzBitBtn21Click(Sender: TObject);
    procedure RzListBox1Click(Sender: TObject);
    procedure RzBitBtn26Click(Sender: TObject);
    procedure RzBitBtn25Click(Sender: TObject);
    procedure RzBitBtn23Click(Sender: TObject);
    procedure RzBitBtn20Click(Sender: TObject);
    procedure RzBitBtn4Click(Sender: TObject);
    procedure RzBitBtn11Click(Sender: TObject);
    procedure RzGroup2Items0Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  MainForm: TMainForm;
  bmp: array of tbitmap;
  GMNum,AsNum,BMNum1,BMNum2,BMNum3:integer;
implementation

{$R *.dfm}
function bytetohex(src: byte): string;   {byte-->hex}
begin
  setlength(result, 2);
  asm
  mov edi, [result]
  mov edi, [edi]
  mov al, src
  mov ah, al // 保存至 ah
  shr al, 4 // 输出高4位
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
function To2Char(const I:integer):string ;   {Int-->2char string}
var
  S:string;
begin
  s:=inttostr(i);
  if length(s)=1 then s:='0'+s;
  result:=s;
end;
function FillHexguild(item:Tfield;cor:Tcolor;tamanho:byte;esp:boolean): tbitmap; {填充某个账户的仓库}
type Tcharset = set of char;
var A:tcharset;
    itemblock:array of byte;
    sWS,sItem:string;
    wsrow,wscol,i,j,c1,c2,c3,c4:integer;
    bmps:tbitmap;
    tam:int64;
begin
  bmps:=tbitmap.create;
  tam:=tamanho;
  bmps.height:=(tam*8)+2;
  bmps.width:=(tam*8)+2;
  a:=['0'..'7'];
  with item do
  begin
    setlength(itemblock,datasize);
    try
      getdata(itemblock);
      i:=2;
      while i<=high(itemblock) do
      begin
        sws:=sws+uppercase(bytetohex(itemblock[i]));
        inc(i);
      end;
      for wscol:=1 to 8 do
      for wsrow:=1 to 8 do
        begin
          sitem:=midstr(sws,8*((wscol)-1)+1*((wsrow)-1)+1,1);
          if (sitem='0') then bmps.Canvas.Pen.Color:=cor;
          if (sitem='1') then bmps.Canvas.Pen.Color:=$000000;
          if (sitem='2') then bmps.Canvas.Pen.Color:=$8c8a8d;
          if (sitem='3') then bmps.Canvas.Pen.Color:=$ffffff;
          if (sitem='4') then bmps.Canvas.Pen.Color:=$0000fe;
          if (sitem='5') then bmps.Canvas.Pen.Color:=$008aff;
          if (sitem='6') then bmps.Canvas.Pen.Color:=$ffff00;
          if (sitem='7') then bmps.Canvas.Pen.Color:=$01FF8D;
          if (sitem='8') then bmps.Canvas.Pen.Color:=$00ff00;
          if (sitem='9') then bmps.Canvas.Pen.Color:=$8CFF01;
          if (sitem='A') then bmps.Canvas.Pen.Color:=$00ffff;
          if (sitem='B') then bmps.Canvas.Pen.Color:=$ff8a00;
          if (sitem='C') then bmps.Canvas.Pen.Color:=$fe0000;
          if (sitem='D') then bmps.Canvas.Pen.Color:=$FF008C;
          if (sitem='E') then bmps.Canvas.Pen.Color:=$ff00fe;
          if (sitem='F') then bmps.Canvas.Pen.Color:=$8C00FF;
          c1:=tam*(wsrow)-tam+1;
          c2:=tam*(wscol)-tam+1;
          c3:=tam*(wsrow);
          c4:=tam*(wscol);
          bmps.Canvas.Rectangle(c1,c2 , c3, c4);
          for j := 0 to tam-1 do
          begin
            c1:=1+tam*(wsrow)-tam;
            c2:=1+tam*(wscol)+j-tam;
            c3:=1+tam*(wsrow);
            c4:=1+tam*(wscol)+j-tam;
            bmps.Canvas.MoveTo(c1, c2);
				   	bmps.Canvas.LineTo(c3,c4 );
          end;

        end;
      bmps.Canvas.Pen.Color:=clblack;
      if esp=true then
      begin
        for j := 1 to tam do
        begin
          c1:=(j*tam-1)+1;
          c2:=1;
          c3:=(j*tam-1)+1;
          c4:=(tam*tam);
          bmps.Canvas.MoveTo(c1, c2);
				 	bmps.Canvas.LineTo(c3,c4 );
        end;
        for j := 1 to tam do
        begin
          c1:=1;
          c2:=(j*tam-1)+1;
          c3:=tam*tam;
          c4:=(j*tam-1)+1;
          bmps.Canvas.MoveTo(c1, c2);
		    	bmps.Canvas.LineTo(c3,c4 );
        end;
      end;
      c1:=0;
      c2:=0*tam;
      c3:=(tam*8)+1;
      c4:=0*tam;
      bmps.Canvas.MoveTo(c1, c2);
			bmps.Canvas.LineTo(c3,c4 );
      c1:=0*tam;
      c2:=0;
      c3:=0*tam;
      c4:=(tam*8)+1;
      bmps.Canvas.MoveTo(c1, c2);
			bmps.Canvas.LineTo(c3,c4 );
      c1:=0;
      c2:=(tam*8)+1;
      c3:=(tam*8)+1;
      c4:=(tam*8)+1;
      bmps.Canvas.MoveTo(c1, c2);
			bmps.Canvas.LineTo(c3,c4 );
      c1:=(tam*8)+1;
      c2:=0;
      c3:=(tam*8)+1;
      c4:=(tam*8)+1;
      bmps.Canvas.MoveTo(c1, c2);
			bmps.Canvas.LineTo(c3,c4 );
      bmps.canvas.pixels[c3,c4]:=clblack;
      result:=bmps;
    except
      on E:exception do application.MessageBox(pchar(e.Message),pchar(mainerrorcaption),mb_ok+mb_iconerror);
    end;
  end;
end;

procedure TMainForm.RzBitBtn10Click(Sender: TObject);
begin
  CharacterSel:=MainForm.RzComboBox2.Text;
  AccountSel:=MainForm.RzComboBox1.Text;
  Echarform.Iniciar;
  Echarform.show;

end;

procedure TMainForm.RzBitBtn11Click(Sender: TObject);
begin
{   Vaultvar.VaultOn:=false;
   // VaultVar.VaultAtual:=0;
    VaultForm.Iniciar;
   // VaultVar.ExtraVaults[255].Edit:=true;

    VaultForm.Enabled:=true;
    VaultForm.Show;   }
end;

procedure TMainForm.RzBitBtn12Click(Sender: TObject);
begin
  FindForm.RzGroupBox1.Caption:=Find;
  FindForm.RzGroupBox2.Caption:=Results;
  FindForm.Caption:=FavoriteTitleCharacters;
  FindForm.RzBitBtn1.Caption:=Okbtn;
  FindForm.RzBitBtn2.Caption:=Cancelbtn;
  FindForm.Remover1.Visible:=true;
  FindForm.Info1.Visible:=true;
  FindForm.Remover1.Caption:=RemFavorites;
  FindForm.Info1.Caption:=InfoFavorites;
  FindForm.Iniciar(cname,cname,character,'CMT Data\CharacterSave.txt',false);
  FindForm.Show;
  Mainform.Enabled:=false;
end;

procedure TMainForm.RzBitBtn13Click(Sender: TObject);
begin
if Mainform.RzComboBox2.Text<>'' then
  begin
    Mainform.SaveCharacter(Mainform.RzComboBox2.Text);
  end else application.MessageBox(pchar(MainError5),pchar(MainErrorCaption));
end;

procedure TMainForm.RzBitBtn14Click(Sender: TObject);
begin
if Mainform.RzComboBox2.Text<>'' then
  begin
    Mainform.BlockCharacter(RzComboBox2.Text);
  end else application.MessageBox(pchar(MainError5),pchar(MainErrorCaption));
end;

procedure TMainForm.RzBitBtn16Click(Sender: TObject);
begin
  FindForm.RzGroupBox1.Caption:=Find;
  FindForm.RzGroupBox2.Caption:=Results;
  FindForm.Caption:=FindTitleAccounts;
  FindForm.RzBitBtn1.Caption:=Okbtn;
  FindForm.RzBitBtn2.Caption:=Cancelbtn;
  FindForm.Remover1.Visible:=false;
  FindForm.Info1.Visible:=false;
  FindForm.Iniciar(cname,cname,character,'',false);
  FindForm.Show;
  Mainform.Enabled:=false;
end;

procedure TMainForm.RzBitBtn17Click(Sender: TObject);
begin
  FindForm.RzGroupBox1.Caption:=Find;
  FindForm.RzGroupBox2.Caption:=Results;
  FindForm.Caption:=FindTitleAccounts;
  FindForm.RzBitBtn1.Caption:=Okbtn;
  FindForm.RzBitBtn2.Caption:=Cancelbtn;
  FindForm.Remover1.Visible:=false;
  FindForm.Info1.Visible:=false;
  FindForm.Iniciar(memb___id,memb___id,Memb_info,'',true);
  FindForm.Show;
  Mainform.Enabled:=false;
end;

procedure TMainForm.RzBitBtn18Click(Sender: TObject);
begin
  ListarAccounts;
end;

procedure TMainForm.RzBitBtn19Click(Sender: TObject);
begin
  NGuildForm.Iniciar;
  NGuildForm.Visible:=True;
end;

procedure TMainForm.RzBitBtn1Click(Sender: TObject);
begin
  AccountSel:='';
  AccountForm.Iniciar(true);
  AccountForm.Show;
  MainForm.enabled:=false;
end;

procedure TMainForm.RzBitBtn20Click(Sender: TObject);
begin
  if RzCombobox3.Text<>'' then
  try
    {Deseja Deletar}
    if application.MessageBox(pchar(MainQuestion3),pchar(programname),mb_yesno+mb_iconquestion)=id_no then exit;
    {Deletar}
    RemGuild(Mainform.RzComboBox3.Text);
  except
    Mainform.MainADOQuery1.Close;
    Mainform.MainADOQuery2.Close;
    application.MessageBox(pchar(MainError13),pchar(MainErrorCaption));
  end
    else application.MessageBox(pchar(MainError2),pchar(MainErrorCaption));
end;
procedure TMainForm.RzBitBtn21Click(Sender: TObject);
begin
  Eguildvar.GuildSave:=RzCombobox3.Text;
  Eguildform.Iniciar;
  Eguildform.Show;
end;

procedure TMainForm.RzBitBtn23Click(Sender: TObject);
begin
  if Mainform.RzComboBox3.Text<>'' then
  begin
    Mainform.SaveGuild(Mainform.RzComboBox3.Text);
  end else application.MessageBox(pchar(MainError12),pchar(MainErrorCaption));
end;

procedure TMainForm.RzBitBtn25Click(Sender: TObject);
begin
  FindForm.RzGroupBox1.Caption:=Find;
  FindForm.RzGroupBox2.Caption:=Results;
  FindForm.Caption:=FavoriteTitleGuilds;
  FindForm.RzBitBtn1.Caption:=Okbtn;
  FindForm.RzBitBtn2.Caption:=Cancelbtn;
  FindForm.Remover1.Visible:=true;
  FindForm.Info1.Visible:=true;
  FindForm.Remover1.Caption:=RemFavorites;
  FindForm.Info1.Caption:=InfoFavorites;
  FindForm.Iniciar(G_Name,G_Name,Guild,'CMT Data\GuildSave.txt',false);
  FindForm.Show;
  Mainform.Enabled:=false;
end;

procedure TMainForm.RzBitBtn26Click(Sender: TObject);
begin
  FindForm.RzGroupBox1.Caption:=Find;
  FindForm.RzGroupBox2.Caption:=Results;
  FindForm.Caption:=FindTitleGuilds;
  FindForm.RzBitBtn1.Caption:=Okbtn;
  FindForm.RzBitBtn2.Caption:=Cancelbtn;
  FindForm.Remover1.Visible:=false;
  FindForm.Info1.Visible:=false;
  FindForm.Iniciar(G_Name,G_Name,Guild,'',false);
  FindForm.Show;
  Mainform.Enabled:=false;
end;

procedure TMainForm.RzBitBtn2Click(Sender: TObject);
begin
  if RzCombobox1.Text<>'' then
  try
    {Deseja Deletar}
    if application.MessageBox(pchar(MainQuestion1),pchar(programname),mb_yesno+mb_iconquestion)=id_no then exit;
    {Deletar}
    RemAccount(RzCombobox1.Text);
  except
    Mainform.MainADOQuery1.Close;
    Mainform.MainADOQuery2.Close;
    application.MessageBox(pchar(MainError1),pchar(MainErrorCaption));
  end
    else application.MessageBox(pchar(MainError2),pchar(MainErrorCaption));
end;

procedure TMainForm.RzBitBtn3Click(Sender: TObject);
begin
  AccountSel:=MainForm.RzComboBox1.Text;
  AccountForm.Iniciar(False);
  AccountForm.Show;
  MainForm.enabled:=false;
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
   // setlength(vaultvar.extravaults,MultiVaultTotal)
    VaultForm.RzTabControl1.Tabs.Clear;
    VaultForm.RzTabControl1.Tabs.Add.Caption:=('Vault');
    for I := 1 to MultiVaultTotal do
    begin
      VaultForm.RzTabControl1.Tabs.Add.Caption:=('Vault'+to2char(i));
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



procedure TMainForm.RzBitBtn5Click(Sender: TObject);
begin
  if Mainform.RzComboBox1.Text<>'' then
  begin
    Mainform.SaveAccount(Mainform.RzComboBox1.Text);
  end else application.MessageBox(pchar(MainError2),pchar(MainErrorCaption));
end;

procedure TMainForm.RzBitBtn6Click(Sender: TObject);
begin
if Mainform.RzComboBox1.Text<>'' then
  begin
    BlockAccount(RzComboBox1.Text);
  end else application.MessageBox(pchar(MainError2),pchar(MainErrorCaption));
end;

procedure TMainForm.RzBitBtn7Click(Sender: TObject);
begin
  FindForm.RzGroupBox1.Caption:=Find;
  FindForm.RzGroupBox2.Caption:=Results;
  FindForm.Caption:=FavoriteTitleAccounts;
  FindForm.RzBitBtn1.Caption:=Okbtn;
  FindForm.RzBitBtn2.Caption:=Cancelbtn;
  FindForm.Remover1.Visible:=true;
  FindForm.Info1.Visible:=true;
  FindForm.Remover1.Caption:=RemFavorites;
  FindForm.Info1.Caption:=InfoFavorites;
  FindForm.Iniciar(memb___id,memb___id,Memb_info,'CMT Data\AccountSave.txt',true);
  FindForm.Show;
  Mainform.Enabled:=false;
end;

procedure TMainForm.RzBitBtn8Click(Sender: TObject);
begin
  AccountSel:=Mainform.RzCombobox1.Text;
  NCharForm.Iniciar;
  NCharForm.Show;
  Mainform.Enabled:=False;
end;

procedure TMainForm.RzBitBtn9Click(Sender: TObject);
begin
if RzCombobox2.Text<>'' then
  try
    {Deseja Deletar}
    if application.MessageBox(pchar(MainQuestion2),pchar(programname),mb_yesno+mb_iconquestion)=id_no then exit;
    {Deletar}
    RemCharacter(RzCombobox2.Text);
    ListarCharacters;
  except
    Mainform.MainADOQuery1.Close;
    Mainform.MainADOQuery2.Close;
    application.MessageBox(pchar(MainError4),pchar(MainErrorCaption));
  end
    else application.MessageBox(pchar(MainError5),pchar(MainErrorCaption));
end;

procedure TMainForm.RzComboBox1Change(Sender: TObject);
begin
  SelecionarAccount;
end;

procedure TMainForm.RzComboBox2Change(Sender: TObject);
begin
  if MainForm.RzComboBox2.Text<>'' then
    SelecionarCharacter;
end;

procedure TMainForm.RzComboBox3Change(Sender: TObject);
begin
  Mainform.SelecionarGuild;
end;

procedure TMainForm.RzComboBox3DrawItem(Control: TWinControl; Index: Integer;
  Rect: TRect; State: TOwnerDrawState);

var
  Bitmap: TBitmap;
  Offset: Integer;
begin
  with (Control as TRzComboBox).Canvas do
  begin
    FillRect(Rect); Bitmap:= TBitmap(Mainform.RzComboBox3.Items.Objects[index]);
    if Bitmap<>nil then
    begin
      BrushCopy(Bounds(Rect.Left + 4, Rect.Top + 4, Bitmap.Width,
      Bitmap.Height), Bitmap, Bounds(0, 0, Bitmap.Width, Bitmap.Height), clRed);
      Offset:= Bitmap.width + 8;
    end
      else Offset:=41;
    TextOut(Rect.Left + Offset, Rect.Top+13, Mainform.RzComboBox3.Items[index]);
  end;
end;

procedure TMainForm.RzComboBox3MeasureItem(Control: TWinControl; Index: Integer;
  var Height: Integer);
begin
  Height:=41;
end;

procedure TMainForm.RzGroup1Items0Click(Sender: TObject);
begin
  Mainform.ACpanel.Visible:=true;
  Mainform.GPanel.Visible:=false;
  //.MdbTable.Visible:=false;
end;

procedure TMainForm.RzGroup1Items1Click(Sender: TObject);
begin
  Mainform.ACpanel.Visible:=false;
  Mainform.GPanel.Visible:=true;
//  Mainform.MdbTable.Visible:=false;
end;

procedure TMainForm.RzGroup2Items0Click(Sender: TObject);
begin
  Mainform.ACpanel.Visible:=false;
  Mainform.GPanel.Visible:=false;
 // Mainform.MdbTable.Visible:=True;
end;

procedure TMainForm.RzListBox1Click(Sender: TObject);
begin
  if MainForm.RzListBox1.ItemIndex=Gmnum then
  begin
    MainForm.RzLabel8.Color := $00FF8A00;
    MainForm.RzLabel8.Caption:= EGuildMaster;
  end
    else if MainForm.RzListBox1.ItemIndex=Asnum then
    begin
      MainForm.RzLabel8.Color := $008CFF01;
      MainForm.RzLabel8.Caption:= EGuildAssistent;
    end
      else if (MainForm.RzListBox1.ItemIndex=BMnum1) or (MainForm.RzListBox1.ItemIndex=BMnum2) or (MainForm.RzListBox1.ItemIndex=BMnum3) then
      begin
        MainForm.RzLabel8.Color :=clYellow;
        MainForm.RzLabel8.Caption:= EGuildBattle;
      end
        else begin
          MainForm.RzLabel8.Color :=clSilver;
          MainForm.RzLabel8.Caption:= EGuildNormal;
        end;
end;

procedure TMainForm.RzListBox1DrawItem(Control: TWinControl; Index: Integer;
  Rect: TRect; State: TOwnerDrawState);
var
  myColor: TColor;
  myBrush: TBrush;
begin
  myBrush := TBrush.Create;
  with (Control as TrzListBox).Canvas do
  begin
    if index=Gmnum then myColor := $00FF8A00
      else if index=Asnum then myColor := $008CFF01
        else if (index=BMnum1) or (index=BMnum2) or (index=BMnum3)  then myColor :=clYellow
          else mycolor :=clSilver;
    myBrush.Style := bsSolid;
    myBrush.Color := myColor;
    Windows.FillRect(handle, Rect, myBrush.Handle);
    Brush.Style := bsClear;
    TextOut(Rect.Left+15, Rect.Top,(Control as TrzListBox).Items[Index]);
    Pen.Color:=clgreen;
    myBrush.Color := clwhite;
    Windows.FillRect(handle, Bounds(Rect.Left, Rect.Top, 13, 13), myBrush.Handle);
    MyBrush.Free;
    Pen.Color:=clblack;
    Ellipse(3,rect.Top+3,10,rect.Top+10);


    Pen.Color:=clwhite;
    if EGuildVar.OldIndex<>-1 then
    begin
      Ellipse(4,EGuildVar.OldIndex+4,9,EGuildVar.OldIndex+9);
      Ellipse(5,EGuildVar.OldIndex+5,8,EGuildVar.OldIndex+8);
      Ellipse(6,EGuildVar.OldIndex+6,7,EGuildVar.OldIndex+7);
      Pixels[5,EGuildVar.OldIndex+5]:=Pen.Color;
      Pixels[5,EGuildVar.OldIndex+7]:=Pen.Color;
      Pixels[6,EGuildVar.OldIndex+6]:=Pen.Color;
      Pixels[7,EGuildVar.OldIndex+5]:=Pen.Color;
      Pixels[7,EGuildVar.OldIndex+7]:=Pen.Color;
    end;
    
    Pen.Color:=myColor;
    Ellipse(rect.Left+4,rect.Top+4,rect.Left+9,rect.Top+9);
    Ellipse(rect.Left+5,rect.Top+5,rect.Left+8,rect.Top+8);
    Ellipse(rect.Left+6,rect.Top+6,rect.Left+7,rect.Top+7);
    Pixels[rect.Left+5,rect.Top+5]:=Pen.Color;
    Pixels[rect.Left+5,rect.Top+7]:=Pen.Color;
    Pixels[rect.Left+6,rect.Top+6]:=Pen.Color;
    Pixels[rect.Left+7,rect.Top+5]:=Pen.Color;
    Pixels[rect.Left+7,rect.Top+7]:=Pen.Color;

    Pen.Color:=clblack;
    MoveTo(rect.Left+1,1+Rect.Top);
    LineTo(rect.Left+1,11+Rect.Top);
    LineTo(rect.Left+11,11+Rect.Top);
    LineTo(rect.Left+11,1+Rect.Top);
    LineTo(rect.Left+1,1+Rect.Top);
    EGuildVar.OldIndex:=Rect.Top;
  end;

end;

procedure TMainForm.FormClose(Sender: TObject; var Action: TCloseAction);
var
  i: Integer;
begin
  for I := 0 to maxguilds-1 do
    bmp[i].free;
  varform.adotable1.Close;

   application.FreeOnRelease;
end;

procedure TMainForm.SaveAccount(AccountString:String);
var
  filename : string;
  f : textfile;
  ch : char;
  esc: boolean;
  g:string;
  s:array[1..1000] of string;
  i,j:integer;
  b:boolean;
begin
  try
    filename:=ExtractFilePath(Application.ExeName)+'CMT Data\AccountSave.txt';
    assignfile(F,filename);
    if fileexists('CMT Data\AccountSave.txt') then
    begin
      reset(F);
      i:=0; j:=0; esc:=false;
      while not eof(F) do
      begin
        read(F,ch);
        Case ch of
          '"'  :  begin
                    if esc=false then esc:=true
                      else begin
                        esc:=false;
                        inc(i);
                        j:=i;
                        s[i]:=g;
                        g:='';
                      end;
                  end;
             else begin
                    if esc=true then g:=g+ch;
                  end;
        end;
      end;
    end;
    b:=false;
    if s[1]<>'' then
      for i:=1 to j do
        if s[i]=AccountString then b:=true;
    if b=false then
    begin
      Rewrite(F);
      if s[1]<>'' then
        for i:=1 to j do
          writeln(F,PChar('"'+s[i]+'"'));
      writeln(F,PChar('"'+AccountString+'"'));
    end;
    closefile(F);
    application.MessageBox(pchar(format(MainConfirm3,[Mainform.RzComboBox1.Text])),pchar(Programname));
  except
    closefile(F);
    application.MessageBox(pchar(MainError8),pchar(MainErrorCaption));
  end;
end;

Procedure TMainForm.BlockAccount(AccountString:String);
var
  i , j : integer;
begin
  try
    Mainform.MainADOQuery1.SQL.Clear;
    Mainform.MainADOQuery1.SQL.Add('select '+ctl1_code+' from '+memb_info+' where '+memb___id+'='''+AccountString+'''');
    Mainform.MainADOQuery1.Open;
    i:=Mainform.MainADOQuery1.Fields[0].AsInteger;
    Mainform.MainADOQuery1.Close;
    Mainform.MainADOQuery1.SQL.Clear;
    if i=1 then j:=0;
    if i=0 then j:=1;
    Mainform.MainADOQuery1.SQL.add('update '+memb_info+' set '+ctl1_code+'='+inttostr(j)+' where '+memb___id+'='''+AccountString+'''');
    Mainform.MainADOQuery1.ExecSQL;
    if i=0 then application.MessageBox(pchar(format(MainConfirm1,[AccountString])),pchar(Programname));
    if i=1 then application.MessageBox(pchar(format(MainConfirm2,[AccountString])),pchar(Programname));
    Mainform.SelecionarAccount;
  except
    Mainform.MainADOQuery1.Close;
    application.MessageBox(pchar(MainError7),pchar(MainErrorCaption));
  end;
end;

procedure TMainForm.SaveCharacter(CharacterString:String);
var
  filename : string;
  f : textfile;
  ch : char;
  esc: boolean;
  g:string;
  s:array[1..1000] of string;
  i,j:integer;
  b:boolean;
begin
  try
    filename:=ExtractFilePath(Application.ExeName)+'CMT Data\CharacterSave.txt';
    assignfile(F,filename);
    if fileexists('CMT Data\CharacterSave.txt') then
    begin
      reset(F);
      i:=0; j:=0; esc:=false;
      while not eof(F) do
      begin
        read(F,ch);
        Case ch of
          '"'  :  begin
                    if esc=false then esc:=true
                      else begin
                        esc:=false;
                        inc(i);
                        j:=i;
                        s[i]:=g;
                        g:='';
                      end;
                  end;
             else begin
                    if esc=true then g:=g+ch;
                  end;
        end;
      end;
    end;
    b:=false;
    if s[1]<>'' then
      for i:=1 to j do
        if s[i]=CharacterString then b:=true;
    if b=false then
    begin
      Rewrite(F);
      if s[1]<>'' then
        for i:=1 to j do
          writeln(F,PChar('"'+s[i]+'"'));
      writeln(F,PChar('"'+CharacterString+'"'));
    end;
    closefile(F);
    application.MessageBox(pchar(format(MainConfirm6,[Mainform.RzComboBox1.Text])),pchar(Programname));
  except
    closefile(F);
    application.MessageBox(pchar(MainError9),pchar(MainErrorCaption));
  end;
end;

Procedure TMainForm.BlockCharacter(CharacterString:String);
var
  i , j : integer;
begin
  try
    Mainform.MainADOQuery2.SQL.Clear;
    Mainform.MainADOQuery2.SQL.Add('select '+ctlcode+' from '+character+' where '+cname+'='''+CharacterString+'''');
    Mainform.MainADOQuery2.Open;
    i:=Mainform.MainADOQuery2.Fields[0].AsInteger;
    Mainform.MainADOQuery2.Close;
    Mainform.MainADOQuery2.SQL.Clear;
    if i=1 then j:=0
      else j:=1;
    Mainform.MainADOQuery2.SQL.add('update '+character+' set '+ctlcode+'='+inttostr(j)+' where '+cname+'='''+CharacterString+'''');
    Mainform.MainADOQuery2.ExecSQL;
    if i=0 then application.MessageBox(pchar(format(MainConfirm4,[CharacterString])),pchar(Programname));
    if i=1 then application.MessageBox(pchar(format(MainConfirm5,[CharacterString])),pchar(Programname));
    Mainform.SelecionarAccount;
  except
    Mainform.MainADOQuery2.Close;
    application.MessageBox(pchar(MainError10),pchar(MainErrorCaption));
  end;
end;

procedure TMainForm.SaveGuild(GuildString:String);
var
  filename : string;
  f : textfile;
  ch : char;
  esc: boolean;
  g:string;
  s:array[1..1000] of string;
  i,j:integer;
  b:boolean;
begin
  try
    filename:=ExtractFilePath(Application.ExeName)+'CMT Data\GuildSave.txt';
    assignfile(F,filename);
    if fileexists('CMT Data\GuildSave.txt') then
    begin
      reset(F);
      i:=0; j:=0; esc:=false;
      while not eof(F) do
      begin
        read(F,ch);
        Case ch of
          '"'  :  begin
                    if esc=false then esc:=true
                      else begin
                        esc:=false;
                        inc(i);
                        j:=i;
                        s[i]:=g;
                        g:='';
                      end;
                  end;
             else begin
                    if esc=true then g:=g+ch;
                  end;
        end;
      end;
    end;
    b:=false;
    if s[1]<>'' then
      for i:=1 to j do
        if s[i]=GuildString then b:=true;
    if b=false then
    begin
      Rewrite(F);
      if s[1]<>'' then
        for i:=1 to j do
          writeln(F,PChar('"'+s[i]+'"'));
      writeln(F,PChar('"'+GuildString+'"'));
    end;
    closefile(F);
    application.MessageBox(pchar(format(MainConfirm7,[GuildString])),pchar(Programname));
  except
    closefile(F);
    application.MessageBox(pchar(MainError11),pchar(MainErrorCaption));
  end;
end;

Procedure TMainForm.RemCharacter(CharacterString:String);
var
  filename , g , FriendGuids , TempChar , TempChar2 : String;
  f : TextFile;
  z , j , x , CurrentStatus : Integer;
  ch : Char;
  esc  : boolean;
  s : Array[1..1000] of String;
begin
  try
    {Lista de Amigos}
    if (versao='CMT') or (versao='WZ') then
    begin
      Mainform.MainADOQuery2.SQL.Clear;
      Mainform.MainADOQuery2.SQL.Add('SELECT '+guid);
      Mainform.MainADOQuery2.SQL.Add('FROM '+T_FriendMain);
      Mainform.MainADOQuery2.SQL.Add('WHERE '+name4+'='''+CharacterString+'''');
      Mainform.MainADOQuery2.Open;
      FriendGuids:=Mainform.MainADOQuery2.Fields[0].AsString;
      Mainform.MainADOQuery2.close;
      Mainform.MainADOQuery2.SQL.Clear;
      Mainform.MainADOQuery2.SQL.Add('DELETE FROM '+T_FriendList);
      Mainform.MainADOQuery2.SQL.Add('WHERE '+guid2+'='''+FriendGuids+'''');

      Mainform.MainADOQuery2.SQL.Add('DELETE FROM '+T_FriendMail);
      Mainform.MainADOQuery2.SQL.Add('WHERE '+friendname+'='''+CharacterString+'''');

      Mainform.MainADOQuery2.SQL.Add('DELETE FROM '+T_WaitFriend);
      Mainform.MainADOQuery2.SQL.Add('WHERE '+guid4+'='''+FriendGuids+'''');
      Mainform.MainADOQuery2.ExecSQL;
    end;
    {Favoritos}
    if fileexists('CMT Data\CharacterSave.txt') then
    begin
      filename:=ExtractFilePath(Application.ExeName)+'CMT Data\CharacterSave.txt';
      assignfile(F,filename);
      reset(F);
      z:=0; j:=0; x:=0; esc:=false;
      while not eof(F) do
      begin
        read(F,ch);
        Case ch of
          '"'  :  begin
                    if esc=false then esc:=true
                      else begin
                        esc:=false;
                        inc(z);
                        j:=z;
                        if (g<>CharacterString) then
                          s[z]:=g
                            else x:=j;
                        g:='';
                      end;
                  end;
             else begin
                    if esc=true then g:=g+ch;
                  end;
        end;
      end;
      Rewrite(F);
      for z:=1 to j do
        if z<>x then
          writeln(F,PChar('"'+s[z]+'"'));
      closefile(f);
    end;
    {Selecionar Guild}
    TempChar:='';
    TempChar2:='';
    Mainform.MainADOQuery2.SQL.Clear;
    Mainform.MainADOQuery2.SQL.Add('SELECT '+G_Name);
    Mainform.MainADOQuery2.SQL.Add('FROM '+Guild);
    Mainform.MainADOQuery2.SQL.Add('WHERE '+G_Master+'='''+CharacterString+'''');
    Mainform.MainADOQuery2.Open;
    if not ((Mainform.MainADOQuery2.Bof) and (Mainform.MainADOQuery2.Eof)) then
    begin
      TempChar:=Mainform.MainADOQuery2.Fields[0].AsString;
    end;
    Mainform.MainADOQuery2.Close;
    Mainform.MainADOQuery2.SQL.Clear;
    if TempChar<>'' then
    begin
      {Selecionar novo sistema de Guilds}
      if (versao='CMT') or (versao='WZ') then
      begin
        CurrentStatus:=0;
        Mainform.MainADOQuery2.SQL.Add('SELECT '+Name2+','+G_Status);
        Mainform.MainADOQuery2.SQL.Add('FROM '+guildmember);
        Mainform.MainADOQuery2.SQL.Add('WHERE '+G_name2+'='''+tempchar+'''');
        Mainform.MainADOQuery2.Open;
        while not(Mainform.MainADOQuery2.Eof) do
        begin
          if (Mainform.MainADOQuery2.Fields[1].AsInteger>=CurrentStatus) and (Mainform.MainADOQuery2.Fields[0].AsString<>CharacterString) then
            TempChar2:=Mainform.MainADOQuery2.Fields[0].AsString;
          Mainform.MainADOQuery2.Next;
        end;
        Mainform.MainADOQuery2.Close;
      end
        else begin
          {Selecionar velho sistema de Guilds}
          Mainform.MainADOQuery2.SQL.Add('SELECT '+Name2);
          Mainform.MainADOQuery2.SQL.Add('FROM '+guildmember);
          Mainform.MainADOQuery2.SQL.Add('WHERE '+G_name2+'='''+tempchar+'''');
          Mainform.MainADOQuery2.Open;
          while not(Mainform.MainADOQuery2.Eof) do
          begin
            if (Mainform.MainADOQuery2.Fields[0].AsString<>CharacterString) then
              TempChar2:=Mainform.MainADOQuery2.Fields[0].AsString;
            Mainform.MainADOQuery2.Next;
          end;
          Mainform.MainADOQuery2.Close;
        end;
      Mainform.MainADOQuery2.SQL.Clear;
      Mainform.MainADOQuery2.SQL.Add('DELETE FROM '+GuildMember);
      Mainform.MainADOQuery2.SQL.Add('WHERE '+Name2+'='''+CharacterString+'''');

      Mainform.MainADOQuery2.SQL.Add('UPDATE '+Guild);
      Mainform.MainADOQuery2.SQL.Add('SET '+G_Master+'='''+tempchar2+'''');
      Mainform.MainADOQuery2.SQL.Add('WHERE '+G_Name+'='''+tempchar+'''');
    end;
    Mainform.MainADOQuery2.SQL.Add('UPDATE '+AccountCharacter);
    Mainform.MainADOQuery2.SQL.Add('SET '+gameid1+'=NULL');
    Mainform.MainADOQuery2.SQL.Add('WHERE '+gameid1+'='''+CharacterString+'''');

    Mainform.MainADOQuery2.SQL.Add('UPDATE '+AccountCharacter);
    Mainform.MainADOQuery2.SQL.Add('SET '+gameid2+'=NULL');
    Mainform.MainADOQuery2.SQL.Add('WHERE '+gameid2+'='''+CharacterString+'''');

    Mainform.MainADOQuery2.SQL.Add('UPDATE '+AccountCharacter);
    Mainform.MainADOQuery2.SQL.Add('SET '+gameid3+'=NULL');
    Mainform.MainADOQuery2.SQL.Add('WHERE '+gameid3+'='''+CharacterString+'''');

    Mainform.MainADOQuery2.SQL.Add('UPDATE '+AccountCharacter);
    Mainform.MainADOQuery2.SQL.Add('SET '+gameid4+'=NULL');
    Mainform.MainADOQuery2.SQL.Add('WHERE '+gameid4+'='''+CharacterString+'''');

    Mainform.MainADOQuery2.SQL.Add('UPDATE '+AccountCharacter);
    Mainform.MainADOQuery2.SQL.Add('SET '+gameid5+'=NULL');
    Mainform.MainADOQuery2.SQL.Add('WHERE '+gameid5+'='''+CharacterString+'''');

    Mainform.MainADOQuery2.SQL.Add('DELETE FROM '+Character);
    Mainform.MainADOQuery2.SQL.Add('WHERE '+CName+'='''+CharacterString+'''');

    Mainform.MainADOQuery2.SQL.Add('DELETE FROM '+OptionData);
    Mainform.MainADOQuery2.SQL.Add('WHERE '+Name3+'='''+CharacterString+'''');
    Mainform.MainADOQuery2.ExecSQL;
  except
    Mainform.MainADOQuery1.Close;
    Mainform.MainADOQuery2.Close;
    application.MessageBox(pchar(MainError4),pchar(MainErrorCaption));
  end;
end;

procedure TMainForm.RemAccount(AccountString:string);
var
  filename , g : String;
  f : TextFile;
  z , j , x , i  : Integer;
  ch : Char;
  esc , RemChar : boolean;
  s : Array[1..1000] of String;
  Acharacter : Array[0..4] of String;
begin
  try
    {Favoritos}
    if fileexists('CMT Data\AccountSave.txt') then
    begin
      filename:=ExtractFilePath(Application.ExeName) + 'CMT Data\AccountSave.txt';
      assignfile(F,filename);
      reset(F);
      z:=0; j:=0; x:=0; esc:=false;
      while not eof(F) do
      begin
        read(F,ch);
        Case ch of
          '"'  :  begin
                    if esc=false then esc:=true
                      else begin
                        esc:=false;
                        inc(z);
                        j:=z;
                        if (g<>AccountString) then
                          s[z]:=g
                            else x:=j;
                        g:='';
                      end;
                  end;
             else begin
                    if esc=true then g:=g+ch;
                  end;
        end;
      end;
      Rewrite(F);
      for z:=1 to j do
        if z<>x then
          writeln(F,PChar('"'+s[z]+'"'));
      closefile(f);
    end;
    {Pegar Guid}
    Mainform.MainADOQuery1.SQL.Clear;
    Mainform.MainADOQuery1.SQL.Add('SELECT '+memb_guid);
    Mainform.MainADOQuery1.SQL.Add('FROM '+memb_info);
    Mainform.MainADOQuery1.SQL.Add('WHERE '+memb___ID+'='''+AccountString+'''');
    Mainform.MainADOQuery1.Open;
    guid:=Mainform.MainADOQuery1.Fields[0].AsString;
    Mainform.MainADOQuery1.Close;
    {Deletar Account}
    Mainform.MainADOQuery1.SQL.Clear;
    Mainform.MainADOQuery1.SQL.Add('delete from '+memb_deta+' where '+memb_guid3+'='+guid+'');
    Mainform.MainADOQuery1.SQL.Add('delete from '+memb_info+' where '+memb___ID+'='''+AccountString+'''');
    Mainform.MainADOQuery1.SQL.Add('delete from '+memb_stat+' where '+memb___ID3+'='''+AccountString+'''') ;
    Mainform.MainADOQuery1.ExecSQL;
    {Selecionar Character}
    Mainform.MainADOQuery2.SQL.Clear;
    Mainform.MainADOQuery2.SQL.Add('SELECT '+GameID1+','+GameID2+', '+GameID3+','+GameID4+','+GameID5);
    Mainform.MainADOQuery2.SQL.Add('FROM '+AccountCharacter);
    Mainform.MainADOQuery2.SQL.Add('WHERE '+Id+'='''+AccountString+'''');
    Mainform.MainADOQuery2.Open;
    RemChar:=false;
    if not ((Mainform.MainADOQuery2.Bof) and (Mainform.MainADOQuery2.Eof)) then
    begin
      RemChar:=true;
      Acharacter[0]:=Mainform.MainADOQuery2.Fields[0].AsString;
      Acharacter[1]:=Mainform.MainADOQuery2.Fields[1].AsString;
      Acharacter[2]:=Mainform.MainADOQuery2.Fields[2].AsString;
      Acharacter[3]:=Mainform.MainADOQuery2.Fields[3].AsString;
      Acharacter[4]:=Mainform.MainADOQuery2.Fields[4].AsString;
    end;
    Mainform.MainADOQuery2.Close;
    {Remover Character}
    if remchar=true then
      for i:=0 to 4 do
      begin
        RemCharacter(Acharacter[i]);
      end;
    Mainform.MainADOQuery2.SQL.Clear;
    Mainform.MainADOQuery2.SQL.Add('Delete from '+AccountCharacter+' where '+Id+'='''+AccountString+'''');
    Mainform.MainADOQuery2.SQL.Add('Delete from '+Character+' where '+AccountId+'='''+AccountString+'''');
    Mainform.MainADOQuery2.SQL.Add('Delete from '+Warehouse+' where '+AccountId2+'='''+AccountString+'''');
    Mainform.MainADOQuery2.ExecSQL;
    MainForm.ListarAccounts;
  except
    Mainform.MainADOQuery1.Close;
    Mainform.MainADOQuery2.Close;
    application.MessageBox(pchar(MainError1),pchar(MainErrorCaption));
  end
end;

procedure TMainForm.RemGuild(GuildString:string);
var
  filename , g : String;
  f : TextFile;
  z , j , x , i  : Integer;
  ch : Char;
  esc , RemChar : boolean;
  s : Array[1..1000] of String;
begin
  try
    {Favoritos}
    if fileexists('CMT Data\GuildSave.txt') then
    begin
      filename:=ExtractFilePath(Application.ExeName) + 'CMT Data\GuildSave.txt';
      assignfile(F,filename);
      reset(F);
      z:=0; j:=0; x:=0; esc:=false;
      while not eof(F) do
      begin
        read(F,ch);
        Case ch of
          '"'  :  begin
                    if esc=false then esc:=true
                      else begin
                        esc:=false;
                        inc(z);
                        j:=z;
                        if (g<>GuildString) then
                          s[z]:=g
                            else x:=j;
                        g:='';
                      end;
                  end;
             else begin
                    if esc=true then g:=g+ch;
                  end;
        end;
      end;
      Rewrite(F);
      for z:=1 to j do
        if z<>x then
          writeln(F,PChar('"'+s[z]+'"'));
      closefile(f);
    end;
    Mainform.MainADOQuery2.SQL.Add('delete from '+guildmember+' where '+G_name2+'='''+guildstring+'''');
    Mainform.MainADOQuery2.ExecSQL;
    Mainform.MainADOQuery2.SQL.Clear;
    Mainform.MainADOQuery2.SQL.Add('delete from '+guild+' where '+G_name+'='''+guildstring+'''');
    Mainform.MainADOQuery2.ExecSQL;

    MainForm.ListarGuilds;
  except
    Mainform.MainADOQuery1.Close;
    Mainform.MainADOQuery2.Close;
    application.MessageBox(pchar(MainError13),pchar(MainErrorCaption));
  end;
end;

procedure TMainForm.SelecionarAccount;
begin
  Mainform.RzBitBtn2.Enabled:=True;
  Mainform.RzBitBtn3.Enabled:=True;
  Mainform.RzBitBtn4.Enabled:=True;
  Mainform.RzBitBtn5.Enabled:=True;
  Mainform.RzBitBtn6.Enabled:=True;
  Mainform.ListarCharacters;
end;

procedure TMainForm.SelecionarCharacter;
begin
  MainForm.RzBitBtn9.Enabled:=True;
  MainForm.RzBitBtn10.Enabled:=True;
  MainForm.RzBitBtn11.Enabled:=True;
  MainForm.RzBitBtn15.Enabled:=false;
  MainForm.RzBitBtn14.Enabled:=True;
  MainForm.RzBitBtn13.Enabled:=True;

end;

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
  Mainform.RzBitBtn2.Enabled:=False;
  Mainform.RzBitBtn3.Enabled:=False;
  Mainform.RzBitBtn4.Enabled:=False;
  Mainform.RzBitBtn5.Enabled:=False;
  Mainform.RzBitBtn6.Enabled:=False;
  Mainform.RzBitBtn8.Enabled:=False;
  Mainform.RzBitBtn9.Enabled:=False;
  Mainform.RzBitBtn10.Enabled:=False;
  Mainform.RzBitBtn11.Enabled:=False;
  Mainform.RzBitBtn13.Enabled:=False;
  Mainform.RzBitBtn14.Enabled:=False;
  Mainform.RzBitBtn15.Enabled:=False;
end;

Procedure TMainForm.ListarCharacters;
var
  i , numchar : integer;
begin
  MainForm.RzComboBox2.Items.clear;
  MainForm.MainADOQuery2.SQL.Clear;
  MainForm.MainADOQuery2.SQL.Add('Select '+GameID1+','+GameID2+', '+GameID3+','+GameID4+','+GameID5+' from '+AccountCharacter+' where '+Id+'='''+MainForm.RzComboBox1.Text+'''');
  MainForm.MainADOQuery2.Open;
  if not ((MainForm.MainADOQuery2.Bof) and (MainForm.MainADOQuery2.Eof)) then
  begin
    numchar:=0;
    for I := 0 to 4 do
      if MainForm.MainADOQuery2.Fields[i].AsString<>'' then inc(numchar);

    if MainForm.MainADOQuery2.Fields[0].AsString<>'' then MainForm.RzComboBox2.Items.Add(MainForm.MainADOQuery2.Fields[0].AsString);
    if MainForm.MainADOQuery2.Fields[1].AsString<>'' then MainForm.RzComboBox2.Items.Add(MainForm.MainADOQuery2.Fields[1].AsString);
    if MainForm.MainADOQuery2.Fields[2].AsString<>'' then MainForm.RzComboBox2.Items.Add(MainForm.MainADOQuery2.Fields[2].AsString);
    if MainForm.MainADOQuery2.Fields[3].AsString<>'' then MainForm.RzComboBox2.Items.Add(MainForm.MainADOQuery2.Fields[3].AsString);
    if MainForm.MainADOQuery2.Fields[4].AsString<>'' then MainForm.RzComboBox2.Items.Add(MainForm.MainADOQuery2.Fields[4].AsString);
  end;
  MainForm.MainADOQuery2.Close;
  MainForm.RzBitBtn9.Enabled:=false;
  MainForm.RzBitBtn10.Enabled:=false;
  MainForm.RzBitBtn11.Enabled:=false;
  MainForm.RzBitBtn15.Enabled:=false;
  MainForm.RzBitBtn14.Enabled:=false;
  MainForm.RzBitBtn13.Enabled:=false;
  if numchar=5 then MainForm.RzBitBtn8.Enabled:=false
    else MainForm.RzBitBtn8.Enabled:=true;
end;

procedure TMainForm.ListarGuilds;
var
  i , j , wsrow , wscol:integer;
begin
  Mainform.RzComboBox3.Items.clear;
  Mainform.MainADOQuery2.SQL.Clear;
  Mainform.MainADOQuery2.SQL.Add('select '+G_name+','+G_mark+' from '+guild+'');
  Mainform.MainADOQuery2.Open;
  if not  ((Mainform.MainADOQuery2.Eof) and (Mainform.MainADOQuery2.Bof)) then
    for i:=0 to Mainform.MainADOQuery2.RecordCount-1 do
    begin
      bmp[i]:=FillHexguild(Mainform.MainADOQuery2.fields[1],$00C56A31,4,false);
      Mainform.RzComboBox3.Items.AddObject(Mainform.MainADOQuery2.Fields[0].asstring,bmp[i]);
      Mainform.MainADOQuery2.Next;
    end;
  Mainform.MainADOQuery2.Close;
  Mainform.RzComboBox3.text:='';
  Mainform.RzComboBox3.ItemIndex:=-1;
  Mainform.RzLabel4.caption:=Format(GuildMaster,['']);
  Mainform.RzLabel5.caption:=Format(GuildScore,['']);
  for wsrow:=1 to 8 do
  for wscol:=1 to 8 do
    begin
      Mainform.Paintbox1.Canvas.Pen.Color:=clBtnFace;
      Mainform.Paintbox1.Canvas.Rectangle(8*(wsrow)-8, 8*(wscol)-8, 8*(wsrow), 8*(wscol));
      for j := 1 to 7 do
      begin
        Mainform.Paintbox1.Canvas.MoveTo(8*(wsrow)-8, 8*(wscol)+j-8);
      	Mainform.Paintbox1.Canvas.LineTo(8*(wsrow), 8*(wscol)+j-8);
      end;
      Mainform.Paintbox1.Canvas.MoveTo(64, 0);
      Mainform.Paintbox1.Canvas.LineTo(64, 65);
      Mainform.Paintbox1.Canvas.MoveTo(0, 64);
      Mainform.Paintbox1.Canvas.LineTo(65, 64);
      Mainform.Paintbox1.Canvas.MoveTo(65, 0);
      Mainform.Paintbox1.Canvas.LineTo(65, 65);
      Mainform.Paintbox1.Canvas.MoveTo(0, 65);
      Mainform.Paintbox1.Canvas.LineTo(65, 65);

    end;
  if Mainform.RzComboBox3.Items.Count>=Maxguilds then Mainform.RzBitBtn19.Enabled:=False
    else Mainform.RzBitBtn19.Enabled:=True;
  Mainform.RzBitBtn23.Enabled:=False;
  Mainform.RzBitBtn21.Enabled:=False;
  Mainform.RzBitBtn20.Enabled:=False;
end;

procedure TMainForm.SelecionarGuild;
var
  Bmps2:tbitmap;
  i:integer;
begin
  Mainform.MainADOQuery2.SQL.Clear;
  Mainform.MainADOQuery2.SQL.Add('select '+G_mark+','+G_Master+','+G_Score+' from '+guild+' where '+G_name+'='''+Mainform.RzComboBox3.text+'''');
  Mainform.MainADOQuery2.Open;
  Mainform.RzLabel7.Caption:=Format(GuildName,[Mainform.RzComboBox3.text]);
  Mainform.RzLabel4.Caption:=Format(GuildMaster,[Mainform.MainADOQuery2.Fields[1].AsString]);
  Mainform.RzLabel5.Caption:=Format(GuildScore,[Mainform.MainADOQuery2.Fields[2].AsString]);
  Bmps2:=tbitmap.create;
  Bmps2:=FillHexguild(Mainform.MainADOQuery2.Fields[0],Mainform.Color,8,true);
  Mainform.paintbox1.canvas.BrushCopy(Bounds(0, 0, Bmps2.Width, Bmps2.Height), Bmps2, Bounds(0, 0, Bmps2.Width, Bmps2.Height), clRed);
  Bmps2.free;
  Mainform.MainADOQuery2.Close;
  Mainform.MainADOQuery2.SQL.Clear;
  if vs='CMT' then Mainform.MainADOQuery2.SQL.Add('select '+Name2+','+G_status+' from '+guildmember+' where '+G_name2+'='''+Mainform.RzComboBox3.text+'''')
    else Mainform.MainADOQuery2.SQL.Add('select '+Name2+' from '+guildmember+' where '+G_name2+'='''+Mainform.RzComboBox3.text+'''');
  Mainform.MainADOQuery2.Open;
  Mainform.RzListBox1.Items.Clear;
  gmnum:=-1;
  asnum:=-1;
  bmnum1:=-1;
  bmnum2:=-1;
  bmnum3:=-1;
  for I:=0 to Mainform.MainADOQuery2.RecordCount-1 do
  begin
    if Format(GuildMaster,[Mainform.MainADOQuery2.Fields[0].AsString])=Mainform.RzLabel4.Caption then gmnum:=i;
    if vs='CMT' then
    begin
      if Mainform.MainADOQuery2.Fields[1].asinteger=64 then asnum:=i;
      if Mainform.MainADOQuery2.Fields[1].asinteger=32 then
        if bmnum1=-1 then bmnum1:=i
          else if bmnum2=-1 then bmnum2:=i
            else if bmnum3=-1 then bmnum3:=i;
    end;
    Mainform.RzListBox1.Add(Mainform.MainADOQuery2.Fields[0].asstring);
    Mainform.MainADOQuery2.Next;
  end;
  Mainform.MainADOQuery2.close;
  Mainform.RzBitBtn23.Enabled:=True;
  Mainform.RzBitBtn21.Enabled:=True;
  Mainform.RzBitBtn20.Enabled:=True;
end;

Procedure MainLang;
begin
  Mainform.RzGroupBox1.Caption:=AccountMenu;
  Mainform.RzLabel1.Caption:=AccountLabel;
  Mainform.RzBitBtn1.Hint:=NewAccountHint;
  Mainform.RzBitBtn2.Hint:=RemAccountHint;
  Mainform.RzBitBtn3.Hint:=EditAccountHint;
  Mainform.RzBitBtn4.Hint:=EditVaultHint;
  Mainform.RzBitBtn5.Hint:=SaveAccountHint;
  Mainform.RzBitBtn7.Hint:=FavoritesAccountsHint;
  Mainform.RzBitBtn6.Hint:=BlockAccountHint;
  Mainform.RzBitBtn17.Hint:=FindAccountHint;

  Mainform.RzGroupBox2.Caption:=CharacterMenu;
  Mainform.RzLabel2.Caption:=CharacterLabel;
  Mainform.RzBitBtn8.Hint:=NewCharacterHint;
  Mainform.RzBitBtn9.Hint:=RemCharacterHint;
  Mainform.RzBitBtn10.Hint:=EditCharacterHint;
  Mainform.RzBitBtn11.Hint:=EditInventoryHint;
  Mainform.RzBitBtn15.Hint:=EditMagicListHint;
  Mainform.RzBitBtn13.Hint:=SaveCharacterHint;
  Mainform.RzBitBtn12.Hint:=FavoritesCharactersHint;
  Mainform.RzBitBtn14.Hint:=BlockCharacterHint;
  Mainform.RzBitBtn16.Hint:=FindCharacterHint;

  Mainform.RzLabel8.Caption:=EGuildStatus;
end;

procedure TMainForm.Iniciar;
var I:Integer;
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
  MainLang;
  SetLength(bmp,maxguilds);
  for I := 0 to maxguilds-1 do
    bmp[i]:=tbitmap.create;
  Mainform.ListarAccounts;
  Mainform.ListarGuilds;
  //VaultForm.Iniciar;
end;


end.
