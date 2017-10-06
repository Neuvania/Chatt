object ConfRede: TConfRede
  Left = 723
  Top = 232
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Configura'#231'oes de rede'
  ClientHeight = 327
  ClientWidth = 408
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  PixelsPerInch = 96
  TextHeight = 13
  object Conectar: TButton
    Left = 172
    Top = 264
    Width = 77
    Height = 49
    Hint = 'Conectar/Desconectar ao Servidor'
    Caption = 'Conectar'
    TabOrder = 2
    Visible = False
    OnClick = ConectarClick
  end
  object gbConfiguracao: TGroupBox
    Left = 0
    Top = 0
    Width = 408
    Height = 249
    Align = alTop
    Caption = 'Configura'#231#245'es'
    TabOrder = 0
    object Label1: TLabel
      Left = 97
      Top = 128
      Width = 28
      Height = 13
      Caption = 'Porta:'
    end
    object Label2: TLabel
      Left = 96
      Top = 160
      Width = 49
      Height = 13
      Caption = 'Endere'#231'o:'
    end
    object Label3: TLabel
      Left = 96
      Top = 192
      Width = 31
      Height = 13
      Caption = 'Nome:'
    end
    object rbServidor: TRadioButton
      Left = 80
      Top = 64
      Width = 113
      Height = 17
      Caption = 'Servidor'
      Checked = True
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -12
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      TabStop = True
      OnClick = rbServidorClick
    end
    object rbCliente: TRadioButton
      Left = 240
      Top = 66
      Width = 113
      Height = 17
      Caption = 'Cliente'
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -12
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
      OnClick = rbClienteClick
    end
    object Porta: TEdit
      Left = 162
      Top = 126
      Width = 137
      Height = 21
      TabOrder = 2
      Text = '2048'
    end
    object Endereco: TEdit
      Left = 161
      Top = 158
      Width = 137
      Height = 21
      ReadOnly = True
      TabOrder = 3
      Text = '127.0.0.1'
    end
    object nomee: TEdit
      Left = 160
      Top = 192
      Width = 138
      Height = 24
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -12
      Font.Name = 'Arial Narrow'
      Font.Style = [fsBold, fsUnderline]
      ParentFont = False
      TabOrder = 4
    end
  end
  object Ativar: TButton
    Left = 173
    Top = 264
    Width = 76
    Height = 49
    Hint = 'Ativar/Desativar Servidor'
    Caption = 'Ativar'
    ParentShowHint = False
    ShowHint = True
    TabOrder = 1
    OnClick = AtivarClick
  end
end
