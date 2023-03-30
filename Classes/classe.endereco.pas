unit classe.endereco;

interface

uses
  classe.base;

type

  TEndereco = class(TClasseBase)
  private
    FnomeBairro: String;
    Fuf: String;
    Fcomplemento: String;
    FnomeCidade: String;
    FnomeLogradouro: String;
    Fcep: string;
    Fid: Integer;

    procedure Setcomplemento(const Value: String);
    procedure SetnomeBairro(const Value: String);
    procedure SetnomeCidade(const Value: String);
    procedure SetnomeLogradouro(const Value: String);
    procedure Setuf(const Value: String);
    procedure Setcep(const Value: string);
    procedure Setid(const Value: Integer);
  public
    property id : Integer read Fid write Setid;
    property uf : String read Fuf write Setuf;
    property nomeCidade : String read FnomeCidade write SetnomeCidade;
    property nomeBairro : String read FnomeBairro write SetnomeBairro;
    property nomeLogradouro : String read FnomeLogradouro write SetnomeLogradouro;
    property complemento : String read Fcomplemento write Setcomplemento;
    property cep : string read Fcep write Setcep;
  end;

implementation
{ TEndereco }

procedure TEndereco.Setcep(const Value: string);
begin
  Fcep := Value;
end;

procedure TEndereco.Setcomplemento(const Value: String);
begin
  Fcomplemento := Value;
end;

procedure TEndereco.Setid(const Value: Integer);
begin
  Fid := Value;
end;

procedure TEndereco.SetnomeBairro(const Value: String);
begin
  FnomeBairro := Value;
end;

procedure TEndereco.SetnomeCidade(const Value: String);
begin
  FnomeCidade := Value;
end;

procedure TEndereco.SetnomeLogradouro(const Value: String);
begin
  FnomeLogradouro := Value;
end;

procedure TEndereco.Setuf(const Value: String);
begin
  Fuf := Value;
end;

end.
