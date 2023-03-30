object dmPrincipal: TdmPrincipal
  OldCreateOrder = False
  Height = 296
  Width = 615
  object DataSnapConnection: TSQLConnection
    ConnectionName = 'DataSnapCONNECTION'
    DriverName = 'DataSnap'
    LoginPrompt = False
    Params.Strings = (
      'DriverUnit=Data.DBXDataSnap'
      'CommunicationProtocol=tcp/ip'
      'DatasnapContext=datasnap/'
      
        'DriverAssemblyLoader=Borland.Data.TDBXClientDriverLoader,Borland' +
        '.Data.DbxClientDriver,Version=22.0.0.0,Culture=neutral,PublicKey' +
        'Token=91d62ebb5b0d1b1b'
      'DriverName=DataSnap'
      'HostName=localhost'
      'port=511'
      'DSAuthenticationUser=connection'
      'DSAuthenticationPassword=password'
      'DBHostName=localhost'
      'DBName=DataBaseTeste'
      'DBUserName=postgres'
      'DBPassword=1234'
      'Filters={}')
    Left = 91
    Top = 26
    UniqueId = '{9ED9B995-3743-46ED-82CC-9913B612D009}'
  end
  object ServerProvider: TDSProviderConnection
    ServerClassName = 'TserverModule'
    SQLConnection = DataSnapConnection
    Left = 87
    Top = 104
  end
end
