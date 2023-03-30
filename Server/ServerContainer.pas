unit ServerContainer;

interface

uses
  System.SysUtils,
  System.Classes,
  Datasnap.DSTCPServerTransport,
  Datasnap.DSHTTPCommon,
  Datasnap.DSHTTP,
  Datasnap.DSServer,
  Datasnap.DSCommonServer,
  IPPeerServer,
  IPPeerAPI,
  Datasnap.DSAuth,
  System.Generics.Collections,
  IdTCPConnection, FireDAC.Phys.PGDef, FireDAC.Stan.Intf, FireDAC.Phys,
  FireDAC.Phys.PG;

type
  TServerContainer1 = class(TDataModule)
    DSServer1: TDSServer;
    DSTCPServerTransport1: TDSTCPServerTransport;
    serverClasses: TDSServerClass;
    procedure serverClassesGetClass(DSServerClass: TDSServerClass;
      var PersistentClass: TPersistentClass);
    procedure DSTCPServerTransport1Connect(Event: TDSTCPConnectEventObject);
  private
    procedure AddConnectionToList(Conn: TIdTCPConnection; Channel: TDSTCPChannel);
  public
    FConnections: TObjectDictionary<TIdTCPConnection,TDSTCPChannel>;
    FObjConnections:TObjectDictionary<String,TIdTCPConnection>;
  end;

var
  ServerContainer1: TServerContainer1;

implementation


{$R *.dfm}

uses
  ServerModule;

procedure TServerContainer1.AddConnectionToList(Conn: TIdTCPConnection;
  Channel: TDSTCPChannel);
var
  InfoStr: String;
begin
  if (Conn <> nil) and (Channel <> nil) and (Channel.ChannelInfo <> nil) and
     (Channel.ChannelInfo.ClientInfo.IpAddress <> EmptyStr) then
  begin
    with Channel.ChannelInfo.ClientInfo do
    begin
      InfoStr := Format('%s:%s', [IpAddress, ClientPort]);
    end;
    FObjConnections.Add(InfoStr, Conn);
  end;
end;

procedure TServerContainer1.DSTCPServerTransport1Connect(
  Event: TDSTCPConnectEventObject);
begin
  Event.Channel.EnableKeepAlive(60000);

  if FConnections = nil then
    Exit;

  System.TMonitor.Enter(FConnections);
  try
    FConnections.Add(TIdTCPConnection(Event.Connection), Event.Channel);
  finally
    System.TMonitor.Exit(FConnections);
  end;

  AddConnectionToList(TIdTCPConnection(Event.Connection), Event.Channel);
end;

procedure TServerContainer1.serverClassesGetClass(
  DSServerClass: TDSServerClass; var PersistentClass: TPersistentClass);
begin
  PersistentClass := ServerModule.TServerModule;
end;

end.

