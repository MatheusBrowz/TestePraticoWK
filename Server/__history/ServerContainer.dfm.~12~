object ServerContainer1: TServerContainer1
  OldCreateOrder = False
  Height = 271
  Width = 415
  object DSServer1: TDSServer
    Left = 96
    Top = 11
  end
  object DSTCPServerTransport1: TDSTCPServerTransport
    Port = 511
    Server = DSServer1
    Filters = <>
    OnConnect = DSTCPServerTransport1Connect
    Left = 96
    Top = 73
  end
  object serverClasses: TDSServerClass
    OnGetClass = serverClassesGetClass
    Server = DSServer1
    Left = 200
    Top = 11
  end
end
