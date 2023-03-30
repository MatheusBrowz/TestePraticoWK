unit Consultas.Pessoa;

interface

type

  TConsultasPessoas = class
  public
    class function SqlConsultaPessoa(nome, documento : String): String;
    class function SqlConsultaEnderecoPessoa(idPessoa : Integer): String;
  end;

implementation

uses
  System.Classes, System.SysUtils;

{ TConsultasPessoas }

class function TConsultasPessoas.SqlConsultaEnderecoPessoa(
  idPessoa: Integer): String;
var
  slSql : TStringList;
begin
  slSql := TStringList.Create;

  try
    slSql.Clear;
    slSql.Add('select endereco.*, endereco_integracao.dsuf, endereco_integracao.nmcidade, endereco_integracao.nmbairro, endereco_integracao.nmlogradouro, endereco_integracao.dscomplemento  ');
    slSql.Add('from endereco');
    slSql.Add('left join endereco_integracao on (endereco_integracao.idendereco = endereco.idendereco)');
    slSql.Add('where endereco.idpessoa = ' + idPessoa.ToString());

    Result := slSql.Text;
  finally
    FreeAndNil(slSql);
  end;
end;

class function TConsultasPessoas.SqlConsultaPessoa(nome,
  documento: String): String;
var
  slSql : TStringList;
begin
  slSql := TStringList.Create;

  try
    slSql.Clear;
    slSql.Add('select pessoa.* from pessoa');
    slSql.Add('where idpessoa > 0');

    if not nome.Trim.IsEmpty() then
    begin
      slSql.Add('  and nmprimeiro like ''' + nome.Trim + '%'' ');
    end;

    if not documento.Trim.IsEmpty() then
    begin
      slSql.Add('  and dsdocumento like ''' + documento.Trim + '%'' ');
    end;

    Result := slSql.Text;
  finally
    FreeAndNil(slSql);
  end;
end;

end.
