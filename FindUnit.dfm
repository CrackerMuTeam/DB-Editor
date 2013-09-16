object FindForm: TFindForm
  Left = 0
  Top = 0
  BorderStyle = bsToolWindow
  Caption = 'FindForm'
  ClientHeight = 302
  ClientWidth = 178
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 13
  object RzGroupBox1: TRzGroupBox
    Left = 8
    Top = 8
    Width = 161
    Height = 49
    Caption = 'Procurar'
    TabOrder = 0
    object RzEdit1: TRzEdit
      Left = 8
      Top = 18
      Width = 145
      Height = 21
      MaxLength = 10
      TabOrder = 0
      OnChange = RzEdit1Change
    end
  end
  object RzGroupBox2: TRzGroupBox
    Left = 9
    Top = 63
    Width = 161
    Height = 202
    Caption = 'Results'
    TabOrder = 1
    object RzListBox1: TRzListBox
      Left = 7
      Top = 16
      Width = 145
      Height = 177
      ItemHeight = 13
      PopupMenu = PopupActionBar1
      TabOrder = 0
      OnDblClick = RzListBox1DblClick
    end
  end
  object RzBitBtn1: TRzBitBtn
    Left = 8
    Top = 271
    Caption = 'Ok'
    TabOrder = 2
    OnClick = RzBitBtn1Click
  end
  object RzBitBtn2: TRzBitBtn
    Left = 95
    Top = 271
    Caption = 'Cancel'
    TabOrder = 3
    OnClick = RzBitBtn2Click
  end
  object ListBox2: TListBox
    Left = 68
    Top = 133
    Width = 78
    Height = 113
    ItemHeight = 13
    TabOrder = 4
    Visible = False
  end
  object PopupActionBar1: TPopupActionBar
    Left = 128
    Top = 152
    object Remover1: TMenuItem
      Caption = 'Remover'
    end
    object Info1: TMenuItem
      Caption = 'Info'
    end
  end
  object FindADOQuery2: TADOQuery
    Parameters = <>
    Left = 57
    Top = 80
  end
  object FindADOQuery1: TADOQuery
    Parameters = <>
    Left = 57
    Top = 48
  end
end
