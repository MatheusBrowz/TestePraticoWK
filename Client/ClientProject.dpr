program ClientProject;

uses
  Vcl.Forms,
  serverClasses in 'serverClasses.pas',
  classe.pessoa in '..\Classes\classe.pessoa.pas',
  classe.endereco in '..\Classes\classe.endereco.pas',
  classe.base in '..\Classes\classe.base.pas',
  frmPessoas in 'forms\frmPessoas.pas' {Form1},
  Consultas.Pessoa in '..\Consultas\Consultas.Pessoa.pas',
  uDmPrincipal in 'uDmPrincipal.pas' {dmPrincipal: TDataModule};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.CreateForm(TdmPrincipal, dmPrincipal);
  Application.Run;
end.
