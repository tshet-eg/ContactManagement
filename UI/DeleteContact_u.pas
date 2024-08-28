unit DeleteContact_u;

interface

uses System.Classes, SysUtils, Helper_u, UILogicService, UIComponentsLogic;

type
  TDeleteContact = class
  public
   class var FGridData: TArray<string>;
   class var FDeletedContact: string;
   class procedure DeleteContact;
   class procedure LoadToDeletedtxt;
  end;

var
  clsDeleteContact: TDeleteContact;

implementation

{ TDeleteContact }

class procedure TDeleteContact.DeleteContact;
var
  vUILogicService: TUILogicService;
begin
  vUILogicService := TUILogicService.Create(TUILogic.Create);
  try
    FDeletedContact := vUILogicService.DeleteContact(FGridData);
    LoadToDeletedtxt;
  finally
    vUILogicService.Free;
  end;

end;

class procedure TDeleteContact.LoadToDeletedtxt;
begin
    THelper.SaveToLog('DeletedContacts.txt', FDeletedContact);
end;

end.
