object MainForm: TMainForm
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'CMT Db Editor'
  ClientHeight = 344
  ClientWidth = 514
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = True
  Visible = True
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 13
  object GPanel: TRzPanel
    Left = 161
    Top = 0
    Width = 353
    Height = 344
    Align = alClient
    BorderOuter = fsNone
    TabOrder = 1
    object RzGroupBox3: TRzGroupBox
      Left = 6
      Top = 8
      Width = 339
      Height = 89
      Hint = 'Guild'
      Caption = 'Guild'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
      object RzLabel3: TRzLabel
        Left = 14
        Top = 18
        Width = 27
        Height = 13
        Caption = 'Guild:'
      end
      object RzComboBox3: TRzComboBox
        Left = 14
        Top = 35
        Width = 145
        Height = 47
        AllowEdit = False
        Style = csOwnerDrawVariable
        Color = 12937777
        ItemHeight = 41
        TabOrder = 0
        OnChange = RzComboBox3Change
        OnDrawItem = RzComboBox3DrawItem
        OnMeasureItem = RzComboBox3MeasureItem
      end
      object RzBitBtn19: TRzBitBtn
        Left = 165
        Top = 58
        Width = 25
        Caption = 'A'
        ParentShowHint = False
        ShowHint = True
        TabOrder = 1
        OnClick = RzBitBtn19Click
      end
      object RzBitBtn20: TRzBitBtn
        Left = 196
        Top = 58
        Width = 25
        Caption = 'R'
        ParentShowHint = False
        ShowHint = True
        TabOrder = 2
        OnClick = RzBitBtn20Click
      end
      object RzBitBtn21: TRzBitBtn
        Left = 227
        Top = 58
        Width = 25
        Caption = 'E'
        ParentShowHint = False
        ShowHint = True
        TabOrder = 3
        OnClick = RzBitBtn21Click
      end
      object RzBitBtn23: TRzBitBtn
        Left = 227
        Top = 27
        Width = 25
        Caption = 'S'
        TabOrder = 4
        OnClick = RzBitBtn23Click
      end
      object RzBitBtn25: TRzBitBtn
        Left = 196
        Top = 27
        Width = 25
        Caption = 'F'
        TabOrder = 5
        OnClick = RzBitBtn25Click
      end
      object RzBitBtn26: TRzBitBtn
        Left = 165
        Top = 27
        Width = 25
        Caption = 'Fin'
        TabOrder = 6
        OnClick = RzBitBtn26Click
      end
    end
    object RzGroupBox4: TRzGroupBox
      Left = 6
      Top = 103
      Width = 339
      Height = 234
      Caption = 'Informa'#231#245'es'
      TabOrder = 1
      object RzLabel4: TRzLabel
        Left = 87
        Top = 54
        Width = 63
        Height = 13
        Caption = 'Guild Master:'
      end
      object RzLabel5: TRzLabel
        Left = 87
        Top = 73
        Width = 31
        Height = 13
        Caption = 'Score:'
      end
      object RzLabel6: TRzLabel
        Left = 17
        Top = 96
        Width = 47
        Height = 13
        Caption = 'Members:'
      end
      object RzLabel7: TRzLabel
        Left = 87
        Top = 23
        Width = 116
        Height = 25
        Caption = 'Guild Name:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = 5329407
        Font.Height = -21
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object PaintBox1: TImage
        Left = 16
        Top = 25
        Width = 65
        Height = 65
      end
      object RzLabel8: TRzLabel
        Left = 16
        Top = 215
        Width = 43
        Height = 13
        Caption = 'RzLabel6'
      end
      object RzListBox1: TRzListBox
        Left = 16
        Top = 112
        Width = 305
        Height = 97
        ItemHeight = 13
        Style = lbOwnerDrawVariable
        TabOrder = 0
        OnClick = RzListBox1Click
        OnDrawItem = RzListBox1DrawItem
      end
    end
  end
  object ACPanel: TRzPanel
    Left = 161
    Top = 0
    Width = 353
    Height = 344
    Align = alClient
    BorderOuter = fsNone
    TabOrder = 0
    object RzGroupBox2: TRzGroupBox
      Left = 6
      Top = 103
      Width = 339
      Height = 90
      Caption = 'Character'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
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
        OnChange = RzComboBox2Change
      end
      object RzBitBtn8: TRzBitBtn
        Left = 8
        Top = 57
        Width = 25
        Caption = 'A'
        TabOrder = 1
        OnClick = RzBitBtn8Click
      end
      object RzBitBtn9: TRzBitBtn
        Left = 39
        Top = 57
        Width = 25
        Caption = 'R'
        TabOrder = 2
        OnClick = RzBitBtn9Click
      end
      object RzBitBtn10: TRzBitBtn
        Left = 70
        Top = 57
        Width = 25
        Caption = 'E'
        TabOrder = 3
        OnClick = RzBitBtn10Click
      end
      object RzBitBtn11: TRzBitBtn
        Left = 101
        Top = 57
        Width = 25
        Caption = 'I'
        TabOrder = 4
        OnClick = RzBitBtn11Click
      end
      object RzBitBtn12: TRzBitBtn
        Left = 196
        Top = 27
        Width = 25
        Caption = 'F'
        TabOrder = 5
        OnClick = RzBitBtn12Click
      end
      object RzBitBtn13: TRzBitBtn
        Left = 196
        Top = 58
        Width = 25
        Caption = 'S'
        TabOrder = 6
        OnClick = RzBitBtn13Click
      end
      object RzBitBtn14: TRzBitBtn
        Left = 165
        Top = 58
        Width = 25
        Caption = 'B'
        TabOrder = 7
        OnClick = RzBitBtn14Click
      end
      object RzBitBtn15: TRzBitBtn
        Left = 132
        Top = 57
        Width = 25
        Caption = 'M'
        TabOrder = 8
      end
      object RzBitBtn16: TRzBitBtn
        Left = 165
        Top = 27
        Width = 25
        Caption = 'Fin'
        TabOrder = 9
        OnClick = RzBitBtn16Click
      end
    end
    object RzGroupBox1: TRzGroupBox
      Left = 6
      Top = 8
      Width = 339
      Height = 89
      Caption = 'Account'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 1
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
      object RzBitBtn1: TRzBitBtn
        Left = 8
        Top = 57
        Width = 25
        ParentShowHint = False
        ShowHint = True
        TabOrder = 1
        TextStyle = tsShadow
        OnClick = RzBitBtn1Click
        Layout = blGlyphBottom
      end
      object RzBitBtn2: TRzBitBtn
        Left = 39
        Top = 57
        Width = 25
        ParentShowHint = False
        ShowHint = True
        TabOrder = 2
        OnClick = RzBitBtn2Click
      end
      object RzBitBtn3: TRzBitBtn
        Left = 70
        Top = 57
        Width = 25
        Caption = 'E'
        ParentShowHint = False
        ShowHint = True
        TabOrder = 3
        OnClick = RzBitBtn3Click
      end
      object RzBitBtn4: TRzBitBtn
        Left = 101
        Top = 57
        Width = 25
        Caption = 'W'
        ParentShowHint = False
        ShowHint = True
        TabOrder = 4
        OnClick = RzBitBtn4Click
      end
      object RzBitBtn5: TRzBitBtn
        Left = 196
        Top = 58
        Width = 25
        Caption = 'S'
        TabOrder = 5
        OnClick = RzBitBtn5Click
      end
      object RzBitBtn6: TRzBitBtn
        Left = 165
        Top = 58
        Width = 25
        Caption = 'B'
        TabOrder = 6
        OnClick = RzBitBtn6Click
      end
      object RzBitBtn7: TRzBitBtn
        Left = 196
        Top = 27
        Width = 25
        Caption = 'F'
        TabOrder = 7
        OnClick = RzBitBtn7Click
      end
      object RzBitBtn17: TRzBitBtn
        Left = 165
        Top = 27
        Width = 25
        Caption = 'Fin'
        TabOrder = 8
        OnClick = RzBitBtn17Click
      end
      object RzBitBtn18: TRzBitBtn
        Left = 227
        Top = 27
        Width = 25
        Caption = 'F'
        TabOrder = 9
        OnClick = RzBitBtn18Click
      end
    end
  end
  object RzGroupBar1: TRzGroupBar
    Left = 0
    Top = 0
    Width = 161
    Height = 344
    GradientColorStart = clBtnFace
    GradientColorStop = clBtnShadow
    GroupBorderSize = 8
    UniqueItemSelection = True
    Color = clBtnShadow
    ParentColor = False
    TabOrder = 2
    object RzGroup1: TRzGroup
      Items = <
        item
          Caption = 'Account\Character'
          Selected = True
          OnClick = RzGroup1Items0Click
        end
        item
          Caption = 'Guild'
          OnClick = RzGroup1Items1Click
        end>
      Opened = True
      OpenedHeight = 67
      ShowItemSelection = True
      Caption = 'Editores'
      ParentColor = False
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
  object XPManifest1: TXPManifest
    Left = 208
    Top = 232
  end
end
