unit VaultUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Forms,
  Dialogs, DB, ADODB, StdCtrls,strUtils, ValEdit, ExtCtrls, Buttons,globalvar,
  ComCtrls, Menus,
  ToolWin, RzPanel, RzTabs, RzEdit, RzButton, RzRadChk, RzLabel, Mask, RzSpnEdt,
  RzCmboBx, RzTrkBar, RzDBTrak, rzcommon, Controls;
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
    TamItem: TRzLabel;
    lblspace: TRzLabel;
    VoltarB: TRzBitBtn;
    SaveVaultB: TRzBitBtn;
    Cbsql: TRzCheckBox;
    CheckBox3: TRzCheckBox;
    itemQuery: TADOQuery;
    LevelShowLB: TRzLabel;
    OptionShowLB: TRzLabel;
    SerialEdit: TEdit;
    RzTabControl1: TRzTabControl;
    RzMemo2: TRzMemo;
    copyrich: TRzMemo;
    BitBtn1: TBitBtn;
    popMenuitem: TPopupMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    zenedit: TLabeledEdit;
    RzComboBox1: TRzComboBox;
    VaultADOQuery1: TADOQuery;
    VaultADOQuery2: TADOQuery;
    Image1: TImage;
    Image2: TImage;
    Timer1: TTimer;
    Image3: TImage;
    procedure RzComboBox1Change(Sender: TObject);
    procedure RzTabControl1Change(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnINClick(Sender: TObject);
    procedure VoltarBClick(Sender: TObject);
    procedure SaveVaultBClick(Sender: TObject);
    procedure N3Click(Sender: TObject);
    procedure N1Click(Sender: TObject);

    procedure ApagarBClick(Sender: TObject);
    procedure EO1Click(Sender: TObject);
    procedure CheckASerialClick(Sender: TObject);
    procedure SerialEditExit(Sender: TObject);
    procedure SerialEditKeyPress(Sender: TObject; var Key: Char);
    procedure Iniciar;
    procedure OpcaoTrackChanging(Sender: TObject; NewPos: Integer;
      var AllowChange: Boolean);
    procedure LevelTrackChanging(Sender: TObject; NewPos: Integer;
      var AllowChange: Boolean);
    procedure ItemCBChange(Sender: TObject);
    procedure TipoCBChange(Sender: TObject);
    procedure itemadd(L:string);
    procedure lertipo;
    procedure Image1MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure Image1MouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure Timer1Timer(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }

  end;
type itemproperty=record
     Name:string;
     X:integer;
     Y:integer;
end;
type itemoptions=record
     lvl:string;
     opt:string;
     dur:string;
     skill:string;
     lucky:string;
     ExOpt:string;
     anc:string;
     ser:string;
end;
type Tmultivault=record
     edit:boolean;
     zen:string;
end;
type TVaultVar=record
  currentitem,sexopt2,ancient2,wearto,xhint,
  tipo,eqpsel,query,tipoantigo,groupvisible:string;

  tamanho:integer;
  numordem,opr,vaultnum,cboxps,cboyps,
  cboxinv,cboyinv,cboxws,cboyws:byte;

  pson,psind,vaultuse:boolean;

  tpanelname:trzpanel;

  itemspc:array of string; {tamanho do item}
  multivaults:array[0..255] of Tmultivault;
  Awarehouse:array[0..255,0..14,0..7] of string; {Hexa dos items}
  InvHexa:array[0..7,0..7] of string; //Codigo hexa do item do INV
  EqpHexa:array[0..11] of string; //Codigo hexa do item do EQP
  PSHexa:array[0..3,0..7] of string; //Codigo hexa do item do PS
  InvName:array[0..11] of string; {Nome dos espaços do EQP}
  wscellsb:array[0..14,0..7] of boolean; {Imagem dos items}
  InvCellsb:array[0..7,0..7] of boolean; {Espaço do Item do INV}
  EqpCellsb:array[0..11] of boolean; {Espaço do Item do EQP}
  PSCellsb:array[0..3,0..7] of boolean; {Espaço do Item do PS}
  WsHint:array[0..14,0..7] of string;
  InvHint:array[0..7,0..7] of string;
  EqpHint:array[0..11] of string;
  PSHint:array[0..3,0..7] of string;
  AX,AY:Integer;
  LagX,LagY:Integer;
  Arrastar:Boolean;
end;
type EqpSize=record
  Top,Left,Height,Width:Integer;
end;

var
  VaultForm: TVaultForm;
  vaultvar: tvaultvar;
  Eqp:array[0..11] of EqpSize;
  IBuffer : TBitmap;
implementation
uses mainunit;

{$R *.dfm}

{Conversôes}
function To2Char(const I:integer):string ;   {Int-->2char string}
var
  S:string;
begin
  s:=inttostr(i);
  if length(s)=1 then s:='0'+s;
  result:=s;
end;
function bytetohex(src: byte): string;   {byte-->hex}
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
function HexToInt(Hex : string) : Cardinal;   {Hex-->Integer}
const
  cHex = '0123456789ABCDEF';
var
   mult,i,loop : integer;
begin
  result := 0;
  mult := 1;
  for loop := length(Hex) downto 1 do
  begin
    i := pos(Hex[loop],cHex)-1;
    if (i < 0) then i := 0;
    inc(result,(i*mult));
    mult := mult * 16;
  end;
end;
{Fim das Conversôes}


{Funções Get}
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
function GetItemProp(ID:string;Unique:string;unique2:string):itemproperty;
begin
  with VaultForm.itemQuery do
  begin
    sql.Clear;
    sql.Add('select name,x,y from muitem where id='''+id+''' and unique='+unique+' and unique2='+unique2+'');
    open;
    if eof and bof then
      result.Name:='miss'
        else begin
          result.Name :=fields[0].AsString;
          result.X:=fields[1].AsInteger;
          result.Y:=fields[2].AsInteger;
        end;
    close;
  end;
end;
function GetItemOption(const part1:string;const part2:string;const part3:string;const part4:string;const part5:string;const itemName:string):itemoptions; {Le a propriedade dos items em hex}
var n,x,y,z,a,b,c,v,p15,aff,pex,p14:integer;
    iserr:boolean;
    sexopt,exctype,ancient:string;
    numitemancient:string;
begin
  iserr:=true;
  for n:=0 to 1 do
  for x:=0 to 15 do
    for y:=0 to 1 do
    for z:=0 to 3 do
      for a:=0 to 1 do
        if 128*n+8*x+4*y+z+a*108=hextoint(part1) then
        begin
          result.lvl:=itemlevel+'+'+inttostr(x);
          result.opt:=itemoption+'+'+inttostr(z*4);
          result.dur:=itemdur+inttostr(hextoint(part2));
          if n=1 then result.skill:=itemskill else result.skill:=ItemNoSkill;
          if y=1 then result.lucky:=itemluck else result.lucky:=ItemNoluck;
          iserr:=false;
          p15:=hextoint(part3[1]);
          aff:=z*4;
          if p15>=12 then
          begin
            result.opt:=itemoption+'+'+(inttostr(aff+16));
            pex:=p15-12;
          end
            else if p15>=8 then
            begin
              pex:=p15-8
            end
              else if p15>=4 then
              begin
                result.opt:=itemoption+'+'+(inttostr(aff+16));
                pex:=p15-4;
              end
                else begin
                  pex:=p15;
                end;
      end;
  ancient:=part4;
  result.anc:=AncientNormal;
  vaultvar.Ancient2:='';
  if (vs)='MG' then
    begin
      if (hextoint(ancient)<4096) and (hextoint(ancient)>2303) then result.anc:=ancientconfig else result.anc:=AncientNormal;
      if (hextoint(ancient)<4096) and (hextoint(ancient)>2303) then vaultvar.Ancient2:='Ancient' else vaultvar.Ancient2:='';
    end;
  if (vs)='MX' then
    begin
      if strtoint(ancient)>=5 then result.anc:=ancientconfig else result.anc:=AncientNormal;
      if strtoint(ancient)>=5 then vaultvar.Ancient2:='Ancient' else vaultvar.Ancient2:='';
    end;
  if (vs)='CMT' then
    begin
      if (ancient[1]+ancient[2]=ancientnum5) then begin
        result.anc:=ancient5;
        vaultvar.Ancient2:='Ancient';
      end;
      if (ancient[1]+ancient[2]=ancientnum6) then begin
        result.anc:=Ancient5Sta;
        vaultvar.Ancient2:='Ancient';
      end;
      if (ancient[1]+ancient[2]=ancientnum10) then begin
        result.anc:=Ancient10;
        vaultvar.Ancient2:='Ancient';
      end;
      if (ancient[1]+ancient[2]=ancientnum11) then begin
          result.anc:=ancient10sta;
          vaultvar.Ancient2:='Ancient';
      end;
      if (ancient[1]+ancient[2]<>ancientnum11) and (ancient[1]+ancient[2]<>ancientnum10)
        and (ancient[1]+ancient[2]<>ancientnum6)  and (ancient[1]+ancient[2]<>ancientnum5)  then begin
          result.anc:=ancientnormal;
          vaultvar.Ancient2:='';
        end;
      result.ser:=itemserial+part5;
    end;
  if vs<>'CMT' then
    result.ser:=itemserial+part5;
  if iserr=true then
    begin
      result.lvl :='error';
      exit;
    end;
  with VaultForm do
    begin
      itemquery.SQL.Clear;
      itemquery.SQL.Add('select excoptiontype from muitem where name='''+itemcb.Text+'''');
      itemquery.Open;
      exctype:=itemquery.Fields[0].asstring;
      itemquery.Close;
      pex:=hextoint(inttostr(pex)+part3[2]);
      for a:=0 to 1 do
        for b:=0 to 1 do
          for c:=0 to 1 do
            for x:=0 to 1 do
              for y:=0 to 1 do
                for z:=0 to 1 do
                  if a+2*b+4*c+8*x+16*y+32*z=pex then
                  begin
                    if exctype='we' then
                    begin
                      if a<>0 then sexopt:=#13+wemode1;
                      if b<>0 then sexopt:=sexopt+#13+wemode2;
                      if c<>0 then sexopt:=sexopt+#13+wemode3;
                      if x<>0 then sexopt:=sexopt+#13+wemode4;
                      if y<>0 then sexopt:=sexopt+#13+wemode5;
                      if z<>0 then sexopt:=sexopt+#13+wemode6;
                    end;
                    if exctype='ar' then
                    begin
                      if a<>0 then sexopt:=#13+armode1;
                      if b<>0 then sexopt:=sexopt+#13+armode2;
                      if c<>0 then sexopt:=sexopt+#13+armode3;
                      if x<>0 then sexopt:=sexopt+#13+armode4;
                      if y<>0 then sexopt:=sexopt+#13+armode5;
                      if z<>0 then sexopt:=sexopt+#13+armode6;
                    end;
                    if exctype='fen' then
                    begin
                      if a<>0 then sexopt:=#13+fenmode1;
                      if b<>0 then sexopt:=#13+fenmode2;
                    end;
                    if exctype='wi' then
                    begin
                      if a<>0 then sexopt:=#13+wimode1;
                      if b<>0 then sexopt:=sexopt+#13+wimode2;
                      if c<>0 then sexopt:=sexopt+#13+wimode3;
                      if x<>0 then sexopt:=sexopt+#13+wimode4;
                      if y<>0 then sexopt:=sexopt+#13+wimode5;
                    end;
                    if (exctype<>'wi') and (exctype<>'fen') and (exctype<>'ar') and (exctype<>'we') then
                    begin
                      if a<>0 then sexopt:=#13+ormode1;
                      if b<>0 then sexopt:=sexopt+#13+ormode2;
                      if c<>0 then sexopt:=sexopt+#13+ormode3;
                      if x<>0 then sexopt:=sexopt+#13+ormode4;
                      if y<>0 then sexopt:=sexopt+#13+ormode5;
                      if z<>0 then sexopt:=sexopt+#13+ormode6;
                    end;
                  end;
     end;
  if sexopt='' then result.exopt:=nonexcelent else result.ExOpt:=excelentoptions+sexopt;
  vaultvar.sexopt2:=sexopt;
end;
function GetItemProp2(s:string):itemproperty;
type Tcharset=set of char;
var
A:tcharset;
suni,u2:string;
begin
  a:=['0'..'7'];
  if s[15] in a then suni:='0' else suni:='8';
  if hextoint(s[7]+s[8])>=249 then u2:='1' else u2:='0';
  Result:=getitemprop(leftstr(s,2),suni,u2);
end;
function GetPos15(const org:string;const adt:string):string; {verifica unique}
begin
  if org='C' then
    case strtoint(adt) of
      1:result:='D';
      2:result:='E';
      3:result:='F';
    end
  else
    if org='8' then
      case strtoint(adt) of
        1:result:='9';
        2:result:='A';
        3:result:='B';
      end
    else
      result:=inttostr(strtoint(org)+strtoint(adt));
end;
{Fim das Funções Get}


{Outras Funções}
function IntoInvGrid(const X:integer;const Y:integer;const itempropertyIn:itemproperty;const itemoptionIn:itemoptions):boolean;{Adiciona Iamgem dos items no INV}
var i,t:integer;
    CanInsert:boolean;
begin
  caninsert:=true;
  if ((x+itempropertyin.y-1)>7) or ((y+itempropertyin.x-1)>7) then caninsert:=false;
  if caninsert=false then
  begin
    application.MessageBox(pchar(Format(VaultError1,[itempropertyin.Name,inttostr(itempropertyin.X)+'x'+inttostr(itempropertyin.Y)])+#13+#13+Format(VaultError2,[inttostr(itempropertyin.X)+'x'+inttostr(itempropertyin.Y)])),Pchar(VaultErrorCaption),mb_ok+mb_iconwarning);
    result:=false;
    exit;
  end;
  caninsert:=true;
  for i:=x to (x+itempropertyin.y-1) do
  for t:=y to (y+itempropertyin.x-1) do
    if vaultvar.invcellsb[i,t] then
      caninsert:=false;
  if caninsert=false then
  begin
    application.MessageBox(pchar(Format(VaultError1,[itempropertyin.Name,inttostr(itempropertyin.X)+'x'+inttostr(itempropertyin.Y)])+#13+#13+Format(VaultError2,[inttostr(itempropertyin.X)+'x'+inttostr(itempropertyin.Y)])),Pchar(VaultErrorCaption),mb_ok+mb_iconwarning);
    result:=false;
    exit;
  end;
  for i:=x to (x+itempropertyin.y-1) do
  for t:=y to (y+itempropertyin.x-1) do
    begin
      vaultvar.invcellsb[i,t]:=true;
    end;
  VaultForm.Font.Name:='MS Serif';
  VaultForm.Font.Size:=7;
  if (vaultvar.sexopt2='') and (vaultvar.ancient2='') then
  begin
    VaultForm.Font.Color:=clblack;
    VaultForm.color:=cl3dlight;
  end;
  if (vaultvar.sexopt2='') and (vaultvar.ancient2<>'') then
  begin
    VaultForm.color:=clmoneyGreen;
    VaultForm.Font.Color:=clblack;
  end;
  if (vaultvar.sexopt2<>'') and (vaultvar.ancient2='') then
  begin
    VaultForm.color:=clGreen;
    VaultForm.Font.Color:=clblack;
  end;
  if (vaultvar.sexopt2<>'') and (vaultvar.ancient2<>'') then
  begin
    VaultForm.color:=$6AFF9B ;
    VaultForm.Font.Color:=clblack;
  end;
  VaultForm.Image1.Canvas.CopyRect(bounds(y*26+263,x*26+199,itempropertyin.y*26,itempropertyin.x*26),VaultForm.Image2.Canvas,Bounds(0,0,VaultForm.Image2.Width,VaultForm.Image2.Height));
 // VaultForm.Image1.Canvas.TextRect(Bounds(x*26+263,y*26+199,itempropertyin.y*26,itempropertyin.x*26),5,5,itempropertyin.Name);
  VaultForm.Image1.Canvas.TextOut(y*26+263,x*26+199,itempropertyin.Name);
  VaultVar.InvHint[itempropertyin.y,itempropertyin.x]:=item+itempropertyin.Name+#13+itemoptionin.lvl+#13
                      +itemoptionin.opt+#13+itemoptionin.dur +#13+itemoptionin.skill
                      +#13+itemoptionin.lucky+#13+itemoptionin.anc+#13+itemoptionin.ExOpt+#13+#13+itemoptionin.ser;
  result:=true;
end;
function IntoPSGrid(const X:integer;const Y:integer;const itempropertyIn:itemproperty;const itemoptionIn:itemoptions):boolean;{Adiciona Imagem dos items no PS}
var i,t:integer;
    CanInsert:boolean;
begin
  caninsert:=true;
  if ((x+itempropertyin.y-1)>3) or ((y+itempropertyin.x-1)>7) then caninsert:=false;
  if caninsert=false then
  begin
    application.MessageBox(pchar(Format(VaultError1,[itempropertyin.Name,inttostr(itempropertyin.X)+'x'+inttostr(itempropertyin.Y)])+#13+#13+Format(VaultError2,[inttostr(itempropertyin.X)+'x'+inttostr(itempropertyin.Y)])),Pchar(VaultErrorCaption),mb_ok+mb_iconwarning);
    result:=false;
    exit;
  end;
  caninsert:=true;
  for i:=x to (x+itempropertyin.y-1) do
  for t:=y to (y+itempropertyin.x-1) do
    if vaultvar.pscellsb[i,t] then
      caninsert:=false;
  if caninsert=false then
  begin
    application.MessageBox(pchar(Format(VaultError1,[itempropertyin.Name,inttostr(itempropertyin.X)+'x'+inttostr(itempropertyin.Y)])+#13+#13+Format(VaultError2,[inttostr(itempropertyin.X)+'x'+inttostr(itempropertyin.Y)])),Pchar(VaultErrorCaption),mb_ok+mb_iconwarning);
    result:=false;
    exit;
  end;
  for i:=x to (x+itempropertyin.y-1) do
  for t:=y to (y+itempropertyin.x-1) do
    begin
      vaultvar.pscellsb[i,t]:=true;
    end;
  VaultForm.Font.Name:='MS Serif';
  VaultForm.Font.Size:=7;
  if (vaultvar.sexopt2='') and (vaultvar.ancient2='') then
  begin
    VaultForm.Font.Color:=clblack;
    VaultForm.color:=cl3dlight;
  end;
  if (vaultvar.sexopt2='') and (vaultvar.ancient2<>'') then
  begin
    VaultForm.color:=clmoneyGreen;
    VaultForm.Font.Color:=clblack;
  end;
  if (vaultvar.sexopt2<>'') and (vaultvar.ancient2='') then
  begin
    VaultForm.color:=clGreen;
    VaultForm.Font.Color:=clblack;
  end;
  if (vaultvar.sexopt2<>'') and (vaultvar.ancient2<>'') then
  begin
    VaultForm.color:=$6AFF9B ;
    VaultForm.Font.Color:=clblack;
  end;
  VaultForm.Image1.Canvas.CopyRect(Bounds(y*26,x*26,itempropertyin.y*26,itempropertyin.x*26),VaultForm.Image2.Canvas,Bounds(0,0,VaultForm.Image2.Width,VaultForm.Image2.Height));
  VaultForm.Image1.Canvas.TextRect(Bounds(y*26,x*26,itempropertyin.y*26,itempropertyin.x*26),5,5,itempropertyin.Name);
  VaultForm.Image1.Canvas.TextOut(y*26,x*26,itempropertyin.Name);
  VaultVar.PSHint[itempropertyin.y,itempropertyin.x]:=item+itempropertyin.Name+#13+itemoptionin.lvl+#13
                      +itemoptionin.opt+#13+itemoptionin.dur +#13+itemoptionin.skill
                      +#13+itemoptionin.lucky+#13+itemoptionin.anc+#13+itemoptionin.ExOpt+#13+#13+itemoptionin.ser;
  result:=true;
end;
function IntoEqpGrid(const X:integer;const itempropertyIn:itemproperty;const itemoptionIn:itemoptions):boolean;  {Adiciona os EQP na imagem}
var CanInsert:boolean;
    itemlabel:trzpanel;
    sLeft,sTop,sWidth,sHeight:integer;
begin
  caninsert:=true;
  if vaultvar.eqpcellsb[x]=true then caninsert:=false;
  if caninsert=false then
  begin
    application.MessageBox(pchar(format(vaulterror9,[itempropertyin.Name]))  ,pchar(vaultErrorCaption),mb_ok+mb_iconwarning);
    result:=false;
    exit;
  end;
  vaultvar.eqpcellsb[x]:=true;
  itemlabel:=trzpanel.Create(vaultform);
  sTop:=Eqp[x].Top;
  sLeft:=Eqp[x].Left;
  sHeight:=Eqp[x].Height;
  sWidth:=Eqp[x].Width;
  VaultForm.Font.Name:='MS Serif';
  VaultForm.Font.Size:=7;
  if (vaultvar.sexopt2='') and (vaultvar.ancient2='') then
  begin
    VaultForm.Font.Color:=clblack;
    VaultForm.color:=cl3dlight;
  end;
  if (vaultvar.sexopt2='') and (vaultvar.ancient2<>'') then
  begin
    VaultForm.color:=clmoneyGreen;
    VaultForm.Font.Color:=clblack;
  end;
  if (vaultvar.sexopt2<>'') and (vaultvar.ancient2='') then
  begin
    VaultForm.color:=clGreen;
    VaultForm.Font.Color:=clblack;
  end;
  if (vaultvar.sexopt2<>'') and (vaultvar.ancient2<>'') then
  begin
    VaultForm.color:=$6AFF9B ;
    VaultForm.Font.Color:=clblack;
  end;
  Vaultform.image1.canvas.Brush.Style := bsClear;
  VaultForm.Image1.Canvas.CopyRect(Bounds(sLeft,sTop,sWidth,sHeight),VaultForm.Image2.Canvas,Bounds(0,0,VaultForm.Image2.Width,VaultForm.Image2.Height));
 // VaultForm.Image1.Canvas.TextRect(Bounds(sLeft,sTop,sWidth,sHeight),5,5,itempropertyin.Name);
 // VaultForm.Image1.Canvas.TextOut(sLeft,sTop,itempropertyin.Name);

  VaultVar.EqpHint[x]:=item+itempropertyin.Name+#13+itemoptionin.lvl+#13
                      +itemoptionin.opt+#13+itemoptionin.dur +#13+itemoptionin.skill
                      +#13+itemoptionin.lucky+#13+itemoptionin.anc+#13+itemoptionin.ExOpt+#13+#13+itemoptionin.ser;
  result:=true;
end;
function IntoWsGrid(const X:integer;const Y:integer;const itempropertyIn:itemproperty;const itemoptionIn:itemoptions):boolean;{Adiciona a imagem do item}
var i,t:integer;
    CanInsert:boolean;
    itemlabel:trzpanel;
    s:string;
begin
  caninsert:=true;
  if ((x+itempropertyin.y-1)>14) or ((y+itempropertyin.x-1)>7) then caninsert:=false;
  if caninsert=false then
  begin
    application.MessageBox(pchar(Format(VaultError1,[itempropertyin.Name,inttostr(itempropertyin.X)+'x'+inttostr(itempropertyin.Y)])+#13+#13+Format(VaultError2,[inttostr(itempropertyin.X)+'x'+inttostr(itempropertyin.Y)])),Pchar(VaultErrorCaption),mb_ok+mb_iconwarning);
    result:=false;
    exit;
  end;
  caninsert:=true;
  for i:=x to (x+itempropertyin.y-1) do
  for t:=y to (y+itempropertyin.x-1) do
    if vaultvar.wscellsb[i,t] then
      caninsert:=false;
  if caninsert=false then
  begin
    application.MessageBox(pchar(Format(VaultError1,[itempropertyin.Name,inttostr(itempropertyin.X)+'x'+inttostr(itempropertyin.Y)])+#13+#13+Format(VaultError2,[inttostr(itempropertyin.X)+'x'+inttostr(itempropertyin.Y)])),Pchar(VaultErrorCaption),mb_ok+mb_iconwarning);
    result:=false;
    exit;
  end;
  for i:=x to (x+itempropertyin.y-1) do
  for t:=y to (y+itempropertyin.x-1) do
    begin
      vaultvar.wscellsb[i,t]:=true;
    end;
  VaultForm.Font.Name:='MS Serif';
  VaultForm.Font.Size:=7;
  if (vaultvar.sexopt2='') and (vaultvar.ancient2='') then
  begin
    VaultForm.Font.Color:=clblack;
    VaultForm.color:=cl3dlight;
  end;
  if (vaultvar.sexopt2='') and (vaultvar.ancient2<>'') then
  begin
    VaultForm.color:=clmoneyGreen;
    VaultForm.Font.Color:=clblack;
  end;
  if (vaultvar.sexopt2<>'') and (vaultvar.ancient2='') then
  begin
    VaultForm.color:=clGreen;
    VaultForm.Font.Color:=clblack;
  end;
  if (vaultvar.sexopt2<>'') and (vaultvar.ancient2<>'') then
  begin
    VaultForm.color:=$6AFF9B ;
    VaultForm.Font.Color:=clblack;
  end;

   Vaultform.image1.canvas.Brush.Style := bsClear;
   vaultform.Image1.Canvas.Font.Size:=7;
  VaultForm.Image1.Canvas.CopyRect(Bounds(y*26,x*26,itempropertyin.y*26,itempropertyin.x*26),VaultForm.Image2.Canvas,Bounds(0,0,VaultForm.Image2.Width,VaultForm.Image2.Height));
  s:='';
  t:=3;
  for I := 1 to length(itempropertyin.Name) do
  begin
    s:=s+itempropertyin.Name[i];
    if VaultForm.Image1.Canvas.TextWidth(s)>=itempropertyin.y*26-8 then
    begin

      if (t+VaultForm.Image1.Canvas.TextHeight(s))<itempropertyin.x*26-6 then
      begin
        VaultForm.Image1.Canvas.TextOut(y*26+3,x*26+t,s);
        t:=t+VaultForm.Image1.Canvas.TextHeight(s);
      end;

      s:='';
    end;

  end;
  if (t+VaultForm.Image1.Canvas.TextHeight(s))<itempropertyin.x*26-6 then
    VaultForm.Image1.Canvas.TextOut(y*26+3,x*26+t,s);
  for i:=x to (x+itempropertyin.y-1) do
  for t:=y to (y+itempropertyin.x-1) do
    begin
      VaultVar.wsHint[i,t]:=item+itempropertyin.Name+#13+itemoptionin.lvl+#13
                      +itemoptionin.opt+#13+itemoptionin.dur +#13+itemoptionin.skill
                      +#13+itemoptionin.lucky+#13+itemoptionin.anc+#13+itemoptionin.ExOpt+#13+#13+itemoptionin.ser;
    end;

  result:=true;
end;
function warehouseCommit():boolean;
var
  i,t,j:integer;
  sSql,sSqlSub,
  psSql,psSqlSub:string;
begin
  if vaultvar.vaultuse=true then
  begin
    vaultvar.multivaults[vaultvar.vaultnum].zen:=vaultform.zenedit.text;
    screen.Cursor:=-11;
    application.ProcessMessages;
    ssql:='update '+warehouse+' set '+Money+'='+vaultvar.multivaults[0].zen+','+Items+'=0x';
    for i:=0 to 14 do
    for t:=0 to 7 do
      ssqlsub:=ssqlsub+vaultvar.awarehouse[0,i,t];
    ssql:=ssql+ssqlsub+' where '+AccountID2+'='''+accountsel+'''' ;
    if multivaulttable<>'' then
      for j := 1 to MultiVaultTotal do
        if vaultvar.multivaults[j].edit=true then
        begin
          ssql:=ssql+' update '+multivaulttable+' set '+multivaultMoney+'='+vaultvar.multivaults[j].zen+','+multivaultItems+'=0x';
          ssqlsub:='';
          for i:=0 to 14 do
          for t:=0 to 7 do ssqlsub:=ssqlsub+vaultvar.awarehouse[j,i,t];
            ssql:=ssql+ssqlsub+' where '+multivaultID+'='''+accountsel+''' and '+multivaultnum+'='+inttostr(j)+'' ;
        end;
    if (VaultForm.cbsql.Checked) and (application.MessageBox(pchar(ssql),'Query',mb_yesno+mb_iconinformation)=mrno) then
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
    screen.Cursor:=0;
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
          application.MessageBox(pchar(e.Message),'Erro',mb_ok+mb_iconerror);
          result:=false;
        end;
      end;
    end;
  end;
  if vaultvar.vaultuse=false then
  begin
    screen.Cursor:=-11;
    application.ProcessMessages;
    ssql:='update '+character+' set '+inventory+'=0x';
    for i:=0 to 11 do ssqlsub:=ssqlsub+vaultvar.eqphexa[i];

    for i:=0 to 7 do
    for t:=0 to 7 do
      ssqlsub:=ssqlsub+vaultvar.invhexa[i,t];

    if (vaultvar.tamanho=itemhexcount*54) and (vaultvar.psind=false) then
      for i:=0 to 3 do
      for t:=0 to 7 do
        ssqlsub:=ssqlsub+vaultvar.pshexa[i,t];
    ssql:=ssql+ssqlsub+' where '+CName+'='''+charactersel+'''' ;
    if (vaultvar.pson=true) and (vaultvar.psind=true) then
    begin
      psSql:=' update '+character+' set '+shopitem+'=0x';
      for i:=0 to 7 do
        for t:=0 to 7 do psSqlSub:=psSqlSub+vaultvar.pshexa[i,t];
      psSql:=psSql+psSqlSub+' where '+cname+'='''+charactersel+'''' ;
    end
      else psSQL:='';
    ssql:=ssql+pssql;
    if (VaultForm.cbsql.checked) and (application.MessageBox(pchar(ssql+#13+psSQL),'Query',mb_yesno+mb_iconinformation)=mrno) then
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
    screen.Cursor:=0;
    with VaultForm.VaultADOQuery2 do
    begin
      sql.clear;
      sql.add(ssql);
      try
        execsql;
        if (vaultvar.pson=true) and (vaultvar.psind=true) then
        begin
          sql.clear;
          sql.add(psSql);
          execsql;
        end;
        result:=true;
      except
        on e:exception do
        begin
          application.MessageBox(pchar(e.Message),pchar(vaultErrorCaption),mb_ok+mb_iconerror);
          result:=false;
        end;
      end;
    end;
  end;
end;
{Fim das Outras Funções}


{Procedures}

{Procedures com relações a items}
procedure lerexc;
var exctype:string;
begin
  with VaultForm do
  begin
    lblspace.Caption:=vaultvar.itemspc[itemcb.itemindex];
    itemquery.SQL.Clear;
    itemquery.SQL.Add('select excoptiontype,setnumber from muitem where name='''+itemcb.Text+'''');
    itemquery.Open;
    exctype:=itemquery.Fields[0].asstring;
    vaultvar.numordem:=itemquery.Fields[1].asinteger;
    itemquery.Close;
    if exctype='we' then
    begin
      EO1.Caption:=wemode1;
      EO2.Caption:=wemode2;
      EO3.Caption:=wemode3;
      EO4.Caption:=wemode4;
      EO5.Caption:=wemode5;
      EO6.Caption:=wemode6;
      EO1.Enabled:=true;
      EO2.Enabled:=true;
      EO3.Enabled:=true;
      EO4.Enabled:=true;
      EO5.Enabled:=true;
      EO6.Enabled:=true;
    end;
    if exctype='any' then
    begin
      EO1.Caption:=anymode;
      EO2.Caption:=anymode;
      EO3.Caption:=anymode;
      EO4.Caption:=anymode;
      EO5.Caption:=anymode;
      EO6.Caption:=anymode;
      EO1.Enabled:=false;
      EO2.Enabled:=false;
      EO3.Enabled:=false;
      EO4.Enabled:=false;
      EO5.Enabled:=false;
      EO6.Enabled:=false;
    end;
    if exctype='ar' then
    begin
      EO1.Caption:=armode1;
      EO2.Caption:=armode2;
      EO3.Caption:=armode3;
      EO4.Caption:=armode4;
      EO5.Caption:=armode5;
      EO6.Caption:=armode6;
      EO1.Enabled:=true;
      EO2.Enabled:=true;
      EO3.Enabled:=true;
      EO4.Enabled:=true;
      EO5.Enabled:=true;
      EO6.Enabled:=true;
    end;
    if exctype='fen' then
    begin
      EO1.Caption:=fenmode1;
      EO2.Caption:=fenmode2;
      EO3.Caption:=fenmode3;
      EO4.Caption:=fenmode4;
      EO5.Caption:=fenmode5;
      EO6.Caption:=fenmode6;
      EO1.Enabled:=true;
      EO2.Enabled:=true;
      EO3.Enabled:=false;
      EO4.Enabled:=false;
      EO5.Enabled:=false;
      EO6.Enabled:=false;
    end;
    if exctype='wi' then
    begin
      EO1.Caption:=wimode1;
      EO2.Caption:=wimode2;
      EO3.Caption:=wimode3;
      EO4.Caption:=wimode4;
      EO5.Caption:=wimode5;
      EO6.Caption:=anymode;
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
        EO1.Caption:=ormode1;
        EO2.Caption:=ormode2;
        EO3.Caption:=ormode3;
        EO4.Caption:=ormode4;
        EO5.Caption:=ormode5;
        EO6.Caption:=ormode6;
        EO1.Enabled:=true;
        EO2.Enabled:=true;
        EO3.Enabled:=true;
        EO4.Enabled:=true;
        EO5.Enabled:=true;
        EO6.Enabled:=true;
      end;
end;
end;
procedure Typechange(const S:string); {Seleciona tipo}
var
  i:integer;
begin
  vaultvar.itemspc:=nil;
  with VaultForm do begin
    try
      lblspace.Caption :='0x0';
      itemcb.Items.Clear;
      itemquery.SQL.Clear;
      itemquery.SQL.Add('select name,x,y,setnumber from muitem where type='''+s+'''');
      itemquery.Open;
      if not (itemquery.Eof and itemquery.Bof) then
      begin
        setlength(vaultvar.itemspc,itemquery.RecordCount);
        for i:=0 to itemquery.RecordCount-1 do
        begin
          itemcb.Items.Add(itemquery.Fields[0].asstring);
          vaultvar.itemspc[i]:=itemquery.Fields[1].AsString+'x'+itemquery.Fields[2].AsString ;
          itemquery.Next;
        end;
      end;
      itemcb.ItemIndex:=0;
      itemquery.Close ;
      itemquery.SQL.Clear;
      itemquery.SQL.Add('select name,setnumber from muitem where type='''+s+'''');
      itemquery.Open;
      itemquery.next;
      for i:=1 to itemquery.recordcount-1 do
      begin
        if (itemquery.Fields[1].asinteger=vaultvar.numordem) and (itemquery.Fields[1].asinteger<>0) then itemcb.itemindex:=i;
        itemquery.next;
      end;
     lblspace.Caption :=vaultvar.itemspc[vaultvar.numordem];
   finally
     itemquery.Close ;
   end;
 end;
end;
{Fim das Procedures com relações a items}


{Procedures com relações a imagem e o hexa}
procedure initWS(); {Gera imagem do vault}
var
  i,t,szcell:integer;
  name1,name2:string;
  X,Y:integer;
begin
  szcell:=26;
  VaultForm.Image2.Picture.LoadFromFile(ExtractFilePath(Application.ExeName)+'CMT Data\VaultImages\Blank.bmp');
  for i:=0 to 14 do
  for t:=0 to 7 do
  begin
    X:=t*szcell;
    Y:=i*szcell;
    VaultForm.Image1.Canvas.CopyRect(Bounds(X,Y,szcell,szcell),VaultForm.Image2.canvas,Bounds(0,0,VaultForm.Image2.Width,VaultForm.Image2.Height));
    vaultvar.wshint[i,t]:='';
    vaultvar.wsCellsb[i,t]:=false;
  end;
end;
procedure initInv();
var i,t,szcell:integer;
    name1,name2:string;
    stop,sleft,sheight,swidth:integer;
begin
with vaultform do
  begin
    szcell:=26;
    for i:=0 to 7 do
    for t:=0 to 7 do
      begin
        VaultForm.Image2.Picture.LoadFromFile(ExtractFilePath(Application.ExeName)+'CMT Data\VaultImages\Blank.bmp');
        VaultForm.Image1.Canvas.CopyRect(Bounds(t*szcell+263,i*szcell+199,szcell,szcell),VaultForm.Image2.Canvas,Bounds(0,0,VaultForm.Image2.Width,VaultForm.Image2.Height));
        vaultvar.invhint[i,t]:='';
        vaultvar.invCellsb[i,t]:=false;
      end;
    for i:=0 to 3 do
    for t:=0 to 7 do
      begin
        VaultForm.Image2.Picture.LoadFromFile(ExtractFilePath(Application.ExeName)+'CMT Data\VaultImages\Blank.bmp');
        VaultForm.Image1.Canvas.CopyRect(Bounds(t*szcell,i*szcell,szcell,szcell),VaultForm.Image2.Canvas,Bounds(0,0,VaultForm.Image2.Width,VaultForm.Image2.Height));
        vaultvar.pshint[i,t]:='';
        vaultvar.PSCellsb[i,t]:=false;
      end;
    for I := 0 to 11 do
    begin
      vaultvar.eqphint[i]:='';
      vaultvar.eqpCellsb[i]:=false;
      sLeft:=Eqp[i].Left;
      sTop:=Eqp[i].Top;
      sWidth:=Eqp[i].Width;
      sHeight:=Eqp[i].Height;
      VaultForm.Image2.Picture.LoadFromFile(ExtractFilePath(Application.ExeName)+'CMT Data\VaultImages\Blank.bmp');
      VaultForm.Image1.Canvas.CopyRect(Bounds(sLeft,sTop,sWidth,sHeight),VaultForm.Image2.Canvas,Bounds(0,0,VaultForm.Image2.Width,VaultForm.Image2.Height));
    end;
  end;
end;
procedure FillHexWS(item:TField;itemhexcounts:integer); {Le o Vault em hexa}
type Tcharset=set of char;
var A:tcharset;
    itemblock:array of byte;
    sWS,sItem,sUni,stemp:string;
    wsrow,wscol,i,j,panelcount:integer;
    itemnow:itemproperty;
    itemoptnow:itemoptions;
    Citem:array[1..3] of string;
    u2:string;
begin
  a:=['0'..'7'];
  with item do
  begin
    try
      sws:='';
      if vaultvar.multivaults[vaultvar.vaultnum].edit=false then
      begin
        setlength(itemblock,datasize);
        getdata(itemblock);
        i:=2;
        j:=2;
        sws:='';
        while j<=high(itemblock) do
          begin
            sws:=sws+uppercase(bytetohex(itemblock[i]));
            j:=i;
            inc(j);
            inc(i);
          end;
        stemp:='';
        for wsrow:=0 to 14 do
        for wscol:=0 to 7 do
        for I := 1 to itemhexcounts do
        begin
          stemp:=stemp+'0';
          if i>itemhexcounts then break;
          
        end;
        if sws=stemp then
        begin
          sws:='';
          for wsrow:=0 to 14 do
          for wscol:=0 to 7 do
            begin
              sws:=sws+'FF';
              for I := 3 to itemhexcounts do
                sws:=sws+'0';
            end;
        end;
      end
        else begin
          for wsrow:=0 to 14 do
          for wscol:=0 to 7 do
            sws:=sws+vaultvar.awarehouse[vaultvar.vaultnum,wsrow,wscol];
        end;
      panelcount:=0;
      citem[1]:=''; citem[2]:=''; citem[3]:='';
      for I := 1 to itemhexcounts do
      begin
        citem[1]:=citem[1]+'F';
        if i<3 then citem[2]:=citem[2]+'F'
          else citem[2]:=citem[2]+'0';
        citem[3]:=citem[3]+'0';
      end;
      for wsrow:=0 to 14 do
      for wscol:=0 to 7 do
        begin
          sitem:=midstr(sws,itemhexcounts*8*(wsrow)+itemhexcounts*(wscol)+1,itemhexcounts);
          vaultvar.awarehouse[vaultvar.vaultnum,wsrow,wscol]:=sitem;
          if (sitem<>citem[1]) and (sitem<>citem[2]) and (sitem<>citem[3]) then inc(panelcount);
        end;
      if panelcount=0 then exit;
      for wsrow:=0 to 14 do
      for wscol:=0 to 7 do
        begin
          sitem:=midstr(sws,itemhexcounts*8*(wsrow)+itemhexcounts*(wscol)+1,itemhexcounts);
          vaultvar.awarehouse[vaultvar.vaultnum,wsrow,wscol]:=sitem;
          if (sitem=citem[1]) or (sitem=citem[2]) or (sitem=citem[3]) then sitem:='';
          if sitem<>'' then
          begin
            if sitem[15] in a then suni:='0' else suni:='8';
            if hextoint(sitem[7]+sitem[8])>=249 then u2:='1' else u2:='0';
            itemnow:=getitemprop(leftstr(sitem,2),suni,u2);
            if itemnow.Name='miss' then
            begin
              showmessage(format(VaultError3,[inttostr(wsrow)+','+inttostr(wscol)]));
              continue;
            end;
            itemoptnow:=getitemoption(sitem[3]+sitem[4],sitem[5]+sitem[6],sitem[15]+sitem[16],sitem[17]+sitem[18]+sitem[19]+sitem[20],sitem[7]+sitem[8]+sitem[9]+sitem[10]+sitem[11]+sitem[12]+sitem[13]+sitem[14],itemnow.name);
            if itemnow.Name='miss' then
              if application.MessageBox(pchar(format(VaultError4,[sitem,#13])),Pchar(VaultErrorCaption),mb_yesno+mb_iconwarning)=id_no then
                continue;
            VaultForm.Image2.Picture.LoadFromFile(ExtractFilePath(Application.ExeName)+'CMT Data\VaultImages\Item.bmp');
            if intowsgrid(wsrow,wscol,itemnow,itemoptnow)=false then application.MessageBox(pchar(format(VaultError5,[sitem,#13,inttostr(wsrow+1)+','+inttostr(wscol+1)])),Pchar(VaultErrorCaption),mb_ok+mb_iconwarning);
          end;
        end;
     except
       on E:exception do application.MessageBox(pchar(e.Message),Pchar(VaultErrorCaption),mb_ok+mb_iconerror);
     end;
  end;
end;
procedure FillHexInv(item:TField;itemhexcounts:integer); {le todos os items}
type Tcharset=set of char;
var A:tcharset;
    itemblock:array of byte;
    sWS,sItem,sUni:string;
    wsrow,wscol,i,panelcount:integer;
    itemnow:itemproperty;
    itemoptnow:itemoptions;
    u2:string;
    Citem:array[1..3] of string;
    j:integer;
begin
  a:=['0'..'7'];
  with item do
    begin
      setlength(itemblock,datasize);
      try
        getdata(itemblock);
        i:=2;
        j:=2;
        sws:='';
        while j<=high(itemblock) do
          begin
            sws:=sws+uppercase(bytetohex(itemblock[i]));
            j:=i;
            inc(j);
            inc(i);
          end;
        panelcount:=0;
        citem[1]:=''; citem[2]:=''; citem[3]:='';
        i:=1;
        j:=itemhexcounts;
        while i <= j do
        begin
          citem[1]:=citem[1]+'F';
          if i<3 then citem[2]:=citem[2]+'F'
            else citem[2]:=citem[2]+'0';
          citem[3]:=citem[3]+'0';
          inc(i);
          if j<>itemhexcounts then break;
          if i>itemhexcounts then break;
          
        end;
        for wsrow := 0 to 11 do
          begin
            sitem:=midstr(sws,itemhexcounts*wsrow+1,itemhexcounts);
            if (sitem<>citem[1]) and (sitem<>citem[2]) and (sitem<>citem[3]) then inc(panelcount);
          end;
        for wsrow:=0 to 7 do
          for wscol:=0 to 7 do
            begin
              sitem:=midstr(sws,8*itemhexcounts*(wsrow)+itemhexcounts*(wscol)+1+itemhexcounts*12,itemhexcounts);
              if (sitem<>citem[1]) and (sitem<>citem[2]) and (sitem<>citem[3]) then inc(panelcount);
            end;
        if vaultvar.tamanho=itemhexcounts*54 then
          for wsrow:=0 to 3 do
            for wscol:=0 to 7 do
              begin
                sitem:=midstr(sws,8*itemhexcounts*(wsrow)+itemhexcounts*(wscol)+1+itemhexcounts*76,itemhexcounts);
                if (sitem<>citem[1]) and (sitem<>citem[2]) and (sitem<>citem[3]) then inc(panelcount);
              end;
      if panelcount=0 then exit;

      for wsrow := 0 to 11 do
        begin
          sitem:=midstr(sws,itemhexcounts*wsrow+1,itemhexcounts);
          vaultvar.EqpHexa[wsrow]:=sitem;
          if (sitem=citem[1]) or (sitem=citem[2]) or (sitem=citem[3]) then sitem:='';
          if sitem<>'' then
            begin
              if sitem[15] in a then suni:='0' else suni:='8';
              if sitem[7]+sitem[8]='F9' then u2:='1' else u2:='0';
              itemnow:=getitemprop(leftstr(sitem,2),suni,u2);
              if itemnow.Name='miss' then
                begin
                  showmessage(format(VaultError3,[vaultvar.InvName[wsrow]]));
                  continue;
                end;
              itemoptnow:=getitemoption(sitem[3]+sitem[4],sitem[5]+sitem[6],sitem[15]+sitem[16],sitem[17]+sitem[18]+sitem[19]+sitem[20],sitem[7]+sitem[8]+sitem[9]+sitem[10]+sitem[11]+sitem[12]+sitem[13]+sitem[14],itemnow.name);
              if itemnow.Name='miss' then
                if application.MessageBox(pchar(format(VaultError4,[sitem,#13])),Pchar(VaultErrorCaption),mb_yesno+mb_iconwarning)=id_no then
                  continue;
              vaultvar.tipo:='eqp';
              if intoeqpgrid(wsrow,itemnow,itemoptnow)=false then
                application.MessageBox(pchar(format(VaultError5,[sitem,#13,vaultvar.InvName[wsrow]])),Pchar(VaultErrorCaption),mb_ok+mb_iconwarning);
            end;
        end;
      for wsrow:=0 to 7 do
        for wscol:=0 to 7 do
          begin
            sitem:=midstr(sws,itemhexcounts*8*(wsrow)+itemhexcounts*(wscol)+1+itemhexcounts*12,itemhexcounts);
            vaultvar.InvHexa[wsrow,wscol]:=sitem;
            if (sitem=citem[1]) or (sitem=citem[2]) or (sitem=citem[3]) then sitem:='';
            if sitem<>'' then
              begin
                if sitem[15] in a then suni:='0' else suni:='8';
                if sitem[7]+sitem[8]='F9' then u2:='1' else u2:='0';
                itemnow:=getitemprop(leftstr(sitem,2),suni,u2);
                if itemnow.Name='miss' then
                  begin
                    showmessage(format(VaultError3,[inttostr(wsrow)+','+inttostr(wscol)]));
                    continue;
                  end;
                itemoptnow:=getitemoption(sitem[3]+sitem[4],sitem[5]+sitem[6],sitem[15]+sitem[16],sitem[17]+sitem[18]+sitem[19]+sitem[20],sitem[7]+sitem[8]+sitem[9]+sitem[10]+sitem[11]+sitem[12]+sitem[13]+sitem[14],itemnow.name);
                if itemnow.Name='miss' then
                  if application.MessageBox(pchar(format(VaultError4,[sitem,#13])),Pchar(VaultErrorCaption),mb_yesno+mb_iconwarning)=id_no then
                    continue;
                vaultvar.tipo:='inv';
                if intoinvgrid(wsrow,wscol,itemnow,itemoptnow)=false then
                  application.MessageBox(pchar(format(VaultError5,[sitem,#13,inttostr(wsrow+1)+','+inttostr(wscol+1)])),Pchar(VaultErrorCaption),mb_ok+mb_iconwarning);
              end;
          end;
      if vaultvar.tamanho=itemhexcounts*54 then
        for wsrow:=0 to 3 do
          for wscol:=0 to 7 do
            begin
              sitem:=midstr(sws,itemhexcounts*8*(wsrow)+itemhexcounts*(wscol)+1+itemhexcounts*76,itemhexcounts);
              vaultvar.PSHexa[wsrow,wscol]:=sitem;
              if (sitem=citem[1]) or (sitem=citem[2]) or (sitem=citem[3]) then sitem:='';
              if sitem<>'' then
                begin
                  if sitem[15] in a then suni:='0' else suni:='8';
                  if sitem[7]+sitem[8]='F9' then u2:='1' else u2:='0';
                  itemnow:=getitemprop(leftstr(sitem,2),suni,u2);
                  if itemnow.Name='miss' then
                    begin
                      showmessage(format(VaultError3,[inttostr(wsrow)+','+inttostr(wscol)]));
                      continue;
                    end;
                  itemoptnow:=getitemoption(sitem[3]+sitem[4],sitem[5]+sitem[6],sitem[15]+sitem[16],sitem[17]+sitem[18]+sitem[19]+sitem[20],sitem[7]+sitem[8]+sitem[9]+sitem[10]+sitem[11]+sitem[12]+sitem[13]+sitem[14],itemnow.name);
                  if itemnow.Name='miss' then
                    if application.MessageBox(pchar(format(VaultError4,[sitem,#13])),Pchar(VaultErrorCaption),mb_yesno+mb_iconwarning)=id_no then
                      continue;
                  vaultvar.tipo:='ps';
                  if intoPSgrid(wsrow,wscol,itemnow,itemoptnow)=false then
                    application.MessageBox(pchar(format(VaultError5,[sitem,#13,inttostr(wsrow+1)+','+inttostr(wscol+1)])),Pchar(VaultErrorCaption),mb_ok+mb_iconwarning);
                end;
            end;
      except
      on E:exception do application.MessageBox(pchar(e.Message),Pchar(vaultErrorCaption),mb_ok+mb_iconerror);
      end;
  end;
end;
procedure FillHexPS(item:TField;itemhexcounts:integer); {le personal store se for separado do inventory}
type Tcharset=set of char;
var A:tcharset;
    itemblock:array of byte;
    sWS,sItem,sUni:string;
    wsrow,wscol,i,j,panelcount:integer;
    itemnow:itemproperty;
    itemoptnow:itemoptions;
    u2:string; //unique2
    Citem:array[1..3] of string;
begin
  a:=['0'..'7'];
  with item do
    begin
      setlength(itemblock,datasize);
      try
        getdata(itemblock);
        i:=2;
        j:=2;
        sws:='';
        while j<=high(itemblock) do
          begin
            sws:=sws+uppercase(bytetohex(itemblock[i]));
            j:=i;
            inc(j);
            inc(i);
          end;
        panelcount:=0;
        citem[1]:=''; citem[2]:=''; citem[3]:='';
        for I := 1 to itemhexcounts do
        begin
          citem[1]:=citem[1]+'F';
          if i<3 then citem[2]:=citem[2]+'F'
            else citem[2]:=citem[2]+'0';
          citem[3]:=citem[3]+'0';
          if i>itemhexcounts then break;
          
        end;
        for wsrow:=0 to 3 do
          for wscol:=0 to 7 do
            begin
              sitem:=midstr(sws,itemhexcounts*8*(wsrow)+itemhexcounts*(wscol)+1,itemhexcounts);
              if (sitem<>citem[1]) and (sitem<>citem[2]) and (sitem<>citem[3]) then inc(panelcount);
            end;
        if panelcount=0 then exit;
        for wsrow:=0 to 3 do
        for wscol:=0 to 7 do
          begin
            sitem:=midstr(sws,itemhexcounts*8*(wsrow)+itemhexcounts*(wscol)+1,itemhexcounts);
            vaultvar.PSHexa[wsrow,wscol]:=sitem;
            if (sitem=citem[1]) or (sitem=citem[2]) or (sitem=citem[3]) then sitem:='';
            if sitem<>'' then
              begin
                if sitem[15] in a then suni:='0' else suni:='8';
                if sitem[7]+sitem[8]='F9' then u2:='1' else u2:='0';
                itemnow:=getitemprop(leftstr(sitem,2),suni,u2);
                if itemnow.Name='miss' then
                  begin
                    showmessage(format(VaultError3,[inttostr(wsrow)+','+inttostr(wscol)]));
                    continue;
                  end;
                itemoptnow:=getitemoption(sitem[3]+sitem[4],sitem[5]+sitem[6],sitem[15]+sitem[16],sitem[17]+sitem[18]+sitem[19]+sitem[20],sitem[7]+sitem[8]+sitem[9]+sitem[10]+sitem[11]+sitem[12]+sitem[13]+sitem[14],itemnow.name);
                if itemnow.Name='miss' then                                                 
                  if application.MessageBox(pchar(format(VaultError4,[sitem,#13])),Pchar(VaultErrorCaption),mb_yesno+mb_iconwarning)=id_no then
                    continue;
                vaultvar.tipo:='ps';
                if intoPSgrid(wsrow,wscol,itemnow,itemoptnow)=false then
                  application.MessageBox(pchar(format(VaultError5,[sitem,#13,inttostr(wsrow+1)+','+inttostr(wscol+1)])),Pchar(VaultErrorCaption),mb_ok+mb_iconwarning);
              end;
          end;
      except
      on E:exception do application.MessageBox(pchar(e.Message),Pchar(vaultErrorCaption),mb_ok+mb_iconerror);
      end;
  end;
end;
{Fim das Procedures com relações a imagem e o hexa}

{Apagar Vault/Items}
procedure ResetWS(clearhex:boolean);  {Limpa o Vault}
var
  i,t:integer;
  citem:string;
begin
  citem:='FF';
  for i := 3 to itemhexcount  do
    citem:=citem+'0';
  for i:=0 to 14 do
  for t:=0 to 7 do
    begin
      vaultvar.wscellsb[i,t]:=false;
      vaultvar.wshint[i,t]:='';
      if clearhex=true then
        vaultvar.awarehouse[vaultvar.vaultnum,i,t]:=citem;
    end;
  InitWs;
end;
procedure ResetInv(); {Dexa em branco todos os espaços de items e limpa items da memoria}
var i,t:integer;
citem:string;
begin
  citem:='FF';
  for i := 3 to itemhexcount  do
    citem:=citem+'0';
  vaultvar.cboxinv:=8;
  vaultvar.cboyinv:=8;
  vaultvar.eqpsel:='';
  for i:=0 to 7 do
  for t := 0 to 7 do
    begin
      vaultvar.Invcellsb[i,t]:=false;
      vaultvar.Invhint[i,t]:='';
      vaultvar.invHexa[i,t]:=citem;
    end;
  for i:=0 to 3 do
  for t := 0 to 7 do
    begin
      vaultvar.pscellsb[i,t]:=false;
      vaultvar.pshint[i,t]:='';
      vaultvar.psHexa[i,t]:=citem;
    end;
  for i := 0 to 11 do
    begin
      vaultvar.eqpcellsb[i]:=false;
      vaultvar.eqphint[i]:='';
      vaultvar.eqphexa[i]:=citem;
    end;
  InitInv;
end;
procedure killitemws(x,y:byte); {deleta item}
type Tcharset=set of char;
var
  itemnow:itemproperty;
  i,j:byte;
begin
  itemnow:=GetItemProp2(vaultvar.awarehouse[vaultvar.vaultnum,x,y]);
  for I := 0 to itemnow.Y do
  for j := 0 to itemnow.x do
  begin
    VaultForm.Image2.Picture.LoadFromFile(ExtractFilePath(Application.ExeName)+'CMT Data\VaultImages\Blank.bmp');
    VaultForm.Image1.Canvas.CopyRect(Bounds(x*26,y*26,j*26,i+26),VaultForm.Image2.Canvas,Bounds(0,0,VaultForm.Image2.Width,VaultForm.Image2.Height));
    VaultVar.WsCellsB[x,y]:=false;
    VaultVar.WsHint[x,y]:='';
  end;

end;
procedure killiteminv(x,y:byte); {Excluir item do Inv}
var
itemnow:itemproperty;
i,j:byte;
begin
  itemnow:=GetItemProp2(vaultvar.InvHexa[x,y]);
  for I := 0 to itemnow.Y do
  for j := 0 to itemnow.x do
  begin
    VaultForm.Image2.Picture.LoadFromFile(ExtractFilePath(Application.ExeName)+'CMT Data\VaultImages\Blank.bmp');
    VaultForm.Image1.Canvas.CopyRect(Bounds(x*26+263,y*26+199,j*26,i+26),VaultForm.Image2.Canvas,Bounds(0,0,VaultForm.Image2.Width,VaultForm.Image2.Height));
  end;
  VaultVar.InvCellsB[x,y]:=false;
end;
procedure killitemps(x,y:byte); {Excluir item do PS}
var
itemnow:itemproperty;
i,j:byte;
begin
  itemnow:=GetItemProp2(vaultvar.PsHexa[x,y]);
  for I := 0 to itemnow.Y do
  for j := 0 to itemnow.x do
  begin
    VaultForm.Image2.Picture.LoadFromFile(ExtractFilePath(Application.ExeName)+'CMT Data\VaultImages\Blank.bmp');
    VaultForm.Image1.Canvas.CopyRect(Bounds(x*26,y*26,j*26,i+26),VaultForm.Image2.Canvas,Bounds(0,0,VaultForm.Image2.Width,VaultForm.Image2.Height));
  end;
  VaultVar.PSCellsB[x,y]:=false;
end;
procedure killitemeqp(x:byte); {Excluir item do PS}
var
itemnow:itemproperty;
i,j:byte;
begin
  itemnow:=GetItemProp2(vaultvar.EqpHexa[x]);
  VaultForm.Image2.Picture.LoadFromFile(ExtractFilePath(Application.ExeName)+'CMT Data\VaultImages\Blank.bmp');
  VaultForm.Image1.Canvas.CopyRect(Bounds(eqp[x].Left,eqp[x].Top,eqp[x].Height,eqp[x].Width),VaultForm.Image2.Canvas,Bounds(0,0,VaultForm.Image2.Width,VaultForm.Image2.Height));
  VaultVar.EqpCellsB[x]:=false;
end;
procedure ResetConfig;
begin
  with vaultform do
  begin
    vaultvar.numordem:=0;
    tipocb.ItemIndex:=-1;
    itemcb.ItemIndex:=-1;
    vaultvar.currentitem:='';
    vaultvar.sexopt2:='';
    vaultvar.ancient2:='';
    vaultvar.wearto:='';
    vaultvar.xhint:='';
    vaultvar.tipo:='';
    vaultvar.eqpsel:='';
    vaultvar.query:='';
    vaultvar.tipoantigo:='';
    vaultvar.groupvisible:='inv';

    vaultvar.tamanho:=0;
    vaultvar.opr:=0;
    vaultvar.vaultnum:=0;
    vaultvar.cboxps:=11;
    vaultvar.cboyps:=11;
    vaultvar.cboxinv:=17;
    vaultvar.cboyinv:=17;
    vaultvar.cboxws:=17;
    vaultvar.cboyws:=17;

    vaultvar.pson:=false;
    vaultvar.psind:=false;

    vaultvar.AX:=-1;
    vaultvar.AY:=-1;
    vaultvar.Arrastar:=false;
    vaultvar.LagX:=26;
    vaultvar.LagY:=26;


    leveltrack.position:=0;
    opcaotrack.position:=0;
    rzspinner1.Value:=255;
    checkskill.Checked:=false;
    checkluck.Checked:=false;
    serialedit.Text:='00000000';
    checkaserial.Checked:=false;
    ancientcb.ItemIndex:=0;
    EO1.Checked:=false;
    EO2.Checked:=false;
    EO3.Checked:=false;
    EO4.Checked:=false;
    EO5.Checked:=false;
    EO6.Checked:=false;
    cboy.Value:=0;
    cbox.Value:=0;
    rzcombobox1.ItemIndex:=0;
    cbsql.Checked:=false;
    checkbox3.Checked:=false;
    zenedit.Text:='0';
    rzpagecontrol1.tabindex:=0;

  end;
end;
procedure ConfigEqpCells;
begin
  With Eqp[0] do
  begin
    Left := 32  ;
    Top := 74   ;
    Width := 48 ;
    Height := 64;
  end;
  With Eqp[1] do
  begin
    Left := 132 ;
    Top := 74   ;
    Width := 48 ;
    Height := 64;
  end;
  With Eqp[2] do
  begin
    Left := 82  ;
    Top := 16   ;
    Width := 48 ;
    Height := 48;
  end;
  With Eqp[3] do
  begin
    Left := 82  ;
    Top := 66   ;
    Width := 48 ;
    Height := 72;
  end;
  With Eqp[4] do
  begin
    Left := 82  ;
    Top := 140  ;
    Width := 48 ;
    Height := 48;
  end;
  With Eqp[5] do
  begin
    Left := 6   ;
    Top := 140  ;
    Width := 48 ;
    Height := 48;
  end;
  With Eqp[6] do
  begin
    Left := 158 ;
    Top := 140  ;
    Width := 48 ;
    Height := 48;
  end;
  With Eqp[7] do
  begin
    Left := 144 ;
    Top := 16   ;
    Width := 62 ;
    Height := 36;
  end;
  With Eqp[8] do
  begin
    Left := 6   ;
    Top := 16   ;
    Width := 24 ;
    Height := 24;
  end;
  With Eqp[9] do
  begin
    Left := 56  ;
    Top := 47   ;
    Width := 24 ;
    Height := 24;
  end;
  With Eqp[10] do
  begin
    Left := 132 ;
    Top := 140  ;
    Width := 24 ;
    Height := 24;
  end;
  With Eqp[11] do
  begin
    Left := 56  ;
    Top := 140  ;
    Width := 24 ;
    Height := 24;
  end;
end;
{Fim do Apagar Vault/Items}

{TVaultForm.}
{Serial}
procedure TVaultForm.SerialEditExit(Sender: TObject);
var i,x,z:byte;
begin
  z:=8;
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
{Fim do Serial}


{Fechar}
procedure TVaultForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  IBuffer.free;
  mainform.Enabled:=true;
end;
procedure TVaultForm.VoltarBClick(Sender: TObject);
begin
  vaultform.Close;
end;
{Fim do Fechar}


{Selecionar Items}
procedure TVaultForm.Timer1Timer(Sender: TObject);
var x,y:integer;
pt:tpoint;
begin
  if vaultvar.vaultuse=true then
  begin
    {Pegar Posição}
    pt:=vaultform.ClientOrigin;
    Pt.X:=mouse.CursorPos.X-Pt.X-277;
    Pt.Y:=mouse.CursorPos.Y-Pt.Y-12;
    x:=pt.x div 26 ;
    y:=pt.y div 26 ;
    {Verificar Posição}
    if (X>=0) and (Y>=0) and (X<=7) and (Y<=14)  then
    begin
      {Click}
      if (GetAsyncKeyState(VK_LBUTTON) <> -32768) and (vaultvar.Arrastar=true) then
      begin
        vaultvar.Arrastar:=false;
        if (vaultvar.wscellsb[vaultvar.Ay,vaultvar.Ax]= false) {and ((vaultvar.Ax<>X) or (vaultvar.Ay<>Y))} then
        begin
          VaultForm.Image2.Picture.LoadFromFile(ExtractFilePath(Application.ExeName)+'CMT Data\VaultImages\Blank.bmp');
          image1.Canvas.CopyRect(bounds(vaultvar.Ax*vaultvar.LagX,vaultvar.Ay*vaultvar.LagY,vaultvar.LagX,vaultvar.LagY),Image2.Canvas,bounds(0,0,vaultvar.LagX,vaultvar.LagY));
        end;
        if vaultvar.wscellsb[vaultvar.Ay,vaultvar.Ax]<>false then
        begin
          Timer1.Enabled:=false;
          application.MessageBox (pchar(vaultvar.WsHint[y,x]),pchar(infor),mb_ok+mb_iconinformation);
          Timer1.Enabled:=true;
        end else
          begin
            if (cbox.value=vaultvar.cboxws) and (cboy.value=vaultvar.cboyws) then
            begin
              itemadd('ws');
            end;
            vaultvar.cboxws:=cbox.value;
            vaultvar.cboyws:=cboy.value;
          end;
      end;
      {Arrastar Mouse}
      if (GetAsyncKeyState(VK_LBUTTON) = -32768) and (vaultvar.Arrastar=false) then
      begin
        if (vaultvar.wscellsb[y,x]= false) then
        begin
          VaultForm.Image2.Picture.LoadFromFile(ExtractFilePath(Application.ExeName)+'CMT Data\VaultImages\BlankPressed.bmp');
          image1.Canvas.CopyRect(bounds(X*vaultvar.LagX,Y*vaultvar.LagY,vaultvar.LagX,vaultvar.LagY),Image2.Canvas,bounds(0,0,vaultvar.LagX,vaultvar.LagY));
          cbox.value:=y+1;
          cboy.value:=x+1;
        end;
        vaultvar.Ax:=X;
        vaultvar.Ay:=Y;
        vaultvar.Arrastar:=true;
      end;
    end;
  end;
end;

procedure TVaultForm.TipoCBChange(Sender: TObject);
var i:integer;
begin
  typechange(tipocb.Text );
  itemquery.SQL.Clear;
  itemquery.SQL.Add('select name,setnumber from muitem where type='''+tipoCB.text+'''');
  itemquery.Open;
  for i:=1 to itemquery.recordcount-1 do
    begin
      if (itemquery.Fields[1].asinteger=vaultvar.numordem) and (itemquery.Fields[1].asinteger<>0) then ItemCB.text:=itemquery.Fields[0].asstring;
      itemquery.next;
    end;
  itemquery.Close ;
  lerexc;
end;
procedure TVaultForm.ItemCBChange(Sender: TObject);
begin
  lerexc;
end;
{Fim Selecionar Items}


{Tracks}
procedure TVaultForm.LevelTrackChanging(Sender: TObject; NewPos: Integer; var AllowChange: Boolean);
begin
  LevelShowLB.Caption:=format(pluslevel,[inttostr(newpos)]);
end;
procedure TVaultForm.OpcaoTrackChanging(Sender: TObject; NewPos: Integer; var AllowChange: Boolean);
begin
  OptionShowLB.Caption:=format(plusoption,[inttostr(newpos*vaultvar.opr)]);
end;
{Fim dos Tracks}


{Opções dos items}
procedure TVaultForm.N1Click(Sender: TObject);
var i,t:integer;
begin
  i:=strtoint(leftstr(vaultvar.currentitem,2));
  t:=strtoint(rightstr(vaultvar.currentitem,2));
  if vaultvar.vaultuse=true then
  begin
    application.MessageBox (pchar(vaultvar.wshint[i,t]),Pchar(Info),mb_ok+mb_iconinformation);
  end else
    begin
      if vaultvar.tipo='inv' then
      begin
        application.MessageBox (pchar(vaultvar.invhint[i,t]),Pchar(Info),mb_ok+mb_iconinformation);

      end;
      if vaultvar.tipo='eqp' then
      begin
        application.MessageBox (pchar(vaultvar.eqphint[t]),Pchar(Info),mb_ok+mb_iconinformation);
      end;
      if vaultvar.tipo='ps' then
      begin
        application.MessageBox (pchar(vaultvar.pshint[i,t]),Pchar(Info),mb_ok+mb_iconinformation);
      end;
    end;
end;
procedure TVaultForm.N3Click(Sender: TObject);
var i,t,j,l:integer;
citem:string;
begin
  citem:='FF';
  for i := 3 to itemhexcount do
    citem:=citem+'0';
  if application.MessageBox(pchar(VaultQuestion2),pchar(programname),mb_yesno+mb_iconquestion)=id_no then exit;
  if vaultvar.vaultuse=true then
  begin
    i:=strtoint(leftstr(vaultvar.currentitem,2));
    t:=strtoint(rightstr(vaultvar.currentitem,2));
    vaultvar.awarehouse[vaultvar.vaultnum,i,t]:=citem;
    vaultvar.wshint[i,t]:='';
    killitemws(i,t);
  end else
    begin
      if vaultvar.tipo='eqp' then
      begin
        l:=strtoint(rightstr(vaultvar.currentitem,2));
        vaultvar.eqphexa[l]:=citem;
        killitemeqp(l);
    end ;
  if vaultvar.tipo='inv' then
    begin
      i:=strtoint(leftstr(vaultvar.currentitem,2));
      t:=strtoint(rightstr(vaultvar.currentitem,2));
      vaultvar.invhexa[i,t]:=citem;
      vaultvar.invhint[i,t]:='';
      killiteminv(i,t);
    end;
 if vaultvar.tipo='ps' then
    begin
      i:=(strtoint(leftstr(vaultvar.currentitem,2))-9);
      t:=(strtoint(rightstr(vaultvar.currentitem,2))-9);
      vaultvar.pshexa[i,t]:=citem;
      vaultvar.pshint[i,t]:='';
      killitemps(i,t);
    end;
    end;
end;
{Fim das Opções dos item}

procedure TVaultForm.btnINClick(Sender: TObject);
begin
   if vaultvar.vaultuse=true then
     itemadd('ws')
   else begin
     if vaultvar.tipo='inv' then
       itemadd('inv');
     if vaultvar.tipo='eqp' then
     begin
       vaultvar.xhint:=rzcombobox1.Text;
       itemadd('eqp');
     end;
     if vaultvar.tipo='ps' then
       itemadd('ps');
   end;

end;
{Procedures Public}
procedure TVaultForm.Image1MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
  var
pt:tpoint;
  begin

  {if vaultvar.vaultuse=true then
  begin
    pt:=vaultform.ClientOrigin;
    Pt.X:=mouse.CursorPos.X-Pt.X-277 div 26;
    Pt.Y:=mouse.CursorPos.Y-Pt.Y-12 div 26;
    if vaultvar.wscellsb[Pt.y,Pt.x]= false then
    begin
      VaultForm.Image2.Picture.LoadFromFile(ExtractFilePath(Application.ExeName)+'CMT Data\VaultImages\BlankPressed.bmp');
      VaultForm.Image1.Canvas.CopyRect(Bounds(Pt.y*26,Pt.x*26,26,26),VaultForm.Image2.Canvas,Bounds(0,0,VaultForm.Image2.Width,VaultForm.Image2.Height));
    end;
  end;
      }
end;

procedure TVaultForm.Image1MouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
  var
pt:tpoint;
  begin
if vaultvar.vaultuse=true then
  begin
    pt:=vaultform.ClientOrigin;
    Pt.X:=mouse.CursorPos.X-Pt.X-277 div 26;
    Pt.Y:=mouse.CursorPos.Y-Pt.Y-12 div 26;
    if vaultvar.wscellsb[Pt.y,Pt.x]= false then
    begin
      VaultForm.Image2.Picture.LoadFromFile(ExtractFilePath(Application.ExeName)+'CMT Data\VaultImages\Blank.bmp');
      VaultForm.Image1.Canvas.CopyRect(Bounds(Pt.x*26,Pt.y*26,26,26),VaultForm.Image2.Canvas,Bounds(0,0,VaultForm.Image2.Width,VaultForm.Image2.Height));
    end;
  end;


end;

{procedure tVaultForm.lblClick(sender:tobject);
begin
  application.MessageBox (pchar((sender as trzpanel).Hint),pchar(infor),mb_ok+mb_iconinformation);
end;

procedure tVaultForm.cellClickws(sender:tobject);
var sHint:string;
begin
  shint:=(sender as tspeedbutton).Hint ;
  cbox.value:=strtoint(leftstr(shint,2));
  cboy.value:=strtoint(rightstr(shint,2));
  if (cbox.value=vaultvar.cboxws) and (cboy.value=vaultvar.cboyws) then
    itemadd('ws');
  vaultvar.cboxws:=cbox.value;
  vaultvar.cboyws:=cboy.value;
end;
procedure tVaultForm.CellClickEQP(sender:tobject);
var sHint:string;
i:byte;
affname:array[0..12] of string ;
begin
  //rzcombobox1.itemindex:=0;
  rzcombobox1.Visible:=true;
  cboy.Visible:=false;
  cbox.visible:=false;
  xlb.visible:=false;
  ylb.visible:=false;
  vaultvar.cboxws:=17;
  vaultvar.cboyws:=17;
  vaultvar.cboxinv:=17;
  vaultvar.cboyinv:=17;
  vaultvar.cboxps:=11;
  vaultvar.cboyps:=11;
  affname[0]:='OL';
  affname[1]:='OR';
  affname[2]:='OB';
  affname[3]:='TR';
  affname[4]:='helm';
  affname[5]:='armor';
  affname[6]:='pants';
  affname[7]:='gloves';
  affname[8]:='boots';
  affname[9]:='wings';
  affname[10]:='guardian';
  affname[11]:='pendant';
  affname[12]:='rings';
  shint:=(sender as tspeedbutton).Hint ;
  if shint=WeaponLeft then vaultvar.wearto:='wearto='''+affname[0]+''' or wearto='''+affname[2]+''' or wearto='''+affname[3]+'''';
  if shint=WeaponRight then vaultvar.wearto:='wearto='''+affname[1]+''' or wearto='''+affname[2]+''' or wearto='''+affname[3]+'''';
  if shint=Helm then vaultvar.wearto:='wearto='''+affname[4]+'''';
  if shint=Armor then vaultvar.wearto:='wearto='''+affname[5]+'''';
  if shint=Pants then vaultvar.wearto:='wearto='''+affname[6]+'''';
  if shint=Gloves then vaultvar.wearto:='wearto='''+affname[7]+'''';
  if shint=Boots then vaultvar.wearto:='wearto='''+affname[8]+'''';
  if shint=Wings then vaultvar.wearto:='wearto='''+affname[9]+'''';
  if shint=Pet then vaultvar.wearto:='wearto='''+affname[10]+'''';
  if shint=Pendants then vaultvar.wearto:='wearto='''+affname[11]+'''';
  if (shint=RingLeft) or (shint=RingRight) then vaultvar.wearto:='wearto='''+affname[12]+'''';
  lertipo;
  vaultvar.query:='eqp';
  for i := 0 to 12 do
    if rzcombobox1.items[i]=shint then rzcombobox1.ItemIndex:=i;
  vaultvar.xhint:='';
  vaultvar.tipo:='eqp';
  if (rzcombobox1.text=vaultvar.eqpsel) then
  begin
    vaultvar.xhint:=shint;
    itemadd('eqp');
  end;
  vaultvar.eqpsel:=rzcombobox1.text;
end;
procedure tVaultForm.CellClickINV(sender:tobject);
var sHint,itemsel,tiposel:string;
begin
  vaultvar.tipoantigo:=tipocb.text;
  rzcombobox1.itemindex:=0;
  rzcombobox1.Visible:=false;
  cboy.Visible:=true;
  cbox.visible:=true;
  xlb.visible:=true;
  ylb.visible:=true;
  vaultvar.cboxws:=17;
  vaultvar.cboyws:=17;
  vaultvar.cboxps:=11;
  vaultvar.cboyps:=11;
  vaultvar.eqpsel:='null';
  shint:=(sender as tspeedbutton).Hint ;
  cbox.value:=strtoint(leftstr(shint,2));
  cboy.value:=strtoint(rightstr(shint,2));
  vaultvar.tipo:='inv';
  if vaultvar.query<>'normal' then
  begin
    tiposel:=tipocb.text;
    itemsel:=itemcb.text;
    vaultvar.wearto:='';
    lertipo;
    tipocb.text:=tiposel;
    typechange(tipocb.text);
    itemsel:=itemcb.text;
    vaultvar.query:='normal';
  end;
  if (cbox.value=vaultvar.cboxinv) and (cboy.value=vaultvar.cboyinv) then
  begin
    itemadd('inv');
  end;

  vaultvar.cboxinv:=cbox.value;
  vaultvar.cboyinv:=cboy.value;
end;
procedure tVaultForm.CellClickPS(sender:tobject);
var sHint,itemsel,tiposel:string;
begin
  tipocb.text:=tiposel;
  vaultvar.tipoantigo:=tipocb.text;
  rzcombobox1.itemindex:=0;
  rzcombobox1.Visible:=false;
  cboy.Visible:=true;
  cbox.visible:=true;
  xlb.visible:=true;
  ylb.visible:=true;
  vaultvar.eqpsel:='null';
  vaultvar.cboxws:=17;
  vaultvar.cboyws:=17;
  vaultvar.cboxinv:=17;
  vaultvar.cboyinv:=17;
  shint:=(sender as tspeedbutton).Hint ;
  cbox.value:=strtoint(leftstr(shint,2))-9;
  cboy.value:=strtoint(rightstr(shint,2))-9;
  if vaultvar.query<>'normal' then
  begin
    tiposel:=tipocb.text;
    itemsel:=itemcb.text;
    vaultvar.wearto:='';
    vaultvar.tipoantigo:=tipocb.text;
    lertipo;

    typechange(tipocb.text);
    itemsel:=itemcb.text;
    vaultvar.query:='normal';
  end;
  vaultvar.tipo:='ps';
  if (cbox.value=vaultvar.cboxps) and (cboy.value=vaultvar.cboyps) then
  begin
    itemadd('ps');
  end;
  vaultvar.cboxps:=cbox.value;
  vaultvar.cboyps:=cboy.value;

end;
procedure tVaultForm.lblmousedownws(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  vaultvar.currentitem:=midstr((sender as trzpanel).Name,2,4);
end;
procedure TVaultForm.lblMouseDownINV(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  vaultvar.currentitem:=midstr((sender as trzpanel).Name,2,4);
  vaultvar.tipo:='inv';
end;
procedure TVaultForm.lblMouseDownEQP(Sender: TObject; Button: TMouseButton;   Shift: TShiftState; X, Y: Integer);
begin
  vaultvar.currentitem:=midstr((sender as trzpanel).Name,2,4);
  vaultvar.tipo:='eqp';
  vaultvar.tpanelname:=(sender as trzpanel);
end;
procedure TVaultForm.lblMouseDownPS(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  vaultvar.currentitem:=midstr((sender as trzpanel).Name,2,4);
  vaultvar.tipo:='ps';
end;
procedure TVaultForm.lblMouseMovews(Sender: TObject; Shift: TShiftState; X,Y: Integer);
var wsPos:string;
    iName:string;
begin
  wspos:=midstr((sender as trzpanel).Name,2,4);
  iname:=(sender as trzpanel).Caption ;
  rzmemo2.Lines.Clear;
  rzmemo2.Lines.add(iname+': '+vaultvar.awarehouse[vaultvar.vaultnum,strtoint(leftstr(wspos,2)),strtoint(rightstr(wspos,2))]);
end;
procedure TVaultForm.lblMouseMoveINV(Sender: TObject; Shift: TShiftState; X,Y: Integer);
var wsPos:string;
    iName:string;
begin
  wspos:=midstr((sender as trzpanel).Name,2,4);
  iname:=(sender as trzpanel).Caption ;
  rzmemo2.Lines.Clear;
  rzmemo2.Lines.add(iname+': '+vaultvar.invhexa[strtoint(leftstr(wspos,2)),strtoint(rightstr(wspos,2))]);

end;
procedure TVaultForm.lblMouseMoveEQP(Sender: TObject; Shift: TShiftState; X,Y: Integer);
var wsPos:string;
    iName:string;
begin
  wspos:=midstr((sender as trzpanel).Name,2,2);
  iname:=(sender as trzpanel).Caption ;
  rzmemo2.Lines.Clear;
  rzmemo2.Lines.add(iname+': '+vaultvar.eqphexa[strtoint(wspos)]);
end;
procedure TVaultForm.lblMouseMovePS(Sender: TObject; Shift: TShiftState; X,Y: Integer);
var wsPos:string;
    iName:string;
begin
  wspos:=midstr((sender as trzpanel).Name,2,4);
  iname:=(sender as trzpanel).Caption ;
  rzmemo2.Lines.Clear;
  rzmemo2.Lines.add(iname+': '+vaultvar.pshexa[strtoint(leftstr(wspos,2))-9,strtoint(rightstr(wspos,2))-9]);
end;
}
{Fim das procedures Public}


{Outras Proceudures}
procedure tvaultform.itemadd(L:string);
var sthisitem,smain,sopt,sdur,spos15,ancient,sex:string;
    ixy,izj,i,j:integer;
    insProp:itemproperty;
    insOpt:itemoptions;
    lvlaff:byte;
    valor:string;
    tipo:boolean;
    poseqp:byte;
    u2serial:string;
begin
   if trim(itemcb.Text)='' then begin
      application.MessageBox(pchar(VaultError7),Pchar(VaultErrorCaption),mb_ok+mb_iconwarning);
      exit;
   end;
   if checkaserial.Checked then
     begin
       VaultForm.VaultADOQuery2.sql.Clear;
       VaultForm.VaultADOQuery2.sql.add('Update '+gameserverinfo+' set '+itemcount+'='+itemcount+'+1');
       VaultForm.VaultADOQuery2.Execsql;
       VaultForm.VaultADOQuery2.sql.Clear;
       VaultForm.VaultADOQuery2.SQL.Add('select '+itemcount+' from '+gameserverinfo+'');
       VaultForm.VaultADOQuery2.Open;
       for i:=0 to VaultForm.VaultADOQuery2.RecordCount-1 do
       begin
         valor:=inttohex(VaultForm.VaultADOQuery2.Fields[0].asinteger,8);
         VaultForm.VaultADOQuery2.Next;
       end;
       VaultForm.VaultADOQuery2.Close;
     end
       else begin
           if (length(serialedit.text)<8) then begin
             i:=8-length(serialedit.text);
             for j := 1 to i do
               serialedit.text:='0'+serialedit.text;
           end;
           valor:=serialedit.text;
       end;
   
   insprop.Name:=itemcb.Text ;
   insprop.X:=strtoint(lblspace.Caption[pos('x',lblspace.Caption)-1]);
   insprop.y:=strtoint(lblspace.caption[pos('x',lblspace.Caption)+1]);
   itemquery.SQL.Clear;
   itemquery.SQL.Add('select id,unique,x,y,ExcOptionType,unique2 from muitem where name='''+itemcb.Text +'''');
   itemquery.Open ;
   smain:=itemquery.Fields[0].AsString ;
   spos15:=itemquery.Fields[1].AsString ;
   if itemquery.Fields[5].AsString='0' then tipo:=false else tipo:=true;
   itemquery.Close ;
   randomize;
   if checkluck.Checked then ixy:=4 else ixy:=0;
   if (vs)='MG' then
    begin
      if ancientcb.ItemIndex=1 then ancient:='09'+inttostr(random(10))+inttostr(random(10)) else  ancient:='80'+inttostr(random(10))+inttostr(random(10)) ;
    end;
   if ((vs)='MX') then
    begin
      if tipo=true then
        if ancientcb.ItemIndex=1 then ancient:='0085' else  ancient:='0080'
          else if ancientcb.ItemIndex=1 then ancient:='0005' else  ancient:='0000'
    end;
   if vs='CMT' then
     begin
       if tipo=true then u2serial:=inttohex(hextoint('F9')+strtoint(valor[1]+valor[2]),2)
         else u2serial:=inttohex(hextoint('00')+strtoint(valor[1]+valor[2]),2);
       for I := 3 to length(valor) do
         u2serial:=u2serial+valor[i];
       if ancientcb.ItemIndex=0 then ancient:='0000' ;
       if ancientcb.ItemIndex=1 then ancient:=ancientnum5+'00' ;
       if ancientcb.ItemIndex=1 then ancient:=ancientnum6+'00' ;
       if ancientcb.ItemIndex=2 then ancient:=ancientnum10+'00' ;
       if ancientcb.ItemIndex=2 then ancient:=ancientnum11+'00' ;
     end
       else u2serial:=valor;
   if (vs<>'MG') and (vs<>'MX') and (vs<>'CMT')  then ancient:='80'+inttostr(random(10))+inttostr(random(10)) ;

   if opcaotrack.position>=4 then
   begin
    izj:=opcaotrack.position-4;
    if spos15='0' then spos15:='4' else spos15:='C';
   end
     else izj:=opcaotrack.Position;
     
   lvlaff:=leveltrack.Position;
   sopt:=inttohex(128*abs(strtoint(booltostr(checkskill.checked)))+ixy+izj+8*lvlaff,2);
   sdur:=inttohex(rzspinner1.value ,2);
   sex:=inttohex(eo1.Tag+eo2.Tag+eo3.Tag+eo4.Tag+eo5.Tag+eo6.Tag,2);
   if sex[1]='0' then sex:=sex[2];
   if length(sex)=2 then begin
      spos15:=getpos15(spos15,sex[1]);
      sex:=sex[2];

   end;

   insopt:=getitemoption(sopt,sdur,spos15+sex,ancient,u2serial,itemcb.Text);
   sthisitem:=smain+sopt+sdur+u2serial+spos15+sex+ancient;
   if length(sthisitem)<itemhexcount then
     for i := length(sthisitem)+1 to itemhexcount do
       if i>=3 then sthisitem:=sthisitem+'0'
         else sthisitem:=sthisitem+'F';
   if l='ws' then
   begin
     VaultForm.Image2.Picture.LoadFromFile(ExtractFilePath(Application.ExeName)+'CMT Data\VaultImages\Item.bmp');
     if intowsgrid((cbox.value )-1,(cboy.value )-1,insprop,insopt) then
       vaultvar.awarehouse[vaultvar.vaultnum,(cbox.value)-1,(cboy.value )-1]:=sthisitem;
   end;
   if l='inv' then
   begin
     if intoinvgrid(cbox.value -1,cboy.value -1,insprop,insopt) then
       vaultvar.InvHexa[cbox.value-1,cboy.value-1]:=sthisitem;
   end;
   if l='eqp' then
   begin
     if vaultvar.xhint=WeaponLeft then poseqp:=0;
     if vaultvar.xhint=WeaponRight then poseqp:=1;
     if vaultvar.xhint=Helm then poseqp:=2;
     if vaultvar.xhint=Armor then poseqp:=3;
     if vaultvar.xhint=Pants then poseqp:=4;
     if vaultvar.xhint=Gloves then poseqp:=5;
     if vaultvar.xhint=Boots then poseqp:=6;
     if vaultvar.xhint=Wings then poseqp:=7;
     if vaultvar.xhint=Pet then poseqp:=8;
     if vaultvar.xhint=Pendants then poseqp:=9;
     if vaultvar.xhint=RingLeft then poseqp:=10;
     if vaultvar.xhint=RingRight then poseqp:=11;
     if intoeqpgrid(poseqp,insprop,insopt) then
       vaultvar.eqphexa[poseqp]:=sthisitem;
   end;
   if l='ps' then
   begin
     if intopsgrid(cbox.value -1,cboy.value -1,insprop,insopt) then
       vaultvar.PSHexa[cbox.value-1,cboy.value -1]:=sthisitem;
     serialedit.Text:=inttohex(hextoint(valor)+1,8);
   end;
   serialedit.Text:=inttohex(hextoint(valor)+1,8);
end;
procedure TVaultForm.lertipo; {Ler tipo que deve aparecer quando selecionar um espaço no EQP}
var any:string;
i:integer;
begin
  vaultvar.tipoantigo:=tipocb.text;
  any:='any';
  tipocb.Items.Clear;
  itemquery.SQL.clear;
  if vaultvar.wearto<>'' then itemquery.SQL.Add('select distinct type from muitem where '+vaultvar.wearto+' or wearto='''+any+''' ')
    else itemquery.SQL.Add('select distinct type from muitem');
  itemquery.Open;
  while not itemquery.Eof do
    begin
      tipocb.Items.Add(itemquery.Fields[0].asstring);
      itemquery.Next;
    end;
  itemquery.Close;

  tipocb.ItemIndex:=0;
  for i:=0 to tipocb.Items.count-1 do
    if tipocb.Items[i]=vaultvar.tipoantigo then tipocb.ItemIndex:=i;

  typechange(tipocb.Text );
  vaultform.Update;
end;
procedure TVaultForm.RzComboBox1Change(Sender: TObject);
var affname: array[0..12] of string;
begin
  affname[0]:='OL';
  affname[1]:='OR';
  affname[2]:='OB';
  affname[3]:='TR';
  affname[4]:='helm';
  affname[5]:='armor';
  affname[6]:='pants';
  affname[7]:='gloves';
  affname[8]:='boots';
  affname[9]:='wings';
  affname[10]:='guardian';
  affname[11]:='pendant';
  affname[12]:='rings';
  if RzComboBox1.itemindex=0 then vaultvar.wearto:='wearto='''+affname[0]+''' or wearto='''+affname[2]+''' or wearto='''+affname[3]+'''';
  if RzComboBox1.itemindex=1 then vaultvar.wearto:='wearto='''+affname[1]+''' or wearto='''+affname[2]+''' or wearto='''+affname[3]+'''';
  if RzComboBox1.itemindex=2 then vaultvar.wearto:='wearto='''+affname[4]+'''';
  if RzComboBox1.itemindex=3 then vaultvar.wearto:='wearto='''+affname[5]+'''';
  if RzComboBox1.itemindex=4 then vaultvar.wearto:='wearto='''+affname[6]+'''';
  if RzComboBox1.itemindex=5 then vaultvar.wearto:='wearto='''+affname[7]+'''';
  if RzComboBox1.itemindex=6 then vaultvar.wearto:='wearto='''+affname[8]+'''';
  if RzComboBox1.itemindex=7 then vaultvar.wearto:='wearto='''+affname[9]+'''';
  if RzComboBox1.itemindex=8 then vaultvar.wearto:='wearto='''+affname[10]+'''';
  if RzComboBox1.itemindex=9 then vaultvar.wearto:='wearto='''+affname[11]+'''';
  if (RzComboBox1.itemindex=10) or (RzComboBox1.itemindex=11)  then vaultvar.wearto:='wearto='''+affname[12]+'''';
  lertipo;
end;
procedure TVaultForm.RzTabControl1Change(Sender: TObject);
var
  s,g:string;
  i,z,j: Integer;
  f:tfield;
begin
  if vaultvar.vaultuse=true then
  begin
    screen.Cursor:=-11;
    application.ProcessMessages;
    try
      VaultForm.VaultADOQuery2.SQL.Clear;
      s:=rightstr(rztabcontrol1.Tabs[rztabcontrol1.tabindex].caption,2);
      vaultvar.multivaults[vaultvar.vaultnum].zen:=zenedit.text;
      if s<>'lt' then
      begin
        vaultvar.vaultnum:=strtoint(s);
        if vaultvar.multivaults[vaultvar.vaultnum].edit=false then
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
              vaultvar.awarehouse[vaultvar.vaultnum,i,j]:='FF';
              g:=g+'FF';
              for z := 1 to itemhexcount do
              begin
                vaultvar.awarehouse[vaultvar.vaultnum,i,j]:=vaultvar.awarehouse[vaultvar.vaultnum,i,j]+'0';
                g:=g+'0';
              end;
            end;
            VaultForm.VaultADOQuery2.SQL.clear;
            VaultForm.VaultADOQuery2.SQL.Add('Update '+multivaulttable+' set '+multivaultitems+'='+g+' where '+multivaultID+'='''+accountsel+''' and '+multivaultnum+'='+s+'');
            VaultForm.VaultADOQuery2.execsql;
          end else VaultForm.VaultADOQuery2.Close;
        end;
      end else vaultvar.vaultnum:=0;
      if vaultvar.multivaults[vaultvar.vaultnum].edit=false then
      begin
        VaultForm.VaultADOQuery2.SQL.clear;
        if s='lt' then
          VaultForm.VaultADOQuery2.SQL.Add('select '+Money+','+Items+' from '+warehouse+' where '+AccountID2+'='''+accountsel+'''')
            else VaultForm.VaultADOQuery2.SQL.Add('select '+MultivaultMoney+','+MultivaultItems+' from '+Multivaulttable+' where '+MultivaultID+'='''+accountsel+''' and '+Multivaultnum+'='+s+'');
        VaultForm.VaultADOQuery2.Open ;
        if (VaultForm.VaultADOQuery2.Eof) and (VaultForm.VaultADOQuery2.Bof) then
        begin
          application.MessageBox(pchar(VaultError5),Pchar(VaultErrorCaption),mb_ok+mb_iconerror);
          screen.Cursor:=0;
          VaultForm.VaultADOQuery2.Close;
          exit;
        end;
        resetws(false);
        fillhexws(VaultForm.VaultADOQuery2.Fields[1],itemhexcount);
        vaultvar.multivaults[vaultvar.vaultnum].zen:=VaultForm.VaultADOQuery2.Fields[0].AsString ;
        VaultForm.VaultADOQuery2.Close;
      end else
        begin
          resetws(false);
          fillhexws(f,itemhexcount);
        end;
      vaultvar.multivaults[vaultvar.vaultnum].edit:=true;
      zenedit.Text :=vaultvar.multivaults[vaultvar.vaultnum].zen ;
    finally
      screen.Cursor:=0;
    end;
  end;
  if vaultvar.vaultuse=false then
  begin
    i:=0;
    if (vaultvar.groupvisible='inv') and (i=0) then
    begin
      vaultvar.groupvisible:='ps';
      rzcombobox1.Visible:=false;
      cboy.Visible:=true;
      cbox.visible:=true;
      xlb.visible:=true;
      ylb.visible:=true;
      vaultvar.cboxinv:=17;
      vaultvar.cboyinv:=17;
      vaultvar.cboxps:=11;
      vaultvar.cboyps:=11;
      vaultvar.eqpsel:='null';
      vaultvar.tipo:='ps';
      i:=1;
    end;
    if (vaultvar.groupvisible='ps') and (i=0) then
    begin
      vaultvar.groupvisible:='inv';
      rzcombobox1.Visible:=false;
      cboy.Visible:=true;
      cbox.visible:=true;
      xlb.visible:=true;
      ylb.visible:=true;
      vaultvar.cboxinv:=17;
      vaultvar.cboyinv:=17;
      vaultvar.cboxps:=11;
      vaultvar.cboyps:=11;
      vaultvar.eqpsel:='null';
      vaultvar.tipo:='inv';
      i:=1;
    end;
  end;
end;
procedure TVaultForm.SaveVaultBClick(Sender: TObject);
begin
 if application.MessageBox(pchar(VaultQuestion3),pchar(programname),mb_yesno+mb_iconquestion)=id_no then exit;
  if warehousecommit then
  begin
    application.MessageBox(pchar(VaultConfirm1),pchar(programname),mb_ok+mb_iconinformation);
    vaultform.Close;
  end else
    application.MessageBox(pchar(VaultError8),Pchar(VaultErrorCaption),mb_ok+mb_iconwarning);

end;
procedure TVaultForm.EO1Click(Sender: TObject);
begin
  with (sender as TRzcheckbox) do
     if (name<>'jn') and (name<>'xy') then
       if checked then tag:=gettag(strtoint(name[3])) else tag:=0;
end;
procedure TVaultForm.ApagarBClick(Sender: TObject);
begin
  if vaultvar.vaultuse=true then
  begin
    if application.MessageBox(pchar(VaultQuestion1),pchar(programname),mb_yesno+mb_iconwarning)=idno then exit;
    resetws(true);
  end;
  if vaultvar.vaultuse=false then
  begin
    if application.MessageBox(pchar(VaultQuestion5),pchar(programname),mb_yesno+mb_iconwarning)=idno then exit;
    resetinv;
  end;

end;
{Fim de Outras Proceudures}


{Procedure Iniciar}


procedure TVaultForm.Iniciar;
var s:string;
i,t,j:integer;
begin
  
  VaultForm.VaultADOQuery1.ConnectionString:='Provider=MSDASQL.1;Password='+memupwd+';Persist Security Info=True;User ID='+memuid+';Data Source='+memudsn+';Initial Catalog='+mecatalog;
  VaultForm.VaultADOQuery2.ConnectionString:='Provider=MSDASQL.1;Password='+mupwd+';Persist Security Info=True;User ID='+muid+';Data Source='+mudsn+';Initial Catalog='+catalog;
  ConfigEqpCells;
  ResetConfig;
  vaultvar.opr:=4;
  itemquery.ConnectionString:='Provider=Microsoft.Jet.OLEDB.4.0;Data Source='+ExtractFilePath(Application.ExeName)+'\CMT Data\muitem.mdb'+';Mode=ReadWrite;Persist Security Info=False';
  {Add Tipos no TipoCB}
  itemquery.close;
  itemquery.sql.clear;
  itemquery.SQL.Add('select distinct type from muitem');
  itemquery.Open;
  while not itemquery.Eof do begin
    tipocb.Items.Add(itemquery.Fields[0].asstring);
    itemquery.Next;
  end;
  itemquery.Close;
  tipocb.ItemIndex:=0;
  typechange(tipocb.Text );
  lerexc;
  if Versao='CMT' then
    begin
      AncientCB.Visible:=true;
      AncientCB.Items.Clear;
      AncientCB.Items.add('Normal');
      AncientCB.Items.add('Ancient5');
      AncientCB.Items.add('Ancient5+Stamina');
      AncientCB.Items.add('Ancient10');
      AncientCB.Items.add('Ancient10+Stamina');
      AncientCB.ItemIndex:=0;
    end
      else
        begin
           AncientCB.Visible:=true;
           AncientCB.Items.Clear;
           AncientCB.Items.add('Normal');
           AncientCB.Items.add('Ancient');
           AncientCB.ItemIndex:=0;
        end;
  if vaultvar.vaultuse=true then
  begin
    try
      resetws(true);
    except

    end;
    initws;

    {Ler Vault da Account}
    screen.Cursor:=-11;
    application.ProcessMessages;
    try
      VaultForm.VaultADOQuery2.SQL.Clear;
      VaultForm.VaultADOQuery2.SQL.Add('select '+Money+','+Items+' from '+warehouse+' where '+AccountID2+'='''+accountsel+'''');
      VaultForm.VaultADOQuery2.Open ;
      if (VaultForm.VaultADOQuery2.Eof) and (VaultForm.VaultADOQuery2.Bof) then
      begin
        application.MessageBox(pchar(VaultError5),Pchar(VaultErrorCaption),mb_ok+mb_iconerror);
        screen.Cursor:=0;
        VaultForm.VaultADOQuery2.Close;
        exit;
        vaultform.Close;
      end;
      resetws(true);
      fillhexws(VaultForm.VaultADOQuery2.Fields[1],itemhexcount);
      vaultvar.vaultnum:=0;
      vaultvar.multivaults[vaultvar.vaultnum].zen:=VaultForm.VaultADOQuery2.Fields[0].AsString ;
      zenedit.Text :=VaultForm.VaultADOQuery2.Fields[0].AsString ;
      VaultForm.VaultADOQuery2.Close;
    finally
      screen.Cursor:=0;
    end;
  end;
  if vaultvar.vaultuse=false then
  begin
    try
      resetinv;
    except

    end;
    initinv;
    vaultvar.InvName[0]:=WeaponLeft;
    vaultvar.InvName[1]:=WeaponRight;
    vaultvar.InvName[2]:=Helm;
    vaultvar.InvName[3]:=Armor;
    vaultvar.InvName[4]:=Pants;
    vaultvar.InvName[5]:=Gloves;
    vaultvar.InvName[6]:=Boots;
    vaultvar.InvName[7]:=Wings;
    vaultvar.InvName[8]:=Pet;
    vaultvar.InvName[9]:=Pendants;
    vaultvar.InvName[10]:=RingLeft;
    vaultvar.InvName[11]:=RingRight ;
    rzcombobox1.Items.Clear;
    rzcombobox1.Items.Add(WeaponLeft);
    rzcombobox1.Items.Add(WeaponRight);
    rzcombobox1.Items.Add(Helm);
    rzcombobox1.Items.Add(Armor);
    rzcombobox1.Items.Add(Pants);
    rzcombobox1.Items.Add(Gloves);
    rzcombobox1.Items.Add(Boots);
    rzcombobox1.Items.Add(Wings);
    rzcombobox1.Items.Add(Pet);
    rzcombobox1.Items.Add(Pendants);
    rzcombobox1.Items.Add(RingLeft);
    rzcombobox1.Items.Add(RingRight);

    if shopitem='' then
      vaultvar.pson:=false
        else vaultvar.pson:=true;
    if shopitem=inventory then vaultvar.psind:=false
      else vaultvar.psind:=true;
    if vaultvar.pson=true then vaultform.RzTabControl1.Tabs.Add.Caption:='Personal Store';
    VaultForm.VaultADOQuery2.Close;
    VaultForm.VaultADOQuery2.sql.clear;
    VaultForm.VaultADOQuery2.SQL.Add('select '+inventory+' from '+character+'');
    VaultForm.VaultADOQuery2.open;
    vaultvar.tamanho:=(VaultForm.VaultADOQuery2.Fields[0].Size);
    VaultForm.VaultADOQuery2.Close;

    screen.Cursor:=-11;
    application.ProcessMessages;
    try
      //ResetInv;
      s:='0x';
        for I := 0 to 11 do
        for j := 1 to itemhexcount do
          s:=s+'0';
        for I := 0 to 7 do
        for t := 0 to 7 do
        for j := 1 to itemhexcount do
          s:=s+'0';
        if (vaultvar.pson=true) and (vaultvar.psind=false) then
          for I := 0 to 3 do
          for t := 0 to 7 do
          for j := 1 to itemhexcount do
            s:=s+'0';
      VaultForm.VaultADOQuery2.SQL.clear;
      VaultForm.VaultADOQuery2.SQL.Add('select '+cname+' from '+character+' where '+cname+'='''+charactersel+''' and '+inventory+'='+s+'' );
      VaultForm.VaultADOQuery2.Open;
      if not ((VaultForm.VaultADOQuery2.Eof) and (VaultForm.VaultADOQuery2.Bof)) then
      begin
        VaultForm.VaultADOQuery2.Close;
        VaultForm.VaultADOQuery2.SQL.clear;
        s:='0x';
        for I := 0 to 11 do
        for j := 1 to itemhexcount do
          if j>=3 then s:=s+'0'
            else s:=s+'F';
        for I := 0 to 7 do
        for t := 0 to 7 do
        for j := 1 to itemhexcount do
          if j>=3 then s:=s+'0'
            else s:=s+'F';
        if (vaultvar.pson=true) and (vaultvar.psind=false) then
          for I := 0 to 3 do
          for t := 0 to 7 do
          for j := 1 to itemhexcount do
            if j>=3 then s:=s+'0'
            else s:=s+'F';
        VaultForm.VaultADOQuery2.SQL.Add('Update '+character+' set '+inventory+'='+s+' where '+cname+'='''+charactersel+'''');
        VaultForm.VaultADOQuery2.execsql;
      end else VaultForm.VaultADOQuery2.Close;
      VaultForm.VaultADOQuery2.SQL.Clear;
      VaultForm.VaultADOQuery2.SQL.Add('select '+inventory+' from '+Character+' where '+cname+'='''+charactersel+'''');
      VaultForm.VaultADOQuery2.Open ;
      if (VaultForm.VaultADOQuery2.Eof) and (VaultForm.VaultADOQuery2.Bof) then
      begin
        application.MessageBox(pchar(VaultError5),Pchar(VaultErrorCaption),mb_ok+mb_iconerror);
        screen.Cursor:=0;
        exit;
      end;

      fillhexinv(VaultForm.VaultADOQuery2.Fields[0],itemhexcount);
      VaultForm.VaultADOQuery2.Close;

      if (vaultvar.psind=true) and (vaultvar.pson=true) then
      begin
        VaultForm.VaultADOQuery2.SQL.Clear;
        VaultForm.VaultADOQuery2.SQL.Add('select '+shopitem+' from '+Character+' where '+cname+'='''+charactersel+'''');
        VaultForm.VaultADOQuery2.Open ;
        if (VaultForm.VaultADOQuery2.Eof) and (VaultForm.VaultADOQuery2.Bof) then
        begin
          application.MessageBox(pchar(VaultError5),Pchar(VaultErrorCaption),mb_ok+mb_iconerror);
          screen.Cursor:=0;
          exit;
        end;
        fillhexps(VaultForm.VaultADOQuery2.Fields[0],itemhexcount);
        VaultForm.VaultADOQuery2.Close;
      end;
    finally
      screen.Cursor:=0;
    end;
  end;

end;
{Fim da Procedure Iniciar}


end.




