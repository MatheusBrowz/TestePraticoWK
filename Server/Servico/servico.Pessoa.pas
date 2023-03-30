unit servico.Pessoa;

interface

uses
  FireDAC.Comp.Client;

type

  TServicoPessoa = class
  public
    class function GravarPessoa(Connection : TFDConnection; pessoa : String): Boolean;
  end;

implementation

{ TServicoPessoa }

class function TServicoPessoa.GravarPessoa(Connection: TFDConnection;
  pessoa: String): Boolean;
begin

end;

end.
