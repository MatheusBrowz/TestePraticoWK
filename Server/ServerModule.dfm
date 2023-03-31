object serverModule: TserverModule
  OldCreateOrder = False
  Height = 334
  Width = 946
  object PGConnection: TFDConnection
    ConnectionName = 'PG'
    Params.Strings = (
      'Server=localhost'
      'User_Name=postgres'
      'Password=1234'
      'Database=DataBaseTeste'
      'DriverID=PG')
    Connected = True
    LoginPrompt = False
    BeforeConnect = PGConnectionBeforeConnect
    Left = 40
    Top = 16
  end
  object fdPessoa: TFDQuery
    Connection = PGConnection
    SQL.Strings = (
      'select pessoa.* from pessoa'
      'where 1 = 0')
    Left = 40
    Top = 240
    object fdPessoaidpessoa: TLargeintField
      FieldName = 'idpessoa'
      Origin = 'idpessoa'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object fdPessoaflnatureza: TSmallintField
      FieldName = 'flnatureza'
      Origin = 'flnatureza'
      ProviderFlags = [pfInUpdate]
    end
    object fdPessoadsdocumento: TWideStringField
      FieldName = 'dsdocumento'
      Origin = 'dsdocumento'
      ProviderFlags = [pfInUpdate]
    end
    object fdPessoanmprimeiro: TWideStringField
      FieldName = 'nmprimeiro'
      Origin = 'nmprimeiro'
      ProviderFlags = [pfInUpdate]
      Size = 100
    end
    object fdPessoanmsegundo: TWideStringField
      FieldName = 'nmsegundo'
      Origin = 'nmsegundo'
      ProviderFlags = [pfInUpdate]
      Size = 100
    end
    object fdPessoadtregistro: TDateField
      FieldName = 'dtregistro'
      Origin = 'dtregistro'
      ProviderFlags = [pfInUpdate]
    end
  end
  object dspPessoa: TDataSetProvider
    DataSet = fdPessoa
    Options = [poAllowCommandText, poUseQuoteChar]
    Left = 48
    Top = 248
  end
  object PGDriverLink: TFDPhysPgDriverLink
    Left = 552
    Top = 16
  end
  object cdsPessoa: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftInteger
        Name = 'IDPESSOA'
        ParamType = ptInput
      end>
    ProviderName = 'dspPessoa'
    Left = 56
    Top = 256
  end
  object fdEndereco: TFDQuery
    Connection = PGConnection
    SQL.Strings = (
      'select endereco.* from endereco'
      'where idpessoa = :idpessoa')
    Left = 176
    Top = 16
    ParamData = <
      item
        Name = 'IDPESSOA'
        DataType = ftInteger
        ParamType = ptInput
      end>
    object fdEnderecoidendereco: TLargeintField
      FieldName = 'idendereco'
      Origin = 'idendereco'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object fdEnderecoidpessoa: TLargeintField
      FieldName = 'idpessoa'
      Origin = 'idpessoa'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object fdEnderecodscep: TWideStringField
      FieldName = 'dscep'
      Origin = 'dscep'
      ProviderFlags = [pfInUpdate]
      Size = 15
    end
  end
  object dspEndereco: TDataSetProvider
    DataSet = fdEndereco
    Left = 184
    Top = 24
  end
  object cdsEndereco: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftInteger
        Name = 'IDPESSOA'
        ParamType = ptInput
      end>
    ProviderName = 'dspEndereco'
    Left = 192
    Top = 32
  end
  object fdBuscaIdPessoa: TFDQuery
    Connection = PGConnection
    SQL.Strings = (
      'select pessoa.idpessoa from pessoa'
      'where dsdocumento = :dsdocumento'
      '  and flnatureza = :flnatureza'
      '  and nmprimeiro = :nmprimeiro'
      '  and nmsegundo = :nmsegundo')
    Left = 40
    Top = 88
    ParamData = <
      item
        Name = 'DSDOCUMENTO'
        DataType = ftString
        ParamType = ptInput
      end
      item
        Name = 'FLNATUREZA'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Name = 'NMPRIMEIRO'
        DataType = ftString
        ParamType = ptInput
      end
      item
        Name = 'NMSEGUNDO'
        DataType = ftString
        ParamType = ptInput
      end>
  end
  object dspBuscaIdPessoa: TDataSetProvider
    DataSet = fdBuscaIdPessoa
    Left = 48
    Top = 96
  end
  object cdsBuscaIdPessoa: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftString
        Name = 'DSDOCUMENTO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'FLNATUREZA'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'NMPRIMEIRO'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'NMSEGUNDO'
        ParamType = ptInput
      end>
    ProviderName = 'dspBuscaIdPessoa'
    Left = 56
    Top = 104
  end
  object fdPesquisaPessoa: TFDQuery
    Connection = PGConnection
    SQL.Strings = (
      'select pessoa.* from pessoa'
      'where 1 = 0')
    Left = 40
    Top = 160
    object fdPesquisaPessoaidpessoa: TLargeintField
      FieldName = 'idpessoa'
      Origin = 'idpessoa'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object fdPesquisaPessoaflnatureza: TSmallintField
      FieldName = 'flnatureza'
      Origin = 'flnatureza'
      ProviderFlags = [pfInUpdate]
    end
    object fdPesquisaPessoadsdocumento: TWideStringField
      FieldName = 'dsdocumento'
      Origin = 'dsdocumento'
      ProviderFlags = [pfInUpdate]
    end
    object fdPesquisaPessoanmprimeiro: TWideStringField
      FieldName = 'nmprimeiro'
      Origin = 'nmprimeiro'
      ProviderFlags = [pfInUpdate]
      Size = 100
    end
    object fdPesquisaPessoanmsegundo: TWideStringField
      FieldName = 'nmsegundo'
      Origin = 'nmsegundo'
      ProviderFlags = [pfInUpdate]
      Size = 100
    end
    object fdPesquisaPessoadtregistro: TDateField
      FieldName = 'dtregistro'
      Origin = 'dtregistro'
      ProviderFlags = [pfInUpdate]
    end
  end
  object dspPesquisaPessoa: TDataSetProvider
    DataSet = fdPesquisaPessoa
    Options = [poAllowCommandText, poUseQuoteChar]
    Left = 48
    Top = 168
  end
  object fdPesquisaEndereco: TFDQuery
    Connection = PGConnection
    SQL.Strings = (
      
        'select endereco.*, endereco_integracao.dsuf, endereco_integracao' +
        '.nmcidade, endereco_integracao.nmbairro, endereco_integracao.nml' +
        'ogradouro, endereco_integracao.dscomplemento  '
      'from endereco'
      
        'left join endereco_integracao on (endereco_integracao.idendereco' +
        ' = endereco.idendereco)'
      'where 1 = 0')
    Left = 176
    Top = 96
  end
  object dspPesquisaEndereco: TDataSetProvider
    DataSet = fdPesquisaEndereco
    Options = [poAllowCommandText, poUseQuoteChar]
    Left = 184
    Top = 104
  end
  object RESTClient1: TRESTClient
    Accept = 'application/json, text/plain;text/html;'
    AcceptCharset = 'utf-8, *;q=0.8'
    BaseURL = 'https://viacep.com.br/ws/07130000/json/'
    Params = <>
    RaiseExceptionOn500 = False
    Left = 392
    Top = 16
  end
  object RESTRequest1: TRESTRequest
    Accept = 'application/json, text/plain;text/html;'
    Client = RESTClient1
    Params = <
      item
        Kind = pkREQUESTBODY
        Options = [poDoNotEncode]
        Value = 
          '{'#13#10#9'"corpem_tms_oco": {'#13#10#9#9'"num_cli_ws": 13,'#13#10#9#9'"cnpj_trp_ws": "' +
          '09361610500110",'#13#10#9#9'"trp_oco": [{'#13#10#9#9#9'"cnpj_trp_oco": "242213680' +
          '00300",'#13#10#9#9#9'"razao_trp_oco": "RECIFE",'#13#10#9#9#9'"ocos": [{'#13#10#9#9#9#9'"cnpj' +
          '_trp_cte": "24221368000229",'#13#10#9#9#9#9'"num_cte": "",'#13#10#9#9#9#9'"sr_cte": ' +
          '"",'#13#10#9#9#9#9'"cnpj_emi_nfe": "09316105001109",'#13#10#9#9#9#9'"num_nfe": "0000' +
          '00116308",'#13#10#9#9#9#9'"sr_nfe": "1",'#13#10#9#9#9#9'"cod_oco": "01",'#13#10#9#9#9#9'"dt_oc' +
          'o": "06\/05\/2021 09:00",'#13#10#9#9#9#9'"obs_oco": "TESTE"'#13#10#9#9#9'}]'#13#10#9#9'}]'#13#10 +
          #9'}'#13#10'}'
        ContentType = ctAPPLICATION_JSON
      end>
    Response = RESTResponse1
    SynchronizedEvents = False
    Left = 392
    Top = 80
  end
  object RESTResponse1: TRESTResponse
    ContentType = 'application/x-www-form-urlencoded'
    ContentEncoding = 'UTF-8, *;q=0.8'
    Left = 392
    Top = 136
  end
  object fdEnderecoIntegracao: TFDQuery
    Connection = PGConnection
    SQL.Strings = (
      'select endereco_integracao.* from endereco_integracao'
      'where idendereco = :idendereco')
    Left = 176
    Top = 256
    ParamData = <
      item
        Name = 'IDENDERECO'
        DataType = ftInteger
        ParamType = ptInput
      end>
    object fdEnderecoIntegracaoidendereco: TLargeintField
      FieldName = 'idendereco'
      Origin = 'idendereco'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object fdEnderecoIntegracaodsuf: TWideStringField
      FieldName = 'dsuf'
      Origin = 'dsuf'
      ProviderFlags = [pfInUpdate]
      Size = 50
    end
    object fdEnderecoIntegracaonmcidade: TWideStringField
      FieldName = 'nmcidade'
      Origin = 'nmcidade'
      ProviderFlags = [pfInUpdate]
      Size = 100
    end
    object fdEnderecoIntegracaonmbairro: TWideStringField
      FieldName = 'nmbairro'
      Origin = 'nmbairro'
      ProviderFlags = [pfInUpdate]
      Size = 50
    end
    object fdEnderecoIntegracaonmlogradouro: TWideStringField
      FieldName = 'nmlogradouro'
      Origin = 'nmlogradouro'
      ProviderFlags = [pfInUpdate]
      Size = 100
    end
    object fdEnderecoIntegracaodscomplemento: TWideStringField
      FieldName = 'dscomplemento'
      Origin = 'dscomplemento'
      ProviderFlags = [pfInUpdate]
      Size = 100
    end
  end
  object dspEnderecoIntegracao: TDataSetProvider
    DataSet = fdEnderecoIntegracao
    Options = [poAllowCommandText, poUseQuoteChar]
    Left = 184
    Top = 264
  end
  object cdsEnderecoIntegracao: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftInteger
        Name = 'IDENDERECO'
        ParamType = ptInput
      end>
    ProviderName = 'dspEnderecoIntegracao'
    Left = 192
    Top = 272
  end
  object fdEnderecosParaIntegracao: TFDQuery
    Connection = PGConnection
    SQL.Strings = (
      'select endereco.idendereco, endereco.dscep from endereco')
    Left = 176
    Top = 176
  end
  object dspEnderecosParaIntegracao: TDataSetProvider
    DataSet = fdEnderecosParaIntegracao
    Options = [poAllowCommandText, poUseQuoteChar]
    Left = 184
    Top = 184
  end
  object cdsEnderecosParaIntegracao: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftInteger
        Name = 'IDENDERECO'
        ParamType = ptInput
      end>
    ProviderName = 'dspEnderecosParaIntegracao'
    Left = 192
    Top = 192
  end
end
