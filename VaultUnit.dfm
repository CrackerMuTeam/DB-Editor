object VaultForm: TVaultForm
  Left = 318
  Top = 82
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsToolWindow
  Caption = 'Editando Vault'
  ClientHeight = 577
  ClientWidth = 572
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnActivate = FormActivate
  OnClose = FormClose
  OnDeactivate = FormDeactivate
  PixelsPerInch = 96
  TextHeight = 13
  object SpeedButton1: TSpeedButton
    Left = 185
    Top = 152
    Width = 23
    Height = 22
    Visible = False
  end
  object RzTabControl1: TRzTabControl
    Left = 8
    Top = 8
    Width = 553
    Height = 561
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Verdana'
    Font.Style = []
    ParentFont = False
    TextOrientation = orVertical
    TabIndex = 0
    TabOrder = 2
    TabOrientation = toRight
    Tabs = <
      item
        Caption = 'Inventory'
      end
      item
        Caption = 'Tab2'
      end>
    OnChange = RzTabControl1Change
    FixedDimension = 23
    object Image1: TImage
      Left = 266
      Top = 10
      Width = 256
      Height = 481
    end
    object RzMemo2: TRzMemo
      Left = 266
      Top = 497
      Width = 256
      Height = 53
      Color = clInfoBk
      ReadOnly = True
      TabOrder = 0
      FocusColor = clWhite
    end
    object copyrich: TRzMemo
      Left = 266
      Top = 439
      Width = 105
      Height = 29
      Color = clInfoBk
      ReadOnly = True
      TabOrder = 1
      Visible = False
      FocusColor = clWhite
    end
  end
  object RzPageControl1: TRzPageControl
    Left = 19
    Top = 170
    Width = 249
    Height = 390
    ActivePage = TabSheet2
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Verdana'
    Font.Style = []
    ParentFont = False
    TabIndex = 1
    TabOrder = 0
    FixedDimension = 19
    object TabSheet1: TRzTabSheet
      Caption = 'Vault'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 0
      ExplicitHeight = 0
      object RzGroupBox2: TRzGroupBox
        Left = 14
        Top = 13
        Width = 220
        Height = 220
        Caption = 'Informa'#231#245'es'
        TabOrder = 0
        object RzMemo1: TRzMemo
          Left = 9
          Top = 16
          Width = 200
          Height = 193
          Color = clInfoBk
          ReadOnly = True
          TabOrder = 0
          FocusColor = clWhite
        end
      end
      object VoltarB: TRzBitBtn
        Left = 14
        Top = 239
        Width = 105
        Height = 29
        Caption = 'Voltar'
        TabOrder = 1
      end
      object SaveVaultB: TRzBitBtn
        Left = 125
        Top = 239
        Width = 109
        Height = 29
        Caption = 'Salvar Vault'
        TabOrder = 2
        OnClick = SaveVaultBClick
      end
      object Cbsql: TRzCheckBox
        Left = 14
        Top = 274
        Width = 181
        Height = 17
        Caption = 'Ver altera'#231#245'es'
        State = cbUnchecked
        TabOrder = 3
      end
      object CheckBox3: TRzCheckBox
        Left = 14
        Top = 292
        Width = 181
        Height = 17
        Caption = 'Copiar Query'
        State = cbUnchecked
        TabOrder = 4
      end
      object BitBtn1: TBitBtn
        Left = 125
        Top = 274
        Width = 108
        Height = 29
        Caption = 'Apagar Vault'
        TabOrder = 5
        OnClick = BitBtn1Click
      end
      object zenedit: TLabeledEdit
        Left = 14
        Top = 336
        Width = 99
        Height = 21
        EditLabel.Width = 22
        EditLabel.Height = 13
        EditLabel.Caption = 'Zen:'
        TabOrder = 6
      end
    end
    object TabSheet2: TRzTabSheet
      Caption = 'Selecionar Item'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      object TipoLB: TRzLabel
        Left = 3
        Top = 24
        Width = 24
        Height = 13
        Caption = 'Tipo:'
      end
      object ItemLB: TRzLabel
        Left = 3
        Top = 51
        Width = 23
        Height = 13
        Caption = 'Item:'
      end
      object LevelLB: TRzLabel
        Left = 3
        Top = 82
        Width = 29
        Height = 13
        Caption = 'Level:'
      end
      object OpcaoLB: TRzLabel
        Left = 3
        Top = 118
        Width = 34
        Height = 13
        Caption = 'Option:'
      end
      object DurLB: TRzLabel
        Left = 3
        Top = 154
        Width = 43
        Height = 13
        Caption = 'Duration:'
      end
      object SerialLB: TRzLabel
        Left = 3
        Top = 185
        Width = 26
        Height = 13
        Caption = 'Serial'
      end
      object AncientLB: TRzLabel
        Left = 3
        Top = 212
        Width = 39
        Height = 13
        Caption = 'Ancient:'
      end
      object LevelShowLB: TRzLabel
        Left = 217
        Top = 82
        Width = 12
        Height = 13
        Caption = '+0'
      end
      object OptionShowLB: TRzLabel
        Left = 218
        Top = 118
        Width = 11
        Height = 13
        Caption = 'z0'
      end
      object RzGroupBox3: TRzGroupBox
        Left = 3
        Top = 235
        Width = 239
        Height = 122
        Caption = 'Op'#231#245'es Excelentes'
        TabOrder = 0
        object EO1: TRzCheckBox
          Left = 8
          Top = 16
          Width = 225
          Height = 17
          Caption = 'Increases Mana After Monster +Mana/8'
          State = cbUnchecked
          TabOrder = 0
          OnClick = EO1Click
        end
        object EO2: TRzCheckBox
          Left = 8
          Top = 33
          Width = 225
          Height = 17
          Caption = 'Increases Life After Monster +life/8'
          State = cbUnchecked
          TabOrder = 1
          OnClick = EO1Click
        end
        object EO3: TRzCheckBox
          Left = 8
          Top = 50
          Width = 225
          Height = 17
          Caption = 'Increase Attacking(wizardry)speed+7'
          State = cbUnchecked
          TabOrder = 2
          OnClick = EO1Click
        end
        object EO4: TRzCheckBox
          Left = 8
          Top = 68
          Width = 225
          Height = 17
          Caption = 'Increase Damage +2%'
          State = cbUnchecked
          TabOrder = 3
          OnClick = EO1Click
        end
        object EO5: TRzCheckBox
          Left = 8
          Top = 85
          Width = 225
          Height = 17
          Caption = 'Increase Damage +level/20'
          State = cbUnchecked
          TabOrder = 4
          OnClick = EO1Click
        end
        object EO6: TRzCheckBox
          Left = 8
          Top = 100
          Width = 225
          Height = 17
          Caption = 'Excellent Damage rate +10%'
          State = cbUnchecked
          TabOrder = 5
          OnClick = EO1Click
        end
      end
      object CheckASerial: TRzCheckBox
        Left = 141
        Top = 182
        Width = 123
        Height = 17
        Caption = 'Auto Serial'
        State = cbUnchecked
        TabOrder = 1
        OnClick = CheckASerialClick
      end
      object CheckSkill: TRzCheckBox
        Left = 125
        Top = 151
        Width = 113
        Height = 17
        Caption = 'Skill'
        State = cbUnchecked
        TabOrder = 2
      end
      object CheckLuck: TRzCheckBox
        Left = 184
        Top = 151
        Width = 115
        Height = 17
        Caption = 'Luck'
        State = cbUnchecked
        TabOrder = 3
      end
      object TipoCB: TRzComboBox
        Left = 70
        Top = 21
        Width = 160
        Height = 21
        ItemHeight = 13
        TabOrder = 4
        OnChange = TipoCBChange
      end
      object ItemCB: TRzComboBox
        Left = 70
        Top = 48
        Width = 160
        Height = 21
        ItemHeight = 13
        TabOrder = 5
        OnChange = ItemCBChange
      end
      object AncientCB: TRzComboBox
        Left = 70
        Top = 208
        Width = 160
        Height = 21
        ItemHeight = 13
        TabOrder = 6
        Text = 'Normal'
        Values.Strings = (
          'Normal'
          'Ancient+5'
          'Ancient+5+Stamina'
          'Ancient+10'
          'Ancient+10+Stamina')
      end
      object RzSpinner1: TRzSpinner
        Left = 70
        Top = 150
        Width = 49
        ButtonWidth = 10
        Max = 255
        Value = 255
        ParentColor = False
        TabOrder = 7
      end
      object LevelTrack: TRzDBTrackBar
        Left = 62
        Top = 75
        Width = 155
        Max = 15
        Position = 0
        ShowFocusRect = False
        OnChanging = LevelTrackChanging
        TabOrder = 8
      end
      object OpcaoTrack: TRzDBTrackBar
        Left = 62
        Top = 109
        Width = 155
        Max = 7
        Position = 0
        ShowFocusRect = False
        OnChanging = OpcaoTrackChanging
        TabOrder = 9
      end
      object SerialEdit: TEdit
        Left = 70
        Top = 181
        Width = 65
        Height = 21
        TabOrder = 10
        Text = '00000000'
        OnExit = SerialEditExit
        OnKeyPress = SerialEditKeyPress
      end
    end
  end
  object RzGroupBox1: TRzGroupBox
    Left = 19
    Top = 14
    Width = 249
    Height = 131
    Caption = 'Adicionar Item'
    TabOrder = 1
    object XLB: TRzLabel
      Left = 8
      Top = 47
      Width = 10
      Height = 13
      Caption = 'X:'
    end
    object YLB: TRzLabel
      Left = 71
      Top = 47
      Width = 10
      Height = 13
      Caption = 'Y:'
    end
    object VaultPos: TRzLabel
      Left = 8
      Top = 25
      Width = 83
      Height = 13
      Caption = 'Posi'#231#227'o no Vault:'
    end
    object RzLabel1: TRzLabel
      Left = 110
      Top = 77
      Width = 106
      Height = 13
      Caption = 'Posi'#231#227'o no Inventorio:'
      Visible = False
    end
    object lblspace: TRzLabel
      Left = 97
      Top = 71
      Width = 17
      Height = 13
      Caption = '0x0'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object TamItem: TRzLabel
      Left = 6
      Top = 71
      Width = 85
      Height = 13
      Caption = 'Tamanho do item:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clMaroon
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      ShadowColor = 4382076
    end
    object RzComboBox1: TRzComboBox
      Left = 113
      Top = 96
      Width = 120
      Height = 21
      ItemHeight = 13
      TabOrder = 3
      Visible = False
    end
    object btnIN: TRzBitBtn
      Left = 11
      Top = 90
      Width = 222
      Caption = 'Adicionar Item'
      TabOrder = 0
      OnClick = btnINClick
    end
    object cbox: TRzSpinner
      Left = 24
      Top = 44
      Width = 41
      ButtonWidth = 10
      Max = 8
      Min = 1
      Value = 2
      ParentColor = False
      TabOrder = 1
    end
    object cboy: TRzSpinner
      Left = 87
      Top = 44
      Width = 41
      ButtonWidth = 10
      Max = 15
      Min = 1
      Value = 1
      ParentColor = False
      TabOrder = 2
    end
  end
  object itemQuery: TADOQuery
    CursorType = ctStatic
    Parameters = <>
    Left = 264
    Top = 96
  end
  object popMenuitem: TPopupMenu
    Left = 336
    Top = 112
    object N1: TMenuItem
      Bitmap.Data = {
        F6000000424DF600000000000000760000002800000010000000100000000100
        0400000000008000000000000000000000001000000000000000000000000000
        8000008000000080800080000000800080008080000080808000C0C0C0000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
        8888888888888888888800000888880000080F000888880F00080F000888880F
        0008000000080000000800F000000F00000800F000800F00000800F000800F00
        00088000000000000088880F00080F0008888800000800000888888000888000
        88888880F08880F0888888800088800088888888888888888888}
      Caption = 'Informa'#231#227'o'
      Default = True
      OnClick = N1Click
    end
    object N2: TMenuItem
      Caption = '-'
    end
    object N3: TMenuItem
      Bitmap.Data = {
        F6000000424DF600000000000000760000002800000010000000100000000100
        0400000000008000000000000000000000001000000000000000000000000000
        8000008000000080800080000000800080008080000080808000C0C0C0000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
        8888888888888888888888808888888888088800088888888888880000888888
        8088888000888888088888880008888008888888800088008888888888000008
        8888888888800088888888888800000888888888800088008888888000088880
        0888880000888888008888000888888888088888888888888888}
      Caption = 'Excluir'
      OnClick = N3Click
    end
  end
  object VaultADOQuery1: TADOQuery
    Parameters = <>
    Left = 65
    Top = 80
  end
  object VaultADOQuery2: TADOQuery
    Parameters = <>
    Left = 65
    Top = 112
  end
  object Timer1: TTimer
    Enabled = False
    Interval = 1
    OnTimer = Timer1Timer
    Left = 408
    Top = 304
  end
end
