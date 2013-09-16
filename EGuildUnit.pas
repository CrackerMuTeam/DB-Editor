unit EGuildUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, RzLine, StdCtrls, RzCmboBx, RzLabel, RzLstBox, ExtCtrls, DB, ADODB,
  RzButton, Mask, RzEdit, RzPanel, GlobalVar, StrUtils, Menus;

type
  TEGuildForm = class(TForm)
    RzGroupBox1: TRzGroupBox;
    RzEdit1: TRzEdit;
    RzGroupBox2: TRzGroupBox;
    Paintbox1: TImage;
    Panel1: TPanel;
    Paintbox2: TImage;
    Panel2: TPanel;
    Panel3: TPanel;
    Panel4: TPanel;
    Panel5: TPanel;
    Panel6: TPanel;
    Panel7: TPanel;
    Panel8: TPanel;
    Panel9: TPanel;
    Panel10: TPanel;
    Panel11: TPanel;
    Panel12: TPanel;
    Panel13: TPanel;
    Panel14: TPanel;
    Panel15: TPanel;
    Panel16: TPanel;
    RzGroupBox4: TRzGroupBox;
    RzBitBtn1: TRzBitBtn;
    RzBitBtn3: TRzBitBtn;
    EGuildADOQuery1: TADOQuery;
    EGuildADOQuery2: TADOQuery;
    Timer1: TTimer;
    RzGroupBox5: TRzGroupBox;
    RzListBox1: TRzListBox;
    RzGroupBox3: TRzGroupBox;
    RzLabel1: TRzLabel;
    RzLabel2: TRzLabel;
    RzComboBox1: TRzComboBox;
    RzComboBox2: TRzComboBox;
    ListBox1: TListBox;
    RzBitBtn4: TRzBitBtn;
    RzBitBtn5: TRzBitBtn;
    RzLabel3: TRzLabel;
    RzLabel4: TRzLabel;
    RzEdit2: TRzEdit;
    RzLine1: TRzLine;
    RzGroupBox6: TRzGroupBox;
    RzEdit3: TRzEdit;
    RzLabel5: TRzLabel;
    RzBitBtn2: TRzBitBtn;
    RzLabel6: TRzLabel;
    PopupMenu1: TPopupMenu;
    SetGuildMaster1: TMenuItem;
    SetAssistent1: TMenuItem;
    SetBattleMaster1: TMenuItem;
    RemoveMember1: TMenuItem;
    procedure Paintbox2Click(Sender: TObject);
    procedure Panel2Click(Sender: TObject);
    procedure RzBitBtn4Click(Sender: TObject);
    procedure RzListBox1Click(Sender: TObject);
    procedure RzListBox1DrawItem(Control: TWinControl; Index: Integer;
      Rect: TRect; State: TOwnerDrawState);
    procedure RzBitBtn1Click(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure RemoveMember1Click(Sender: TObject);
    procedure PopupMenu1Popup(Sender: TObject);
    procedure RzBitBtn5Click(Sender: TObject);
    procedure RzComboBox1Change(Sender: TObject);

    procedure ListarAccounts;
    procedure Imagem;
    procedure SelecionarAccount;
    procedure EditarGuild;
    procedure LerGuild;
    procedure AtivarOpcoes;
    procedure LinhasGrid;
    procedure Iniciar;
    procedure GuildMembers;
    function AccountOnline(TempAccount:String):boolean;
    procedure RzComboBox1DrawItem(Control: TWinControl; Index: Integer;
      Rect: TRect; State: TOwnerDrawState);
    procedure RzComboBox2DrawItem(Control: TWinControl; Index: Integer;
      Rect: TRect; State: TOwnerDrawState);
    procedure SetGuildMaster1Click(Sender: TObject);
    procedure SetAssistent1Click(Sender: TObject);
    procedure RzListBox1MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure RzListBox1MouseLeave(Sender: TObject);
    procedure SetBattleMaster1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure RzBitBtn3Click(Sender: TObject);
    procedure RzEdit2KeyPress(Sender: TObject; var Key: Char);
    procedure RzBitBtn2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;
type TEGuildVar = record
  cor: tcolor;
  agrid: array[1..8,1..8] of tcolor;
  GuildMasterSave:String;
  GuildSave:String;
  GMNum,AsNum,BMNum1,BMNum2,BMNum3:integer;
  OldIndex:integer;
  OldColor:Tcolor;
  MovingList:Boolean;
end;

var
  EGuildForm: TEGuildForm;
  EGuildVar : TEGuildVar;


implementation
uses Mainunit;
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

procedure FillHexguild(item:Tfield); {填充某个账户的仓库}
type Tcharset=set of char;
var A:tcharset;
    itemblock:array of byte;
    sWS,sItem:string;
    wsrow,wscol,i,panelcount:integer;
    j,k:integer;
begin
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
              if (sitem='0') then EGuildVar.agrid[wsrow,wscol]:=$666666;
              if (sitem='1') then EGuildVar.agrid[wsrow,wscol]:=$000000;
              if (sitem='2') then EGuildVar.agrid[wsrow,wscol]:=$8c8a8d;
              if (sitem='3') then EGuildVar.agrid[wsrow,wscol]:=$ffffff;
              if (sitem='4') then EGuildVar.agrid[wsrow,wscol]:=$0000fe;
              if (sitem='5') then EGuildVar.agrid[wsrow,wscol]:=$008aff;
              if (sitem='6') then EGuildVar.agrid[wsrow,wscol]:=$ffff00;
              if (sitem='7') then EGuildVar.agrid[wsrow,wscol]:=$01FF8D;
              if (sitem='8') then EGuildVar.agrid[wsrow,wscol]:=$00ff00;
              if (sitem='9') then EGuildVar.agrid[wsrow,wscol]:=$8CFF01;
              if (sitem='A') then EGuildVar.agrid[wsrow,wscol]:=$00ffff;
              if (sitem='B') then EGuildVar.agrid[wsrow,wscol]:=$ff8a00;
              if (sitem='C') then EGuildVar.agrid[wsrow,wscol]:=$fe0000;
              if (sitem='D') then EGuildVar.agrid[wsrow,wscol]:=$FF008C;
              if (sitem='E') then EGuildVar.agrid[wsrow,wscol]:=$ff00fe;
              if (sitem='F') then EGuildVar.agrid[wsrow,wscol]:=$8C00FF;
            end;
        EGuildForm.Imagem;
      except
      on E:exception do application.MessageBox(pchar(e.Message),'Erro',mb_ok+mb_iconerror);

      end;
    end;
end;

procedure TEGuildForm.Paintbox2Click(Sender: TObject);
begin
  EGuildVar.Cor:=$00666666;
end;

procedure TEGuildForm.Panel2Click(Sender: TObject);
begin
  EGuildVar.Cor:=(sender as tpanel).color;
end;

procedure TEGuildForm.PopupMenu1Popup(Sender: TObject);
var
  X , Y:integer;
begin
  if EGuildVar.MovingList=true then
  begin
    X:=mouse.CursorPos.X-EGuildForm.RzListBox1.ClientOrigin.X;
    Y:=mouse.CursorPos.Y-EGuildForm.RzListBox1.ClientOrigin.Y;
    Y:=Y div 13;
    if EGuildForm.RzListBox1.Items.Count-1>=y then
      EGuildForm.RzListBox1.ItemIndex:=y;
  end;
  EGuildForm.AtivarOpcoes;
end;

procedure TEGuildForm.RemoveMember1Click(Sender: TObject);
begin
  if EGuildForm.RzListBox1.Items[EGuildForm.RzListBox1.ItemIndex]=EGuildVar.GuildMasterSave then
  begin
    application.MessageBox(pchar(EGuildError1),pchar(eguilderrorcaption),mb_ok+mb_iconerror);
    exit;
  end;
  if application.MessageBox(pchar(EGuildQuestion1),pchar(programname),mb_yesno+mb_iconinformation)=mrno then exit;
  EGuildForm.EGuildADOQuery2.SQL.Clear;
  EGuildForm.EGuildADOQuery2.SQL.Add('delete from '+GuildMember+' where '+name2+'='''+rzlistbox1.items[rzlistbox1.itemindex]+'''');
  EGuildForm.EGuildADOQuery2.ExecSQL;
  EGuildForm.GuildMembers;
  EGuildForm.ListarAccounts;
  application.MessageBox(pchar(EGuildConfirm1),pchar(programname),mb_ok);
end;

procedure TEGuildForm.RzBitBtn1Click(Sender: TObject);
begin
  EGuildForm.EditarGuild;
  EGuildForm.Close;
end;

procedure TEGuildForm.RzBitBtn2Click(Sender: TObject);
var i:integer;
s:string;
begin
  if EGuildForm.RzEdit3.text='' then
  begin
    application.MessageBox(pchar(EGuildError4),pchar(programname),mb_iconerror);
    exit;
  end;
  if application.MessageBox(pchar(EGuildQuestion3),pchar(programname),mb_yesno+mb_iconquestion)=id_no then exit;
  EGuildForm.EGuildADOQuery2.SQL.Clear;
  EGuildForm.EGuildADOQuery2.SQL.Add('Select * from '+guild+' where '+G_name+'='''+EGuildForm.RzEdit3.Text+'''');
  EGuildForm.EGuildADOQuery2.Open;
  if not((EGuildForm.EGuildADOQuery2.Bof) and (EGuildForm.EGuildADOQuery2.Eof)) then
  begin
    application.MessageBox(pchar(NGuildError3),pchar(NGuildErrorCaption));
    exit;
  end;
  EGuildForm.EGuildADOQuery2.Close;
  EGuildForm.EGuildADOQuery2.SQL.Clear;
  EGuildForm.EGuildADOQuery2.SQL.Add('Select '+G_Mark+','+G_Score+','+G_Master+','+G_Count+','+G_Notice+','+G_Type+','+G_Rival+','+G_Union+' from '+Guild+' where '+G_Name+'='''+EGuildVar.GuildSave+'''');
  EGuildForm.EGuildADOQuery2.Open;
  s:='Insert into '+Guild+' ('+G_Mark+','+G_Score+','+G_Master+','+G_Count+','+G_Notice+','+G_Type+','+G_Rival+','+G_Union+','+G_Name+')Values('+HexFieldToString(EGuildForm.EGuildADOQuery2.Fields[0])+','+EGuildForm.EGuildADOQuery2.Fields[1].AsString+','''+EGuildForm.EGuildADOQuery2.Fields[2].AsString+''','''+EGuildForm.EGuildADOQuery2.Fields[3].AsString+''','''+EGuildForm.EGuildADOQuery2.Fields[4].AsString+''','+EGuildForm.EGuildADOQuery2.Fields[5].AsString+','''+EGuildForm.EGuildADOQuery2.Fields[6].AsString+''','''+EGuildForm.EGuildADOQuery2.Fields[7].AsString+''','''+EGuildForm.RzEdit3.text+''')';
  EGuildForm.EGuildADOQuery2.close;
  EGuildForm.EGuildADOQuery2.SQL.Clear;
  EGuildForm.EGuildADOQuery2.SQL.Add(s);
  EGuildForm.EGuildADOQuery2.ExecSQL;
  EGuildForm.EGuildADOQuery2.SQL.Clear;
  EGuildForm.EGuildADOQuery2.SQL.Add('Update '+guildmember+' set '+G_Name2+'='''+EGuildForm.RzEdit3.text+''' where '+G_Name2+'='''+EGuildVar.GuildSave+'''');
  EGuildForm.EGuildADOQuery2.ExecSQL;
  EGuildForm.EGuildADOQuery2.SQL.Clear;
  EGuildForm.EGuildADOQuery2.SQL.Add('Delete from '+guild+' where '+G_Name+'='''+EGuildVar.GuildSave+'''');
  if (versao='CMT') or (versao='WZ') then
  begin
    EGuildForm.EGuildADOQuery2.SQL.Add('Update '+MuCastle_DATA+' set '+OWNER_GUILD+'='''+EGuildForm.RzEdit3.text+''' where '+OWNER_GUILD+'='''+EGuildVar.GuildSave+'''');
    EGuildForm.EGuildADOQuery2.SQL.Add('Update '+MuCastle_REG_SIEGE+' set '+REG_SIEGE_GUILD+'='''+EGuildForm.RzEdit3.text+''' where '+REG_SIEGE_GUILD+'='''+EGuildVar.GuildSave+'''');
    EGuildForm.EGuildADOQuery2.SQL.Add('Update '+MuCastle_SIEGE_GUILDLIST+' set '+GUILD_NAME+'='''+EGuildForm.RzEdit3.text+''' where '+GUILD_NAME+'='''+EGuildVar.GuildSave+'''');
  end;
  EGuildForm.EGuildADOQuery2.ExecSQL;
  EGuildVar.GuildSave:=EGuildForm.RzEdit3.text;
  MainForm.SelecionarGuild;
  for i := 0 to Mainform.RzComboBox3.Items.Count-1 do
    if Mainform.RzComboBox3.Items[i]=EGuildVar.GuildSave then Mainform.RzComboBox3.ItemIndex:=i;
  Mainform.RzComboBox3.OnChange(Mainform.RzComboBox3);
end;

procedure TEGuildForm.RzBitBtn3Click(Sender: TObject);
begin
  EguildForm.Close;
end;

procedure TEGuildForm.RzBitBtn4Click(Sender: TObject);
begin
  if EGuildForm.RzComboBox2.Text='' then
  begin
    application.MessageBox(pchar(EGuildError2),pchar(EGuildErrorCaption),mb_ok+mb_iconerror);
    exit;
  end;
  EGuildForm.EGuildADOQuery2.SQL.Clear;                                                                        
  EGuildForm.EGuildADOQuery2.SQL.Add('insert into '+GuildMember+' ('+G_Name2+','+name2+')  VALUES ('''+EGuildVar.GuildSave+''','''+EGuildForm.RzComboBox2.Text+''')');
  EGuildForm.EGuildADOQuery2.ExecSQL;
  EGuildform.GuildMembers;
  EGuildForm.ListarAccounts;
  application.MessageBox(pchar(EGuildConfirm2),pchar(programname),mb_ok);
end;

procedure TEGuildForm.RzBitBtn5Click(Sender: TObject);
begin
  EGuildForm.PopupMenu1.Popup(Mouse.CursorPos.X,Mouse.CursorPos.Y);
end;

procedure TEGuildForm.RzComboBox1Change(Sender: TObject);
begin
  EGuildForm.SelecionarAccount;

end;

procedure TEGuildForm.RzComboBox1DrawItem(Control: TWinControl; Index: Integer;
  Rect: TRect; State: TOwnerDrawState);

var
  myColor: TColor;
  myBrush: TBrush;
begin
  myBrush := TBrush.Create;
  with (Control as TRzComboBox).Canvas do
  begin
    mycolor :=clwhite;
    myBrush.Style := bsSolid;
    myBrush.Color := myColor;
    Windows.FillRect(handle, Rect, myBrush.Handle);
    Brush.Style := bsClear;
    Font.Color:=ClBlack;
    TextOut(Rect.Left+15, Rect.Top,(Control as TRzComboBox).Items[Index]);
    Pen.Color:=clgreen;
    myBrush.Color := clwhite;
    Windows.FillRect(handle, Bounds(Rect.Left, Rect.Top, 13, 13), myBrush.Handle);
    MyBrush.Free;
    Pen.Color:=clblack;
    Ellipse(Rect.Left+3,rect.Top+3,Rect.Left+10,rect.Top+10);


    if EGuildForm.AccountOnline((Control as TRzComboBox).Items[Index])=true then Pen.Color:=clgreen
      else Pen.Color:=clred;


    Ellipse(Rect.Left+4,rect.Top+4,Rect.Left+9,rect.Top+9);
    Ellipse(Rect.Left+5,rect.Top+5,Rect.Left+8,rect.Top+8);
    Ellipse(Rect.Left+6,rect.Top+6,Rect.Left+7,rect.Top+7);
    Pixels[Rect.Left+5,rect.Top+5]:=Pen.Color;
    Pixels[Rect.Left+5,rect.Top+7]:=Pen.Color;
    Pixels[Rect.Left+6,rect.Top+6]:=Pen.Color;
    Pixels[Rect.Left+7,rect.Top+5]:=Pen.Color;
    Pixels[Rect.Left+7,rect.Top+7]:=Pen.Color;


   { Pen.Color:=clblack;
    MoveTo(Rect.Left+1,1+Rect.Top);
    LineTo(Rect.Left+1,11+Rect.Top);
    LineTo(Rect.Left+11,11+Rect.Top);
    LineTo(Rect.Left+11,1+Rect.Top);
    LineTo(Rect.Left+1,1+Rect.Top);}
    EGuildVar.OldIndex:=Rect.Top;
  end;

end;

procedure TEGuildForm.RzComboBox2DrawItem(Control: TWinControl; Index: Integer;
  Rect: TRect; State: TOwnerDrawState);
var
  myColor: TColor;
  myBrush: TBrush;
begin
  myBrush := TBrush.Create;
  with (Control as TRzComboBox).Canvas do
  begin
    mycolor :=clwhite;
    myBrush.Style := bsSolid;
    myBrush.Color := myColor;
    Windows.FillRect(handle, Rect, myBrush.Handle);
    Brush.Style := bsClear;
    Font.Color:=ClBlack;
    TextOut(Rect.Left+15, Rect.Top,(Control as TRzComboBox).Items[Index]);
    Pen.Color:=clgreen;
    myBrush.Color := clwhite;
    Windows.FillRect(handle, Bounds(Rect.Left, Rect.Top, 13, 13), myBrush.Handle);
    MyBrush.Free;
    Pen.Color:=clblack;
    Ellipse(Rect.Left+3,rect.Top+3,Rect.Left+10,rect.Top+10);

    Pen.Color:=$00FF8A00;

    Ellipse(Rect.Left+4,rect.Top+4,Rect.Left+9,rect.Top+9);
    Ellipse(Rect.Left+5,rect.Top+5,Rect.Left+8,rect.Top+8);
    Ellipse(Rect.Left+6,rect.Top+6,Rect.Left+7,rect.Top+7);
    Pixels[Rect.Left+5,rect.Top+5]:=Pen.Color;
    Pixels[Rect.Left+5,rect.Top+7]:=Pen.Color;
    Pixels[Rect.Left+6,rect.Top+6]:=Pen.Color;
    Pixels[Rect.Left+7,rect.Top+5]:=Pen.Color;
    Pixels[Rect.Left+7,rect.Top+7]:=Pen.Color;
  end;

end;

procedure TEGuildForm.RzEdit2KeyPress(Sender: TObject; var Key: Char);
begin
If Not (Key in ['0'..'9',#8,#0]) then
Key:=#0;
end;

procedure TEGuildForm.RzListBox1Click(Sender: TObject);
begin
  EGuildForm.AtivarOpcoes;
end;

procedure TEGuildForm.RzListBox1DrawItem(Control: TWinControl; Index: Integer;
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

procedure TEGuildForm.RzListBox1MouseLeave(Sender: TObject);
begin
  EGuildVar.MovingList:=false;
end;

procedure TEGuildForm.RzListBox1MouseMove(Sender: TObject; Shift: TShiftState;
  X, Y: Integer);
begin
  EGuildVar.MovingList:=true;
end;

procedure TEGuildForm.ListarAccounts;
begin
  EGuildForm.RzComboBox1.Items.Clear;
  EGuildForm.RzComboBox1.Items.Add(AllCharacters);
  EGuildForm.RzComboBox2.Items.Clear;
  EGuildForm.EGuildADOQuery1.SQL.Clear;
  EGuildForm.EGuildADOQuery1.SQL.Add('Select '+memb___id+' from '+memb_info);
  EGuildForm.EGuildADOQuery1.Open;
  While not(EGuildForm.EGuildADOQuery1.Eof) do
  begin
    EGuildForm.RzComboBox1.Items.Add(EGuildForm.EGuildADOQuery1.Fields[0].AsString);
    EGuildForm.EGuildADOQuery1.Next;
  end;
  EGuildForm.EGuildADOQuery1.Close;
end;

procedure TEGuildForm.Imagem;
var x,y,z:integer;
begin
  for y:= 1 to 8 do
  for x := 1 to 8  do
    begin
      EGuildForm.PaintBox1.Canvas.Pen.Color:=EGuildVar.AGrid[x,y];
      for z:=1 to 17 do
      begin
        EGuildForm.PaintBox1.Canvas.MoveTo(18*(x-1)+1, 18*(y-1)+z);
   	    EGuildForm.PaintBox1.Canvas.LineTo(18*(x-1)+18, 18*(y-1)+z);
      end;
      if EGuildVar.AGrid[x,y]=$00666666 then
      begin
        EGuildForm.PaintBox1.Canvas.Pen.Color:=clwhite;
        EGuildForm.PaintBox1.Canvas.Pen.width:=2;
        EGuildForm.PaintBox1.Canvas.MoveTo(18*(x-1)+2, 18*(y-1)+2);
        EGuildForm.PaintBox1.Canvas.LineTo(18*(x-1)+16, 18*(y-1)+16);
        EGuildForm.PaintBox1.Canvas.MoveTo(18*(x-1)+2, 18*(y-1)+16);
        EGuildForm.PaintBox1.Canvas.LineTo(18*(x-1)+16, 18*(y-1)+2);
        EGuildForm.PaintBox1.Canvas.Pen.width:=1;
      end;
    end;
end;

procedure TEGuildForm.SelecionarAccount;
var
  i:byte;
  j:integer;
  AccountSave:string;
begin
  EGuildForm.RzComboBox2.Items.Clear;
  AccountSave:=EGuildForm.RzComboBox1.Text;
  EGuildForm.EGuildADOQuery2.SQL.Clear;
  EGuildForm.ListBox1.Items.Clear;
  if EGuildForm.RzComboBox1.Text<>AllCharacters then
  begin
    EGuildForm.EGuildADOQuery2.SQL.Add('select '+GameID1+','+GameID2+','+GameID3+','+GameID4+','+GameID5+' from '+AccountCharacter+' where '+Id+'='''+AccountSave+'''');
    EGuildForm.EGuildADOQuery2.Open;
    if not ((EGuildForm.EGuildADOQuery2.Eof) and (EGuildForm.EGuildADOQuery2.Bof)) then
      for i:=0 to 4 do
      begin
        if EGuildForm.EGuildADOQuery2.Fields[i].asstring<>'' then
          EGuildForm.ListBox1.Items.Add(EGuildForm.EGuildADOQuery2.Fields[i].asstring);
      end;
    EGuildForm.EGuildADOQuery2.Close;
  end
    else begin
      EGuildForm.EGuildADOQuery2.SQL.Clear;
      EGuildForm.EGuildADOQuery2.SQL.Add('select '+GameID1+','+GameID2+','+GameID3+','+GameID4+','+GameID5+' from '+AccountCharacter+'');
      EGuildForm.EGuildADOQuery2.Open;
      if not ((EGuildForm.EGuildADOQuery2.Eof) and (EGuildForm.EGuildADOQuery2.Bof)) then
        for j := 0 to EGuildForm.EGuildADOQuery2.RecordCount-1 do
        begin
          for i:=0 to 4 do
            if EGuildForm.EGuildADOQuery2.Fields[i].asstring<>'' then
              EGuildForm.ListBox1.Items.Add(EGuildForm.EGuildADOQuery2.Fields[i].asstring);
          EGuildForm.EGuildADOQuery2.Next;
        end;
      EGuildForm.EGuildADOQuery2.Close;
    end;
  if EGuildForm.ListBox1.Items.Count>0 then
    for j := 0 to EGuildForm.ListBox1.Items.Count-1 do
    begin
      EGuildForm.EGuildADOQuery2.SQL.Clear;
      EGuildForm.EGuildADOQuery2.SQL.Add('select '+G_name2+' from '+GuildMember+' where '+name2+'='''+EGuildForm.ListBox1.Items[j]+'''');
      EGuildForm.EGuildADOQuery2.Open;
      if (EGuildForm.EGuildADOQuery2.Eof) and (EGuildForm.EGuildADOQuery2.Bof) then
        EGuildForm.RzComboBox2.Items.Add(EGuildForm.ListBox1.Items[j]);
      EGuildForm.EGuildADOQuery2.close;
    end;
end;

procedure TEGuildForm.SetAssistent1Click(Sender: TObject);
begin
  if EGuildForm.SetAssistent1.Caption=EGuildSetAssistent then
  begin
    EGuildForm.EGuildADOQuery2.SQL.Clear;
    EGuildForm.EGuildADOQuery2.SQL.Add('Select '+name2+' from '+guildmember+' where '+G_status+'=64 and '+G_Name2+'='''+EGuildVar.GuildSave+'''');
    EGuildForm.EGuildADOQuery2.Open;
    if (EGuildForm.EGuildADOQuery2.Bof) and (EGuildForm.EGuildADOQuery2.Eof) then
    begin
      EGuildForm.EGuildADOQuery2.Close;
      EGuildForm.EGuildADOQuery2.SQL.Clear;
      EGuildForm.EGuildADOQuery2.SQL.Add('Update '+Guildmember+' set '+G_status+'=64 where '+name2+'='''+rzlistbox1.items[rzlistbox1.itemindex]+'''');
      EGuildForm.EGuildADOQuery2.ExecSQL;
      EGuildForm.GuildMembers;
    end
      else begin
        EGuildForm.EGuildADOQuery2.Close;
        application.MessageBox(pchar(EGuildError3),pchar(EGuildErrorCaption),mb_ok+mb_iconerror) ;
        exit;
      end;
  end
    else begin
      EGuildForm.EGuildADOQuery2.SQL.Clear;
      EGuildForm.EGuildADOQuery2.SQL.Add('Update '+Guildmember+' set '+G_status+'=0 where '+name2+'='''+rzlistbox1.items[rzlistbox1.itemindex]+'''');
      EGuildForm.EGuildADOQuery2.ExecSQL;
      EGuildForm.GuildMembers;
    end;
end;

procedure TEGuildForm.SetBattleMaster1Click(Sender: TObject);
begin
  if EGuildForm.SetBattleMaster1.Caption=EGuildSetBattleMaster then
  begin
    EGuildForm.EGuildADOQuery2.SQL.Clear;
    EGuildForm.EGuildADOQuery2.SQL.Add('Select '+name2+' from '+guildmember+' where '+G_status+'=32 and '+G_Name2+'='''+EGuildVar.GuildSave+'''');
    EGuildForm.EGuildADOQuery2.Open;
    if EGuildForm.EGuildADOQuery2.RecordCount=3 then
    begin
      EGuildForm.EGuildADOQuery2.Close;
      application.MessageBox(pchar(NGuildError4),pchar(EGuildErrorCaption),mb_ok+mb_iconerror) ;
      exit;
    end;
    EGuildForm.EGuildADOQuery2.Close;
    EGuildForm.EGuildADOQuery2.SQL.Clear;
    EGuildForm.EGuildADOQuery2.SQL.Add('Update '+Guildmember+' set '+G_status+'=32 where '+name2+'='''+rzlistbox1.items[rzlistbox1.itemindex]+'''');
    EGuildForm.EGuildADOQuery2.ExecSQL;
    EGuildForm.GuildMembers;
  end
    else begin
      EGuildForm.EGuildADOQuery2.SQL.Clear;
      EGuildForm.EGuildADOQuery2.SQL.Add('Update '+Guildmember+' set '+G_status+'=0 where '+name2+'='''+rzlistbox1.items[rzlistbox1.itemindex]+'''');
      EGuildForm.EGuildADOQuery2.ExecSQL;
      EGuildForm.GuildMembers;
    end;
end;

procedure TEGuildForm.SetGuildMaster1Click(Sender: TObject);
begin
  if application.MessageBox(pchar(EGuildQuestion2),pchar(programname),mb_yesno+mb_iconinformation)=mrno then begin
    exit;
  end;
  if vs='CMT' then
  begin
    EGuildForm.EGuildADOQuery2.SQL.Clear;
    EGuildForm.EGuildADOQuery2.SQL.Add('Update '+Guildmember+' set '+G_status+'=128 where '+name2+'='''+rzlistbox1.items[rzlistbox1.itemindex]+'''');
    EGuildForm.EGuildADOQuery2.ExecSQL;
    EGuildForm.EGuildADOQuery2.SQL.Clear;
    EGuildForm.EGuildADOQuery2.SQL.Add('Update '+Guildmember+' set '+G_status+'=0 where '+name2+'='''+EGuildVar.GuildMasterSave+'''');
    EGuildForm.EGuildADOQuery2.ExecSQL;
  end;
  EGuildForm.EGuildADOQuery2.SQL.Clear;
  EGuildForm.EGuildADOQuery2.SQL.Add('Update '+Guild+' set '+G_master+'='''+rzlistbox1.items[rzlistbox1.itemindex]+''' where '+G_name+'='''+ EGuildVar.GuildSave+'''');
  EGuildForm.EGuildADOQuery2.ExecSQL;
  EGuildVar.GuildMasterSave:=rzlistbox1.items[rzlistbox1.itemindex];
  EGuildForm.GuildMembers;
end;

procedure TEGuildForm.Timer1Timer(Sender: TObject);
var
  y2 , x2 , z , x ,y :integer;
begin
  X:=mouse.CursorPos.X-EGuildForm.Paintbox1.ClientOrigin.X;
  Y:=mouse.CursorPos.Y-EGuildForm.Paintbox1.ClientOrigin.Y;
  {Click direito}
  if (GetAsyncKeyState(VK_RBUTTON) = -32768)  then
  begin
    for y2:=0 to 7 do
    for x2:=0 to 7 do
      if (x>=(x2*18)) and (x<((x2*18)+18)) and (y>=(y2*18)) and (y<((y2*18)+18)) then
      begin
        EGuildVar.agrid[x2+1,y2+1]:=$00666666;
        for z:=1 to 17 do
        begin
          EGuildForm.PaintBox1.Canvas.Pen.Color:=$00666666;
          EGuildForm.PaintBox1.Canvas.MoveTo(18*(x2)+1, 18*(y2)+z);
        	EGuildForm.PaintBox1.Canvas.LineTo(18*(x2)+18, 18*(y2)+z);
        end;
        if EGuildVar.AGrid[x2+1,y2+1]=$00666666 then
        begin
          EGuildForm.PaintBox1.Canvas.Pen.Color:=clwhite;
          EGuildForm.PaintBox1.Canvas.Pen.width:=2;
          EGuildForm.PaintBox1.Canvas.MoveTo(18*(x2)+2, 18*(y2)+2);
          EGuildForm.PaintBox1.Canvas.LineTo(18*(x2)+16, 18*(y2)+16);
          EGuildForm.PaintBox1.Canvas.MoveTo(18*(x2)+2, 18*(y2)+16);
      	  EGuildForm.PaintBox1.Canvas.LineTo(18*(x2)+16, 18*(y2)+2);
          EGuildForm.PaintBox1.Canvas.Pen.width:=1;
        end;
      end;
    EGuildForm.Update;
  end;
  {Click Esquerdo}
  if (GetAsyncKeyState(VK_LBUTTON) = -32768) then
  begin
    for y2:=0 to 7 do
    for x2:=0 to 7 do
      if (x>=(x2*18)) and (x<((x2*18)+18)) and (y>=(y2*18)) and (y<((y2*18)+18)) then
      begin
        EGuildVar.AGrid[x2+1,y2+1]:=EGuildVar.Cor;
        for z:=1 to 17 do
        begin
          EGuildForm.PaintBox1.Canvas.Pen.Color:=EGuildVar.Cor;
          EGuildForm.PaintBox1.Canvas.MoveTo(18*(x2)+1, 18*(y2)+z);
        	EGuildForm.PaintBox1.Canvas.LineTo(18*(x2)+18, 18*(y2)+z);
        end;
        if EGuildVar.AGrid[x2+1,y2+1]=$00666666 then
        begin
          EGuildForm.PaintBox1.Canvas.Pen.Color:=clwhite;
          EGuildForm.PaintBox1.Canvas.Pen.width:=2;
          EGuildForm.PaintBox1.Canvas.MoveTo(18*(x2)+2, 18*(y2)+2);
          EGuildForm.PaintBox1.Canvas.LineTo(18*(x2)+16, 18*(y2)+16);
          EGuildForm.PaintBox1.Canvas.MoveTo(18*(x2)+2, 18*(y2)+16);
      	  EGuildForm.PaintBox1.Canvas.LineTo(18*(x2)+16, 18*(y2)+2);
          EGuildForm.PaintBox1.Canvas.Pen.width:=1;
        end;
      end;
    EGuildForm.Update;
  end;

end;

procedure TEGuildForm.EditarGuild;
var
  x , y : integer;
  marksql : string;
begin
  marksql:='';
  for y := 1 to 8 do
  for x := 1 to 8 do
    begin
      if EGuildVar.AGrid[x,y]=$666666 then marksql:=marksql+'0';
      if EGuildVar.AGrid[x,y]=$000000 then marksql:=marksql+'1';
      if EGuildVar.AGrid[x,y]=$8c8a8d then marksql:=marksql+'2';
      if EGuildVar.AGrid[x,y]=$ffffff then marksql:=marksql+'3';
      if EGuildVar.AGrid[x,y]=$0000fe then marksql:=marksql+'4';
      if EGuildVar.AGrid[x,y]=$008aff then marksql:=marksql+'5';
      if EGuildVar.AGrid[x,y]=$ffff00 then marksql:=marksql+'6';
      if EGuildVar.AGrid[x,y]=$01FF8D then marksql:=marksql+'7';
      if EGuildVar.AGrid[x,y]=$00ff00 then marksql:=marksql+'8';
      if EGuildVar.AGrid[x,y]=$8CFF01 then marksql:=marksql+'9';
      if EGuildVar.AGrid[x,y]=$00ffff then marksql:=marksql+'A';
      if EGuildVar.AGrid[x,y]=$ff8a00 then marksql:=marksql+'B';
      if EGuildVar.AGrid[x,y]=$fe0000 then marksql:=marksql+'C';
      if EGuildVar.AGrid[x,y]=$FF008C then marksql:=marksql+'D';
      if EGuildVar.AGrid[x,y]=$ff00fe then marksql:=marksql+'E';
      if EGuildVar.AGrid[x,y]=$8C00FF then marksql:=marksql+'F';
    end;
  EGuildForm.EGuildADOQuery2.SQL.Clear;
  EGuildForm.EGuildADOQuery2.SQL.Add('Update '+guild+' set '+g_mark+'=0x'+marksql+', '+G_Score+'='''+EGuildForm.RzEdit2.text+''', '+G_notice+'='''+EGuildForm.RzEdit1.text+''' where '+G_Name+'='''+EGuildVar.GuildSave+'''');
  EGuildForm.EGuildADOQuery2.ExecSql;
end;

procedure TEGuildForm.FormClose(Sender: TObject; var Action: TCloseAction);
var i:integer;
begin
 Mainform.ListarGuilds;
 Mainform.update;
 for i := 0 to Mainform.RzComboBox3.Items.Count-1 do
   if Mainform.RzComboBox3.Items[i]=Eguildvar.GuildSave then
     Mainform.RzComboBox3.ItemIndex:=i;
 Mainform.SelecionarGuild;
 Mainform.Enabled:=true;
 EGuildForm.FreeOnRelease;
end;

procedure TEGuildForm.LerGuild;
var i:integer;
s:string;
begin
  EGuildForm.EGuildADOQuery2.SQL.clear;
  EGuildForm.EGuildADOQuery2.SQL.add('select '+G_mark+','+G_Score+','+G_Master+','+G_notice+' from '+Guild+' where '+G_Name+'='''+EGuildVar.GuildSave+'''') ;
  EGuildForm.EGuildADOQuery2.Open;
  EGuildForm.RzEdit2.Text:=EGuildForm.EGuildADOQuery2.Fields[1].AsString;
  EGuildVar.GuildMasterSave:=EGuildForm.EGuildADOQuery2.Fields[2].AsString;
  EGuildForm.RzEdit1.Text:=EGuildForm.EGuildADOQuery2.Fields[3].AsString;
  FillHexguild(EGuildForm.EGuildADOQuery2.Fields[0]);
  EGuildForm.EGuildADOQuery2.Close;
  EGuildform.GuildMembers;
end;

procedure TEGuildForm.AtivarOpcoes;
var b:boolean;
begin
  EGuildForm.SetGuildMaster1.caption:=EGuildSetMaster;
  EGuildForm.SetAssistent1.caption:=EGuildSetAssistent;
  EGuildForm.SetBattleMaster1.caption:=EGuildSetBattleMaster;
  EGuildForm.RemoveMember1.caption:=EGuildRemoveMember;
  b:=false;
  if (EGuildForm.RzListBox1.Itemindex=gmnum) and (b=false) then
  begin
    EGuildForm.SetGuildMaster1.enabled:=false;
    EGuildForm.SetAssistent1.enabled:=false;
    EGuildForm.SetBattleMaster1.enabled:=false;
    EGuildForm.RemoveMember1.enabled:=false;
    EGuildForm.RzLabel6.Color := $00FF8A00;
    EGuildForm.RzLabel6.Caption:= EGuildMaster;
    b:=true;
  end;
  if (EGuildForm.RzListBox1.itemindex=asnum) and (b=false) then
  begin
    EGuildForm.SetGuildMaster1.enabled:=true;
    EGuildForm.SetAssistent1.enabled:=true;
    EGuildForm.SetBattleMaster1.enabled:=true;
    EGuildForm.RemoveMember1.enabled:=true;
    EGuildForm.SetAssistent1.caption:=EGuildRemAssistent;
    EGuildForm.RzLabel6.Color := $008CFF01;
    EGuildForm.RzLabel6.Caption:= EGuildAssistent;
    b:=true;
  end;
  if ((EGuildForm.RzListBox1.itemindex=bmnum1) or (EGuildForm.RzListBox1.itemindex=bmnum2) or (EGuildForm.RzListBox1.itemindex=bmnum3)) and (b=false)  then
  begin
    EGuildForm.SetGuildMaster1.enabled:=true;
    EGuildForm.SetAssistent1.enabled:=true;
    EGuildForm.SetBattleMaster1.enabled:=true;
    EGuildForm.RemoveMember1.enabled:=true;
    EGuildForm.SetBattleMaster1.caption:=EGuildRemBattleMaster;
    EGuildForm.RzLabel6.Color :=clYellow;
    EGuildForm.RzLabel6.Caption:= EGuildBattle;
    b:=true;
  end;
  if b=false then
  begin
    EGuildForm.SetGuildMaster1.enabled:=true;
    EGuildForm.SetAssistent1.enabled:=true;
    EGuildForm.SetBattleMaster1.enabled:=true;
    EGuildForm.RemoveMember1.enabled:=true;
    EGuildForm.RzLabel6.Color :=clSilver;
    EGuildForm.RzLabel6.Caption:= EGuildNormal;
  end;
end;

procedure TEGuildForm.LinhasGrid;
begin
  EGuildForm.PaintBox1.canvas.Pen.width:=1;
  EGuildForm.PaintBox1.canvas.MoveTo(0,0);
  EGuildForm.PaintBox1.Canvas.LineTo(0,144);
  EGuildForm.PaintBox1.canvas.MoveTo(18,0);
  EGuildForm.PaintBox1.Canvas.LineTo(18,144);
  EGuildForm.PaintBox1.canvas.MoveTo(36,0);
  EGuildForm.PaintBox1.Canvas.LineTo(36,144);
  EGuildForm.PaintBox1.canvas.MoveTo(54,0);
  EGuildForm.PaintBox1.Canvas.LineTo(54,144);
  EGuildForm.PaintBox1.canvas.MoveTo(72,0);
  EGuildForm.PaintBox1.Canvas.LineTo(72,144);
  EGuildForm.PaintBox1.canvas.MoveTo(90,0);
  EGuildForm.PaintBox1.Canvas.LineTo(90,144);
  EGuildForm.PaintBox1.canvas.MoveTo(108,0);
  EGuildForm.PaintBox1.Canvas.LineTo(108,144);
  EGuildForm.PaintBox1.canvas.MoveTo(126,0);
  EGuildForm.PaintBox1.Canvas.LineTo(126,144);
  EGuildForm.PaintBox1.canvas.MoveTo(144,0);
  EGuildForm.PaintBox1.Canvas.LineTo(144,144);
//horizontal
  EGuildForm.PaintBox1.canvas.MoveTo(0,0);
  EGuildForm.PaintBox1.Canvas.LineTo(144,0);
  EGuildForm.PaintBox1.canvas.MoveTo(0,18);
  EGuildForm.PaintBox1.Canvas.LineTo(144,18);
  EGuildForm.PaintBox1.canvas.MoveTo(0,36);
  EGuildForm.PaintBox1.Canvas.LineTo(144,36);
  EGuildForm.PaintBox1.canvas.MoveTo(0,54);
  EGuildForm.PaintBox1.Canvas.LineTo(144,54);
  EGuildForm.PaintBox1.canvas.MoveTo(0,72);
  EGuildForm.PaintBox1.Canvas.LineTo(144,72);
  EGuildForm.PaintBox1.canvas.MoveTo(0,90);
  EGuildForm.PaintBox1.Canvas.LineTo(144,90);
  EGuildForm.PaintBox1.canvas.MoveTo(0,108);
  EGuildForm.PaintBox1.Canvas.LineTo(144,108);
  EGuildForm.PaintBox1.canvas.MoveTo(0,126);
  EGuildForm.PaintBox1.Canvas.LineTo(144,126);
  EGuildForm.PaintBox1.canvas.MoveTo(0,144);
  EGuildForm.PaintBox1.Canvas.LineTo(144,144);
//Atualizar
  EGuildForm.Update;
end;

procedure TEGuildForm.Iniciar;
var x,y,i:integer;
begin
  EGuildForm.EGuildADOQuery1.ConnectionString:='Provider=MSDASQL.1;Password='+memupwd+';Persist Security Info=True;User ID='+memuid+';Data Source='+memudsn+';Initial Catalog='+mecatalog;
  EGuildForm.EGuildADOQuery2.ConnectionString:='Provider=MSDASQL.1;Password='+mupwd+';Persist Security Info=True;User ID='+muid+';Data Source='+mudsn+';Initial Catalog='+catalog;
  EGuildForm.PaintBox1.Canvas.Pen.width:=1;
  EGuildForm.PaintBox1.Canvas.Pen.Color:=clblack;

  EGuildForm.LinhasGrid;
  EGuildForm.LerGuild;
  EGuildForm.ListarAccounts;
  EGuildVar.MovingList:=false;
  EGuildVar.OldIndex:=-1;
  EGuildVar.Cor:=$00666666;
  for i:=0 to 18 do
  begin
    EGuildForm.PaintBox2.Canvas.Pen.Color:=$00666666;
    EGuildForm.PaintBox2.Canvas.MoveTo(0, i);
   	EGuildForm.PaintBox2.Canvas.LineTo(18, i);
  end;
  EGuildForm.PaintBox2.Canvas.Pen.Color:=clwhite;
  EGuildForm.PaintBox2.Canvas.Pen.width:=2;
  EGuildForm.PaintBox2.Canvas.MoveTo(0,0);
  EGuildForm.PaintBox2.Canvas.LineTo(16,16);
  EGuildForm.PaintBox2.Canvas.MoveTo(0,16);
  EGuildForm.PaintBox2.Canvas.LineTo(16,0);
  EGuildForm.Update;
end;

procedure TEGuildForm.GuildMembers;
var i:integer;
s:string;
begin
  gmnum:=-1;
  asnum:=-1;
  bmnum1:=-1;
  bmnum2:=-1;
  bmnum3:=-1;
  EGuildForm.EGuildADOQuery2.SQL.Clear;
  if vs='CMT' then
    EGuildForm.EGuildADOQuery2.sql.Add('select '+name2+','+G_status+' from '+guildmember+' where '+G_name2+'='''+EGuildVar.GuildSave+'''')
      else  EGuildForm.EGuildADOQuery2.sql.Add('select '+name2+' from '+guildmember+' where '+G_name2+'='''+EGuildVar.GuildSave+'''');
  EGuildForm.EGuildADOQuery2.Open;
  EGuildForm.RzListBox1.Items.Clear;
  for I:=0 to EGuildForm.EGuildADOQuery2.RecordCount-1 do
  begin
    if EGuildForm.EGuildADOQuery2.Fields[0].AsString=EGuildVar.GuildMasterSave then gmnum:=i;
    if vs='CMT' then
    begin
      if EGuildForm.EGuildADOQuery2.Fields[1].AsInteger=64 then asnum:=i;
      if EGuildForm.EGuildADOQuery2.Fields[1].AsInteger=32 then
      if bmnum1=-1 then bmnum1:=i
        else if bmnum2=-1 then bmnum2:=i
          else if bmnum3=-1 then bmnum3:=i;
    end;
    EGuildForm.RzListBox1.Items.Add(EGuildForm.EGuildADOQuery2.Fields[0].asstring);
    EGuildForm.EGuildADOQuery2.Next;
  end;
  EGuildForm.EGuildADOQuery2.close;
  EGuildForm.RzListBox1.ItemIndex:=0;
  EGuildForm.AtivarOpcoes;
end;

function TEGuildForm.AccountOnline(TempAccount:String):boolean;
begin
  EGuildForm.EGuildADOQuery1.SQL.Clear;
  EGuildForm.EGuildADOQuery1.SQL.Add('Select '+ConnectStat+' from '+MEMB_STAT+' where '+memb___id3+'='''+TempAccount+'''');
  EGuildForm.EGuildADOQuery1.Open;
  If (EGuildForm.EGuildADOQuery1.Eof) and (EGuildForm.EGuildADOQuery1.Bof) then result:=false
    else begin
      if EGuildForm.EGuildADOQuery1.Fields[0].AsString='0' then  result:=false
        else result:=true;
    end;
  EGuildForm.EGuildADOQuery1.Close;
end;

end.
