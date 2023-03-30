unit uDmPrincipal;

interface

uses
  System.SysUtils,
  System.Classes,
  Data.DBXDataSnap,
  Data.DBXCommon,
  IPPeerClient, Datasnap.DBClient, Datasnap.DSConnect, Data.DB, Data.SqlExpr,
  FireDAC.Phys.PGDef, FireDAC.Stan.Intf, FireDAC.Phys, FireDAC.Phys.PG,
  Winapi.Windows, Winapi.Messages, System.Variants, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ComCtrls, Vcl.StdCtrls, Vcl.ExtCtrls,
  Vcl.Grids, Vcl.DBGrids, Vcl.Mask, Vcl.DBCtrls, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.VCLUI.Wait, FireDAC.Stan.Param,
  FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.DApt, Datasnap.Provider,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TdmPrincipal = class(TDataModule)
    DataSnapConnection: TSQLConnection;
    ServerProvider: TDSProviderConnection;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dmPrincipal: TdmPrincipal;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

uses serverClasses;

{$R *.dfm}

end.
