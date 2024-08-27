unit DeleteContact_u;

interface

uses System.Classes, SysUtils, Helper_u, UILogicService, UIComponentsLogic;

type
  TDeleteContact = class
    FGridData: TArray<string>;
    FDeletedContact: string;
    procedure DeleteContact;
    procedure LoadToDeletedtxt;
  end;

var
  clsDeleteContact: TDeleteContact;

implementation

{ TDeleteContact }

procedure TDeleteContact.DeleteContact;
var
  vUILogicService: TUILogicService;
begin
  vUILogicService := TUILogicService.Create(TUILogic.Create);
  try
    FDeletedContact := vUILogicService.DeleteContact(FGridData,
      'ContactsLog.txt');
    LoadToDeletedtxt;
  finally
    vUILogicService.Free;
  end;

end;

procedure TDeleteContact.LoadToDeletedtxt;
begin
  tHelperObj := THelper.Create;
  try
    tHelperObj.SaveToLog('DeletedContacts.txt', FDeletedContact);
  finally
    tHelperObj.Free;
  end;
end;

end.
