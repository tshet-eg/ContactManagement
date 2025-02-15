program ContactManagementSystem;

uses
  Vcl.Forms,
  Contacts in 'UI\Contacts.pas' {frmContacts},
  AddContact in 'UI\AddContact.pas' {frmAddContact},
  EditOrDeleteChoice in 'UI\EditOrDeleteChoice.pas' {frmEditOrDelete},
  EditContact in 'UI\EditContact.pas' {frmEditContact},
  DeleteContact_u in 'UI\DeleteContact_u.pas',
  Helper_u in 'Helper\Helper_u.pas',
  ContactValidation in 'Validations\ContactValidation.pas',
  UILogicInterface in 'Interfaces\UILogicInterface.pas',
  UIComponentsLogic in 'UILogic\UIComponentsLogic.pas',
  UILogicService in 'Services\UILogicService.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmContacts, frmContacts);
  Application.CreateForm(TfrmAddContact, frmAddContact);
  Application.CreateForm(TfrmEditOrDelete, frmEditOrDelete);
  Application.CreateForm(TfrmEditContact, frmEditContact);
  Application.Run;
end.
