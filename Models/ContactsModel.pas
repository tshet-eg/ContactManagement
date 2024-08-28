unit ContactsModel;

interface

uses ContactValidation, System.SysUtils;

type
  TContactModel = class
  private
    FName: string;
    FPhoneNumber: string;
    FEmailID: string;
    FAlternateNumber: string;
    FID: string;
    procedure SetName(const Value: string);
    procedure SetPhoneNumber(const Value: string);
    procedure SetAlternateNumber(const Value: string);
    procedure SetEmailID(const Value: string);
    procedure SetID(const Value: string);
  public
    property Name: string read FName write SetName;
    property PhoneNumber: string read FPhoneNumber write SetPhoneNumber;
    property AlternateNumber: string read FAlternateNumber
      write SetAlternateNumber;
    property EmailID: string read FEmailID write SetEmailID;
    property ID: string read FID write SetID;
  end;

var
  ContactModel: TContactModel;

implementation

{ TContactModel }

procedure TContactModel.SetAlternateNumber(const Value: string);
begin
  ValidationObj := TValidation.Create;
  try
    if (ValidationObj.isValidNumber(Value)) or (Value = '') then
      FAlternateNumber := Value
    else
      raise Exception.Create('Invalid phone number');
  finally
    ValidationObj.Free;
  end;
end;

procedure TContactModel.SetEmailID(const Value: string);
begin
  ValidationObj := TValidation.Create;
  try
    if (ValidationObj.IsValidEmail(Value)) or (Value = '') then
      FEmailID := Value
    else
      raise Exception.Create('Invalid email ID');
  finally
    ValidationObj.Free;
  end;
end;

procedure TContactModel.SetID(const Value: string);
begin
  FID := Value;
end;

procedure TContactModel.SetName(const Value: string);
begin
  if Value = '' then
    raise Exception.Create('Name field required')
  else
    FName := Value;
end;

procedure TContactModel.SetPhoneNumber(const Value: string);
begin
  ValidationObj := TValidation.Create;
  try
    if ValidationObj.isValidNumber(Value) then
      FPhoneNumber := Value
    else
      raise Exception.Create('Invalid phone number');
  finally
    ValidationObj.Free;
  end;
end;

end.
