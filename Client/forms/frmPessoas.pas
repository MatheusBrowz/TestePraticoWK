unit frmPessoas;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ComCtrls, Data.DB,
  Vcl.ExtCtrls, Vcl.Grids, Vcl.DBGrids, Datasnap.DBClient, Vcl.Menus, classe.pessoa, classe.endereco;

type
  TForm1 = class(TForm)
    pgPrincipal: TPageControl;
    tsPessoas: TTabSheet;
    tsPesquisa: TTabSheet;
    tsDados: TTabSheet;
    btnPesquisa: TButton;
    Label1: TLabel;
    Label2: TLabel;
    edtPesquisaNome: TEdit;
    edtPesquisaDocumento: TEdit;
    DBGrid1: TDBGrid;
    DBGrid2: TDBGrid;
    pnEndereço: TPanel;
    Panel1: TPanel;
    cdsPessoa: TClientDataSet;
    dsPessoa: TDataSource;
    cdsEndereco: TClientDataSet;
    dsEndereco: TDataSource;
    pnBotoesAcoes: TPanel;
    btnIncluir: TButton;
    btnEditar: TButton;
    btnExcluir: TButton;
    Label3: TLabel;
    edtPrimeiroNome: TEdit;
    edtSobrenome: TEdit;
    Label4: TLabel;
    edtDocumento: TEdit;
    Label5: TLabel;
    Label6: TLabel;
    edtNatureza: TEdit;
    edtDataInclusao: TEdit;
    Label7: TLabel;
    Label8: TLabel;
    edtCep: TEdit;
    edtLogradouro: TEdit;
    Label9: TLabel;
    Label10: TLabel;
    edtCidade: TEdit;
    edtBairro: TEdit;
    Label11: TLabel;
    Label12: TLabel;
    edtComplemento: TEdit;
    edtUF: TEdit;
    Label13: TLabel;
    Panel2: TPanel;
    btnGravar: TButton;
    btnCancelar: TButton;
    btnIncluirLote: TButton;
    mmOpcoes: TPopupMenu;
    miIncluirLote: TMenuItem;
    miAtualizarEnderecos: TMenuItem;
    Panel3: TPanel;
    Label14: TLabel;
    OpenDialog1: TOpenDialog;
    procedure btnPesquisaClick(Sender: TObject);
    procedure cdsPessoaAfterScroll(DataSet: TDataSet);
    procedure btnIncluirClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnEditarClick(Sender: TObject);
    procedure btnGravarClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure pgPrincipalChanging(Sender: TObject; var AllowChange: Boolean);
    procedure Label14Click(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
    procedure miIncluirLoteClick(Sender: TObject);
    procedure btnIncluirLoteClick(Sender: TObject);
    procedure miAtualizarEnderecosClick(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
  private
    Finclusao: Boolean;
    FatualizandoCepViaCep: Boolean;

    procedure Setinclusao(const Value: Boolean);
    function GetTempDir(): String;
    procedure OpenPopup;
    procedure SetatualizandoCepViaCep(const Value: Boolean);
    procedure DoTerminate(Sender: TObject);
    { Private declarations }
  public
    property inclusao : Boolean read Finclusao write Setinclusao;
    property atualizandoCepViaCep : Boolean read FatualizandoCepViaCep write SetatualizandoCepViaCep;

    procedure CarregarCamposEdicao();
    procedure LimparCamposEdicao();
    procedure CarregarPessoa(pessoa : TPessoa);
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

uses uDmPrincipal, Consultas.Pessoa, serverClasses, Winapi.ShellAPI;

procedure TForm1.btnCancelarClick(Sender: TObject);
begin
  LimparCamposEdicao;
  pgPrincipal.ActivePage := tsPessoas;
end;

procedure TForm1.btnEditarClick(Sender: TObject);
begin
  inclusao := false;
  pgPrincipal.ActivePage := tsDados;
  CarregarCamposEdicao();
end;

procedure TForm1.btnExcluirClick(Sender: TObject);
var
  smServerMethods : TServerModuleClient;
  erros : String;
begin
  if cdsPessoa.IsEmpty() then
  begin
    ShowMessage('Não existem registros para exclusão!');
    Exit;
  end;

  if Application.MessageBox(PChar('Confirma a exclusão do registro?'), 'Pergunta', MB_YESNO) = IDYES then
  begin
    smServerMethods := TServerModuleClient.Create(dmPrincipal.DataSnapConnection.DBXConnection);

    try
      if not smServerMethods.Delete(cdsPessoa.FieldByName('idpessoa').AsInteger, erros) then
      begin
        ShowMessage('Não foi possível deletar a pessoa: ' + erros);
        Exit;
      end;

      cdsPessoa.Refresh;
      ShowMessage('Pessoa excluída com sucesso!');
    finally
      FreeAndNil(smServerMethods);
    end;
  end;
end;

procedure TForm1.btnGravarClick(Sender: TObject);
var
  smServerMethods : TServerModuleClient;
  objPessoa : TPessoa;
  erros : String;
  slErros : TStringList;
begin
  smServerMethods := TServerModuleClient.Create(dmPrincipal.DataSnapConnection.DBXConnection);
  objPessoa := TPessoa.Create;

  try
    CarregarPessoa(objPessoa);

    if inclusao then
    begin
      if not smServerMethods.Insert(
        objPessoa.ToStandardJson(),
        erros
      ) then
      begin
        slErros := TStringList.Create;

        try
          slErros.Text := erros;
          var sCaminhoArquivo : String := ExtractFilePath(Application.ExeName) + 'logsErro_' + FormatDateTime('HH-NN-SS', Now) + '.txt';
          slErros.SaveToFile(sCaminhoArquivo);

          if Application.MessageBox(PChar('Não foi possível cadastrar a pessoa, deseja visualizar o retorno?'), 'Pergunta', MB_YESNO) = IDYES then
          begin
            ShellExecute(Application.Handle, nil, PChar(sCaminhoArquivo), nil, nil, SW_SHOWNORMAL);
          end;
        finally
          FreeAndNil(slErros);
        end;
      end
      else
      begin
        cdsPessoa.Refresh;
        pgPrincipal.ActivePage := tsPessoas;
      end;
    end
    else
    begin
      if not smServerMethods.Update(
        objPessoa.ToStandardJson(),
        erros
      ) then
      begin
        slErros := TStringList.Create;

        try
          slErros.Text := erros;
          var sCaminhoArquivo : String := ExtractFilePath(Application.ExeName) + 'logsErro_' + FormatDateTime('HH-NN-SS', Now) + '.txt';
          slErros.SaveToFile(sCaminhoArquivo);

          if Application.MessageBox(PChar('Não foi possível editar a pessoa, deseja visualizar o retorno?'), 'Pergunta', MB_YESNO) = IDYES then
          begin
            ShellExecute(Application.Handle, nil, PChar(sCaminhoArquivo), nil, nil, SW_SHOWNORMAL);
          end;
        finally
          FreeAndNil(slErros);
        end;
      end
      else
      begin
        cdsPessoa.Refresh;
        pgPrincipal.ActivePage := tsPessoas;
      end;
    end;
  finally
    FreeAndNil(objPessoa);
    FreeAndNil(smServerMethods);
  end;
end;

procedure TForm1.btnIncluirClick(Sender: TObject);
begin
  inclusao := true;
  pgPrincipal.ActivePage := tsDados;
end;

procedure TForm1.btnIncluirLoteClick(Sender: TObject);
begin
  mmOpcoes.Popup(btnIncluirLote.Left, btnIncluirLote.Top);
end;

procedure TForm1.btnPesquisaClick(Sender: TObject);
begin
  cdsPessoa.Close;
  cdsPessoa.CommandText := TConsultasPessoas.SqlConsultaPessoa(String(edtPesquisaNome.Text).Trim, String(edtPesquisaDocumento.Text));
  cdsPessoa.Open;

  if cdsPessoa.IsEmpty() then
  begin
    ShowMessage('Não foi possível encontrar uma pessoa com os filtros informados!');
    Exit;
  end;

  pgPrincipal.ActivePage := tsPessoas;
end;

procedure TForm1.CarregarCamposEdicao;
begin
  edtPrimeiroNome.Text := cdsPessoa.FieldByName('nmprimeiro').AsString;
  edtSobrenome.Text := cdsPessoa.FieldByName('nmsegundo').AsString;
  edtDocumento.Text := cdsPessoa.FieldByName('dsdocumento').AsString;
  edtNatureza.Text := cdsPessoa.FieldByName('flnatureza').AsString;

  if cdsPessoa.FieldByName('dtregistro').AsDateTime > 0 then
  begin
    edtDataInclusao.Text := FormatDateTime('DD/MM/YYYY', cdsPessoa.FieldByName('dtregistro').AsDateTime);
  end;

  edtCep.Text := cdsEndereco.FieldByName('dscep').AsString;
  edtLogradouro.Text := cdsEndereco.FieldByName('nmlogradouro').AsString;
  edtCidade.Text := cdsEndereco.FieldByName('nmcidade').AsString;
  edtUF.Text := cdsEndereco.FieldByName('dsuf').AsString;
  edtBairro.Text := cdsEndereco.FieldByName('nmbairro').AsString;
  edtComplemento.Text := cdsEndereco.FieldByName('dscomplemento').AsString;
end;

procedure TForm1.CarregarPessoa(pessoa: TPessoa);
begin
  if not inclusao then
  begin
    pessoa.id := cdsPessoa.FieldByName('idpessoa').AsInteger;
  end;

  pessoa.natureza := StrToIntDef(edtNatureza.Text, 0);
  pessoa.numeroDocumento := edtDocumento.Text;
  pessoa.nome := edtPrimeiroNome.Text;
  pessoa.sobrenome := edtSobrenome.Text;

  if not Assigned(pessoa.endereco) then
  begin
    pessoa.endereco := TEndereco.Create;
  end;

  pessoa.endereco.cep := edtCep.Text;
end;

procedure TForm1.cdsPessoaAfterScroll(DataSet: TDataSet);
begin
  cdsEndereco.Close;
  cdsEndereco.CommandText := TConsultasPessoas.SqlConsultaEnderecoPessoa(cdsPessoa.FieldByName('idpessoa').AsInteger);
  cdsEndereco.Open;
end;

procedure TForm1.DoTerminate(Sender: TObject);
begin
  miAtualizarEnderecos.Enabled := true;
  atualizandoCepViaCep := false;

  ShowMessage('Atualização de cep pelo viacep finalizou!');
end;

procedure TForm1.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  if atualizandoCepViaCep then
  begin
    if Application.MessageBox(PChar('O processo de atualização de CEP está rodando no momento, deseja realmente sair?'), 'Pergunta', MB_YESNO) = IDYES then
    begin
      CanClose := true;
      Exit;
    end;
  end;

  CanClose := true;
end;

procedure TForm1.FormShow(Sender: TObject);
begin
  pgPrincipal.ActivePage := tsPesquisa;
end;

function TForm1.GetTempDir: String;
var
  pEnvStrings: Pointer;

  function API_GetEnvironmentVariable(EnVar: String): String;
  var
    pEnvStrings: Pointer;
  begin
    pEnvStrings := GetEnvironmentStrings;
    SetLength(Result, 256);
    SetLength(Result, GetEnvironmentVariable(PChar(EnVar), PChar(Result), 256));
    FreeEnvironmentStrings(pEnvStrings);
  end;
begin
  Result := API_GetEnvironmentVariable('TEMP');
end;

procedure TForm1.Label14Click(Sender: TObject);
begin
  pgPrincipal.ActivePage := tsPesquisa;
end;

procedure TForm1.LimparCamposEdicao;
begin
  edtPrimeiroNome.Clear;
  edtSobrenome.Clear;
  edtDocumento.Clear;
  edtNatureza.Clear;
  edtDataInclusao.Clear;
  edtCep.Clear;
  edtLogradouro.Clear;
  edtCidade.Clear;
  edtUF.Clear;
  edtBairro.Clear;
  edtComplemento.Clear;
end;

procedure TForm1.miAtualizarEnderecosClick(Sender: TObject);
begin
  atualizandoCepViaCep := true;
  miAtualizarEnderecos.Enabled := false;
  TThread.CreateAnonymousThread(
    procedure
    var
      smServerMethods : TServerModuleClient;
    begin
      smServerMethods := TServerModuleClient.Create(dmPrincipal.DataSnapConnection.DBXConnection);

      try
        smServerMethods.AtualizarEnderecoViaCep();
      finally
        FreeAndNil(smServerMethods);

        TThread.Synchronize(
          TThread.CurrentThread,
          procedure
          begin
            DoTerminate(nil);
          end
        );
      end;
    end
  ).Start;
end;

procedure TForm1.miIncluirLoteClick(Sender: TObject);
var
  smServerMethods : TServerModuleClient;
  slArquivo,
  slErros : TStringList;
  errosImportacao : String;
begin
  if OpenDialog1.Execute then
  begin
    smServerMethods := TServerModuleClient.Create(dmPrincipal.DataSnapConnection.DBXConnection);
    slArquivo := TStringList.Create;

    try
      slArquivo.Clear;
      slArquivo.LoadFromFile(OpenDialog1.FileName);

      if slArquivo.Text.Trim.IsEmpty() then
      begin
        ShowMessage('Não foi possível carregar o arquivo!');
        Exit;
      end;

      if not smServerMethods.CadastrarLotePessoas(slArquivo.Text, errosImportacao) then
      begin
        slErros := TStringList.Create;

        try
          slErros.Text := errosImportacao;
          var sCaminhoArquivo : String := ExtractFilePath(Application.ExeName) + 'logsErro_' + FormatDateTime('HH-NN-SS', Now) + '.txt';
          slErros.SaveToFile(sCaminhoArquivo);

          if Application.MessageBox(PChar('Não foi possível importar o lote, deseja visualizar o retorno?'), 'Pergunta', MB_YESNO) = IDYES then
          begin
            ShellExecute(Application.Handle, nil, PChar(sCaminhoArquivo), nil, nil, SW_SHOWNORMAL);
          end;
        finally
          FreeAndNil(slErros);
        end;
      end;

      cdsPessoa.Refresh;

      ShowMessage('Lote importado com sucesso!');
    finally
      FreeAndNil(smServerMethods);
      FreeAndNIl(slArquivo);
    end;
  end;
end;

procedure TForm1.OpenPopup;
const
  WM_DX = WM_APP + 100;
  DXM_DROPDOWNPOPUPMENU = WM_DX + 52;
begin
  PostMessage(Handle, DXM_DROPDOWNPOPUPMENU, 0, 0);
end;

procedure TForm1.pgPrincipalChanging(Sender: TObject; var AllowChange: Boolean);
begin
  AllowChange := false;

  if (Sender is TButton) or
     (Sender is TLabel) then
  begin
    AllowChange := true;
  end;
end;

procedure TForm1.SetatualizandoCepViaCep(const Value: Boolean);
begin
  FatualizandoCepViaCep := Value;
end;

procedure TForm1.Setinclusao(const Value: Boolean);
begin
  Finclusao := Value;
end;

end.
