//
// Created by the DataSnap proxy generator.
// 30/03/2023 03:04:07
//

unit serverClasses;

interface

uses System.JSON, Data.DBXCommon, Data.DBXClient, Data.DBXDataSnap, Data.DBXJSON, Datasnap.DSProxy, System.Classes, System.SysUtils, Data.DB, Data.SqlExpr, Data.DBXDBReaders, Data.DBXCDSReaders, Data.DBXJSONReflect;

type
  TServerModuleClient = class(TDSAdminClient)
  private
    FPGDriverLinkDriverCreatedCommand: TDBXCommand;
    FInsertCommand: TDBXCommand;
    FUpdateCommand: TDBXCommand;
    FDeleteCommand: TDBXCommand;
    FCadastrarLotePessoasCommand: TDBXCommand;
    FAtualizarEnderecoViaCepCommand: TDBXCommand;
  public
    constructor Create(ADBXConnection: TDBXConnection); overload;
    constructor Create(ADBXConnection: TDBXConnection; AInstanceOwner: Boolean); overload;
    destructor Destroy; override;
    procedure PGDriverLinkDriverCreated(Sender: TObject);
    function Insert(pessoa: string; var erros: string): Boolean;
    function Update(pessoa: string; var erros: string): Boolean;
    function Delete(idPessoa: Integer; var erros: string): Boolean;
    function CadastrarLotePessoas(dados: string; var erros: string): Boolean;
    procedure AtualizarEnderecoViaCep;
  end;

implementation

procedure TServerModuleClient.PGDriverLinkDriverCreated(Sender: TObject);
begin
  if FPGDriverLinkDriverCreatedCommand = nil then
  begin
    FPGDriverLinkDriverCreatedCommand := FDBXConnection.CreateCommand;
    FPGDriverLinkDriverCreatedCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FPGDriverLinkDriverCreatedCommand.Text := 'TServerModule.PGDriverLinkDriverCreated';
    FPGDriverLinkDriverCreatedCommand.Prepare;
  end;
  if not Assigned(Sender) then
    FPGDriverLinkDriverCreatedCommand.Parameters[0].Value.SetNull
  else
  begin
    FMarshal := TDBXClientCommand(FPGDriverLinkDriverCreatedCommand.Parameters[0].ConnectionHandler).GetJSONMarshaler;
    try
      FPGDriverLinkDriverCreatedCommand.Parameters[0].Value.SetJSONValue(FMarshal.Marshal(Sender), True);
      if FInstanceOwner then
        Sender.Free
    finally
      FreeAndNil(FMarshal)
    end
  end;
  FPGDriverLinkDriverCreatedCommand.ExecuteUpdate;
end;

function TServerModuleClient.Insert(pessoa: string; var erros: string): Boolean;
begin
  if FInsertCommand = nil then
  begin
    FInsertCommand := FDBXConnection.CreateCommand;
    FInsertCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FInsertCommand.Text := 'TServerModule.Insert';
    FInsertCommand.Prepare;
  end;
  FInsertCommand.Parameters[0].Value.SetWideString(pessoa);
  FInsertCommand.Parameters[1].Value.SetWideString(erros);
  FInsertCommand.ExecuteUpdate;
  erros := FInsertCommand.Parameters[1].Value.GetWideString;
  Result := FInsertCommand.Parameters[2].Value.GetBoolean;
end;

function TServerModuleClient.Update(pessoa: string; var erros: string): Boolean;
begin
  if FUpdateCommand = nil then
  begin
    FUpdateCommand := FDBXConnection.CreateCommand;
    FUpdateCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FUpdateCommand.Text := 'TServerModule.Update';
    FUpdateCommand.Prepare;
  end;
  FUpdateCommand.Parameters[0].Value.SetWideString(pessoa);
  FUpdateCommand.Parameters[1].Value.SetWideString(erros);
  FUpdateCommand.ExecuteUpdate;
  erros := FUpdateCommand.Parameters[1].Value.GetWideString;
  Result := FUpdateCommand.Parameters[2].Value.GetBoolean;
end;

function TServerModuleClient.Delete(idPessoa: Integer; var erros: string): Boolean;
begin
  if FDeleteCommand = nil then
  begin
    FDeleteCommand := FDBXConnection.CreateCommand;
    FDeleteCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FDeleteCommand.Text := 'TServerModule.Delete';
    FDeleteCommand.Prepare;
  end;
  FDeleteCommand.Parameters[0].Value.SetInt32(idPessoa);
  FDeleteCommand.Parameters[1].Value.SetWideString(erros);
  FDeleteCommand.ExecuteUpdate;
  erros := FDeleteCommand.Parameters[1].Value.GetWideString;
  Result := FDeleteCommand.Parameters[2].Value.GetBoolean;
end;

function TServerModuleClient.CadastrarLotePessoas(dados: string; var erros: string): Boolean;
begin
  if FCadastrarLotePessoasCommand = nil then
  begin
    FCadastrarLotePessoasCommand := FDBXConnection.CreateCommand;
    FCadastrarLotePessoasCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FCadastrarLotePessoasCommand.Text := 'TServerModule.CadastrarLotePessoas';
    FCadastrarLotePessoasCommand.Prepare;
  end;
  FCadastrarLotePessoasCommand.Parameters[0].Value.SetWideString(dados);
  FCadastrarLotePessoasCommand.Parameters[1].Value.SetWideString(erros);
  FCadastrarLotePessoasCommand.ExecuteUpdate;
  erros := FCadastrarLotePessoasCommand.Parameters[1].Value.GetWideString;
  Result := FCadastrarLotePessoasCommand.Parameters[2].Value.GetBoolean;
end;

procedure TServerModuleClient.AtualizarEnderecoViaCep;
begin
  if FAtualizarEnderecoViaCepCommand = nil then
  begin
    FAtualizarEnderecoViaCepCommand := FDBXConnection.CreateCommand;
    FAtualizarEnderecoViaCepCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FAtualizarEnderecoViaCepCommand.Text := 'TServerModule.AtualizarEnderecoViaCep';
    FAtualizarEnderecoViaCepCommand.Prepare;
  end;
  FAtualizarEnderecoViaCepCommand.ExecuteUpdate;
end;

constructor TServerModuleClient.Create(ADBXConnection: TDBXConnection);
begin
  inherited Create(ADBXConnection);
end;

constructor TServerModuleClient.Create(ADBXConnection: TDBXConnection; AInstanceOwner: Boolean);
begin
  inherited Create(ADBXConnection, AInstanceOwner);
end;

destructor TServerModuleClient.Destroy;
begin
  FPGDriverLinkDriverCreatedCommand.DisposeOf;
  FInsertCommand.DisposeOf;
  FUpdateCommand.DisposeOf;
  FDeleteCommand.DisposeOf;
  FCadastrarLotePessoasCommand.DisposeOf;
  FAtualizarEnderecoViaCepCommand.DisposeOf;
  inherited;
end;

end.

