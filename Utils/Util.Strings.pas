unit Util.Strings;

interface

type

  TUtilString = class
  public
    class function RemoverEspacosEmBranco(pTexto: String): String;
    class function OnlyNumber(pValue: String): String;
    class function CharIsNum(C: Char): Boolean;
  end;

implementation

uses
  System.StrUtils, System.SysUtils;

{ TUtilString }

class function TUtilString.CharIsNum(C: Char): Boolean;
begin
  Result := CharInSet(C, ['0'..'9']);
end;

class function TUtilString.OnlyNumber(pValue: String): String;
var
  i,
  LenValue: Integer;
begin
  Result   := '';

  LenValue := Length(pValue);

  for i := 1 to LenValue  do
  begin
    if CharIsNum(pValue[i]) then
    begin
      Result := Result + pValue[i];
    end;
  end;
end ;

class function TUtilString.RemoverEspacosEmBranco(pTexto: String): String;
begin
  Result := ReplaceStr(pTexto, ' ', '');
end;

end.
