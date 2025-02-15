unit ContactValidation;

interface

uses RegularExpressions, System.SysUtils;

type
  TValidation = class
  private
    FPhoneNumber: string;
    FEmailId: string;
    procedure SetEmailId(const Value: string);
    procedure SetPhoneNumber(const Value: string);
  public
    function isValidNumber(APhoneNumber: string): Boolean;
    property PhoneNumber: string read FPhoneNumber write SetPhoneNumber;
    property EmailId: string read FEmailId write SetEmailId;
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

procedure TValidation.SetEmailId(const Value: string);
begin
  if IsValidEmail(Value) then
    FEmailId := Value
  else
    raise Exception.Create('Invalid email ID');
end;

procedure TValidation.SetPhoneNumber(const Value: string);
begin
  if isValidNumber(Value) then
    FPhoneNumber := Value
  else
    raise Exception.Create('invalid phone number');
end;

end.
