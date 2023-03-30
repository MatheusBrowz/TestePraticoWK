unit Validador.Pessoa;

interface

type

  TValidadorPessoa = class
  public
    class function ValidarPessoa(pessoa : String; var erros : String): Boolean;
  end;

implementation

uses
  classe.pessoa, System.SysUtils, System.Classes, REST.Json;

{ TValidadorPessoa }

class function TValidadorPessoa.ValidarPessoa(pessoa: String;
  var erros: String): Boolean;
var
  objPessoa : TPessoa;
  slListaErros : TStringList;
begin
  Result := false;
  objPessoa := TPessoa.Create;
  slListaErros := TStringList.Create;

  try
    try
      slListaErros.Clear;

      try
        objPessoa := TJson.JsonToObject<TPessoa>(pessoa)
      except
        raise Exception.Create('A pessoa informada n�o cont�m os dados de acordo com o esperado, verificar as informa��es!');
      end;

      {$REGION '. Pessoa .'}
      if (objPessoa.natureza < 0) or
         (objPessoa.natureza > 32767) then
      begin
        slListaErros.Add('Natureza informada tem um tamanho inv�lido, deve ser maior que 0 e menor que 32767');
      end;

      if (objPessoa.numeroDocumento.Trim.IsEmpty()) or
         (Length(objPessoa.numeroDocumento.Trim) > 20) then
      begin
        slListaErros.Add('N�mero de documento informado � inv�lido, n�o pode estar vazio e deve conter no m�ximo 20 caracteres.');
      end;

      if (objPessoa.nome.Trim.IsEmpty()) or
         (Length(objPessoa.nome.Trim) > 20) then
      begin
        slListaErros.Add('Nome informado � inv�lido, n�o pode estar vazio e deve conter no m�ximo 100 caracteres.');
      end;

      if (objPessoa.sobrenome.Trim.IsEmpty()) or
         (Length(objPessoa.sobrenome.Trim) > 20) then
      begin
        slListaErros.Add('Sobrenome informado � inv�lido, n�o pode estar vazio e deve conter no m�ximo 100 caracteres.');
      end;
      {$ENDREGION}

      {$REGION '. Endere�o .'}
      if not Assigned(objPessoa.endereco) then
      begin
        slListaErros.Add('Os dados de endere�o s�o obrigat�rios!');
      end
      else
      begin
        if Length(objPessoa.nome.Trim) > 15 then
        begin
          slListaErros.Add('O CEP informado � inv�lido, ele deve conter no m�ximo 15 caracteres.');
        end;
      end;
      {$ENDREGION}

      if slListaErros.Count > 0 then
      begin
        raise Exception.Create(slListaErros.Text);
      end;

      Result := true;
    except
      on E:Exception do
      begin
        Result := false;
        erros := E.Message;
      end;
    end;
  finally
    FreeAndNil(objPessoa);
    FreeAndNil(slListaErros);
  end;
end;

end.
