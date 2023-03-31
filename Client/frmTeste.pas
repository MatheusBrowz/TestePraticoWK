unit frmTeste;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Data.DB, Datasnap.DBClient;

type
  TForm1 = class(TForm)
    Memo1: TMemo;
    Button1: TButton;
    ClientDataSet1: TClientDataSet;
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

uses dmPrincipal, serverClasses;

procedure TForm1.Button1Click(Sender: TObject);
begin
  ClientDataSet1.Close;
  ClientDataSet1.Open;
end;

end.
