object MainForm: TMainForm
  Left = 0
  Top = 0
  Caption = 'Form1'
  ClientHeight = 317
  ClientWidth = 461
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object RzGroupBox1: TRzGroupBox
    Left = 8
    Top = 8
    Width = 339
    Height = 89
    Caption = 'Account'
    ParentShowHint = False
    ShowHint = True
    TabOrder = 0
    object RzLabel1: TRzLabel
      Left = 8
      Top = 16
      Width = 43
      Height = 13
      Caption = 'Account:'
    end
    object RzComboBox1: TRzComboBox
      Left = 8
      Top = 30
      Width = 145
      Height = 21
      AllowEdit = False
      Style = csDropDownList
      ItemHeight = 13
      TabOrder = 0
      OnChange = RzComboBox1Change
    end
    object RzBitBtn4: TRzBitBtn
      Left = 99
      Top = 57
      Width = 25
      Caption = 'W'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 1
      OnClick = RzBitBtn4Click
    end
  end
  object RzGroupBox2: TRzGroupBox
    Left = 6
    Top = 103
    Width = 339
    Height = 90
    Caption = 'Character'
    ParentShowHint = False
    ShowHint = True
    TabOrder = 1
    object RzLabel2: TRzLabel
      Left = 8
      Top = 16
      Width = 52
      Height = 13
      Caption = 'Character:'
    end
    object RzComboBox2: TRzComboBox
      Left = 8
      Top = 30
      Width = 145
      Height = 21
      AllowEdit = False
      Style = csDropDownList
      ItemHeight = 13
      TabOrder = 0
    end
    object RzBitBtn11: TRzBitBtn
      Left = 101
      Top = 57
      Width = 25
      Caption = 'I'
      TabOrder = 1
    end
    object RzBitBtn15: TRzBitBtn
      Left = 132
      Top = 57
      Width = 25
      Caption = 'M'
      TabOrder = 2
    end
  end
  object MainADOQuery1: TADOQuery
    Parameters = <>
    Left = 65
    Top = 80
  end
  object MainADOQuery2: TADOQuery
    Parameters = <>
    Left = 65
    Top = 112
  end
end
