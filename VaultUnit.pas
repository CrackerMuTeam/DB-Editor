unit VaultUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Forms,
  Dialogs, DB, ADODB, StdCtrls,strUtils, ValEdit, ExtCtrls, Buttons,globalvar,
  ComCtrls, Menus,
  ToolWin, RzPanel, RzTabs, RzEdit, RzButton, RzRadChk, RzLabel, Mask, RzSpnEdt,
  RzCmboBx, RzTrkBar, RzDBTrak, rzcommon, Controls, Tabs;
type
  TVaultForm = class(TForm)
    SpeedButton1: TSpeedButton;
    RzPageControl1: TRzPageControl;
    TabSheet1: TRzTabSheet;
    TabSheet2: TRzTabSheet;
    RzGroupBox1: TRzGroupBox;
    RzGroupBox2: TRzGroupBox;
    RzMemo1: TRzMemo;
    RzGroupBox3: TRzGroupBox;
    btnIN: TRzBitBtn;
    CheckASerial: TRzCheckBox;
    CheckSkill: TRzCheckBox;
    CheckLuck: TRzCheckBox;
    EO1: TRzCheckBox;
    EO2: TRzCheckBox;
    EO3: TRzCheckBox;
    EO4: TRzCheckBox;
    EO5: TRzCheckBox;
    EO6: TRzCheckBox;
    TipoLB: TRzLabel;
    ItemLB: TRzLabel;
    LevelLB: TRzLabel;
    OpcaoLB: TRzLabel;
    DurLB: TRzLabel;
    SerialLB: TRzLabel;
    AncientLB: TRzLabel;
    TipoCB: TRzComboBox;
    ItemCB: TRzComboBox;
    AncientCB: TRzComboBox;
    RzSpinner1: TRzSpinner;
    LevelTrack: TRzDBTrackBar;
    OpcaoTrack: TRzDBTrackBar;
    cbox: TRzSpinner;
    cboy: TRzSpinner;
    XLB: TRzLabel;
    YLB: TRzLabel;
    VaultPos: TRzLabel;
    VoltarB: TRzBitBtn;
    SaveVaultB: TRzBitBtn;
    Cbsql: TRzCheckBox;
    CheckBox3: TRzCheckBox;
    itemQuery: TADOQuery;
    LevelShowLB: TRzLabel;
    OptionShowLB: TRzLabel;
    SerialEdit: TEdit;
    BitBtn1: TBitBtn;
    popMenuitem: TPopupMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    zenedit: TLabeledEdit;
    RzComboBox1: TRzComboBox;
    VaultADOQuery1: TADOQuery;
    VaultADOQuery2: TADOQuery;
    Timer1: TTimer;
    RzTabControl1: TRzTabControl;
    Image1: TImage;
    RzMemo2: TRzMemo;
    copyrich: TRzMemo;
    RzLabel1: TRzLabel;
    lblspace: TRzLabel;
    TamItem: TRzLabel;
    procedure FormActivate(Sender: TObject);
    procedure FormDeactivate(Sender: TObject);
    procedure Iniciar;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Timer1Timer(Sender: TObject);
    procedure TipoCBChange(Sender: TObject);
    procedure ItemCBChange(Sender: TObject);
    procedure LevelTrackChanging(Sender: TObject; NewPos: Integer;
      var AllowChange: Boolean);
    procedure OpcaoTrackChanging(Sender: TObject; NewPos: Integer;
      var AllowChange: Boolean);
    procedure SerialEditExit(Sender: TObject);
    procedure SerialEditKeyPress(Sender: TObject; var Key: Char);
    procedure CheckASerialClick(Sender: TObject);
    procedure EO1Click(Sender: TObject);
    procedure N1Click(Sender: TObject);
    procedure N3Click(Sender: TObject);
    procedure btnINClick(Sender: TObject);
    procedure RzTabControl1Change(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure SaveVaultBClick(Sender: TObject);

    procedure ClickDireito1(pt:tpoint;sx,sy,ty:integer);
    procedure ClickDireito2(pt:tpoint;sx,sy,ty:integer);
    procedure ClickEsquerdo1(pt:tpoint;sx,sy,ty:integer);
    procedure ClickEsquerdo2(pt:tpoint;sx,sy,ty:integer);
    procedure MoverMouse(pt:tpoint;sx,sy,ty:integer);

  private
    { Private declarations }
  public
    { Public declarations }

  end;

type TItemMdbInfo=record
  Index:byte;
  Classe:byte;
  Nome:string;
  Tipo:string;
  X,Y:byte;
  Wearto:string;
  SetNumber:byte;
  SetItem:string;
  ExcOptionType:string;
end;

type TItemProp=record
  Level:byte;
  Option:byte;
  Dur:byte;
  Luck:boolean;
  Skill:boolean;
  Ancient:string;
  Serial:string;
  Exc:array[1..6] of boolean;
end;

type TItemInfo=record
  ItemMdbInfo:TItemMdbInfo;
  ItemProp:Titemprop;
  X,Y:byte;
  Usar:boolean;
end;

type TEquipInfo=record
  ItemInfo:TItemInfo;
  X,Y,TamX,TamY:Integer;
  Image:String;
end;

type TVaultImg=record
  LagItemX,LagItemY:integer;
  PressD,PressE:Boolean;
  UClickEX,UClickEY:byte;
  UClickDX,UClickDY:byte;
  UClickDT,UCLickET:string;
end;

type TMultiVault=record
     Edit:boolean;
     Zen:string;
end;

type TVaultVar=record
  VaultOn:Boolean;
  QuantidadeDeItems:Integer;
  SetNumber:byte;
  OptionNum:byte;
  itemspc:array of string;
  ExtraVaults:array[0..255] of TMultiVault;
  VaultAtual:integer;
  cItem:array[1..3] of string;
  VaultHex:array[0..255,0..7,0..14] of string;
  InventoryHex:array[0..7,0..7] of string;
  PSHex:array[0..7,0..3] of string;
  EqpHex:array[0..11] of string;
  VaultItems :array[1..120] of TItemInfo;
  EquipItems :array[0..11] of TEquipInfo;
  InventoryItems :array[1..64] of TItemInfo;
  PSItems :array[1..32] of TItemInfo;
  ItemClick:integer;
  InvAtual:string;
  Ultimows:integer;
  Ultimoinv:integer;
  Ultimops:integer;
end;


var
  VaultForm: TVaultForm;
  VaultVar: tVaultVar;
  IBuffer : TBitmap;
  VaultImg:TVaultImg;
  MdbItems:array of TItemMdbInfo;
  TimerEnable:boolean;
implementation
uses mainunit;

{$R *.dfm}
function MessageShow(text,caption:string;flags:integer):integer;
begin
  VaultForm.Timer1.Enabled:=false;
  Result:=Application.MessageBox(pchar(text),pchar(caption),flags);
  VaultForm.Timer1.Enabled:=true;
end;

procedure ChangeTimerEnable(b:boolean);
begin
  VaultForm.Timer1.Enabled:=b;
  TimerEnable:=b;
end;

function VerificarVaultItem(Sx,Sy:integer): integer ;
var I:integer;
begin
  Result:=0;
  for I := 1 to 120 do
    if (VaultVar.VaultItems[i].usar=true) and (VaultVar.VaultItems[i].X<=Sx) and (VaultVar.VaultItems[i].X+VaultVar.VaultItems[i].ItemMdbInfo.X-1>=Sx) and (VaultVar.VaultItems[i].Y<=Sy) and (VaultVar.VaultItems[i].Y+VaultVar.VaultItems[i].ItemMdbInfo.Y-1>=Sy) then
    begin
      Result:=i;
      Exit;
    end;
end;
function VerificarInvItem(Sx,Sy:integer): integer ;
var I:integer;
begin
  Result:=0;
  for I := 1 to 64 do
    if (VaultVar.InventoryItems[i].usar=true) and (VaultVar.InventoryItems[i].X<=Sx) and (VaultVar.InventoryItems[i].X+VaultVar.InventoryItems[i].ItemMdbInfo.X-1>=Sx) and (VaultVar.InventoryItems[i].Y<=Sy) and (VaultVar.InventoryItems[i].Y+VaultVar.InventoryItems[i].ItemMdbInfo.Y-1>=Sy) then
    begin
      Result:=i;
      Exit;
    end;
end;
function VerificarPSItem(Sx,Sy:integer): integer ;
var I:integer;
begin
  Result:=0;
  for I := 1 to 32 do
    if (VaultVar.PSItems[i].usar=true) and (VaultVar.PSItems[i].X<=Sx) and (VaultVar.PSItems[i].X+VaultVar.PSItems[i].ItemMdbInfo.X-1>=Sx) and (VaultVar.PSItems[i].Y<=Sy) and (VaultVar.PSItems[i].Y+VaultVar.PSItems[i].ItemMdbInfo.Y-1>=Sy) then
    begin
      Result:=i;
      Exit;
    end;
end;
function VerificarEquipItem(j:integer): integer ;
begin
  result:=12;
  if VaultVar.EquipItems[j].ItemInfo.Usar=true then
    result:=j;
end;
function VerificarEquipItembyPos(SX,SY:integer): integer ;
var I:integer;
begin
  Result:=12;
  for I := 0 to 11 do
    if (VaultVar.EquipItems[i].X<=Sx) and (VaultVar.EquipItems[i].X+VaultVar.EquipItems[i].TamX-1>=Sx) and (VaultVar.EquipItems[i].Y<=Sy) and (VaultVar.EquipItems[i].Y+VaultVar.EquipItems[i].TamY-1>=Sy) then
    begin
      Result:=i;
      Exit;
    end;
end;


function GetTag(const I:integer):integer ;  {Opções Excelents}
begin
  case i of
    1:result:=1;
    2:result:=2;
    3:result:=4;
    4:result:=8;
    5:result:=16;
    6:result:=32;
    else result:=0;
  end;
end;
function GetItemName(s:string):TItemMdbInfo;
type Tcharset=set of char;
var
  I,id:Integer;
  CS:tcharset;
  B:boolean;
begin
  if (ItemHexType=0) or (ItemHexType=1) then
    for I := 0 to VaultVar.QuantidadeDeItems do
    begin
      CS:=['0'..'7'];
      b:=false;
      if MdbItems[i].index<32 then
        id:=MdbItems[i].Classe*32+MdbItems[i].index
        else begin
          id:=MdbItems[i].Classe*32+MdbItems[i].index-32;
          b:=true;
        end;
      if MdbItems[i].Classe>=8 then
      begin
        id:=id-256;
        CS:=['8','9','A','B','C','D','E','F'];
      end;
      if (s[1]+s[2]=GlobalConfig.bytetohex(id)) and (s[15] in CS) then
      begin
        if (ItemHexType=0) then
        begin
          result:=MdbItems[i];
          break;
        end;
        if (ItemHexType=1) then
        begin
          if (b=true) and (GlobalConfig.hextoint(s[7]+s[8])>=GlobalConfig.hextoint('F9')) then
          begin
            result:=MdbItems[i];
            break;
          end;
          if (b=false) and (GlobalConfig.hextoint(s[7]+s[8])<GlobalConfig.hextoint('F9')) then
           begin
            result:=MdbItems[i];
            break;
          end;
        end;

      end;
    end;
  if (ItemHexType=2) then
    for I := 0 to VaultVar.QuantidadeDeItems do
      if (s[1]+s[2]=GlobalConfig.bytetohex(MdbItems[i].index)) and (s[19]=GlobalConfig.bytetohex(MdbItems[i].Classe)) then
      begin
        result:=MdbItems[i];
        break;
      end;
end;
function GetItemProperty(s:string):TItemprop;
var
  n,x,y,z,a,b,c,v,p15,aff,pex,p14:integer;
  iserr:boolean;
begin
    iserr:=true;
  for n:=0 to 1 do
  for x:=0 to 15 do
  for y:=0 to 1 do
  for z:=0 to 3 do
  for a:=0 to 1 do
    if 128*n+8*x+4*y+z+a*108=GlobalConfig.hextoint(s[3]+s[4]) then
    begin
      result.Level:=x;
      result.option:=z;
      result.dur:=GlobalConfig.hextoint(s[5]+s[6]);
      if n=1 then result.skill:=true else result.skill:=false;
      if y=1 then result.Luck:=true else result.luck:=false;
      iserr:=false;
      p15:=GlobalConfig.hextoint(s[15]);
      if p15>=12 then
      begin
        result.option:=z+4;
        pex:=p15-12;
      end
        else if p15>=8 then
        begin
          pex:=p15-8
        end
          else if p15>=4 then
          begin
            result.option:=z+4;
            pex:=p15-4;
          end
            else begin
              pex:=p15;
            end;
    end;

  result.ancient:='';
  if (ItemHexType=2) or (ItemHexType=1)  then
  begin
    if (s[17]+s[18]='05') then
      result.ancient:='05';
    if (s[17]+s[18]='06') then
      result.ancient:='06';
    if (s[17]+s[18]='09') then
      result.ancient:='09';
    if (s[17]+s[18]='0A') then
      result.ancient:='0A';
  end;

  result.serial:=s[7]+s[8]+s[9]+s[10]+s[11]+s[12]+s[13]+s[14];
  //if (ItemHexType=1) then result.serial:=s[9]+s[10]+s[11]+s[12]+s[13]+s[14];

  result.exc[1]:=false;
  result.exc[2]:=false;
  result.exc[3]:=false;
  result.exc[4]:=false;
  result.exc[5]:=false;
  result.exc[6]:=false;
  pex:=GlobalConfig.hextoint(inttostr(pex)+s[16]);
  for a:=0 to 1 do
  for b:=0 to 1 do
  for c:=0 to 1 do
  for x:=0 to 1 do
  for y:=0 to 1 do
  for z:=0 to 1 do
    if a+2*b+4*c+8*x+16*y+32*z=pex then
    begin
      if a<>0 then result.Exc[1]:=true else result.Exc[1]:=false;
      if b<>0 then result.Exc[2]:=true else result.Exc[2]:=false;
      if c<>0 then result.Exc[3]:=true else result.Exc[3]:=false;
      if x<>0 then result.Exc[4]:=true else result.Exc[4]:=false;
      if y<>0 then result.Exc[5]:=true else result.Exc[5]:=false;
      if z<>0 then result.Exc[6]:=true else result.Exc[6]:=false;
    end;
end;
function GetItemStringInfo(item:TItemInfo):string;
var s:string;
i,Ti:byte;
X:string;
begin
  s:='';
  s:=s+format(ItemNome,[item.ItemMdbInfo.Nome])+#13;
  s:=s+format(ItemLevel,[inttostr(item.ItemProp.Level)])+#13;
  s:=s+format(ItemOption,[inttostr(item.ItemProp.Option*VaultVar.OptionNum)])+#13;
  s:=s+format(ItemDur,[inttostr(item.ItemProp.Dur)])+#13;
  if item.ItemProp.Skill=true then s:=s+format(ItemSkill,[ItemSkillOn])+#13
    else s:=s+format(ItemSkill,[ItemSkillOff])+#13;
  if item.ItemProp.Luck=true then s:=s+format(ItemLuck,[ItemLuckOn])+#13
    else s:=s+format(ItemLuck,[ItemLuckOff])+#13;
  if (itemhextype=1) or (itemhextype=1) then
  begin
    if item.ItemProp.Ancient='00' then s:=s+format(ItemAncient,[AncientNormal])+#13;
    if item.ItemProp.Ancient='05' then s:=s+format(ItemAncient,[Ancient5])+#13;
    if item.ItemProp.Ancient='06' then s:=s+format(ItemAncient,[Ancient5sta])+#13;
    if item.ItemProp.Ancient='09' then s:=s+format(ItemAncient,[Ancient10])+#13;
    if item.ItemProp.Ancient='0A' then s:=s+format(ItemAncient,[Ancient10sta])+#13;
  end;
  x:=''+#13;
  ti:=2;
  for i := 1 to 6 do
    if item.ItemProp.Exc[i]=true then
    begin
      if item.ItemMdbInfo.ExcOptionType='we' then Ti:=1;
      if item.ItemMdbInfo.ExcOptionType='any' then Ti:=2;
      if item.ItemMdbInfo.ExcOptionType='ar' then Ti:=3;
      if item.ItemMdbInfo.ExcOptionType='fen' then Ti:=4;
      if item.ItemMdbInfo.ExcOptionType='or' then Ti:=5;
      if item.ItemMdbInfo.ExcOptionType='wi' then Ti:=6;
      x:=x+ExcItemTypes[i,ti]+#13;
    end;
  if x=#13 then S:=s+NonExc+#13+#13
    else s:=s+format(ItemExcellent,[x])+#13+#13;
  s:=s+format(ItemSerial,[item.ItemProp.Serial]);
  result:=s;
end;

function WsToImage(Item:TItemInfo;arquivo:string;YEx:Integer):boolean;
var
  b:boolean;
  i,t:integer;
  s:string;
  cor:tcolor;
  ItemBmp:Tbitmap;
begin
  result:=false;
  try
    ItemBmp:=tbitmap.Create();
    ItemBMP.Width:=vaultimg.LagItemY;
    ItemBMP.Height:=vaultimg.LagItemX;
    ItemBMP.LoadFromFile(arquivo);
    b:=false;

    For I:=1 to 6 do
      if item.ItemProp.Exc[i]=true then b:=true;

    if (b=false) and (item.ItemProp.Ancient='') then
      cor:=clwhite;
    if (b=false) and (item.ItemProp.Ancient<>'') then
      cor:=$0042DD7C;
    if (b=true) and (item.ItemProp.Ancient='') then
      cor:=clGreen;
    if (b=true) and (item.ItemProp.Ancient<>'') then
      cor:= $003DFE21;

    for I := item.X to item.X+item.ItemMdbInfo.X-1 do
      for t := item.Y to item.Y+item.ItemMdbInfo.Y-1 do
        IBuffer.Canvas.CopyRect(Bounds(i*vaultimg.lagitemX,t*vaultimg.lagitemY+YEx,vaultimg.lagitemX,vaultimg.lagitemY),itembmp.canvas,Bounds(0,0,itembmp.Width,itembmp.Height));

    ibuffer.Canvas.Pen.Color:=cor;
    i:=(item.X+item.ItemMdbInfo.X)*vaultimg.lagitemX;
    t:=(item.Y+item.ItemMdbInfo.Y)*vaultimg.lagitemY;

    ibuffer.Canvas.MoveTo(item.X*vaultimg.lagitemX,item.Y*vaultimg.lagitemY+YEx);
    ibuffer.Canvas.LineTo(i-1,(item.Y*vaultimg.lagitemY)+YEx);

    ibuffer.Canvas.MoveTo(item.X*vaultimg.lagitemX,t-1+YEx);
    ibuffer.Canvas.LineTo(i,t-1+YEx);

    ibuffer.Canvas.MoveTo(item.X*vaultimg.lagitemX,item.Y*vaultimg.lagitemY+YEx);
    ibuffer.Canvas.LineTo(item.X*vaultimg.lagitemX,t-1+YEx);

    ibuffer.Canvas.MoveTo(i-1,item.Y*vaultimg.lagitemY+YEx);
    ibuffer.Canvas.LineTo(i-1,t+YEx);

    ibuffer.Canvas.Font.Name:='MS Serif';
    ibuffer.Canvas.Font.Size:=7;
    ibuffer.Canvas.Font.Color:=cor;
    ibuffer.Canvas.Brush.Style := bsClear;
    s:='';
    t:=3;
    for I := 1 to length(item.ItemMdbInfo.nome) do
    begin
      s:=s+item.ItemMdbInfo.nome[i];
      if ibuffer.Canvas.TextWidth(s)>=(item.ItemMdbInfo.x)*vaultimg.lagitemX-10 then
      begin
        if (t+ibuffer.Canvas.TextHeight(s))<item.ItemMdbInfo.y*vaultimg.lagitemY-6 then
        begin
          ibuffer.Canvas.TextOut(item.X*vaultimg.lagitemX+3,item.Y*vaultimg.lagitemY+t+YEx,s);
          t:=t+ibuffer.Canvas.TextHeight(s);
        end;
        s:='';
      end;
    end;
    if (t+ibuffer.Canvas.TextHeight(s))<item.ItemMdbInfo.y*vaultimg.lagitemY-6 then
      ibuffer.Canvas.TextOut(item.X*vaultimg.lagitemX+3,item.Y*vaultimg.lagitemY+t+YEx,s);

    vaultform.image1.Canvas.Draw(0,0,IBuffer);
  finally
    itembmp.Free;
    result:=true;
  end;
end;
function EqpToImage(Item:TItemInfo;arquivo:string):boolean;
var b:boolean;
i,t:integer;
s:string;
cor:tcolor;
  ItemBmp:Tbitmap;
  x,y:integer;
begin
  result:=false;
  try
  ItemBmp:=tbitmap.Create();
  ItemBMP.Width:=vaultimg.LagItemY;
  ItemBMP.Height:=vaultimg.LagItemX;
  ItemBMP.LoadFromFile(arquivo);
  x:=item.X;
  Y:=item.Y;
  b:=false;
  For I:=1 to 6 do
    if item.ItemProp.Exc[i]=true then b:=true;

  if (b=false) and (item.ItemProp.Ancient='') then
  begin
    cor:=clwhite;
  end;
  if (b=false) and (item.ItemProp.Ancient<>'') then
  begin
    cor:=$0042DD7C;
  end;
  if (b=true) and (item.ItemProp.Ancient='') then
  begin
    cor:=clGreen;
  end;
  if (b=true) and (item.ItemProp.Ancient<>'') then
  begin
    cor:= $003DFE21;
  end;

  for I := item.X to item.X+item.ItemMdbInfo.X-1 do
    for t := item.Y to item.Y+item.ItemMdbInfo.Y-1 do
      IBuffer.Canvas.CopyRect(Bounds(i*vaultimg.lagitemX,t*vaultimg.lagitemY,vaultimg.lagitemX,vaultimg.lagitemY),itembmp.canvas,Bounds(0,0,itembmp.Width,itembmp.Height));
   ibuffer.Canvas.Pen.Color:=cor;
  i:=(vaultvar.EquipItems[item.Y].X+vaultvar.EquipItems[item.Y].TamX);
  t:=(vaultvar.EquipItems[item.Y].Y+vaultvar.EquipItems[item.Y].TamY);
  ibuffer.Canvas.MoveTo(vaultvar.EquipItems[item.Y].X,vaultvar.EquipItems[item.Y].Y);
  ibuffer.Canvas.LineTo(i-1,(vaultvar.EquipItems[item.Y].Y));

  ibuffer.Canvas.MoveTo(item.X*vaultimg.lagitemX,t-1);
  ibuffer.Canvas.LineTo(i,t-1);

  ibuffer.Canvas.MoveTo(vaultvar.EquipItems[item.Y].X,vaultvar.EquipItems[item.Y].Y);
  ibuffer.Canvas.LineTo(vaultvar.EquipItems[item.Y].X,t-1);

  ibuffer.Canvas.MoveTo(i-1,vaultvar.EquipItems[item.Y].Y);
  ibuffer.Canvas.LineTo(i-1,t);
  ibuffer.Canvas.Font.Name:='MS Serif';
  ibuffer.Canvas.Font.Size:=7;
  ibuffer.Canvas.Font.Color:=cor;
  ibuffer.Canvas.Brush.Style := bsClear;
  ibuffer.Canvas.Font.Size:=7;
  s:='';
  t:=3;
  for I := 1 to length(item.ItemMdbInfo.nome) do
  begin
    s:=s+item.ItemMdbInfo.nome[i];
    if ibuffer.Canvas.TextWidth(s)>=vaultvar.EquipItems[item.Y].TamX-10 then
    begin
      if (t+ibuffer.Canvas.TextHeight(s))<vaultvar.EquipItems[item.Y].TamY-6 then
      begin
        ibuffer.Canvas.TextOut(vaultvar.EquipItems[item.Y].X+3,vaultvar.EquipItems[item.Y].Y+t,s);
        t:=t+ibuffer.Canvas.TextHeight(s);
      end;
      s:='';
    end;

  end;
  if (t+ibuffer.Canvas.TextHeight(s))<vaultvar.EquipItems[item.Y].Y-6 then
    ibuffer.Canvas.TextOut(vaultvar.EquipItems[item.Y].X+3,vaultvar.EquipItems[item.Y].Y+t,s);


  vaultform.image1.Canvas.Draw(0,0,IBuffer);
  finally
    itembmp.Free;
    result:=true;
  end;
end;


Function ItemToWs(Item:TItemInfo;tipo:string;X,Y:Integer;Msg:String):boolean;
var i,t:integer;
    CanInsert:boolean;
    s:string;
begin
  result:=true;
  caninsert:=true;
  if ((item.X+item.ItemMdbInfo.x-1)>X) or ((item.Y+item.ItemMdbInfo.y-1)>Y) then caninsert:=false;
  if caninsert=false then
  begin
    MessageShow(Format(Msg,[item.ItemMdbInfo.nome,inttostr(item.ItemMdbInfo.X)+'x'+inttostr(item.ItemMdbInfo.Y)])+#13+#13+Format(VaultError2,[inttostr(item.ItemMdbInfo.X)+'x'+inttostr(item.ItemMdbInfo.Y)]),VaultErrorCaption,mb_ok+mb_iconwarning);
    result:=false;
    exit;
  end;
  for i:=item.X to (item.X+item.ItemMdbInfo.x-1) do
  for t:=item.Y to (item.Y+item.ItemMdbInfo.y-1) do
  begin
    if (tipo='ws') and (VerificarVaultItem(i,t)<>0) then
      caninsert:=false;
    if (tipo='inv') and (VerificarInvItem(i,t)<>0) then
      caninsert:=false;
    if (tipo='ps') and (VerificarpsItem(i,t)<>0) then
      caninsert:=false;
  end;

  if caninsert=false then
  begin
    MessageShow(Format(Msg,[item.ItemMdbInfo.nome,inttostr(item.ItemMdbInfo.X)+'x'+inttostr(item.ItemMdbInfo.Y)])+#13+#13+Format(VaultError2,[inttostr(item.ItemMdbInfo.X)+'x'+inttostr(item.ItemMdbInfo.Y)]),VaultErrorCaption,mb_ok+mb_iconwarning);
    result:=false;
    exit;
  end;
end;
Function ItemToEqp(Item:TItemInfo):boolean;
var CanInsert:boolean;
begin
  result:=true;
  caninsert:=true;
  if VerificarequipItem(item.Y)<>12 then
    caninsert:=false;
  if caninsert=false then
  begin
    MessageShow(Format(VaultError1,[item.ItemMdbInfo.nome,inttostr(item.ItemMdbInfo.X)+'x'+inttostr(item.ItemMdbInfo.Y)])+#13+#13+Format(VaultError2,[inttostr(item.ItemMdbInfo.X)+'x'+inttostr(item.ItemMdbInfo.Y)]),VaultErrorCaption,mb_ok+mb_iconwarning);
    result:=false;
    exit;
  end;
end;

function SetItemInfo(S:string;Xx,Yy:Integer;tipo:string):boolean;
var
  Item:TItemInfo;
begin
  result:=true;
  item.ItemMdbInfo:=GetItemName(S);
  item.X:=Xx;
  item.Y:=Yy;
  if item.ItemMdbInfo.Nome='' then
  begin
    item.ItemMdbInfo.Tipo:='miss';
    item.ItemMdbInfo.Nome:='miss';
    item.ItemMdbInfo.X:=1;
    item.ItemMdbInfo.Y:=1;
  end;
  item.ItemProp:=GetItemProperty(s);
  if (tipo='ws') and (ItemtoWs(item,tipo,7,14,vaulterror1)=true) then
  begin
    item.Usar:=true;
    WsToImage(item,ExtractFilePath(Application.ExeName)+'CMT Data\VaultImages\InventoryBox2.bmp',0);
    inc(vaultvar.Ultimows);
    vaultvar.VaultItems[vaultvar.Ultimows]:=item;

  end;
  if (tipo='inv') and (Itemtows(item,tipo,7,7,vaulterror1)=true) then
  begin
    item.Usar:=true;
    wsToImage(item,ExtractFilePath(Application.ExeName)+'CMT Data\VaultImages\InventoryBox2.bmp',225);
    inc(vaultvar.Ultimoinv);
    vaultvar.inventoryItems[vaultvar.Ultimoinv]:=item;
  end;
  if (tipo='eqp') and (Itemtoeqp(item)=true) then
  begin
    item.Usar:=true;
    eqpToImage(item, vaultvar.EquipItems[yy].Image);
    vaultvar.EquipItems[yy].ItemInfo:=item;
  end;
  if (tipo='ps') and (Itemtows(item,tipo,7,3,vaulterror1)=true) then
  begin
    item.Usar:=true;
    wsToImage(item, ExtractFilePath(Application.ExeName)+'CMT Data\VaultImages\InventoryBox2.bmp',0);
    inc(vaultvar.Ultimops);
    vaultvar.psItems[vaultvar.Ultimops]:=item;
  end;
end;
function CorrigirVault(s:string):string;
var Stemp,xs:string;
X,Y,I:byte;
begin
  xs:=s;
  sTemp:='';
  for X:=0 to 7 do
  for Y:=0 to 14 do
    sTemp:=sTemp+VaultVar.citem[3];
  if s=sTemp then
  begin
    xs:='';
    for Y:=0 to 14 do
    for X:=0 to 7 do
      xs:=xs+VaultVar.citem[2];
  end;
  result:=xs;
end;
function CorrigirInv(s:string):string;
var Stemp,xs:string;
I,X:integer;
begin
  xs:=s;
  sTemp:='';
  i:=75;
  if (PSTable=Character) and (PSCollumn=Inventory) and (PSRef=CName) then
    i:=i+32;
  for X:=0 to i do
    sTemp:=sTemp+VaultVar.citem[3];
  if s=sTemp then
  begin
    xs:='';
    for X:=0 to i do
      xs:=xs+VaultVar.citem[2];
  end;
  result:=xs;
end;


function SalvarWarehouse:boolean;
var
  i,t,j:integer;
  sSql,sSqlSub,
  psSql,psSqlSub:string;
begin
  if vaultvar.VaultOn=true then
  begin
    vaultvar.ExtraVaults[vaultvar.VaultAtual].zen:=vaultform.zenedit.text;

    ssql:='update '+warehouse+' set '+Money+'='+vaultvar.ExtraVaults[255].zen+','+Items+'=0x';
    for i:=0 to 14 do
    for t:=0 to 7 do
      ssqlsub:=ssqlsub+vaultvar.VaultHex[255,t,i];
    ssql:=ssql+ssqlsub+' where '+AccountID2+'='''+accountsel+'''' ;
    if multivaulttable<>'' then
      for j := 1 to MultiVaultTotal do
        if vaultvar.ExtraVaults[j].edit=true then
        begin
          ssql:=ssql+' update '+multivaulttable+' set '+multivaultMoney+'='+vaultvar.ExtraVaults[j].zen+','+multivaultItems+'=0x';
          ssqlsub:='';
          for i:=0 to 14 do
          for t:=0 to 7 do ssqlsub:=ssqlsub+vaultvar.VaultHex[j,t,i];
            ssql:=ssql+ssqlsub+' where '+multivaultID+'='''+accountsel+''' and '+multivaultnum+'='+inttostr(j)+'' ;
        end;
    if (VaultForm.cbsql.Checked) and (MessageShow(ssql,'Query',mb_yesno+mb_iconinformation)=mrno) then
    begin
      screen.Cursor:=0;
      result:=false;
      exit;
    end;
    if VaultForm.checkbox3.checked then
    begin
      VaultForm.copyrich.Lines.Clear;
      VaultForm.copyrich.Lines.Add(ssql);
      VaultForm.copyrich.SelectAll;
      VaultForm.copyrich.CopyToClipboard;
    end;
    with VaultForm.VaultAdoquery2 do
    begin
      sql.clear;
      sql.add(ssql);
      try
        execsql;
        result:=true;
      except
        on e:exception do
        begin
          MessageShow(e.Message,VaultErrorCaption,mb_ok+mb_iconerror);
          result:=false;
        end;
      end;
    end;
  end;
end;

procedure FillHexWS(item:TField); {Le o Vault em hexa}
type Tcharset=set of char;
var itemblock:array of byte;
    sWS,sItem:string;
    X,Y,i,j,panelcount:integer;
    ItemInf:TitemInfo;
begin
  with item do
  begin
    try
      sws:='';
      if VaultVar.ExtraVaults[VaultVar.VaultAtual].Edit=False then
        begin
          setlength(itemblock,item.datasize);
          item.getdata(itemblock);
          i:=2;
          j:=2;
          while j<=high(itemblock) do
          begin
            sws:=sws+uppercase(GlobalConfig.bytetohex(itemblock[i]));
            j:=i;
            inc(j);
            inc(i);
          end;
          sws:=CorrigirVault(sws)
        end
        else begin
          for Y:=0 to 14 do
          for X:=0 to 7 do
            sws:=sws+VaultVar.VaultHex[VaultVar.VaultAtual,X,Y];
        end;
      panelcount:=0;

      for Y:=0 to 14 do
      for X:=0 to 7 do
        begin
          sitem:=midstr(sws,ItemHexCount*8*(Y)+ItemHexCount*(X)+1,ItemHexCount);
          VaultVar.VaultHex[VaultVar.VaultAtual,X,Y]:=sitem;
          if (sitem=VaultVar.citem[1]) or (sitem=VaultVar.citem[2]) or (sitem=VaultVar.citem[3]) then
            sitem:='';
          if sitem<>'' then
          begin
            SetItemInfo(sitem,X,Y,'ws');
          end;
        end;
     except
       on E:exception do MessageShow(e.Message,VaultErrorCaption,mb_ok+mb_iconerror);
     end;
  end;
end;
procedure FillHexInv(item:TField;S:string); {Le o Vault em hexa}
type Tcharset=set of char;
var itemblock:array of byte;
    sWS,sItem:string;
    X,Y,i,j,panelcount:integer;
    ItemInf:TitemInfo;
begin
  with item do
  begin
    try
      if (s='inv') or (s='invps') then
      begin
        sws:='';
        setlength(itemblock,item.datasize);
        item.getdata(itemblock);
        i:=2;
        j:=2;
        while j<=high(itemblock) do
        begin
          sws:=sws+uppercase(GlobalConfig.bytetohex(itemblock[i]));
          j:=i;
          inc(j);
          inc(i);
        end;
        sws:=CorrigirInv(sws);
      end;
      if (s='inv2') or (s='invps2') then
      begin
        for Y:=0 to 11 do
          sws:=sws+VaultVar.EqpHex[Y];
        for Y:=0 to 7 do
        for X:=0 to 7 do
          sws:=sws+VaultVar.InventoryHex[X,Y];
        if (PSTable=Character) and (PSCollumn=Inventory) and (PSRef=CName) then
          for Y:=0 to 4 do
          for X:=0 to 7 do
            sws:=sws+VaultVar.PSHex[X,Y];
      end;
      panelcount:=0;

      for Y := 0 to 11 do
      begin
        sitem:=midstr(sws,ItemHexCount*(X)+1,ItemHexCount);
        VaultVar.EqpHex[X]:=sitem;
        if (sitem=VaultVar.citem[1]) or (sitem=VaultVar.citem[2]) or (sitem=VaultVar.citem[3]) then
          sitem:='';
        if sitem<>'' then
        begin
          SetItemInfo(sitem,0,Y,'eqp');
        end;
      end;

      for Y:=0 to 7 do
      for X:=0 to 7 do
        begin
          sitem:=midstr(sws,ItemHexCount*8*(Y)+ItemHexCount*(X)+1+(12*ItemHexCount),ItemHexCount);
          VaultVar.InventoryHex[X,Y]:=sitem;
          if (sitem=VaultVar.citem[1]) or (sitem=VaultVar.citem[2]) or (sitem=VaultVar.citem[3]) then
            sitem:='';
          if sitem<>'' then
          begin
            SetItemInfo(sitem,X,Y,'inv');
          end;
        end;

      if (PSTable=Character) and (PSCollumn=Inventory) and (PSRef=CName) then
        for Y:=0 to 4 do
        for X:=0 to 7 do
          begin
            sitem:=midstr(sws,ItemHexCount*8*(Y)+ItemHexCount*(X)+1+(12*ItemHexCount)+(64*ItemHexCount),ItemHexCount);
            VaultVar.PSHex[X,Y]:=sitem;
            if (sitem=VaultVar.citem[1]) or (sitem=VaultVar.citem[2]) or (sitem=VaultVar.citem[3]) then
              sitem:='';
            if sitem<>'' then
            begin
              SetItemInfo(sitem,X,Y,'ps');
            end;
          end;
     except
       on E:exception do MessageShow(e.Message,VaultErrorCaption,mb_ok+mb_iconerror);
     end;
  end;
end;
procedure FillHexPS(item:TField;S:string); {Le o Vault em hexa}
type Tcharset=set of char;
var itemblock:array of byte;
    sWS,sItem:string;
    X,Y,i,j,panelcount:integer;
    ItemInf:TitemInfo;
begin
  with item do
  begin
    try
      if (s='ps') then
      begin
        sws:='';
        setlength(itemblock,item.datasize);
        item.getdata(itemblock);
        i:=2;
        j:=2;
        while j<=high(itemblock) do
        begin
          sws:=sws+uppercase(GlobalConfig.bytetohex(itemblock[i]));
          j:=i;
          inc(j);
          inc(i);
        end;
        sws:=CorrigirInv(sws);
      end;
      if (s='ps2')  then
        for Y:=0 to 4 do
        for X:=0 to 7 do
          sws:=sws+VaultVar.PSHex[X,Y];
      panelcount:=0;

      for Y:=0 to 4 do
      for X:=0 to 7 do
        begin
          sitem:=midstr(sws,ItemHexCount*8*(Y)+ItemHexCount*(X)+1,ItemHexCount);
          VaultVar.PSHex[X,Y]:=sitem;
          if (sitem=VaultVar.citem[1]) or (sitem=VaultVar.citem[2]) or (sitem=VaultVar.citem[3]) then
            sitem:='';
          if sitem<>'' then
          begin
            SetItemInfo(sitem,X,Y,'ps');
          end;
        end;
     except
       on E:exception do MessageShow(e.Message,VaultErrorCaption,mb_ok+mb_iconerror);
     end;
  end;
end;
procedure DeleteVaultItem(item:TitemInfo);
var i,j,X2,Y2,X,Y:integer;
  ImgTemp:Tbitmap;
begin
  X:=item.X;
  Y:=item.Y;
  i:=VerificarVaultItem(X,Y);
  for j := i to vaultvar.Ultimows-1 do
    vaultvar.VaultItems[j]:=vaultvar.VaultItems[j+1];
  vaultvar.VaultItems[vaultvar.Ultimows].Usar:=false;
  dec(vaultvar.Ultimows);
  ImgTemp:= tbitmap.Create();
  ImgTemp.LoadFromFile(ExtractFilePath(Application.ExeName)+'CMT Data\VaultImages\Item_box.BMP');
  for X2:= X to X+VaultVar.VaultItems[i].ItemMdbInfo.X-1  do
    for Y2:= Y to Y+VaultVar.VaultItems[i].ItemMdbInfo.Y-1  do
      Ibuffer.Canvas.CopyRect(bounds(X2*VaultImg.LagItemX,Y2*VaultImg.LagItemY,vaultimg.LagItemX,vaultimg.LagItemY),imgtemp.Canvas,bounds(0,0,vaultimg.LagItemX,vaultimg.LagItemY));
  VaultVar.VaultHex[VaultVar.VaultAtual,X,Y]:=VaultVar.citem[2];
  ImgTemp.Free;
end;

procedure ItemADD(S:string);
var
Hex,Hex1,Hex2,Hex3,Hex4,Hex5,Hex6,Hex7,Hex8:String;
i,j,id:integer;
Unique2:Boolean;
Unique,Level,Option2,Exc,Anc:byte;
begin
  Hex1:='FF'; Hex2:='00'; Hex3:='00'; Hex4:='00000000'; Hex5:='00'; Hex6:='00'; Hex7:='00'; Hex8:='';
  Option2:=0; Exc:=0; Level:=0; Unique:=0; Anc:=0;
  Unique2:=False;
  {ID-Hex1}
  for I := 0 to VaultVar.QuantidadeDeItems do
  begin
    Unique:=0;
    Unique2:=false;
    if MdbItems[i].index<32 then
      id:=MdbItems[i].Classe*32+MdbItems[i].index
      else begin
        id:=MdbItems[i].Classe*32+MdbItems[i].index-32;
        Unique2:=true;
      end;
    if MdbItems[i].Classe>=8 then
    begin
      id:=id-256;
      Unique:=128;
    end;
    if MdbItems[i].Nome=vaultform.itemCB.Text then
    begin
      if (ItemHexType=0) or (ItemHexType=1) then
        Hex1:=inttohex(id,2);
      if (itemhextype=2) then
      begin
        Hex1:=inttohex(MdbItems[i].index,2);
        Hex7:=inttohex(MdbItems[i].Classe,1)+'0';
        Hex8:='000000000000';
      end;
      break;
    end;
  end;
  {Level-Hex2}
  Level:=(vaultform.leveltrack.Position)*8;
  if vaultform.OpcaoTrack.Position>3 then
  begin
    Option2:=64;
    Level:=Level+vaultform.OpcaoTrack.Position-4;
  end else Level:=Level+vaultform.OpcaoTrack.Position;
  if vaultform.checkskill.Checked=true then Level:=Level+128;
  if vaultform.checkluck.Checked=true then Level:=Level+4;
  Hex2:=InttoHex(Level,2);
  {Dur-Hex3}
  Hex3:=InttoHex(vaultform.rzspinner1.Value,2);
  {Serial-Hex4}
  if VaultForm.checkaserial.Checked then
  begin
    VaultForm.VaultADOQuery2.sql.Clear;
    VaultForm.VaultADOQuery2.sql.add('Update '+gameserverinfo+' set '+itemcount+'='+itemcount+'+1');
    VaultForm.VaultADOQuery2.Execsql;
    VaultForm.VaultADOQuery2.sql.Clear;
    VaultForm.VaultADOQuery2.SQL.Add('select '+itemcount+' from '+gameserverinfo+'');
    VaultForm.VaultADOQuery2.Open;
    for i:=0 to VaultForm.VaultADOQuery2.RecordCount-1 do
    begin
      hex4:=inttohex(VaultForm.VaultADOQuery2.Fields[0].asinteger,8);
      VaultForm.VaultADOQuery2.Next;
    end;
    VaultForm.VaultADOQuery2.Close;
  end
    else begin
      if (length(VaultForm.serialedit.text)<8) then
      begin
        i:=8-length(VaultForm.serialedit.text);
        for j := 1 to i do
          VaultForm.serialedit.text:='0'+VaultForm.serialedit.text;
      end;
      hex4:=VaultForm.serialedit.text;
    end;
  if (itemhextype=1) and (unique2=true) then
    hex4:=inttohex(GlobalConfig.hextoint(Hex4[1]+Hex4[2])+GlobalConfig.hextoint('F9'),2)+Hex4[3]+Hex4[4]+Hex4[5]+Hex4[6]+Hex4[7]+Hex4[8];
  {Excellent-Hex5}
  if vaultform.EO1.Checked=true then Exc:=Exc+1;
  if vaultform.EO2.Checked=true then Exc:=Exc+2;
  if vaultform.EO3.Checked=true then Exc:=Exc+4;
  if vaultform.EO4.Checked=true then Exc:=Exc+8;
  if vaultform.EO5.Checked=true then Exc:=Exc+16;
  if vaultform.EO6.Checked=true then Exc:=Exc+32;
  Exc:=Exc+Option2+Unique;
  Hex5:=inttohex(exc,2);
  {Ancient-Hex6};
  if vaultform.ancientcb.ItemIndex=0 then anc:=0 ;
  if vaultform.ancientcb.ItemIndex=1 then anc:=5 ;
  if vaultform.ancientcb.ItemIndex=2 then anc:=6 ;
  if vaultform.ancientcb.ItemIndex=3 then anc:=9 ;
  if vaultform.ancientcb.ItemIndex=4 then anc:=10 ;
  if (itemhextype=2) or (itemhextype=1)  then
  Hex6:=inttohex(Anc,2);

  Hex:=Hex1+Hex2+Hex3+Hex4+Hex5+Hex6+Hex7+Hex8;

  if s='ws' then
   begin

     if SetItemInfo(hex,(vaultform.cbox.value )-1,(vaultform.cboy.value )-1,s) then
       VaultVar.VaultHex[VaultVar.VaultAtual,vaultform.cbox.Value-1,vaultform.cboy.Value-1]:=hex;
   end;



end;

{Procedures de Inicialização}
procedure VaultInicial;
var i,t:integer;
ImgTemp:Tbitmap;
begin
  ImgTemp:= tbitmap.Create();
  ImgTemp.LoadFromFile(ExtractFilePath(Application.ExeName)+'CMT Data\VaultImages\Item_box.BMP');
  for i:=0 to 7 do
  for t:=0 to 14 do
  begin
    Ibuffer.Canvas.CopyRect(bounds(i*VaultImg.LagItemX,t*VaultImg.LagItemY,vaultimg.LagItemX,vaultimg.LagItemY),imgtemp.Canvas,bounds(0,0,vaultimg.LagItemX,vaultimg.LagItemY));
  end;
  for I := 1 to 120 do
    vaultvar.VaultItems[i].Usar:=false;
  ImgTemp.Free;
end;
procedure InventoryInicial;
var i,t:integer;
ImgTemp:Tbitmap;
begin
  ImgTemp:= tbitmap.Create();
  ImgTemp.LoadFromFile(ExtractFilePath(Application.ExeName)+'CMT Data\VaultImages\Inventory_Back.BMP');
  Ibuffer.Canvas.CopyRect(bounds(0,0,ibuffer.Width,ibuffer.Height),imgtemp.Canvas,bounds(0,0,ImgTemp.Width,ImgTemp.Height));
  ImgTemp.LoadFromFile(ExtractFilePath(Application.ExeName)+'CMT Data\VaultImages\Item_box.BMP');
  for i:=0 to 7 do
  for t:=0 to 7 do
  begin
    Ibuffer.Canvas.CopyRect(bounds(i*VaultImg.LagItemX,(t*VaultImg.LagItemY)+225,vaultimg.LagItemX,vaultimg.LagItemY),imgtemp.Canvas,bounds(0,0,vaultimg.LagItemX,vaultimg.LagItemY));
  end;

  for I := 1 to 64 do
    vaultvar.InventoryItems[i].Usar:=false;
  for I := 0 to 11 do
  begin
    ImgTemp.LoadFromFile(vaultvar.EquipItems[i].image);
    Ibuffer.Canvas.CopyRect(bounds(vaultvar.EquipItems[i].X,vaultvar.EquipItems[i].Y,vaultvar.EquipItems[i].TamX,vaultvar.EquipItems[i].TamY),imgtemp.Canvas,bounds(0,0,ImgTemp.width,ImgTemp.height));
    vaultvar.EquipItems[i].ItemInfo.Usar:=false;
  end;
  for I := 1 to 32 do
    vaultvar.PSItems[i].Usar:=false;
  ImgTemp.Free;
end;
procedure LerItemsMdb;
var i:integer;
begin
  with VaultForm do
  begin
    itemquery.SQL.Clear;
    itemquery.SQL.Add('select id2,unique2,name,type,x,y,wearto,setnumber,setitem,excoptiontype from item');
    itemquery.Open;
    Setlength(MdbItems,itemquery.RecordCount-1);
    VaultVar.QuantidadeDeItems:=itemquery.RecordCount-1;
    for i := 0 to VaultVar.QuantidadeDeItems do
    begin
      MdbItems[i].Index:=GlobalConfig.hextoint(itemquery.Fields[0].asstring);
      MdbItems[i].Classe:=(itemquery.Fields[1].asinteger);
      MdbItems[i].Nome:=itemquery.Fields[2].asstring;
      MdbItems[i].Tipo:=itemquery.Fields[3].asstring;
      MdbItems[i].X:=itemquery.Fields[4].asinteger;
      MdbItems[i].Y:=itemquery.Fields[5].asinteger;
      MdbItems[i].Wearto:=itemquery.Fields[6].asstring;
      MdbItems[i].SetNumber:=itemquery.Fields[7].asinteger;
      MdbItems[i].SetItem:=itemquery.Fields[8].asstring;
      MdbItems[i].ExcOptionType:=itemquery.Fields[9].asstring;
      itemquery.Next;
    end;
    itemquery.Close;
  end;
end;
procedure IniciarVar;
var I:integer;
begin
  VaultImg.LagItemX:=32;
  VaultImg.LagItemY:=32;
  VaultImg.PressD:=false;
  VaultImg.PressE:=False;
  VaultVar.QuantidadeDeItems:=-1;
  VaultVar.Ultimows:=0;
  VaultVar.Ultimoinv:=0;
  VaultVar.Ultimops:=0;
  VaultVar.OptionNum:=4;
  VaultVar.SetNumber:=0;
  VaultVar.InvAtual:='INV';
  IBuffer:=TBitmap.create;
  //IBuffer.Height:=VaultImg.LagItemY*15+1;
//  IBuffer.Width:=VaultImg.LagItemX*8+1;
IBUffer.Height:=Vaultform.image1.Height;
IBUffer.Width:=Vaultform.image1.Width;
  VaultVar.cItem[1]:=''; VaultVar.cItem[2]:=''; VaultVar.cItem[3]:='';
  for I := 1 to itemhexcount do
  begin
    VaultVar.cItem[1]:=VaultVar.cItem[1]+'F';
    if i<3 then VaultVar.cItem[2]:=VaultVar.cItem[2]+'F'
      else VaultVar.cItem[2]:=VaultVar.cItem[2]+'0';
    VaultVar.cItem[3]:=VaultVar.cItem[3]+'0';
  end;
  for I := 1 to 120 do
  begin
    VaultVar.VaultItems[i].Usar:=false;
  end;
  //Equip 0  Weapon Left
  VaultVar.EquipItems[0].X:=15 ;
  VaultVar.EquipItems[0].Y:=67 ;
  VaultVar.EquipItems[0].TamX:=57 ;
  VaultVar.EquipItems[0].TamY:=86 ;
  VaultVar.EquipItems[0].Image:=ExtractFilePath(Application.ExeName)+'CMT Data\VaultImages\Item_Weapon01.BMP';

  //Equip 1 Weapon Right
  VaultVar.EquipItems[1].X:=183 ;
  VaultVar.EquipItems[1].Y:=67 ;
  VaultVar.EquipItems[1].TamX:=57 ;
  VaultVar.EquipItems[1].TamY:=86 ;
  VaultVar.EquipItems[1].Image:=ExtractFilePath(Application.ExeName)+'CMT Data\VaultImages\Item_Weapon02.BMP';

  //Equip 2 Helm
  VaultVar.EquipItems[2].X:=99 ;
  VaultVar.EquipItems[2].Y:=7 ;
  VaultVar.EquipItems[2].TamX:=57 ;
  VaultVar.EquipItems[2].TamY:=57 ;
  VaultVar.EquipItems[2].Image:=ExtractFilePath(Application.ExeName)+'CMT Data\VaultImages\Item_Cap.BMP';

  //Equip 3 Armor
  VaultVar.EquipItems[3].X:=99 ;
  VaultVar.EquipItems[3].Y:=67 ;
  VaultVar.EquipItems[3].TamX:=57 ;
  VaultVar.EquipItems[3].TamY:=86 ;
  VaultVar.EquipItems[3].Image:=ExtractFilePath(Application.ExeName)+'CMT Data\VaultImages\Item_Upper.BMP';

  //Equip 4 Pants
  VaultVar.EquipItems[4].X:=99 ;
  VaultVar.EquipItems[4].Y:=156 ;
  VaultVar.EquipItems[4].TamX:=57 ;
  VaultVar.EquipItems[4].TamY:=57 ;
  VaultVar.EquipItems[4].Image:=ExtractFilePath(Application.ExeName)+'CMT Data\VaultImages\Item_Lower.BMP';

  //Equip 5 Gloves
  VaultVar.EquipItems[5].X:=15 ;
  VaultVar.EquipItems[5].Y:=156 ;
  VaultVar.EquipItems[5].TamX:=57 ;
  VaultVar.EquipItems[5].TamY:=57 ;
  VaultVar.EquipItems[5].Image:=ExtractFilePath(Application.ExeName)+'CMT Data\VaultImages\Item_Gloves.BMP';

  //Equip 6 Boots
  VaultVar.EquipItems[6].X:=183 ;
  VaultVar.EquipItems[6].Y:=156 ;
  VaultVar.EquipItems[6].TamX:=57 ;
  VaultVar.EquipItems[6].TamY:=57 ;
  VaultVar.EquipItems[6].Image:=ExtractFilePath(Application.ExeName)+'CMT Data\VaultImages\Item_Boots.BMP';

  //Equip 7 Wings
  VaultVar.EquipItems[7].X:=157 ;
  VaultVar.EquipItems[7].Y:=6 ;
  VaultVar.EquipItems[7].TamX:=82 ;
  VaultVar.EquipItems[7].TamY:=58 ;
  VaultVar.EquipItems[7].Image:=ExtractFilePath(Application.ExeName)+'CMT Data\VaultImages\Item_Wing.BMP';

  //Equip 8 Angel/Satan
  VaultVar.EquipItems[8].X:=15 ;
  VaultVar.EquipItems[8].Y:=7 ;
  VaultVar.EquipItems[8].TamX:=57 ;
  VaultVar.EquipItems[8].TamY:=57 ;
  VaultVar.EquipItems[8].Image:=ExtractFilePath(Application.ExeName)+'CMT Data\VaultImages\Item_Fairy.BMP';

  //Equip 9 Pendant
  VaultVar.EquipItems[9].X:=73 ;
  VaultVar.EquipItems[9].Y:=67 ;
  VaultVar.EquipItems[9].TamX:=25 ;
  VaultVar.EquipItems[9].TamY:=25 ;
  VaultVar.EquipItems[9].Image:=ExtractFilePath(Application.ExeName)+'CMT Data\VaultImages\Item_NeckLace.BMP';

  //Equip 10 Ring Left
  VaultVar.EquipItems[10].X:=73 ;
  VaultVar.EquipItems[10].Y:=156 ;
  VaultVar.EquipItems[10].TamX:=25 ;
  VaultVar.EquipItems[10].TamY:=25 ;
  VaultVar.EquipItems[10].Image:=ExtractFilePath(Application.ExeName)+'CMT Data\VaultImages\Item_Ring.BMP';

  //Equip 11 Ring Right
  VaultVar.EquipItems[11].X:=157 ;
  VaultVar.EquipItems[11].Y:=156 ;
  VaultVar.EquipItems[11].TamX:=25 ;
  VaultVar.EquipItems[11].TamY:=25 ;
  VaultVar.EquipItems[11].Image:=ExtractFilePath(Application.ExeName)+'CMT Data\VaultImages\Item_Ring.BMP';

end;
{Procedures de Inicialização}

{Procedures De Items/Tipo}
procedure ExcNome;
var ExcType:string;
i,ti:Integer;
begin
  with VaultForm do
  begin
    lblspace.Caption:=VaultVar.itemspc[itemcb.itemindex];
    for i := 0 to VaultVar.QuantidadeDeItems do
    begin
      if MdbItems[i].Nome=itemcb.Text then
      begin
        ExcType:=MdbItems[i].ExcOptionType;
        VaultVar.SetNumber:=MdbItems[i].SetNumber;
      end;
    end;
    if exctype='we' then
    begin
      Ti:=1;
      EO1.Enabled:=true;
      EO2.Enabled:=true;
      EO3.Enabled:=true;
      EO4.Enabled:=true;
      EO5.Enabled:=true;
      EO6.Enabled:=true;
    end;
    if exctype='any' then
    begin
      Ti:=2;
      EO1.Enabled:=false;
      EO2.Enabled:=false;
      EO3.Enabled:=false;
      EO4.Enabled:=false;
      EO5.Enabled:=false;
      EO6.Enabled:=false;
    end;
    if exctype='ar' then
    begin
      Ti:=3;
      EO1.Enabled:=true;
      EO2.Enabled:=true;
      EO3.Enabled:=true;
      EO4.Enabled:=true;
      EO5.Enabled:=true;
      EO6.Enabled:=true;
    end;
    if exctype='fen' then
    begin
      Ti:=4;
      EO1.Enabled:=true;
      EO2.Enabled:=true;
      EO3.Enabled:=false;
      EO4.Enabled:=false;
      EO5.Enabled:=false;
      EO6.Enabled:=false;
    end;
    if exctype='wi' then
    begin
      Ti:=6;
      EO1.Enabled:=true;
      EO2.Enabled:=true;
      EO3.Enabled:=true;
      EO4.Enabled:=true;
      EO5.Enabled:=true;
      EO6.Enabled:=false;
    end;
    if (exctype<>'wi') and (exctype<>'fen') and (exctype<>'ar')
      and (exctype<>'any') and (exctype<>'we') then
      begin
        Ti:=5;
        EO1.Enabled:=true;
        EO2.Enabled:=true;
        EO3.Enabled:=true;
        EO4.Enabled:=true;
        EO5.Enabled:=true;
        EO6.Enabled:=true;
      end;
    EO1.Caption:=ExcItemTypes[1,ti];
    EO2.Caption:=ExcItemTypes[2,ti];
    EO3.Caption:=ExcItemTypes[3,ti];
    EO4.Caption:=ExcItemTypes[4,ti];
    EO5.Caption:=ExcItemTypes[5,ti];
    EO6.Caption:=ExcItemTypes[6,ti];
end;
end;
procedure Typechange(const S:string); {Seleciona tipo}
var
  i,j:integer;
begin
  VaultVar.itemspc:=nil;
  with VaultForm do
  begin
    lblspace.Caption :='0x0';
    itemcb.Items.Clear;

    j:=-1;
    for i := 0 to VaultVar.QuantidadeDeItems do
      if MdbItems[i].Tipo=s then
        inc(j);
    setlength(VaultVar.itemspc,j);

    j:=-1;
    for i := 0 to VaultVar.QuantidadeDeItems do
      if MdbItems[i].Tipo=s then
      begin
        itemcb.Items.Add(MdbItems[i].Nome);
        inc(j);
        VaultVar.itemspc[j]:=inttostr(MdbItems[i].X)+'x'+inttostr(MdbItems[i].Y) ;
      end;
    itemcb.ItemIndex:=0;

    j:=-1;
    for i := 0 to VaultVar.QuantidadeDeItems do
      if MdbItems[i].Tipo=s then
      begin
        inc(j);
        if (MdbItems[i].SetNumber=VaultVar.SetNumber) and (MdbItems[i].SetNumber<>0) then
          itemcb.itemindex:=j;
   //     VaultVar.itemspc[j]:=inttostr(MdbItems[i].X)+'x'+inttostr(MdbItems[i].Y) ;
      end;
    lblspace.Caption :=VaultVar.itemspc[itemcb.ItemIndex];
  end;
end;
{Procedures De Items/Tipo}

{Procedures de Selecionar Items}
procedure TVaultForm.BitBtn1Click(Sender: TObject);
var i,j:integer;
begin
  if VaultVar.VaultOn=true then
  begin
    vaultinicial;
    for i := 0 to 7 do
      for j := 0 to 14 do
        vaultvar.VaultHex[vaultvar.VaultAtual,i,j]:=vaultvar.citem[2];
    for I := 1 to 120 do
      vaultvar.VaultItems[i].Usar:=false;
  end;
end;

procedure TVaultForm.btnINClick(Sender: TObject);
begin
  itemadd('ws');
end;

procedure TVaultForm.CheckASerialClick(Sender: TObject);
var
  valor:string;
begin
  if SerialEdit.enabled=true then
    begin
      VaultForm.VaultADOQuery2.sql.Clear;
      VaultForm.VaultADOQuery2.SQL.Add('select '+itemcount+' from '+gameserverinfo+'');
      VaultForm.VaultADOQuery2.Open;
      valor:=inttohex(VaultForm.VaultADOQuery2.Fields[0].asinteger+1,8);
      VaultForm.VaultADOQuery2.Close;
      SerialEdit.Text:=(valor);
      SerialEdit.Enabled:=false;
    end
      else SerialEdit.Enabled:=true;
end;
procedure TVaultForm.EO1Click(Sender: TObject);
begin
  with (sender as TRzcheckbox) do
     if (name<>'jn') and (name<>'xy') then
       if checked then tag:=gettag(strtoint(name[3])) else tag:=0;
end;
procedure TVaultForm.TipoCBChange(Sender: TObject);
begin
  typechange(tipocb.Text );
  ExcNome;
end;
procedure TVaultForm.ItemCBChange(Sender: TObject);
begin
  ExcNome;
end;
procedure TVaultForm.LevelTrackChanging(Sender: TObject; NewPos: Integer; var AllowChange: Boolean);
begin
  LevelShowLB.Caption:=format(pluslevel,[inttostr(newpos)]);
end;
procedure TVaultForm.N1Click(Sender: TObject);
begin
  MessageShow(GetItemStringInfo(VaultVar.vaultitems[VaultVar.ItemClick]),ItemInformation,mb_ok);
end;
procedure TVaultForm.N3Click(Sender: TObject);
begin
  if MessageShow(VaultDelete,programname,mb_yesno+mb_iconquestion)=id_no then
    exit;
  DeleteVaultItem(VaultVar.vaultitems[VaultVar.ItemClick]);

end;
procedure TVaultForm.OpcaoTrackChanging(Sender: TObject; NewPos: Integer;  var AllowChange: Boolean);
begin
  OptionShowLB.Caption:=format(plusoption,[inttostr(newpos*VaultVar.OptionNum)]);
end;
procedure TVaultForm.RzTabControl1Change(Sender: TObject);
var
  s,g:string;
  i,z,j: Integer;
  f:tfield;
begin
  if VaultVar.VaultOn=true then
  begin
    screen.Cursor:=-11;
    application.ProcessMessages;
    try
      VaultForm.VaultADOQuery2.SQL.Clear;
      s:=rightstr(rztabcontrol1.Tabs[rztabcontrol1.tabindex].caption,2);
      VaultVar.ExtraVaults[VaultVar.VaultAtual].Zen:=zenedit.text;
      if s<>'lt' then
      begin
        VaultVar.VaultAtual:=strtoint(s);
        if VaultVar.ExtraVaults[VaultVar.VaultAtual].edit=false then
        begin
          VaultForm.VaultADOQuery2.SQL.clear;
          VaultForm.VaultADOQuery2.SQL.Add('select * from '+multivaulttable+' where '+multivaultID+'='''+accountsel+''' and '+multivaultnum+'='+s+'' );
          VaultForm.VaultADOQuery2.Open;
          if (VaultForm.VaultADOQuery2.Eof) and (VaultForm.VaultADOQuery2.Bof) then
          begin
            VaultForm.VaultADOQuery2.Close;
            VaultForm.VaultADOQuery2.SQL.clear;
            VaultForm.VaultADOQuery2.SQL.Add('Insert into '+multivaulttable+' ('+multivaultID+','+multivaultmoney+','+multivaultnum+')VALUES('''+accountsel+''',0,'+s+')');
            VaultForm.VaultADOQuery2.execsql;
            g:='0x';
            for i := 0 to 14 do
            for j := 0 to 7 do
            begin
              VaultVar.VaultHex[VaultVar.VaultAtual,i,j]:=VaultVar.citem[2];
              g:=g+VaultVar.citem[2];
            end;
          end else VaultForm.VaultADOQuery2.Close;
        end;
      end else VaultVar.VaultAtual:=255;
      if VaultVar.ExtraVaults[VaultVar.VaultAtual].Edit=false then
      begin
        VaultForm.VaultADOQuery2.SQL.Clear;
        if s='lt' then
          VaultForm.VaultADOQuery2.SQL.Add('select '+Money+','+Items+' from '+warehouse+' where '+AccountID2+'='''+accountsel+'''')
            else VaultForm.VaultADOQuery2.SQL.Add('select '+MultivaultMoney+','+MultivaultItems+' from '+Multivaulttable+' where '+MultivaultID+'='''+accountsel+''' and '+Multivaultnum+'='+s+'');
        VaultForm.VaultADOQuery2.Open ;
        if (VaultForm.VaultADOQuery2.Eof) and (VaultForm.VaultADOQuery2.Bof) then
        begin
          MessageShow(VaultError4,VaultErrorCaption,mb_ok+mb_iconerror);
          screen.Cursor:=0;
          VaultForm.VaultADOQuery2.Close;
          exit;
        end;
        VaultInicial;
        fillhexws(VaultForm.VaultADOQuery2.Fields[1]);
        VaultVar.ExtraVaults[VaultVar.VaultAtual].zen:=VaultForm.VaultADOQuery2.Fields[0].AsString ;
        VaultForm.VaultADOQuery2.Close;
      end else
        begin
          VaultInicial;
          fillhexws(f);
        end;
      VaultVar.ExtraVaults[VaultVar.VaultAtual].Edit:=true;
      zenedit.Text :=VaultVar.ExtraVaults[VaultVar.VaultAtual].Zen ;
    finally
      screen.Cursor:=0;
    end;
  end;
end;



procedure TVaultForm.SaveVaultBClick(Sender: TObject);
begin
  if MessageShow(VaultQuestion1,programname,mb_yesno+mb_iconquestion)=id_no then exit;
  if SalvarWarehouse then
  begin
    MessageShow(VaultConfirm1,programname,mb_ok+mb_iconinformation);
    VaultForm.Close;
  end else
    MessageShow(VaultError5,VaultErrorCaption,mb_ok+mb_iconwarning);
end;

procedure TVaultForm.SerialEditExit(Sender: TObject);
var i,x,z:byte;
begin
  z:=SerialEdit.MaxLength;
  i:=z-length(SerialEdit.text);
  if i>0 then
    for x:=1 to i do
      SerialEdit.text:='0'+SerialEdit.text;
end;
procedure TVaultForm.SerialEditKeyPress(Sender: TObject; var Key: Char);
begin
  key:=AnsiUpperCase(key)[1];
  If Not (Key in ['0'..'9',#8,#0,'A','B','C','D','E','F']) then
    Key:=#0;
end;
{Procedures de Selecionar Items}

procedure TVaultForm.FormActivate(Sender: TObject);
begin
  Timer1.Enabled:=TimerEnable;
end;

procedure TVaultForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
IBuffer.free;
ChangeTimerEnable(False);
end;

procedure TVaultForm.FormDeactivate(Sender: TObject);
begin
  TimerEnable:=Timer1.Enabled;
  timer1.Enabled:=false;
end;

Procedure TVaultForm.ClickDireito1(pt: TPoint; sx: Integer; sy: Integer; ty: Integer);
begin
  if (GetAsyncKeyState(VK_RBUTTON) = -32768) and (VaultImg.PressD=false) then
  begin
    if (VaultVar.VaultOn=true) and ((Sx>-1) and (Sy>-1) and (Sx<=7) and (Sy<=14)) then
    begin
      VaultImg.UClickDX:=Sx;
      VaultImg.UClickDY:=Sy;
      VaultImg.PressD:=True;
    end;
    if VaultVar.VaultOn=false then
    begin
      if (Sx>-1) and (Sx<=7)  then
      begin
        VaultImg.PressD:=false;
        VaultImg.UClickDX:=Sx;
        if (rztabcontrol1.Tabs[rztabcontrol1.tabindex].caption=PSTab) and ((Sy<=3) and (sy>-1)) then
        begin
          VaultImg.UClickDY:=Sy;
          VaultImg.PressD:=True;
          VaultImg.UClickDT:='PS';
        end;
        if (rztabcontrol1.Tabs[rztabcontrol1.tabindex].caption=InventoryTab) and ((ty<=7) and (ty>-1)) then
        begin
          VaultImg.UClickDY:=Ty;
          VaultImg.PressD:=True;
          VaultImg.UClickDT:='INV';
        end;
      end;
      if (VerificarEquipItembyPos(pt.x,pt.Y)<>12) and (rztabcontrol1.Tabs[rztabcontrol1.tabindex].caption=InventoryTab) then
      begin
        VaultImg.UClickDY:=VerificarEquipItembyPos(pt.x,pt.Y);
        VaultImg.PressD:=True;
        VaultImg.UClickDT:='EQP';
      end;
    end;
  end;
end;
Procedure TVaultForm.ClickDireito2(pt: TPoint; sx: Integer; sy: Integer; ty: Integer);
begin
  if (GetAsyncKeyState(VK_RBUTTON) <> -32768) and (VaultImg.PressD=true) then
  begin
    if (VaultVar.VaultOn=true) and ((VerificarVaultItem(VaultImg.UClickDX,VaultImg.UClickDY)= VerificarVaultItem(Sx,Sy)) and  (VerificarVaultItem(Sx,Sy)<>0)) then
    begin
      ChangeTimerEnable(False);
      VaultVar.ItemClick:=VerificarVaultItem(VaultImg.UClickDX,VaultImg.UClickDY);
      popmenuitem.Popup(mouse.CursorPos.X,mouse.CursorPos.Y);
      ChangeTimerEnable(True);
    end;
    if VaultVar.VaultOn=false then
    begin
      if (VaultImg.UClickDT='INV') and ((VerificarInvItem(VaultImg.UClickDX,VaultImg.UClickDY)= VerificarInvItem(Sx,Ty)) and (VerificarInvItem(Sx,Ty)<>0)) then
      begin
        ChangeTimerEnable(False);
        VaultVar.ItemClick:=VerificarInvItem(VaultImg.UClickDX,VaultImg.UClickDY);
        popmenuitem.Popup(mouse.CursorPos.X,mouse.CursorPos.Y);
        ChangeTimerEnable(True);
      end;
      if (VaultImg.UClickDT='PS') and ((VerificarPSItem(VaultImg.UClickDX,VaultImg.UClickDY)= VerificarPSItem(Sx,Sy)) and (VerificarPSItem(Sx,Sy)<>0)) then
      begin
        ChangeTimerEnable(False);
        VaultVar.ItemClick:=VerificarPSItem(VaultImg.UClickDX,VaultImg.UClickDY);
        popmenuitem.Popup(mouse.CursorPos.X,mouse.CursorPos.Y);
        ChangeTimerEnable(True);
      end;
      if (VaultImg.UClickDT='EQP') and ((VerificarEquipItem(VaultImg.UClickDY)= VerificarEquipItem(VerificarEquipItembypos(pt.x,pt.y))) and (VerificarEquipItem(VaultImg.UClickDY)<>12)) then
      begin
        ChangeTimerEnable(False);
        VaultVar.ItemClick:=VerificarEquipItem(VaultImg.UClickDY);
        popmenuitem.Popup(mouse.CursorPos.X,mouse.CursorPos.Y);
        ChangeTimerEnable(True);
      end;
    end;
    VaultImg.PressD:=False;
  end;
end;
Procedure TVaultForm.ClickEsquerdo1(pt: TPoint; sx: Integer; sy: Integer; ty: Integer);
var ImgTemp:Tbitmap;
begin
  ImgTemp:= tbitmap.Create();
  if (GetAsyncKeyState(VK_LBUTTON) = -32768) and (VaultImg.PressE=false) then
  begin
    if (VaultVar.VaultOn=true) and ((Sx>-1) and (Sy>-1) and (Sx<=7) and (Sy<=14)) then
    begin
      VaultImg.UClickEX:=Sx;
      VaultImg.UClickEY:=Sy;
      VaultImg.PressE:=True;
      if VerificarVaultItem(Sx,Sy)= 0 then
      begin
        ImgTemp.LoadFromFile(ExtractFilePath(Application.ExeName)+'CMT Data\VaultImages\InventoryBox2.bmp');
        Ibuffer.Canvas.CopyRect(bounds(Sx*VaultImg.LagItemX,Sy*VaultImg.LagItemY,vaultimg.LagItemX,vaultimg.LagItemY),imgtemp.Canvas,bounds(0,0,vaultimg.LagItemX,vaultimg.LagItemY));
      end;
    end;
    if VaultVar.VaultOn=false then
    begin
      if (Sx>-1) and (Sx<=7)  then
      begin
        VaultImg.PressE:=false;
        VaultImg.UClickEX:=Sx;
        if (rztabcontrol1.Tabs[rztabcontrol1.tabindex].caption=PSTab) and ((Sy<=3) and (sy>-1)) then
        begin
          VaultImg.UClickEY:=Sy;
          VaultImg.PressE:=True;
          VaultImg.UClickET:='PS';
          if VerificarpsItem(Sx,Sy)= 0 then
          begin
            ImgTemp.LoadFromFile(ExtractFilePath(Application.ExeName)+'CMT Data\VaultImages\InventoryBox2.bmp');
            Ibuffer.Canvas.CopyRect(bounds(Sx*VaultImg.LagItemX,Sy*VaultImg.LagItemY,vaultimg.LagItemX,vaultimg.LagItemY),imgtemp.Canvas,bounds(0,0,vaultimg.LagItemX,vaultimg.LagItemY));
          end;
        end;
        if (rztabcontrol1.Tabs[rztabcontrol1.tabindex].caption=InventoryTab) and ((ty<=7) and (ty>-1)) then
        begin
          VaultImg.UClickEY:=Ty;
          VaultImg.PressE:=True;
          VaultImg.UClickET:='INV';
          if VerificarpsItem(Sx,Ty)= 0 then
          begin
            ImgTemp.LoadFromFile(ExtractFilePath(Application.ExeName)+'CMT Data\VaultImages\InventoryBox2.bmp');
            Ibuffer.Canvas.CopyRect(bounds(Sx*VaultImg.LagItemX,(Ty*VaultImg.LagItemY)+225,vaultimg.LagItemX,vaultimg.LagItemY),imgtemp.Canvas,bounds(0,0,vaultimg.LagItemX,vaultimg.LagItemY));
          end;
        end;
      end;
      if (VerificarEquipItembyPos(pt.x,pt.Y)<>12) and (rztabcontrol1.Tabs[rztabcontrol1.tabindex].caption=InventoryTab) then
      begin
        VaultImg.UClickEY:=VerificarEquipItembyPos(pt.x,pt.Y);
        VaultImg.PressE:=True;
        VaultImg.UClickET:='EQP';
        if (VerificarEquipItembyPos(pt.X,pt.Y)<>12) and (VerificarEquipItem(VerificarEquipItembyPos(pt.X,pt.Y))<>12) then
        begin
          ImgTemp.LoadFromFile(VaultVar.Equipitems[VerificarEquipItembyPos(pt.x,pt.Y)].Image);
          Ibuffer.Canvas.CopyRect(bounds(VaultVar.Equipitems[VerificarEquipItembyPos(pt.x,pt.Y)].X,VaultVar.Equipitems[VerificarEquipItembyPos(pt.x,pt.Y)].Y,VaultVar.Equipitems[VerificarEquipItembyPos(pt.x,pt.Y)].TamX,VaultVar.Equipitems[VerificarEquipItembyPos(pt.x,pt.Y)].TamY),imgtemp.Canvas,bounds(0,0,ImgTemp.Width,ImgTemp.Height));
        end;
      end;
    end;
  end;
  ImgTemp.Free;
end;
Procedure TVaultForm.ClickEsquerdo2(pt: TPoint; sx: Integer; sy: Integer; ty: Integer);
var ImgTemp:Tbitmap;
begin
  ImgTemp:= tbitmap.Create();
  if (GetAsyncKeyState(VK_LBUTTON) <> -32768) and (VaultImg.PressE=true) then
  begin
    VaultImg.PressE:=False;
    if (VaultVar.VaultOn=true) then
    begin
      if ((VerificarVaultItem(VaultImg.UClickEX,VaultImg.UClickEY)= 0)) then
      begin
        ImgTemp.LoadFromFile(ExtractFilePath(Application.ExeName)+'CMT Data\VaultImages\Item_box.BMP');
        Ibuffer.Canvas.CopyRect(bounds(VaultImg.UClickEX*VaultImg.LagItemX,VaultImg.UClickEY*VaultImg.LagItemY,vaultimg.LagItemX,vaultimg.LagItemY),imgtemp.Canvas,bounds(0,0,vaultimg.LagItemX,vaultimg.LagItemY));
        if (VaultImg.UClickEX=cbox.Value-1) and (VaultImg.UClickEY=cboy.Value-1) then
          itemadd('ws');
        cbox.Value:=VaultImg.UClickEX+1;
        cboy.Value:=VaultImg.UClickEY+1;
      end else
        if (VerificarVaultItem(Sx,Sy)<>0) and (VerificarVaultItem(VaultImg.UClickEX,VaultImg.UClickEY)=VerificarVaultItem(Sx,Sy))  then
          MessageShow(GetItemStringInfo(VaultVar.vaultitems[VerificarVaultItem(VaultImg.UClickEX,VaultImg.UClickEY)]),ItemInformation,mb_ok);
    end;
    if (VaultVar.VaultOn=false) then
    begin
      if (VaultImg.UClickET='INV') then
        if ((VerificarInvItem(VaultImg.UClickEX,VaultImg.UClickEY)= VerificarInvItem(Sx,Ty)) and (VerificarInvItem(Sx,Ty)=0)) then
        begin
          ImgTemp.LoadFromFile(ExtractFilePath(Application.ExeName)+'CMT Data\VaultImages\Item_box.BMP');
          Ibuffer.Canvas.CopyRect(bounds(VaultImg.UClickEX*VaultImg.LagItemX,(VaultImg.UClickEY*VaultImg.LagItemY)+225,vaultimg.LagItemX,vaultimg.LagItemY),imgtemp.Canvas,bounds(0,0,vaultimg.LagItemX,vaultimg.LagItemY));
          if (VaultImg.UClickEX=cbox.Value-1) and (VaultImg.UClickEY=cboy.Value-1) then
            itemadd('inv');
          cbox.Value:=VaultImg.UClickEX+1;
          cboy.Value:=VaultImg.UClickEY+1;
        end else
          MessageShow((GetItemStringInfo(VaultVar.inventoryitems[VerificarInvItem(VaultImg.UClickEX,VaultImg.UClickEY)])),(ItemInformation),mb_ok);
      if (VaultImg.UClickET='PS') then
        if ((VerificarpsItem(VaultImg.UClickEX,VaultImg.UClickEY)= VerificarpsItem(Sx,Sy)) and (VerificarpsItem(Sx,Sy)=0)) then
        begin
          ImgTemp.LoadFromFile(ExtractFilePath(Application.ExeName)+'CMT Data\VaultImages\Item_box.BMP');
          Ibuffer.Canvas.CopyRect(bounds(VaultImg.UClickEX*VaultImg.LagItemX,(VaultImg.UClickEY*VaultImg.LagItemY),vaultimg.LagItemX,vaultimg.LagItemY),imgtemp.Canvas,bounds(0,0,vaultimg.LagItemX,vaultimg.LagItemY));
          if (VaultImg.UClickEX=cbox.Value-1) and (VaultImg.UClickEY=cboy.Value-1) then
            itemadd('ps');
          cbox.Value:=VaultImg.UClickEX+1;
          cboy.Value:=VaultImg.UClickEY+1;
        end else
          MessageShow(GetItemStringInfo(VaultVar.psitems[VerificarpsItem(VaultImg.UClickEX,VaultImg.UClickEY)]),ItemInformation,mb_ok);

      if (VaultImg.UClickET='EQP') and  ((VaultImg.UClickEY)= VerificarEquipItembypos(pt.x,pt.y)) and (VaultImg.UClickEY<>12) then
        if (VerificarEquipItem(VaultImg.UClickEY)=12) then
        begin
          ImgTemp.LoadFromFile(VaultVar.Equipitems[VerificarEquipItembyPos(pt.x,pt.Y)].Image);
          Ibuffer.Canvas.CopyRect(bounds(VaultVar.Equipitems[VerificarEquipItembyPos(pt.x,pt.Y)].X,VaultVar.Equipitems[VerificarEquipItembyPos(pt.x,pt.Y)].Y,VaultVar.Equipitems[VerificarEquipItembyPos(pt.x,pt.Y)].TamX,VaultVar.Equipitems[VerificarEquipItembyPos(pt.x,pt.Y)].TamY),imgtemp.Canvas,bounds(0,0,ImgTemp.Width,ImgTemp.Height));
          if rzcombobox1.ItemIndex=sy then
            itemadd('eqp');
          rzcombobox1.ItemIndex:=sy;
        end else
          MessageShow(GetItemStringInfo(VaultVar.equipitems[VerificarEquipItembyPos(pt.x,pt.Y)].ItemInfo),ItemInformation,mb_ok);

    end;
  end;
  ImgTemp.Free;
end;
procedure TVaultForm.MoverMouse(pt: TPoint; sx: Integer; sy: Integer; ty: Integer);
begin
  if (VaultVar.VaultOn=true) and ((Sx>-1) and (Sy>-1) and (Sx<=7) and (Sy<=14)) then
  begin
    if VerificarVaultItem(Sx,Sy)<>0 then
    begin
      image1.Cursor:=crhandpoint;
      rzmemo2.Lines.Clear;
      rzmemo2.Lines.Add(VaultVar.vaultitems[VerificarVaultItem(Sx,Sy)].ItemMdbInfo.Nome+': '+VaultVar.vaulthex[VaultVar.vaultatual,VaultVar.vaultitems[VerificarVaultItem(Sx,Sy)].x,VaultVar.vaultitems[VerificarVaultItem(Sx,Sy)].y])
    end else image1.Cursor:=crdefault;
  end;
  if (VaultVar.VaultOn=false)  and ((Sx>-1) and (Sx<=7)) then
  begin
    image1.Cursor:=crdefault;
    if (verificarinvitem(Sx,Ty)<>0) and (Ty>-1) and (Ty<=7) and (rztabcontrol1.Tabs[rztabcontrol1.tabindex].caption=InventoryTab) then
    begin
      image1.Cursor:=crhandpoint;
      rzmemo2.Lines.Clear;
      rzmemo2.Lines.Add(VaultVar.inventoryitems[VerificarinvItem(Sx,Ty)].ItemMdbInfo.Nome+': '+VaultVar.inventoryhex[VaultVar.Inventoryitems[VerificarInvItem(Sx,Ty)].x,VaultVar.Inventoryitems[VerificarInvItem(Sx,Ty)].y])
    end;
    if (verificarpsitem(Sx,Sy)<>0) and (Sy>-1) and (Sy<=3)  and (rztabcontrol1.Tabs[rztabcontrol1.tabindex].caption=PSTab)  then
    begin
      image1.Cursor:=crhandpoint;
      rzmemo2.Lines.Clear;
      rzmemo2.Lines.Add(VaultVar.PSitems[VerificarPSItem(Sx,Sy)].ItemMdbInfo.Nome+': '+VaultVar.PShex[VaultVar.pSitems[VerificarPSItem(Sx,Sy)].x,VaultVar.PSitems[VerificarPSItem(Sx,Sy)].y])
    end;
    if  (VerificarEquipitembypos(pt.x,pt.Y)<>12) and (verificarequipitem(VerificarEquipitembypos(pt.x,pt.Y))<>12) and (rztabcontrol1.Tabs[rztabcontrol1.tabindex].caption=InventoryTab)  then
    begin
      image1.Cursor:=crhandpoint;
      rzmemo2.Lines.Clear;
      rzmemo2.Lines.Add(VaultVar.Equipitems[VerificarEquipItem(VerificarEquipItembypos(pt.x,pt.y))].ItemInfo.ItemMdbInfo.Nome+': '+VaultVar.EQPhex[VaultVar.Equipitems[VerificarEquipItem(VerificarEquipItembypos(pt.x,pt.y))].x,VaultVar.PSitems[VerificarEquipItem(VerificarEquipItembypos(pt.x,pt.y))].y])
    end;
  end;
end;
procedure TVaultForm.Timer1Timer(Sender: TObject);
var
  Pt: TPoint;
  Sx,Sy,Ty,i:Integer;
begin
  {Posição do mouse na imagem}
  pt:=vaultform.ClientOrigin;
  Pt.X:=mouse.CursorPos.X-pt.x-274;
  Pt.Y:=mouse.CursorPos.Y-pt.y-18 ;
  {Posição do quadrado}
  if Pt.X / VaultImg.LagItemX>=0 then
    Sx:=(Pt.X div VaultImg.LagItemX);
  if Pt.Y / VaultImg.LagItemY>=0 then
  Sy:=round(Pt.Y div (VaultImg.LagItemY));
  ty:=(Pt.Y-225);
  if ty>0 then ty:=ty div (VaultImg.LagItemY);
  {Funções do Mouse na Imagem}
  ClickDireito1(Pt,SX,SY,TY);
  ClickDireito2(Pt,SX,SY,TY);
  ClickEsquerdo1(Pt,SX,SY,TY);
  ClickEsquerdo2(Pt,SX,SY,TY);
  MoverMouse(Pt,SX,SY,TY);
  {Atualizar Imagem}
  image1.Canvas.Draw(0,0,IBuffer);
end;

Procedure TVaultForm.Iniciar;
begin
  VaultForm.VaultADOQuery1.ConnectionString:='Provider=MSDASQL.1;Password='+memupwd+';Persist Security Info=True;User ID='+memuid+';Data Source='+memudsn+';Initial Catalog='+mecatalog;
  VaultForm.VaultADOQuery2.ConnectionString:='Provider=MSDASQL.1;Password='+mupwd+';Persist Security Info=True;User ID='+muid+';Data Source='+mudsn+';Initial Catalog='+catalog;
  ItemQuery.ConnectionString:='Provider=Microsoft.Jet.OLEDB.4.0;Data Source='+ExtractFilePath(Application.ExeName)+'\CMT Data\muitem.mdb'+';Mode=ReadWrite;Persist Security Info=False';

  IniciarVar;

  VaultForm.TipoCb.Items.Clear;
  LerItemsMdb;
  itemquery.sql.clear;
  itemquery.SQL.Add('select distinct type from item');
  itemquery.Open;
  while not itemquery.Eof do begin
    tipocb.Items.Add(itemquery.Fields[0].asstring);
    itemquery.Next;
  end;
  itemquery.Close;
  VaultForm.TipoCb.ItemIndex:=0;
  typechange(VaultForm.TipoCb.Text );
  ExcNome;

  If VaultVar.VaultOn=True then
  begin
    VaultInicial;
    VaultForm.VaultADOQuery2.SQL.Clear;
    VaultForm.VaultADOQuery2.SQL.Add('select '+Money+','+Items+' from '+warehouse+' where '+AccountID2+'='''+accountsel+'''');
    VaultForm.VaultADOQuery2.Open ;
    if (VaultForm.VaultADOQuery2.Eof) and (VaultForm.VaultADOQuery2.Bof) then
    begin
      MessageShow(VaultError4,VaultErrorCaption,mb_ok+mb_iconerror);
      VaultForm.VaultADOQuery2.Close;
      exit;
      vaultform.Close;
    end;
   //   resetws(true);
      VaultVar.VaultAtual:=255;
      fillhexws(VaultForm.VaultADOQuery2.Fields[1]);

      VaultVar.ExtraVaults[VaultVar.VaultAtual].zen:=VaultForm.VaultADOQuery2.Fields[0].AsString ;
      zenedit.Text :=VaultForm.VaultADOQuery2.Fields[0].AsString ;
      VaultForm.VaultADOQuery2.Close;
  end;

  If VaultVar.VaultOn=False then
  begin
    InventoryInicial;
    VaultForm.VaultADOQuery2.SQL.Clear;
    VaultForm.VaultADOQuery2.SQL.Add('select '+Inventory+' from '+Character+' where '+CName+'='''+Charactersel+'''');
    VaultForm.VaultADOQuery2.Open ;
    if (VaultForm.VaultADOQuery2.Eof) and (VaultForm.VaultADOQuery2.Bof) then
    begin
      MessageShow(VaultError4,VaultErrorCaption,mb_ok+mb_iconerror);
      VaultForm.VaultADOQuery2.Close;
      exit;
      vaultform.Close;
    end;
    If ((PSTable='') or (PSRef='') or (PSCollumn='')) or (((PSTable<>Character) and (PSRef<>CName) and (PSCollumn<>Inventory)))  then
      fillhexinv(VaultForm.VaultADOQuery2.Fields[1],'Inv');
    If ((PSTable=Character) and (PSRef=CName)) and (PSCollumn=Inventory)  then
      fillhexinv(VaultForm.VaultADOQuery2.Fields[1],'InvPS');
    VaultForm.VaultADOQuery2.Close;
    If ((PSTable<>Character) and (PSRef<>CName) and (PSCollumn<>Inventory)) and ( ((PSTable<>'') and (PSRef<>'') and (PSCollumn<>''))) then
    begin
      VaultForm.VaultADOQuery2.SQL.Clear;
      VaultForm.VaultADOQuery2.SQL.Add('select '+PsCollumn+' from '+PSTable+' where '+PSRef+'='''+Charactersel+'''');
      VaultForm.VaultADOQuery2.Open ;
      fillhexps(VaultForm.VaultADOQuery2.Fields[0],'PS');
      VaultForm.VaultADOQuery2.Close;
    end;
  end;
  RztabControl1.DoubleBuffered:=true;
  ChangeTimerEnable(True);
end;

end.




