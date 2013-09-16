unit FindUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, RzButton, StdCtrls, RzLstBox, Mask, RzEdit, RzLabel, ExtCtrls,
  RzPanel, Menus, ActnPopup, DB, ADODB, Globalvar;

type
  TFindForm = class(TForm)
    RzGroupBox1: TRzGroupBox;
    RzGroupBox2: TRzGroupBox;
    RzEdit1: TRzEdit;
    RzListBox1: TRzListBox;
    RzBitBtn1: TRzBitBtn;
    RzBitBtn2: TRzBitBtn;
    PopupActionBar1: TPopupActionBar;
    Remover1: TMenuItem;
    Info1: TMenuItem;
    FindADOQuery2: TADOQuery;
    FindADOQuery1: TADOQuery;
    ListBox2: TListBox;
    procedure Selecionar;
    procedure Iniciar(col, col2, tab, arq:string;a1:boolean);
    procedure Procurar(texto:string);
    procedure RzEdit1Change(Sender: TObject);
    procedure RzBitBtn2Click(Sender: TObject);
    procedure RzBitBtn1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure RzListBox1DblClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FindForm: TFindForm;
  Ado1:boolean;
  coluna,tabela,coluna2,Arquivo:string;
implementation
uses MainUnit;
{$R *.dfm}

procedure TFindForm.Procurar(texto:string);
var
  i , j : integer;
  b : boolean;
begin
  if Ado1=True then
  begin
    Findform.RzListBox1.Items.Clear;
    Findform.FindADOQuery1.SQL.clear;
    Findform.FindADOQuery1.SQL.Add('Select '+Coluna+' from '+Tabela+' where '+Coluna+' like '''+texto+'%''');
    Findform.FindADOQuery1.Open;
    for i := 0 to Findform.FindADOQuery1.RecordCount-1 do
    begin
      b:=false;
      for j := 0 to Findform.ListBox2.items.Count - 1 do
        if Findform.FindADOQuery1.Fields[0].AsString=Findform.ListBox2.Items[j] then
          b:=true;
      if b=true then
        Findform.RzListBox1.Items.add(Findform.FindADOQuery1.Fields[0].AsString);
      Findform.FindADOQuery1.Next;
    end;
    Findform.FindADOQuery1.close;
  end;
  if Ado1=False then
  begin
    Findform.RzListBox1.Items.Clear;
    Findform.FindADOQuery2.SQL.clear;
    Findform.FindADOQuery2.SQL.Add('Select '+Coluna+' from '+Tabela+' where '+Coluna+' like '''+texto+'%''');
    Findform.FindADOQuery2.Open;
    for i := 0 to Findform.FindADOQuery2.RecordCount-1 do
    begin
      b:=false;
      for j := 0 to Findform.ListBox2.items.Count - 1 do
        if Findform.FindADOQuery2.Fields[0].AsString=Findform.ListBox2.Items[j] then
          b:=true;
      if b=true then
        Findform.RzListBox1.Items.add(Findform.FindADOQuery2.Fields[0].AsString);
      Findform.FindADOQuery2.Next;
    end;
    Findform.FindADOQuery2.close;
  end;
end;

procedure TFindform.Selecionar;
var
  i : integer;
  s : string;
begin
  if (Ado1=true) and (FindForm.RzListBox1.Itemindex<>-1) then
  begin
    for i := 0 to Mainform.RzComboBox1.Items.Count - 1 do
      if Mainform.RzComboBox1.Items[i]=FindForm.RzListBox1.Items[FindForm.RzListBox1.itemindex] then
        Mainform.RzComboBox1.ItemIndex:=i;
    Mainform.SelecionarAccount;
  end;
  if (Ado1=false) and (FindForm.RzListBox1.Itemindex<>-1) then
  begin
    Findform.FindADOQuery2.SQL.Clear;
    Findform.FindADOQuery2.SQL.Add('Select '+coluna2+' from '+tabela+' where '+coluna+'='''+FindForm.RzListBox1.Items[FindForm.RzListBox1.itemindex]+'''');
    Findform.FindADOQuery2.Open;
    s:=Findform.FindADOQuery2.Fields[0].AsString;
    Findform.FindADOQuery2.Close;
    for i := 0 to Mainform.RzComboBox1.Items.Count - 1 do
      if Mainform.RzComboBox1.Items[i]=s then
        Mainform.RzComboBox1.ItemIndex:=i;
    Mainform.SelecionarAccount;
    for i := 0 to Mainform.RzComboBox2.Items.Count - 1 do
      if Mainform.RzComboBox2.Items[i]=FindForm.RzListBox1.Items[FindForm.RzListBox1.itemindex] then
        Mainform.RzComboBox2.ItemIndex:=i;
  end;
end;

procedure TFindForm.RzBitBtn1Click(Sender: TObject);
begin
  FindForm.Selecionar;
  FindForm.Close;
end;

procedure TFindForm.RzBitBtn2Click(Sender: TObject);
begin
  FindForm.Close;
end;

procedure TFindForm.RzEdit1Change(Sender: TObject);
begin
  Procurar(FindForm.RzEdit1.Text);
end;

procedure TFindForm.RzListBox1DblClick(Sender: TObject);
begin
  Selecionar;
end;

procedure TFindForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  mainform.Enabled:=true;
  FindForm.FreeOnRelease;
end;

procedure TFindForm.Iniciar(col, col2 ,tab,arq:string;a1:boolean);
var
  i:integer;
  filename : string;
  f : textfile;
  ch : char;
  esc: boolean;
  g:string;
  s:array[1..1000] of string;
  j:integer;
begin
  Findform.FindADOQuery1.ConnectionString:='Provider=MSDASQL.1;Password='+memupwd+';Persist Security Info=True;User ID='+memuid+';Data Source='+memudsn+';Initial Catalog='+mecatalog;
  Findform.FindADOQuery2.ConnectionString:='Provider=MSDASQL.1;Password='+mupwd+';Persist Security Info=True;User ID='+muid+';Data Source='+mudsn+';Initial Catalog='+catalog;
  Findform.RzEdit1.Text:='';
  Findform.RzListBox1.Items.Clear;
  coluna:=col;
  coluna2:=col2;
  tabela:=tab;
  arquivo:=arq;
  Ado1:=a1;
  Findform.ListBox2.Items.Clear;
  if (arq='') and (ado1=true) then
  begin
    Findform.FindADOQuery1.SQL.Clear;
    Findform.FindADOQuery1.SQL.Add('Select '+coluna+' from '+tabela);
    Findform.FindADOQuery1.Open;
    while not(Findform.FindADOQuery1.Eof) do
    begin
      Findform.ListBox2.Items.Add(Findform.FindADOQuery1.Fields[0].AsString);
      Findform.FindADOQuery1.Next;
    end;
    Findform.FindADOQuery1.Close;
  end;
  if (arq='') and (ado1=false) then
  begin
    Findform.FindADOQuery2.SQL.Clear;
    Findform.FindADOQuery2.SQL.Add('Select '+coluna+' from '+tabela);
    Findform.FindADOQuery2.Open;
    while not(Findform.FindADOQuery2.Eof) do
    begin
      Findform.ListBox2.Items.Add(Findform.FindADOQuery2.Fields[0].AsString);
      Findform.FindADOQuery2.Next;
    end;
    Findform.FindADOQuery2.Close;
  end;
  if (arq<>'') then
  begin
    if fileexists(arq) then
    begin
      filename:=ExtractFilePath(Application.ExeName)+arq;
      assignfile(F,filename);
      reset(F);
      i:=0;
      while not eof(F) do  begin
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
      for i:=1 to j do
        Findform.ListBox2.Items.add(s[i]);
      closefile(f);
    end;
  end;
  procurar(Findform.RzEdit1.Text);
end;

end.
