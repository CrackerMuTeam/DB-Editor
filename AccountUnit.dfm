object AccountForm: TAccountForm
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Form1'
  ClientHeight = 312
  ClientWidth = 319
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 13
  object RzGroupBox1: TRzGroupBox
    Left = 8
    Top = -1
    Width = 305
    Height = 217
    Align = alCustom
    TabOrder = 0
    object RzLabel1: TRzLabel
      Left = 16
      Top = 24
      Width = 62
      Height = 13
      Caption = 'AccountID:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object RzLabel2: TRzLabel
      Left = 16
      Top = 70
      Width = 57
      Height = 13
      Caption = 'Password:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object RzLabel3: TRzLabel
      Left = 16
      Top = 118
      Width = 31
      Height = 13
      Caption = 'Name:'
    end
    object RzLabel4: TRzLabel
      Left = 168
      Top = 24
      Width = 81
      Height = 13
      Caption = 'Secret Question:'
    end
    object RzLabel5: TRzLabel
      Left = 168
      Top = 70
      Width = 74
      Height = 13
      Caption = 'Secret Answer:'
    end
    object RzLabel6: TRzLabel
      Left = 168
      Top = 118
      Width = 32
      Height = 13
      Caption = 'E-Mail:'
    end
    object RzLabel7: TRzLabel
      Left = 168
      Top = 166
      Width = 68
      Height = 13
      Caption = 'Personal ID:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object RzEdit1: TRzEdit
      Left = 16
      Top = 43
      Width = 121
      Height = 21
      MaxLength = 10
      TabOrder = 0
    end
    object RzEdit2: TRzEdit
      Left = 16
      Top = 89
      Width = 121
      Height = 21
      MaxLength = 10
      TabOrder = 1
    end
    object RzEdit3: TRzEdit
      Left = 16
      Top = 137
      Width = 121
      Height = 21
      MaxLength = 10
      TabOrder = 2
    end
    object RzEdit4: TRzEdit
      Left = 168
      Top = 43
      Width = 121
      Height = 21
      MaxLength = 50
      TabOrder = 3
    end
    object RzEdit5: TRzEdit
      Left = 168
      Top = 89
      Width = 121
      Height = 21
      MaxLength = 50
      TabOrder = 4
    end
    object RzEdit6: TRzEdit
      Left = 168
      Top = 137
      Width = 121
      Height = 21
      MaxLength = 50
      TabOrder = 5
    end
    object RzEdit7: TRzEdit
      Left = 168
      Top = 185
      Width = 121
      Height = 21
      MaxLength = 13
      TabOrder = 6
    end
  end
  object RzGroupBox2: TRzGroupBox
    Left = 8
    Top = 221
    Width = 305
    Height = 83
    TabOrder = 1
    object RzLabel8: TRzLabel
      Left = 16
      Top = 20
      Width = 136
      Height = 13
      Caption = 'Encriptation Status: Enabled'
    end
    object RzLabel9: TRzLabel
      Left = 16
      Top = 52
      Width = 130
      Height = 13
      Caption = 'Editando Account: Account'
    end
    object RzBitBtn1: TRzBitBtn
      Left = 214
      Top = 15
      Caption = 'Ok'
      TabOrder = 0
      OnClick = RzBitBtn1Click
    end
    object RzBitBtn2: TRzBitBtn
      Left = 214
      Top = 46
      Caption = 'Cancelar'
      TabOrder = 1
      OnClick = RzBitBtn2Click
    end
  end
  object AccountADOQuery1: TADOQuery
    Parameters = <>
    Left = 25
    Top = 168
  end
  object AccountADOQuery2: TADOQuery
    Parameters = <>
    Left = 65
    Top = 168
  end
end
