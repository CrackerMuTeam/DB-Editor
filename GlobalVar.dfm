object VarForm: TVarForm
  Left = 0
  Top = 0
  Caption = 'VarForm'
  ClientHeight = 64
  ClientWidth = 175
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object DataSource1: TDataSource
    Left = 40
    Top = 8
  end
  object ADOTable1: TADOTable
    Left = 72
    Top = 8
  end
  object itemquery: TADOQuery
    CursorType = ctStatic
    Parameters = <>
    Left = 128
    Top = 8
  end
end
