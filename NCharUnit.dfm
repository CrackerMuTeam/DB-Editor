object NCharForm: TNCharForm
  Left = 0
  Top = 0
  BorderStyle = bsToolWindow
  Caption = 'New Character'
  ClientHeight = 174
  ClientWidth = 338
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
    Width = 162
    Height = 49
    Caption = 'Name'
    TabOrder = 0
    object RzEdit1: TRzEdit
      Left = 8
      Top = 16
      Width = 145
      Height = 21
      MaxLength = 10
      TabOrder = 0
    end
  end
  object RzGroupBox2: TRzGroupBox
    Left = 8
    Top = 63
    Width = 162
    Height = 106
    Caption = 'Class'
    TabOrder = 1
    object RzLabel1: TRzLabel
      Left = 8
      Top = 32
      Width = 29
      Height = 13
      Caption = 'Class:'
    end
    object RzComboBox1: TRzComboBox
      Left = 8
      Top = 47
      Width = 145
      Height = 21
      ItemHeight = 13
      TabOrder = 0
      Items.Strings = (
        '0-Dark Wizard'
        '1-Soul Master'
        '16-Dark Knight'
        '17-Blade Knight'
        '32-Elf'
        '33-Muse Elf'
        '48-Magic Gladiator'
        '64-Dark Lord')
    end
    object RzComboBox2: TRzComboBox
      Left = 8
      Top = 66
      Width = 145
      Height = 21
      ItemHeight = 13
      TabOrder = 1
      Visible = False
      Items.Strings = (
        '0-Dark Wizard'
        '1-Soul Master'
        '16-Dark Knight'
        '17-Blade Knight'
        '32-Elf'
        '33-Muse Elf'
        '48-Magic Gladiator'
        '64-Dark Lord')
    end
  end
  object RzGroupBox3: TRzGroupBox
    Left = 176
    Top = 8
    Width = 155
    Height = 161
    TabOrder = 2
    object RzBitBtn1: TRzBitBtn
      Left = 16
      Top = 24
      Width = 121
      Height = 39
      Caption = 'Create Charater'
      TabOrder = 0
      OnClick = RzBitBtn1Click
    end
    object RzBitBtn2: TRzBitBtn
      Left = 16
      Top = 68
      Width = 121
      Height = 39
      Caption = 'Create Charater And Edit'
      TabOrder = 1
      OnClick = RzBitBtn2Click
    end
    object RzBitBtn3: TRzBitBtn
      Left = 16
      Top = 113
      Width = 121
      Height = 39
      Caption = 'Cancel'
      TabOrder = 2
      OnClick = RzBitBtn3Click
    end
  end
  object NCharADOQuery1: TADOQuery
    Parameters = <>
    Left = 113
    Top = 104
  end
  object NCharADOQuery2: TADOQuery
    Parameters = <>
    Left = 113
    Top = 136
  end
end
