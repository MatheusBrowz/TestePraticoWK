program ServerProject;

uses
  Vcl.Forms,
  Web.WebReq,
  System.SysUtils,
  IdHTTPWebBrokerBridge,
  ServerContainer in 'ServerContainer.pas' {ServerContainer1: TDataModule},
  ServerModule in 'ServerModule.pas' {serverModule: TDSServerModule},
  formServer in 'formServer.pas' {frmServerProject},
  classe.base in '..\Classes\classe.base.pas',
  classe.endereco in '..\Classes\classe.endereco.pas',
  classe.pessoa in '..\Classes\classe.pessoa.pas',
  Validador.Pessoa in 'Validador\Validador.Pessoa.pas',
  Util.Strings in '..\Utils\Util.Strings.pas',
  classe.viacep in '..\Classes\viacep\classe.viacep.pas', System.Classes;

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmServerProject, frmServerProject);
  Application.CreateForm(TServerContainer1, ServerContainer1);

  Application.Run;
end.

