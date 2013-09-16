object ECharForm: TECharForm
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = 'Editing Character'
  ClientHeight = 400
  ClientWidth = 591
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
    Width = 385
    Height = 73
    Caption = 'Information'
    TabOrder = 0
    object RzLabel11: TRzLabel
      Left = 8
      Top = 16
      Width = 67
      Height = 21
      Caption = 'RzLabel1'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 15305260
      Font.Height = -17
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object RzLabel12: TRzLabel
      Left = 8
      Top = 41
      Width = 67
      Height = 21
      Caption = 'RzLabel1'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 6539639
      Font.Height = -17
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
  end
  object RzGroupBox2: TRzGroupBox
    Left = 8
    Top = 87
    Width = 193
    Height = 306
    Caption = 'Edit Stats'
    TabOrder = 1
    VisualStyle = vsGradient
    object RzGroupBar1: TRzGroupBar
      Left = 8
      Top = 14
      Width = 176
      Height = 279
      BorderShadow = clSkyBlue
      GradientColorStart = clCream
      GradientColorStop = clCaptionText
      GradientPath = gpBottomToTop
      GroupBorderSize = 0
      FlatColor = clBtnText
      Style = gbsOutlook
      UniqueItemSelection = True
      Align = alNone
      Color = clBtnText
      ParentColor = False
      TabOrder = 0
      TabStop = True
      object RzGroup1: TRzGroup
        Items = <>
        Opened = True
        OpenedHeight = 259
        Caption = 'Level'
        ParentColor = False
        object RzLabel1: TRzLabel
          Left = 16
          Top = 32
          Width = 29
          Height = 13
          Caption = 'Level:'
          Transparent = True
        end
        object RzLabel2: TRzLabel
          Left = 16
          Top = 72
          Width = 77
          Height = 13
          Caption = 'Level Up Points:'
          Transparent = True
        end
        object RzLabel3: TRzLabel
          Left = 16
          Top = 112
          Width = 57
          Height = 13
          Caption = 'Experience:'
          Transparent = True
        end
        object RzLabel4: TRzLabel
          Left = 16
          Top = 152
          Width = 22
          Height = 13
          Caption = 'Zen:'
          Transparent = True
        end
        object RzLabel5: TRzLabel
          Left = 16
          Top = 192
          Width = 32
          Height = 13
          Caption = 'Reset:'
          Transparent = True
        end
        object RzEdit1: TRzEdit
          Left = 16
          Top = 48
          Width = 121
          Height = 21
          TabOrder = 0
          OnKeyPress = RzEdit1KeyPress
        end
        object RzEdit2: TRzEdit
          Left = 16
          Top = 88
          Width = 121
          Height = 21
          TabOrder = 1
          OnKeyPress = RzEdit1KeyPress
        end
        object RzEdit3: TRzEdit
          Left = 16
          Top = 131
          Width = 122
          Height = 21
          TabOrder = 2
          OnKeyPress = RzEdit1KeyPress
        end
        object RzEdit4: TRzEdit
          Left = 16
          Top = 168
          Width = 121
          Height = 21
          TabOrder = 3
          OnKeyPress = RzEdit1KeyPress
        end
        object RzEdit5: TRzEdit
          Left = 16
          Top = 208
          Width = 121
          Height = 21
          TabOrder = 4
          OnKeyPress = RzEdit1KeyPress
        end
        object RzBitBtn5: TRzBitBtn
          Left = 144
          Top = 126
          Width = 29
          Caption = 'Ger'
          TabOrder = 5
          OnClick = RzBitBtn5Click
        end
        object RzBitBtn6: TRzBitBtn
          Left = 143
          Top = 45
          Width = 29
          Caption = 'Ger'
          TabOrder = 6
          OnClick = RzBitBtn6Click
        end
      end
      object RzGroup2: TRzGroup
        Items = <>
        Opened = False
        OpenedHeight = 259
        SelectionShadowColor = clBtnFace
        SelectionFrameColor = clBtnFace
        Caption = 'Stat'
        ParentColor = False
        object RzLabel6: TRzLabel
          Left = 16
          Top = 32
          Width = 46
          Height = 13
          Caption = 'Strength:'
          Transparent = True
        end
        object RzLabel7: TRzLabel
          Left = 16
          Top = 72
          Width = 49
          Height = 13
          Caption = 'Dexterity:'
          Transparent = True
        end
        object RzLabel8: TRzLabel
          Left = 16
          Top = 113
          Width = 36
          Height = 13
          Caption = 'Vitality:'
          Transparent = True
        end
        object RzLabel9: TRzLabel
          Left = 16
          Top = 153
          Width = 38
          Height = 13
          Caption = 'Energy:'
          Transparent = True
        end
        object RzLabel10: TRzLabel
          Left = 16
          Top = 193
          Width = 51
          Height = 13
          Caption = 'Command:'
          Transparent = True
        end
        object RzEdit6: TRzEdit
          Left = 16
          Top = 48
          Width = 121
          Height = 21
          TabOrder = 0
          OnKeyPress = RzEdit1KeyPress
        end
        object RzEdit7: TRzEdit
          Left = 16
          Top = 88
          Width = 121
          Height = 21
          TabOrder = 1
          OnKeyPress = RzEdit1KeyPress
        end
        object RzEdit8: TRzEdit
          Left = 16
          Top = 129
          Width = 121
          Height = 21
          TabOrder = 2
          OnKeyPress = RzEdit1KeyPress
        end
        object RzEdit9: TRzEdit
          Left = 16
          Top = 169
          Width = 121
          Height = 21
          TabOrder = 3
          OnKeyPress = RzEdit1KeyPress
        end
        object RzEdit10: TRzEdit
          Left = 16
          Top = 209
          Width = 121
          Height = 21
          TabOrder = 4
          OnKeyPress = RzEdit1KeyPress
        end
      end
    end
  end
  object RzGroupBox3: TRzGroupBox
    Left = 207
    Top = 87
    Width = 186
    Height = 114
    Caption = 'Class/Status'
    TabOrder = 2
    object RzLabel13: TRzLabel
      Left = 8
      Top = 18
      Width = 29
      Height = 13
      Caption = 'Class:'
    end
    object RzLabel14: TRzLabel
      Left = 8
      Top = 61
      Width = 35
      Height = 13
      Caption = 'Status:'
    end
    object RzComboBox1: TRzComboBox
      Left = 8
      Top = 80
      Width = 169
      Height = 21
      Style = csDropDownList
      ItemHeight = 13
      TabOrder = 0
      Text = '0-Normal'
      Items.Strings = (
        '0-Normal'
        '1-Banned'
        '8-GM')
      ItemIndex = 0
      Values.Strings = (
        '0-Normal'
        '1-Banned'
        '8-GM')
    end
    object RzComboBox2: TRzComboBox
      Left = 8
      Top = 37
      Width = 169
      Height = 21
      Style = csDropDownList
      ItemHeight = 13
      TabOrder = 1
      Items.Strings = (
        '0-Dark Wizard'
        '1-Soul Master'
        '16-Dark Knight'
        '17-Blade Knight'
        '32-Elf'
        '33-Muse Elf'
        '48-Magic Gladiator'
        '64-Dark Lord')
      Values.Strings = (
        '')
    end
    object RzComboBox7: TRzComboBox
      Left = 104
      Top = 37
      Width = 50
      Height = 21
      Style = csDropDownList
      ItemHeight = 13
      TabOrder = 2
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
      Values.Strings = (
        '')
    end
    object RzComboBox8: TRzComboBox
      Left = 104
      Top = 80
      Width = 49
      Height = 21
      Style = csDropDownList
      ItemHeight = 13
      TabOrder = 3
      Visible = False
    end
  end
  object RzGroupBox5: TRzGroupBox
    Left = 207
    Top = 207
    Width = 186
    Height = 186
    Caption = 'Map/Pk'
    TabOrder = 3
    object RzGroupBar2: TRzGroupBar
      Left = 8
      Top = 14
      Width = 169
      Height = 163
      GradientColorStart = clBtnFace
      GradientColorStop = clBtnShadow
      GroupBorderSize = 0
      Style = gbsOutlook
      Align = alNone
      Color = clBtnShadow
      ParentColor = False
      TabOrder = 0
      object RzGroup3: TRzGroup
        Items = <>
        Opened = True
        OpenedHeight = 143
        Caption = 'Map'
        ParentColor = False
        object RzLabel15: TRzLabel
          Left = 16
          Top = 32
          Width = 30
          Height = 13
          Caption = 'Mapa:'
          Transparent = True
        end
        object RzLabel16: TRzLabel
          Left = 16
          Top = 83
          Width = 42
          Height = 13
          Caption = 'Coord X:'
          Transparent = True
        end
        object RzLabel17: TRzLabel
          Left = 16
          Top = 113
          Width = 42
          Height = 13
          Caption = 'Coord Y:'
          Transparent = True
        end
        object RzComboBox3: TRzComboBox
          Left = 16
          Top = 48
          Width = 137
          Height = 21
          Style = csDropDownList
          ItemHeight = 13
          TabOrder = 0
        end
        object RzSpinEdit1: TRzSpinEdit
          Left = 88
          Top = 79
          Width = 65
          Height = 21
          TabOrder = 1
        end
        object RzSpinEdit2: TRzSpinEdit
          Left = 88
          Top = 110
          Width = 65
          Height = 21
          TabOrder = 2
        end
      end
      object RzGroup4: TRzGroup
        Items = <>
        Opened = False
        OpenedHeight = 143
        Caption = 'Pk'
        ParentColor = False
        object RzLabel18: TRzLabel
          Left = 16
          Top = 32
          Width = 44
          Height = 13
          Caption = 'PK Level:'
          Transparent = True
        end
        object RzLabel19: TRzLabel
          Left = 16
          Top = 83
          Width = 48
          Height = 13
          Caption = 'PK Count:'
          Transparent = True
        end
        object RzLabel20: TRzLabel
          Left = 16
          Top = 113
          Width = 41
          Height = 13
          Caption = 'PK Time:'
          Transparent = True
        end
        object RzComboBox4: TRzComboBox
          Left = 16
          Top = 48
          Width = 137
          Height = 21
          Style = csDropDownList
          ItemHeight = 13
          TabOrder = 0
        end
        object RzSpinEdit3: TRzSpinEdit
          Left = 88
          Top = 79
          Width = 65
          Height = 21
          TabOrder = 1
        end
        object RzSpinEdit4: TRzSpinEdit
          Left = 88
          Top = 110
          Width = 65
          Height = 21
          TabOrder = 2
        end
        object RzComboBox9: TRzComboBox
          Left = 82
          Top = 48
          Width = 47
          Height = 21
          ItemHeight = 13
          TabOrder = 3
          Visible = False
        end
      end
    end
  end
  object RzGroupBox4: TRzGroupBox
    Left = 398
    Top = 8
    Width = 185
    Height = 73
    Caption = 'Quest'
    TabOrder = 4
    object RzLabel23: TRzLabel
      Left = 16
      Top = 16
      Width = 33
      Height = 13
      Caption = 'Quest:'
    end
    object RzComboBox6: TRzComboBox
      Left = 16
      Top = 32
      Width = 153
      Height = 21
      Style = csDropDownList
      ItemHeight = 13
      TabOrder = 0
    end
    object RzComboBox10: TRzComboBox
      Left = 104
      Top = 32
      Width = 41
      Height = 21
      ItemHeight = 13
      TabOrder = 1
      Visible = False
    end
  end
  object RzGroupBox6: TRzGroupBox
    Left = 399
    Top = 87
    Width = 186
    Caption = 'Rename Character'
    TabOrder = 5
    object RzLabel21: TRzLabel
      Left = 16
      Top = 24
      Width = 55
      Height = 13
      Caption = 'New Name:'
    end
    object RzEdit11: TRzEdit
      Left = 16
      Top = 40
      Width = 153
      Height = 21
      MaxLength = 10
      TabOrder = 0
    end
    object RzBitBtn1: TRzBitBtn
      Left = 16
      Top = 67
      Width = 155
      Caption = 'Change'
      TabOrder = 1
      OnClick = RzBitBtn1Click
    end
  end
  object RzGroupBox7: TRzGroupBox
    Left = 398
    Top = 198
    Width = 186
    Caption = 'Move To Account'
    TabOrder = 6
    object RzLabel22: TRzLabel
      Left = 16
      Top = 24
      Width = 136
      Height = 13
      Caption = 'Move Character to Account:'
    end
    object RzBitBtn2: TRzBitBtn
      Left = 16
      Top = 67
      Width = 155
      Caption = 'Change'
      TabOrder = 0
      OnClick = RzBitBtn2Click
    end
    object RzComboBox5: TRzComboBox
      Left = 16
      Top = 40
      Width = 153
      Height = 21
      Style = csDropDownList
      ItemHeight = 13
      TabOrder = 1
    end
  end
  object RzGroupBox8: TRzGroupBox
    Left = 398
    Top = 307
    Width = 185
    Height = 86
    TabOrder = 7
    object RzBitBtn3: TRzBitBtn
      Left = 16
      Top = 17
      Width = 152
      Caption = 'OK'
      TabOrder = 0
      OnClick = k
    end
    object RzBitBtn4: TRzBitBtn
      Left = 16
      Top = 48
      Width = 152
      Caption = 'Cancel'
      TabOrder = 1
      OnClick = RzBitBtn4Click
    end
  end
  object ECharADOQuery1: TADOQuery
    Parameters = <>
    Left = 65
    Top = 80
  end
  object ECharADOQuery2: TADOQuery
    Parameters = <>
    Left = 65
    Top = 112
  end
end
