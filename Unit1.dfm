object Form1: TForm1
  Left = 0
  Top = 0
  Caption = #1055#1086#1089#1090#1088#1086#1077#1085#1080#1077' '#1075#1088#1072#1092#1080#1082#1086#1074
  ClientHeight = 192
  ClientWidth = 184
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 16
    Top = 68
    Width = 12
    Height = 13
    Caption = 'x1'
  end
  object Label2: TLabel
    Left = 16
    Top = 101
    Width = 12
    Height = 13
    Caption = 'x2'
  end
  object Label6: TLabel
    Left = 7
    Top = 125
    Width = 21
    Height = 13
    Caption = 'step'
  end
  object Label3: TLabel
    Left = 8
    Top = 8
    Width = 130
    Height = 13
    Caption = 'y=(cos(x))^2 , '#1077#1089#1083#1080' x<=0'
  end
  object Label4: TLabel
    Left = 8
    Top = 27
    Width = 124
    Height = 13
    Caption = 'y=1 , '#1077#1089#1083#1080' x<=0 '#1080' x>=1'
  end
  object Label5: TLabel
    Left = 8
    Top = 46
    Width = 127
    Height = 13
    Caption = 'y=(sin(x))^2 , '#1077#1089#1083#1080' x>=1'
  end
  object Edit1: TEdit
    Left = 34
    Top = 65
    Width = 47
    Height = 21
    TabOrder = 0
    Text = '0'
  end
  object Edit2: TEdit
    Left = 34
    Top = 98
    Width = 47
    Height = 21
    TabOrder = 1
    Text = '10'
  end
  object Edit6: TEdit
    Left = 34
    Top = 125
    Width = 47
    Height = 21
    TabOrder = 2
    Text = '1'
    OnChange = Edit6Change
  end
  object Button1: TButton
    Left = 16
    Top = 160
    Width = 75
    Height = 25
    Caption = 'Start'
    TabOrder = 3
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 97
    Top = 160
    Width = 75
    Height = 25
    Caption = 'Draw'
    TabOrder = 4
    OnClick = Button2Click
  end
end
