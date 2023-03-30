﻿object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Pessoas'
  ClientHeight = 436
  ClientWidth = 873
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Segoe UI'
  Font.Style = []
  OldCreateOrder = False
  OnCloseQuery = FormCloseQuery
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object pgPrincipal: TPageControl
    Left = 0
    Top = 0
    Width = 873
    Height = 436
    ActivePage = tsPesquisa
    Align = alClient
    TabOrder = 0
    OnChanging = pgPrincipalChanging
    ExplicitWidth = 852
    ExplicitHeight = 454
    object tsPesquisa: TTabSheet
      Caption = 'Pesquisa'
      ImageIndex = 1
      ExplicitWidth = 844
      ExplicitHeight = 426
      object Label1: TLabel
        Left = 32
        Top = 24
        Width = 107
        Height = 21
        Caption = 'Primeiro Nome'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
      end
      object Label2: TLabel
        Left = 32
        Top = 88
        Width = 81
        Height = 21
        Caption = 'Documento'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
      end
      object btnPesquisa: TButton
        Left = 640
        Top = 184
        Width = 175
        Height = 41
        Caption = 'Pesquisar'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = 11053224
        Font.Height = -19
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
        OnClick = btnPesquisaClick
      end
      object edtPesquisaNome: TEdit
        Left = 32
        Top = 51
        Width = 783
        Height = 29
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Segoe UI'
        Font.Style = []
        MaxLength = 100
        ParentFont = False
        TabOrder = 1
      end
      object edtPesquisaDocumento: TEdit
        Left = 32
        Top = 115
        Width = 783
        Height = 29
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Segoe UI'
        Font.Style = []
        MaxLength = 20
        ParentFont = False
        TabOrder = 2
      end
    end
    object tsPessoas: TTabSheet
      Caption = 'Pessoas'
      ExplicitWidth = 844
      ExplicitHeight = 426
      object DBGrid1: TDBGrid
        Left = 0
        Top = 82
        Width = 865
        Height = 98
        Align = alClient
        DataSource = dsPessoa
        ReadOnly = True
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'Segoe UI'
        TitleFont.Style = []
        Columns = <
          item
            Expanded = False
            FieldName = 'dsdocumento'
            Title.Caption = 'Documento'
            Width = 100
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'flnatureza'
            Title.Caption = 'Natureza'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'nmprimeiro'
            Title.Caption = 'Primeiro Nome'
            Width = 150
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'nmsegundo'
            Title.Caption = 'Segundo Nome'
            Width = 200
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'dtregistro'
            Title.Caption = 'Data de inclus'#227'o'
            Visible = True
          end>
      end
      object DBGrid2: TDBGrid
        Left = 0
        Top = 221
        Width = 865
        Height = 125
        Align = alBottom
        DataSource = dsEndereco
        ReadOnly = True
        TabOrder = 1
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'Segoe UI'
        TitleFont.Style = []
        Columns = <
          item
            Expanded = False
            FieldName = 'dscep'
            Title.Caption = 'CEP'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'dsuf'
            Title.Caption = 'UF'
            Width = 30
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'nmcidade'
            Title.Caption = 'Cidade'
            Width = 243
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'nmbairro'
            Title.Caption = 'Bairro'
            Width = 125
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'nmlogradouro'
            Title.Caption = 'Logradouro'
            Width = 200
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'dscomplemento'
            Title.Caption = 'Complemento'
            Visible = True
          end>
      end
      object pnEndereço: TPanel
        Left = 0
        Top = 180
        Width = 865
        Height = 41
        Align = alBottom
        Alignment = taLeftJustify
        BevelOuter = bvNone
        Caption = '   Endere'#231'o'
        Color = clWindow
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentBackground = False
        ParentFont = False
        TabOrder = 2
        ExplicitLeft = 328
        ExplicitTop = 200
        ExplicitWidth = 185
      end
      object Panel1: TPanel
        Left = 0
        Top = 41
        Width = 865
        Height = 41
        Align = alTop
        Alignment = taLeftJustify
        BevelOuter = bvNone
        Caption = '   Pessoa'
        Color = clWindow
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentBackground = False
        ParentFont = False
        TabOrder = 3
        ExplicitLeft = 328
        ExplicitTop = 200
        ExplicitWidth = 185
      end
      object pnBotoesAcoes: TPanel
        Left = 0
        Top = 346
        Width = 865
        Height = 62
        Align = alBottom
        Color = clWindow
        ParentBackground = False
        TabOrder = 4
        ExplicitTop = 352
        object btnIncluir: TButton
          Left = 16
          Top = 9
          Width = 137
          Height = 41
          Caption = 'Incluir'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Height = -16
          Font.Name = 'Segoe UI'
          Font.Style = [fsItalic]
          ParentFont = False
          TabOrder = 0
          OnClick = btnIncluirClick
        end
        object btnEditar: TButton
          Left = 159
          Top = 9
          Width = 137
          Height = 41
          Caption = 'Editar'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Height = -16
          Font.Name = 'Segoe UI'
          Font.Style = [fsItalic]
          ParentFont = False
          TabOrder = 1
          OnClick = btnEditarClick
        end
        object btnExcluir: TButton
          Left = 302
          Top = 9
          Width = 137
          Height = 41
          Caption = 'Excluir'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Height = -16
          Font.Name = 'Segoe UI'
          Font.Style = [fsItalic]
          ParentFont = False
          TabOrder = 2
          OnClick = btnExcluirClick
        end
        object btnIncluirLote: TButton
          Left = 696
          Top = 9
          Width = 145
          Height = 41
          Caption = 'Op'#231#245'es'
          DropDownMenu = mmOpcoes
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Height = -16
          Font.Name = 'Segoe UI'
          Font.Style = [fsItalic]
          ParentFont = False
          Style = bsSplitButton
          TabOrder = 3
          OnClick = btnIncluirLoteClick
        end
      end
      object Panel3: TPanel
        Left = 0
        Top = 0
        Width = 865
        Height = 41
        Align = alTop
        BevelOuter = bvNone
        Color = clWindow
        ParentBackground = False
        TabOrder = 5
        ExplicitTop = -6
        object Label14: TLabel
          Left = 15
          Top = 8
          Width = 172
          Height = 17
          Caption = '<- VOLTAR PARA PESQUISA'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold, fsItalic]
          ParentFont = False
          OnClick = Label14Click
        end
      end
    end
    object tsDados: TTabSheet
      Caption = 'Dados'
      ImageIndex = 2
      ExplicitLeft = 8
      ExplicitTop = 28
      object Label3: TLabel
        Left = 16
        Top = 16
        Width = 89
        Height = 17
        Caption = 'Primeiro Nome'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
      end
      object Label4: TLabel
        Left = 392
        Top = 16
        Width = 68
        Height = 17
        Caption = 'Sobrenome'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
      end
      object Label5: TLabel
        Left = 16
        Top = 64
        Width = 67
        Height = 17
        Caption = 'Documento'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
      end
      object Label6: TLabel
        Left = 392
        Top = 64
        Width = 53
        Height = 17
        Caption = 'Natureza'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
      end
      object Label7: TLabel
        Left = 578
        Top = 64
        Width = 97
        Height = 17
        Caption = 'Data de inclus'#227'o'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
      end
      object Label8: TLabel
        Left = 16
        Top = 144
        Width = 22
        Height = 17
        Caption = 'CEP'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
      end
      object Label9: TLabel
        Left = 152
        Top = 144
        Width = 70
        Height = 17
        Caption = 'Logradouro'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
      end
      object Label10: TLabel
        Left = 16
        Top = 200
        Width = 41
        Height = 17
        Caption = 'Cidade'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
      end
      object Label11: TLabel
        Left = 392
        Top = 200
        Width = 35
        Height = 17
        Caption = 'Bairro'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
      end
      object Label12: TLabel
        Left = 16
        Top = 256
        Width = 82
        Height = 17
        Caption = 'Complemento'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
      end
      object Label13: TLabel
        Left = 324
        Top = 200
        Width = 15
        Height = 17
        Caption = 'UF'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
      end
      object edtPrimeiroNome: TEdit
        Left = 16
        Top = 36
        Width = 361
        Height = 22
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Segoe UI'
        Font.Style = []
        MaxLength = 100
        ParentFont = False
        TabOrder = 0
      end
      object edtSobrenome: TEdit
        Left = 392
        Top = 36
        Width = 361
        Height = 22
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Segoe UI'
        Font.Style = []
        MaxLength = 100
        ParentFont = False
        TabOrder = 1
      end
      object edtDocumento: TEdit
        Left = 16
        Top = 84
        Width = 361
        Height = 22
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Segoe UI'
        Font.Style = []
        MaxLength = 20
        NumbersOnly = True
        ParentFont = False
        TabOrder = 2
      end
      object edtNatureza: TEdit
        Left = 392
        Top = 84
        Width = 175
        Height = 22
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Segoe UI'
        Font.Style = []
        MaxLength = 100
        NumbersOnly = True
        ParentFont = False
        TabOrder = 3
      end
      object edtDataInclusao: TEdit
        Left = 578
        Top = 84
        Width = 175
        Height = 22
        Color = clBtnFace
        Enabled = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Segoe UI'
        Font.Style = []
        MaxLength = 100
        ParentFont = False
        TabOrder = 4
      end
      object edtCep: TEdit
        Left = 16
        Top = 165
        Width = 121
        Height = 22
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Segoe UI'
        Font.Style = []
        MaxLength = 15
        NumbersOnly = True
        ParentFont = False
        TabOrder = 5
      end
      object edtLogradouro: TEdit
        Left = 152
        Top = 165
        Width = 601
        Height = 22
        Color = clBtnFace
        Enabled = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Segoe UI'
        Font.Style = []
        MaxLength = 100
        ParentFont = False
        TabOrder = 6
      end
      object edtCidade: TEdit
        Left = 16
        Top = 221
        Width = 297
        Height = 22
        Color = clBtnFace
        Enabled = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Segoe UI'
        Font.Style = []
        MaxLength = 100
        ParentFont = False
        TabOrder = 7
      end
      object edtBairro: TEdit
        Left = 392
        Top = 221
        Width = 361
        Height = 22
        Color = clBtnFace
        Enabled = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Segoe UI'
        Font.Style = []
        MaxLength = 50
        ParentFont = False
        TabOrder = 8
      end
      object edtComplemento: TEdit
        Left = 16
        Top = 275
        Width = 737
        Height = 22
        Color = clBtnFace
        Enabled = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Segoe UI'
        Font.Style = []
        MaxLength = 100
        ParentFont = False
        TabOrder = 9
      end
      object edtUF: TEdit
        Left = 324
        Top = 221
        Width = 53
        Height = 22
        Color = clBtnFace
        Enabled = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Segoe UI'
        Font.Style = []
        MaxLength = 50
        ParentFont = False
        TabOrder = 10
      end
      object Panel2: TPanel
        Left = 0
        Top = 352
        Width = 865
        Height = 56
        Align = alBottom
        BevelOuter = bvNone
        Color = clWindow
        ParentBackground = False
        TabOrder = 11
        object btnGravar: TButton
          Left = 19
          Top = 7
          Width = 137
          Height = 41
          Caption = 'Gravar'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Height = -16
          Font.Name = 'Segoe UI'
          Font.Style = [fsItalic]
          ParentFont = False
          TabOrder = 0
          OnClick = btnGravarClick
        end
        object btnCancelar: TButton
          Left = 162
          Top = 7
          Width = 137
          Height = 41
          Caption = 'Cancelar'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Height = -16
          Font.Name = 'Segoe UI'
          Font.Style = [fsItalic]
          ParentFont = False
          TabOrder = 1
          OnClick = btnCancelarClick
        end
      end
    end
  end
  object cdsPessoa: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspPesquisaPessoa'
    RemoteServer = dmPrincipal.ServerProvider
    AfterScroll = cdsPessoaAfterScroll
    Left = 568
    Top = 24
  end
  object dsPessoa: TDataSource
    DataSet = cdsPessoa
    Left = 576
    Top = 32
  end
  object cdsEndereco: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspPesquisaEndereco'
    RemoteServer = dmPrincipal.ServerProvider
    Left = 568
    Top = 136
  end
  object dsEndereco: TDataSource
    DataSet = cdsEndereco
    Left = 576
    Top = 144
  end
  object mmOpcoes: TPopupMenu
    Left = 440
    Top = 112
    object miIncluirLote: TMenuItem
      Caption = 'Incluir Lote'
      OnClick = miIncluirLoteClick
    end
    object miAtualizarEnderecos: TMenuItem
      Caption = 'Atualizar Endere'#231'os (ViaCEP)'
      OnClick = miAtualizarEnderecosClick
    end
  end
  object OpenDialog1: TOpenDialog
    Filter = '*.txt;*.nfs'
    InitialDir = 'C:\'
    Options = [ofHideReadOnly, ofAllowMultiSelect, ofEnableSizing]
    Left = 440
    Top = 248
  end
end
