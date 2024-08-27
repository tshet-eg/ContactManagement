unit ContactValidation;

interface

uses RegularExpressions, System.SysUtils;

type
  TValidation = class

  public
    function isValidNumber(APhoneNumber: string): Boolean;
    function IsValidEmail(AEmailId: string): Boolean;

  const
    cPhoneNumberPattern = '^\(?\d{3}\)?[-.\s]?\d{3}[-.\s]?\d{4}$';
    cEmailPattern = '^[A-Z0-9._%+-]+@[A-Z0-9.-]+\.[A-Z]{2,}$';
  end;

var
  ValidationObj: TValidation;

implementation

{ TValidation }

function TValidation.IsValidEmail(AEmailId: string): Boolean;
begin
  Result := TRegEx.IsMatch(AEmailId, cEmailPattern, [roIgnoreCase]);
end;

function TValidation.isValidNumber(APhoneNumber: string): Boolean;
begin
  Result := TRegEx.IsMatch(APhoneNumber, cPhoneNumberPattern);
end;

end.
