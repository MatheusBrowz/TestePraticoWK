unit classe.base;

interface

uses
  REST.Json;

type

  TClasseBase = class
  public
    function ToStandardJson(AOptions: TJsonOptions = [joDateIsUTC, joDateFormatISO8601]): String;
  end;

implementation


{ TClasseBase }

function TClasseBase.ToStandardJson(AOptions: TJsonOptions = [joDateIsUTC, joDateFormatISO8601]): String;
begin
  Result := TJson.ObjectToJsonString(Self, AOptions);
end;

end.
