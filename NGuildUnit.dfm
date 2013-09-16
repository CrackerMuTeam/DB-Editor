object NGuildForm: TNGuildForm
  Left = 0
  Top = 0
  ClientHeight = 318
  ClientWidth = 376
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
    Width = 177
    Height = 65
    Caption = 'Name'
    TabOrder = 0
    object RzEdit1: TRzEdit
      Left = 16
      Top = 23
      Width = 145
      Height = 21
      MaxLength = 8
      TabOrder = 0
    end
  end
  object RzGroupBox2: TRzGroupBox
    Left = 191
    Top = 8
    Width = 177
    Height = 225
    Caption = 'Guild Mark'
    TabOrder = 1
    object Paintbox1: TImage
      Left = 16
      Top = 25
      Width = 145
      Height = 145
    end
    object Panel1: TPanel
      Left = 16
      Top = 176
      Width = 18
      Height = 18
      Color = 6710886
      TabOrder = 0
      object Paintbox2: TImage
        Left = 1
        Top = 1
        Width = 16
        Height = 16
        Align = alClient
        OnClick = PaintBox2Click
        ExplicitLeft = -127
        ExplicitTop = -127
        ExplicitWidth = 145
        ExplicitHeight = 145
      end
    end
    object Panel2: TPanel
      Left = 34
      Top = 176
      Width = 18
      Height = 18
      Color = clBlack
      TabOrder = 1
      OnClick = Panel2Click
    end
    object Panel3: TPanel
      Left = 52
      Top = 176
      Width = 18
      Height = 18
      Color = 9210509
      TabOrder = 2
      OnClick = Panel2Click
    end
    object Panel4: TPanel
      Left = 70
      Top = 176
      Width = 18
      Height = 18
      Color = clWhite
      TabOrder = 3
      OnClick = Panel2Click
    end
    object Panel5: TPanel
      Left = 34
      Top = 194
      Width = 18
      Height = 18
      Color = 9240321
      TabOrder = 4
      OnClick = Panel2Click
    end
    object Panel6: TPanel
      Left = 52
      Top = 194
      Width = 18
      Height = 18
      Color = clAqua
      TabOrder = 5
      OnClick = Panel2Click
    end
    object Panel7: TPanel
      Left = 70
      Top = 194
      Width = 18
      Height = 18
      Color = 16747008
      TabOrder = 6
      OnClick = Panel2Click
    end
    object Panel8: TPanel
      Left = 88
      Top = 194
      Width = 18
      Height = 18
      Color = 16646144
      TabOrder = 7
      OnClick = Panel2Click
    end
    object Panel9: TPanel
      Left = 106
      Top = 194
      Width = 18
      Height = 18
      Color = 16711820
      TabOrder = 8
      OnClick = Panel2Click
    end
    object Panel10: TPanel
      Left = 124
      Top = 194
      Width = 18
      Height = 18
      Color = 16711934
      TabOrder = 9
      OnClick = Panel2Click
    end
    object Panel11: TPanel
      Left = 142
      Top = 194
      Width = 18
      Height = 18
      Color = 9175295
      TabOrder = 10
      OnClick = Panel2Click
    end
    object Panel12: TPanel
      Left = 88
      Top = 176
      Width = 18
      Height = 18
      Color = 254
      TabOrder = 11
      OnClick = Panel2Click
    end
    object Panel13: TPanel
      Left = 106
      Top = 176
      Width = 18
      Height = 18
      Color = 35583
      TabOrder = 12
      OnClick = Panel2Click
    end
    object Panel14: TPanel
      Left = 124
      Top = 176
      Width = 18
      Height = 18
      Color = clYellow
      TabOrder = 13
      OnClick = Panel2Click
    end
    object Panel15: TPanel
      Left = 142
      Top = 176
      Width = 18
      Height = 18
      Color = 130957
      TabOrder = 14
      OnClick = Panel2Click
    end
    object Panel16: TPanel
      Left = 16
      Top = 194
      Width = 18
      Height = 18
      Color = clLime
      TabOrder = 15
      OnClick = Panel2Click
    end
  end
  object RzGroupBox3: TRzGroupBox
    Left = 8
    Top = 79
    Width = 177
    Height = 154
    Caption = 'Guild Master'
    TabOrder = 2
    object RzLabel1: TRzLabel
      Left = 16
      Top = 32
      Width = 43
      Height = 13
      Caption = 'Account:'
    end
    object RzLabel2: TRzLabel
      Left = 16
      Top = 80
      Width = 52
      Height = 13
      Caption = 'Character:'
    end
    object RzComboBox1: TRzComboBox
      Left = 16
      Top = 51
      Width = 145
      Height = 19
      Style = csOwnerDrawVariable
      ItemHeight = 13
      TabOrder = 0
      OnChange = RzComboBox1Change
      OnDrawItem = RzComboBox1DrawItem
    end
    object RzComboBox2: TRzComboBox
      Left = 16
      Top = 99
      Width = 145
      Height = 19
      Style = csOwnerDrawVariable
      ItemHeight = 13
      TabOrder = 1
      OnDrawItem = RzComboBox2DrawItem
    end
    object ListBox1: TListBox
      Left = 130
      Top = 15
      Width = 25
      Height = 30
      ItemHeight = 13
      TabOrder = 2
      Visible = False
    end
  end
  object RzGroupBox4: TRzGroupBox
    Left = 8
    Top = 239
    Width = 360
    Height = 74
    TabOrder = 3
    object RzBitBtn1: TRzBitBtn
      Left = 16
      Top = 20
      Width = 97
      Height = 39
      Caption = 'Create Guild'
      TabOrder = 0
      OnClick = RzBitBtn1Click
    end
    object RzBitBtn2: TRzBitBtn
      Left = 130
      Top = 20
      Width = 97
      Height = 39
      Caption = 'Create Guild And Edit'
      TabOrder = 1
      OnClick = RzBitBtn2Click
    end
    object RzBitBtn3: TRzBitBtn
      Left = 247
      Top = 20
      Width = 97
      Height = 39
      Caption = 'Cancel'
      TabOrder = 2
      OnClick = RzBitBtn3Click
    end
  end
  object NGuildADOQuery1: TADOQuery
    Parameters = <>
    Left = 209
    Top = 32
  end
  object NGuildADOQuery2: TADOQuery
    Parameters = <>
    Left = 209
    Top = 64
  end
  object Timer1: TTimer
    Interval = 1
    OnTimer = Timer1Timer
    Left = 240
    Top = 32
  end
end
