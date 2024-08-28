program ContactManagementSystem;

uses
  Vcl.Forms,
  Contacts in 'UI\Contacts.pas' {frmContacts},
  AddContact in 'UI\AddContact.pas' {frmAddContact},
  EditContact in 'UI\EditContact.pas' {frmEditContact},
  DeleteContact_u in 'UI\DeleteContact_u.pas',
  Helper_u in 'Helper\Helper_u.pas',
  ContactValidation in 'Validations\ContactValidation.pas',
  UILogicInterface in 'Interfaces\UILogicInterface.pas',
  UIComponentsLogic in 'UILogic\UIComponentsLogic.pas',
  UILogicService in 'Services\UILogicService.pas',
  ContactsModel in 'Models\ContactsModel.pas',
  FileHandler in 'FileHandler\FileHandler.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmContacts, frmContacts);
  Application.CreateForm(TfrmAddContact, frmAddContact);
  Application.CreateForm(TfrmEditContact, frmEditContact);
  Application.Run;
end.
