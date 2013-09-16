unit NGuildUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, Mask, RzEdit, RzCmboBx, RzLabel, RzPanel,
  RzButton, DB, ADODB, GlobalVar, EGuildUnit;

type
  TNGuildForm = class(TForm)
    RzGroupBox1: TRzGroupBox;
    RzGroupBox2: TRzGroupBox;
    RzGroupBox3: TRzGroupBox;
    RzLabel1: TRzLabel;
    RzLabel2: TRzLabel;
    RzComboBox1: TRzComboBox;
    RzComboBox2: TRzComboBox;
    RzEdit1: TRzEdit;
    Panel1: TPanel;
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
    RzBitBtn2: TRzBitBtn;
    RzBitBtn3: TRzBitBtn;
    NGuildADOQuery1: TADOQuery;
    NGuildADOQuery2: TADOQuery;
    Timer1: TTimer;
    Paintbox1: TImage;
    Paintbox2: TImage;
    ListBox1: TListBox;
    procedure Panel2Click(Sender: TObject);
    procedure PaintBox2Click(Sender: TObject);
    procedure RzComboBox1Change(Sender: TObject);
    procedure SelecionarAccount;
    procedure Imagem;
    procedure LinhasGrid;
    procedure NGuildLang;
    procedure Iniciar;
    procedure CriarGuild;
    procedure ListarAccounts;
    function AccountOnline(TempAccount:String):boolean;
    procedure RzBitBtn1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure RzBitBtn3Click(Sender: TObject);
    procedure RzBitBtn2Click(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure RzComboBox1DrawItem(Control: TWinControl; Index: Integer;
      Rect: TRect; State: TOwnerDrawState);
    procedure RzComboBox2DrawItem(Control: TWinControl; Index: Integer;
      Rect: TRect; State: TOwnerDrawState);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  NGuildForm: TNGuildForm;
  cor: tcolor;
  agrid: array[1..8,1..8] of tcolor;
  
implementation
uses mainunit;
{$R *.dfm}

procedure TNGuildForm.PaintBox2Click(Sender: TObject);
begin
  cor:=$00666666;
end;

procedure TNGuildForm.Panel2Click(Sender: TObject);
begin
  cor:=(sender as tpanel).color;
end;

procedure TNGuildForm.RzBitBtn1Click(Sender: TObject);
begin
  NGuildForm.CriarGuild;
end;

procedure TNGuildForm.RzBitBtn2Click(Sender: TObject);
begin
  NGuildForm.CriarGuild;
  Eguildvar.GuildSave:=NGuildform.RzEdit1.Text;
  Eguildform.Iniciar;
  Eguildform.Show;
  Mainform.Enabled:=false;
end;

procedure TNGuildForm.RzBitBtn3Click(Sender: TObject);
begin
  NGuildForm.Close;
end;

procedure TNGuildForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Mainform.Enabled:=true;
  NGuildForm.FreeOnRelease;
end;

procedure TNGuildForm.RzComboBox1Change(Sender: TObject);
begin
  SelecionarAccount;
end;

procedure TNGuildForm.RzComboBox1DrawItem(Control: TWinControl; Index: Integer;
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

    if NGuildForm.AccountOnline((Control as TRzComboBox).Items[Index])=true then Pen.Color:=clgreen
      else Pen.Color:=clred;

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

procedure TNGuildForm.RzComboBox2DrawItem(Control: TWinControl; Index: Integer;
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

procedure TNGuildForm.Iniciar;
var
  x , y , i : integer;
begin
  NGuildForm.NGuildADOQuery1.ConnectionString:='Provider=MSDASQL.1;Password='+memupwd+';Persist Security Info=True;User ID='+memuid+';Data Source='+memudsn+';Initial Catalog='+mecatalog;
  NGuildForm.NGuildADOQuery2.ConnectionString:='Provider=MSDASQL.1;Password='+mupwd+';Persist Security Info=True;User ID='+muid+';Data Source='+mudsn+';Initial Catalog='+catalog;
  for x := 1 to 8 do
  for y := 1 to 8 do
    agrid[x,y]:=$00666666;
  cor:=$00666666;
  NGuildForm.PaintBox1.Canvas.Pen.Color:=$00666666;
  NGuildForm.PaintBox1.Canvas.Pen.Width:=144;
  NGuildForm.PaintBox1.Canvas.MoveTo(72,0);
  NGuildForm.PaintBox1.Canvas.LineTo(72,144);
  NGuildForm.PaintBox1.Canvas.Pen.width:=1;
  NGuildForm.PaintBox1.Canvas.Pen.Color:=clblack;
  NGuildForm.LinhasGrid;
  NGuildForm.RzEdit1.Text:='';
  NGuildForm.ListarAccounts;
  for i:=0 to 18 do
  begin
    NGuildForm.PaintBox2.Canvas.Pen.Color:=$00666666;
    NGuildForm.PaintBox2.Canvas.MoveTo(0, i);
   	NGuildForm.PaintBox2.Canvas.LineTo(18, i);
  end;
  NGuildForm.PaintBox2.Canvas.Pen.Color:=clwhite;
  NGuildForm.PaintBox2.Canvas.Pen.width:=2;
  NGuildForm.PaintBox2.Canvas.MoveTo(0,0);
  NGuildForm.PaintBox2.Canvas.LineTo(16,16);
  NGuildForm.PaintBox2.Canvas.MoveTo(0,16);
  NGuildForm.PaintBox2.Canvas.LineTo(16,0);
  NGuildForm.NGuildLang;
  NGuildForm.Imagem;
  NGuildForm.Update;
end;

procedure TNGuildForm.SelecionarAccount;
var
  i:byte;
  j:integer;
  AccountSave:string;
begin
  NGuildForm.RzComboBox2.Items.Clear;
  AccountSave:=NGuildForm.RzComboBox1.Text;
  NGuildForm.NGuildADOQuery2.SQL.Clear;
  NGuildForm.ListBox1.Items.Clear;
  if NGuildForm.RzComboBox1.Text<>AllCharacters then
  begin
    NGuildForm.NGuildADOQuery2.SQL.Add('select '+GameID1+','+GameID2+','+GameID3+','+GameID4+','+GameID5+' from '+AccountCharacter+' where '+Id+'='''+AccountSave+'''');
    NGuildForm.NGuildADOQuery2.Open;
    if not ((NGuildForm.NGuildADOQuery2.Eof) and (NGuildForm.NGuildADOQuery2.Bof)) then
      for i:=0 to 4 do
      begin
        if NGuildForm.NGuildADOQuery2.Fields[i].asstring<>'' then
          NGuildForm.ListBox1.Items.Add(NGuildForm.NGuildADOQuery2.Fields[i].asstring);
      end;
    NGuildForm.NGuildADOQuery2.Close;
  end
    else begin
      NGuildForm.NGuildADOQuery2.SQL.Clear;
      NGuildForm.NGuildADOQuery2.SQL.Add('select '+GameID1+','+GameID2+','+GameID3+','+GameID4+','+GameID5+' from '+AccountCharacter+'');
      NGuildForm.NGuildADOQuery2.Open;
      if not ((NGuildForm.NGuildADOQuery2.Eof) and (NGuildForm.NGuildADOQuery2.Bof)) then
        for j := 0 to NGuildForm.NGuildADOQuery2.RecordCount-1 do
        begin
          for i:=0 to 4 do
            if NGuildForm.NGuildADOQuery2.Fields[i].asstring<>'' then
              NGuildForm.ListBox1.Items.Add(NGuildForm.NGuildADOQuery2.Fields[i].asstring);
          NGuildForm.NGuildADOQuery2.Next;
        end;
      NGuildForm.NGuildADOQuery2.Close;
    end;
  if NGuildForm.ListBox1.Items.Count>0 then
    for j := 0 to NGuildForm.ListBox1.Items.Count-1 do
    begin
      NGuildForm.NGuildADOQuery2.SQL.Clear;
      NGuildForm.NGuildADOQuery2.SQL.Add('select '+G_name2+' from '+GuildMember+' where '+name2+'='''+NGuildForm.ListBox1.Items[j]+'''');
      NGuildForm.NGuildADOQuery2.Open;
      if (NGuildForm.NGuildADOQuery2.Eof) and (NGuildForm.NGuildADOQuery2.Bof) then
        NGuildForm.RzComboBox2.Items.Add(NGuildForm.ListBox1.Items[j]);
      NGuildForm.NGuildADOQuery2.close;
    end;
end;

procedure TNGuildForm.Timer1Timer(Sender: TObject);
var
  y2 , x2 , z, x ,y :integer;
begin
  X:=mouse.CursorPos.X-NGuildForm.Paintbox1.ClientOrigin.X;
  Y:=mouse.CursorPos.Y-NGuildForm.Paintbox1.ClientOrigin.Y;
  {Click direito}
  if (GetAsyncKeyState(VK_RBUTTON) = -32768)  then
  begin
    for y2:=0 to 7 do
    for x2:=0 to 7 do
      if (x>=(x2*18)) and (x<((x2*18)+18)) and (y>=(y2*18)) and (y<((y2*18)+18)) then
      begin
        agrid[x2+1,y2+1]:=$00666666;
        for z:=1 to 17 do
        begin
          NGuildForm.PaintBox1.Canvas.Pen.Color:=$00666666;
          NGuildForm.PaintBox1.Canvas.MoveTo(18*(x2)+1, 18*(y2)+z);
        	NGuildForm.PaintBox1.Canvas.LineTo(18*(x2)+18, 18*(y2)+z);
        end;
        if agrid[x2+1,y2+1]=$00666666 then
        begin
          NGuildForm.PaintBox1.Canvas.Pen.Color:=clwhite;
          NGuildForm.PaintBox1.Canvas.Pen.width:=2;
          NGuildForm.PaintBox1.Canvas.MoveTo(18*(x2)+2, 18*(y2)+2);
          NGuildForm.PaintBox1.Canvas.LineTo(18*(x2)+16, 18*(y2)+16);
          NGuildForm.PaintBox1.Canvas.MoveTo(18*(x2)+2, 18*(y2)+16);
      	  NGuildForm.PaintBox1.Canvas.LineTo(18*(x2)+16, 18*(y2)+2);
          NGuildForm.PaintBox1.Canvas.Pen.width:=1;
        end;
      end;
    NGuildForm.Update;
  end;
  {Click Esquerdo}
  if (GetAsyncKeyState(VK_LBUTTON) = -32768) then
  begin
    for y2:=0 to 7 do
    for x2:=0 to 7 do
      if (x>=(x2*18)) and (x<((x2*18)+18)) and (y>=(y2*18)) and (y<((y2*18)+18)) then
      begin
        agrid[x2+1,y2+1]:=cor;
        for z:=1 to 17 do
        begin
          NGuildForm.PaintBox1.Canvas.Pen.Color:=cor;
          NGuildForm.PaintBox1.Canvas.MoveTo(18*(x2)+1, 18*(y2)+z);
        	NGuildForm.PaintBox1.Canvas.LineTo(18*(x2)+18, 18*(y2)+z);
        end;
        if agrid[x2+1,y2+1]=$00666666 then
        begin
          NGuildForm.PaintBox1.Canvas.Pen.Color:=clwhite;
          NGuildForm.PaintBox1.Canvas.Pen.width:=2;
          NGuildForm.PaintBox1.Canvas.MoveTo(18*(x2)+2, 18*(y2)+2);
          NGuildForm.PaintBox1.Canvas.LineTo(18*(x2)+16, 18*(y2)+16);
          NGuildForm.PaintBox1.Canvas.MoveTo(18*(x2)+2, 18*(y2)+16);
      	  NGuildForm.PaintBox1.Canvas.LineTo(18*(x2)+16, 18*(y2)+2);
          NGuildForm.PaintBox1.Canvas.Pen.width:=1;
        end;
      end;
    NGuildForm.Update;
  end;
end;

procedure TNGuildForm.Imagem;
var x,y,z:integer;
begin
  for y:= 1 to 8 do
  for x := 1 to 8  do
    begin
      NGuildForm.PaintBox1.Canvas.Pen.Color:=agrid[x,y];
      for z:=1 to 17 do
      begin
        NGuildForm.PaintBox1.Canvas.MoveTo(18*(x-1)+1, 18*(y-1)+z);
   	    NGuildForm.PaintBox1.Canvas.LineTo(18*(x-1)+18, 18*(y-1)+z);
      end;
      if agrid[x,y]=$00666666 then
      begin
        NGuildForm.PaintBox1.Canvas.Pen.Color:=clwhite;
        NGuildForm.PaintBox1.Canvas.Pen.width:=2;
        NGuildForm.PaintBox1.Canvas.MoveTo(18*(x-1)+2, 18*(y-1)+2);
        NGuildForm.PaintBox1.Canvas.LineTo(18*(x-1)+16, 18*(y-1)+16);
        NGuildForm.PaintBox1.Canvas.MoveTo(18*(x-1)+2, 18*(y-1)+16);
        NGuildForm.PaintBox1.Canvas.LineTo(18*(x-1)+16, 18*(y-1)+2);
        NGuildForm.PaintBox1.Canvas.Pen.width:=1;
      end;
    end;
end;

procedure TNGuildForm.LinhasGrid;
begin
  NGuildForm.PaintBox1.canvas.Pen.width:=1;
  NGuildForm.PaintBox1.canvas.MoveTo(0,0);
  NGuildForm.PaintBox1.Canvas.LineTo(0,144);
  NGuildForm.PaintBox1.canvas.MoveTo(18,0);
  NGuildForm.PaintBox1.Canvas.LineTo(18,144);
  NGuildForm.PaintBox1.canvas.MoveTo(36,0);
  NGuildForm.PaintBox1.Canvas.LineTo(36,144);
  NGuildForm.PaintBox1.canvas.MoveTo(54,0);
  NGuildForm.PaintBox1.Canvas.LineTo(54,144);
  NGuildForm.PaintBox1.canvas.MoveTo(72,0);
  NGuildForm.PaintBox1.Canvas.LineTo(72,144);
  NGuildForm.PaintBox1.canvas.MoveTo(90,0);
  NGuildForm.PaintBox1.Canvas.LineTo(90,144);
  NGuildForm.PaintBox1.canvas.MoveTo(108,0);
  NGuildForm.PaintBox1.Canvas.LineTo(108,144);
  NGuildForm.PaintBox1.canvas.MoveTo(126,0);
  NGuildForm.PaintBox1.Canvas.LineTo(126,144);
  NGuildForm.PaintBox1.canvas.MoveTo(144,0);
  NGuildForm.PaintBox1.Canvas.LineTo(144,144);
//horizontal
  NGuildForm.PaintBox1.canvas.MoveTo(0,0);
  NGuildForm.PaintBox1.Canvas.LineTo(144,0);
  NGuildForm.PaintBox1.canvas.MoveTo(0,18);
  NGuildForm.PaintBox1.Canvas.LineTo(144,18);
  NGuildForm.PaintBox1.canvas.MoveTo(0,36);
  NGuildForm.PaintBox1.Canvas.LineTo(144,36);
  NGuildForm.PaintBox1.canvas.MoveTo(0,54);
  NGuildForm.PaintBox1.Canvas.LineTo(144,54);
  NGuildForm.PaintBox1.canvas.MoveTo(0,72);
  NGuildForm.PaintBox1.Canvas.LineTo(144,72);
  NGuildForm.PaintBox1.canvas.MoveTo(0,90);
  NGuildForm.PaintBox1.Canvas.LineTo(144,90);
  NGuildForm.PaintBox1.canvas.MoveTo(0,108);
  NGuildForm.PaintBox1.Canvas.LineTo(144,108);
  NGuildForm.PaintBox1.canvas.MoveTo(0,126);
  NGuildForm.PaintBox1.Canvas.LineTo(144,126);
  NGuildForm.PaintBox1.canvas.MoveTo(0,144);
  NGuildForm.PaintBox1.Canvas.LineTo(144,144);
//Atualizar
  NGuildForm.Update;
end;

procedure TNGuildForm.NGuildLang;
begin
  NGuildForm.RzGroupBox1.Caption:=NGuildName;
  NGuildForm.RzGroupBox1.Caption:=NGuildMark;
  NGuildForm.RzGroupBox3.Caption:=NGuildGM;
  NGuildForm.RzLabel1.Caption:=NGuildAccount;
  NGuildForm.RzLabel2.Caption:=NGuildCharacter;
  NGuildForm.RzBitBtn1.Caption:=NGuildCreate;
  NGuildForm.RzBitBtn2.Caption:=NGuildCreateEdit;
  NGuildForm.RzBitBtn3.Caption:=NGuildCancel;
end;

procedure TNGuildForm.CriarGuild;
var
  x , y : integer;
  marksql : string;
begin
  if NGuildform.RzEdit1.Text='' then
  begin
    application.MessageBox(pchar(NGuildError1),pchar(NGuildErrorCaption));
    exit;
  end;
  if NGuildform.RzComboBox2.Text='' then
  begin
    application.MessageBox(pchar(NGuildError2),pchar(NGuildErrorCaption));
    exit;
  end;
  marksql:='';
  for y := 1 to 8 do
  for x := 1 to 8 do
    begin
      if agrid[x,y]=$666666 then marksql:=marksql+'0';
      if agrid[x,y]=$000000 then marksql:=marksql+'1';
      if agrid[x,y]=$8c8a8d then marksql:=marksql+'2';
      if agrid[x,y]=$ffffff then marksql:=marksql+'3';
      if agrid[x,y]=$0000fe then marksql:=marksql+'4';
      if agrid[x,y]=$008aff then marksql:=marksql+'5';
      if agrid[x,y]=$ffff00 then marksql:=marksql+'6';
      if agrid[x,y]=$01FF8D then marksql:=marksql+'7';
      if agrid[x,y]=$00ff00 then marksql:=marksql+'8';
      if agrid[x,y]=$8CFF01 then marksql:=marksql+'9';
      if agrid[x,y]=$00ffff then marksql:=marksql+'A';
      if agrid[x,y]=$ff8a00 then marksql:=marksql+'B';
      if agrid[x,y]=$fe0000 then marksql:=marksql+'C';
      if agrid[x,y]=$FF008C then marksql:=marksql+'D';
      if agrid[x,y]=$ff00fe then marksql:=marksql+'E';
      if agrid[x,y]=$8C00FF then marksql:=marksql+'F';
    end;
  NGuildForm.NGuildADOQuery2.SQL.Clear;
  NGuildForm.NGuildADOQuery2.SQL.Add('Select * from '+guild+' where '+G_name+'='''+NGuildform.RzEdit1.Text+'''');
  NGuildForm.NGuildADOQuery2.Open;
  if not((NGuildForm.NGuildADOQuery2.Bof) and (NGuildForm.NGuildADOQuery2.Eof)) then
  begin
    application.MessageBox(pchar(NGuildError3),pchar(NGuildErrorCaption));
    exit;
  end;
  NGuildForm.NGuildADOQuery2.Close;
  NGuildForm.NGuildADOQuery2.SQL.Clear;
  NGuildForm.NGuildADOQuery2.SQL.Add('INSERT INTO '+guild+' ('+G_Name+','+G_Master+','+G_score+')  VALUES ('''+NGuildform.RzEdit1.Text+''','''+NGuildform.RzComboBox2.Text+''',0)');
  NGuildForm.NGuildADOQuery2.ExecSql;
  NGuildForm.NGuildADOQuery2.SQL.Clear;
  NGuildForm.NGuildADOQuery2.SQL.Add('Update '+guild+' set '+g_mark+'=0x'+marksql+' where '+G_Name+'='''+NGuildform.RzEdit1.Text+'''');
  NGuildForm.NGuildADOQuery2.ExecSql;
  NGuildForm.NGuildADOQuery2.SQL.Clear;
  if vs<>'CMT' then
    NGuildForm.NGuildADOQuery2.SQL.Add('INSERT INTO '+guildmember+' ('+G_Name2+','+name2+')  VALUES ('''+NGuildform.RzEdit1.Text+''','''+NGuildform.RzComboBox2.Text+''')')
      else NGuildForm.NGuildADOQuery2.SQL.Add('INSERT INTO '+guildmember+' ('+G_Name2+','+name2+','+G_Level+','+G_status+')  VALUES ('''+NGuildform.RzEdit1.Text+''','''+NGuildform.RzComboBox2.Text+''',0,128)');
  NGuildForm.NGuildADOQuery2.ExecSql;
  Mainform.ListarGuilds;
  NGuildForm.Close;
end;

procedure TNGuildForm.ListarAccounts;
begin
  NGuildForm.RzComboBox1.Items.Clear;
  NGuildForm.RzComboBox1.Items.Add(AllCharacters);
  NGuildForm.RzComboBox2.Items.Clear;
  NGuildForm.NGuildADOQuery1.SQL.Clear;
  NGuildForm.NGuildADOQuery1.SQL.Add('Select '+memb___id+' from '+memb_info);
  NGuildForm.NGuildADOQuery1.Open;
  While not(NGuildForm.NGuildADOQuery1.Eof) do
  begin
    NGuildForm.RzComboBox1.Items.Add(NGuildForm.NGuildADOQuery1.Fields[0].AsString);
    NGuildForm.NGuildADOQuery1.Next;
  end;
  NGuildForm.NGuildADOQuery1.Close;
end;

function TNGuildForm.AccountOnline(TempAccount:String):boolean;
begin
  NGuildForm.NGuildADOQuery1.SQL.Clear;
  NGuildForm.NGuildADOQuery1.SQL.Add('Select '+ConnectStat+' from '+MEMB_STAT+' where '+memb___id3+'='''+TempAccount+'''');
  NGuildForm.NGuildADOQuery1.Open;
  If (NGuildForm.NGuildADOQuery1.Eof) and (NGuildForm.NGuildADOQuery1.Bof) then result:=false
    else begin
      if NGuildForm.NGuildADOQuery1.Fields[0].AsString='0' then  result:=false
        else result:=true;
    end;
  NGuildForm.NGuildADOQuery1.Close;
end;



end.

