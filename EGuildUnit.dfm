object EGuildForm: TEGuildForm
  Left = 0
  Top = 0
  Caption = 'Form6'
  ClientHeight = 400
  ClientWidth = 512
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
    Top = 239
    Width = 496
    Height = 73
    Caption = 'Configs'
    TabOrder = 0
    object RzLabel3: TRzLabel
      Left = 16
      Top = 20
      Width = 72
      Height = 13
      Caption = 'Guild Message:'
    end
    object RzLabel4: TRzLabel
      Left = 336
      Top = 20
      Width = 57
      Height = 13
      Caption = 'Guild Score:'
    end
    object RzLine1: TRzLine
      Left = 306
      Top = 16
      Width = 20
      Height = 51
      LineColor = cl3DDkShadow
    end
    object RzEdit1: TRzEdit
      Left = 16
      Top = 38
      Width = 280
      Height = 21
      MaxLength = 60
      TabOrder = 0
    end
    object RzEdit2: TRzEdit
      Left = 336
      Top = 38
      Width = 143
      Height = 21
      TabOrder = 1
      OnKeyPress = RzEdit2KeyPress
    end
  end
  object RzGroupBox2: TRzGroupBox
    Left = 327
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
        OnClick = Paintbox2Click
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
  object RzGroupBox4: TRzGroupBox
    Left = 263
    Top = 318
    Width = 241
    Height = 74
    TabOrder = 2
    object RzBitBtn1: TRzBitBtn
      Left = 16
      Top = 20
      Width = 97
      Height = 39
      Caption = 'Edit Guild'
      TabOrder = 0
      OnClick = RzBitBtn1Click
    end
    object RzBitBtn3: TRzBitBtn
      Left = 127
      Top = 20
      Width = 97
      Height = 39
      Caption = 'Cancel'
      TabOrder = 1
      OnClick = RzBitBtn3Click
    end
  end
  object RzGroupBox5: TRzGroupBox
    Left = 8
    Top = 8
    Width = 313
    Height = 225
    Caption = 'Members'
    TabOrder = 3
    object RzLabel6: TRzLabel
      Left = 159
      Top = 18
      Width = 43
      Height = 13
      Caption = 'RzLabel6'
    end
    object RzListBox1: TRzListBox
      Left = 16
      Top = 16
      Width = 129
      Height = 196
      ItemHeight = 13
      PopupMenu = PopupMenu1
      Style = lbOwnerDrawVariable
      TabOrder = 0
      OnClick = RzListBox1Click
      OnDrawItem = RzListBox1DrawItem
      OnMouseLeave = RzListBox1MouseLeave
      OnMouseMove = RzListBox1MouseMove
    end
    object RzGroupBox3: TRzGroupBox
      Left = 151
      Top = 68
      Width = 154
      Height = 144
      Caption = 'New Member'
      TabOrder = 1
      object RzLabel1: TRzLabel
        Left = 8
        Top = 15
        Width = 43
        Height = 13
        Caption = 'Account:'
      end
      object RzLabel2: TRzLabel
        Left = 8
        Top = 63
        Width = 52
        Height = 13
        Caption = 'Character:'
      end
      object ListBox1: TListBox
        Left = 114
        Top = 15
        Width = 25
        Height = 30
        ItemHeight = 13
        TabOrder = 2
        Visible = False
      end
      object RzComboBox1: TRzComboBox
        Left = 8
        Top = 34
        Width = 137
        Height = 19
        Style = csOwnerDrawVariable
        ItemHeight = 13
        TabOrder = 0
        OnChange = RzComboBox1Change
        OnDrawItem = RzComboBox1DrawItem
      end
      object RzComboBox2: TRzComboBox
        Left = 8
        Top = 82
        Width = 137
        Height = 19
        Style = csOwnerDrawVariable
        ItemHeight = 13
        TabOrder = 1
        OnDrawItem = RzComboBox2DrawItem
      end
      object RzBitBtn4: TRzBitBtn
        Left = 8
        Top = 109
        Width = 137
        Caption = 'New Member'
        TabOrder = 3
        OnClick = RzBitBtn4Click
      end
    end
    object RzBitBtn5: TRzBitBtn
      Left = 159
      Top = 37
      Width = 137
      Caption = 'Options'
      TabOrder = 2
      OnClick = RzBitBtn5Click
    end
  end
  object RzGroupBox6: TRzGroupBox
    Left = 8
    Top = 318
    Width = 249
    Height = 74
    Caption = 'Change Guild Name'
    TabOrder = 4
    object RzLabel5: TRzLabel
      Left = 16
      Top = 20
      Width = 81
      Height = 13
      Caption = 'New Guild Name:'
    end
    object RzEdit3: TRzEdit
      Left = 16
      Top = 39
      Width = 129
      Height = 21
      MaxLength = 8
      TabOrder = 0
    end
    object RzBitBtn2: TRzBitBtn
      Left = 159
      Top = 20
      Width = 74
      Height = 39
      Caption = 'Change Name'
      TabOrder = 1
      OnClick = RzBitBtn2Click
    end
  end
  object EGuildADOQuery1: TADOQuery
    Parameters = <>
    Left = 377
    Top = 56
  end
  object EGuildADOQuery2: TADOQuery
    Parameters = <>
    Left = 425
    Top = 64
  end
  object Timer1: TTimer
    Interval = 1
    OnTimer = Timer1Timer
    Left = 408
    Top = 56
  end
  object PopupMenu1: TPopupMenu
    AutoHotkeys = maManual
    OnPopup = PopupMenu1Popup
    Left = 416
    Top = 104
    object SetGuildMaster1: TMenuItem
      Caption = 'Set Guild Master'
      OnClick = SetGuildMaster1Click
    end
    object SetAssistent1: TMenuItem
      Caption = 'Set Assistent'
      OnClick = SetAssistent1Click
    end
    object SetBattleMaster1: TMenuItem
      Caption = 'Set Battle Master'
      OnClick = SetBattleMaster1Click
    end
    object RemoveMember1: TMenuItem
      Caption = 'Remove Member'
      OnClick = RemoveMember1Click
    end
  end
end
