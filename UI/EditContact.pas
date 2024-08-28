unit EditContact;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls,
  ContactsModel, FileHandler, UIComponentsLogic, UILogicService;

type
  TfrmEditContact = class(TForm)
    pnlEdit: TPanel;
    lblName: TLabel;
    lblPhoneNumber: TLabel;
    lblAlternateNumber: TLabel;
    lblEmailId: TLabel;
    edtName: TEdit;
    btnSave: TButton;
    edtPhoneNumber: TEdit;
    edtAlternateNumber: TEdit;
    edtEmailId: TEdit;
    btnCancel: TButton;
    procedure FormActivate(Sender: TObject);
    procedure btnSaveClick(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    sGridData: TArray<string>;
    FSelectedRow: integer;
  end;

var
  frmEditContact: TfrmEditContact;

implementation

{$R *.dfm}

uses Contacts;

procedure TfrmEditContact.btnCancelClick(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

procedure TfrmEditContact.btnSaveClick(Sender: TObject);
var
  vUILogicService: TUILogicService;
begin
  vUILogicService := TUILogicService.Create(TUILogic.Create);
  ContactModel := TContactModel.Create;
  try
    try
      ContactModel.ID := sGridData[0];
      ContactModel.Name := edtName.Text;
      ContactModel.PhoneNumber := edtPhoneNumber.Text;
      ContactModel.AlternateNumber := edtAlternateNumber.Text;
      ContactModel.EmailId := edtEmailId.Text;
      vUILogicService.EditContact(ContactModel);
      ModalResult := mrCancel;
    except
      on E: Exception do
        ShowMessage(E.Message);
    end;

  finally
    ContactModel.Free;
    vUILogicService.Free;
  end;

end;

procedure TfrmEditContact.FormActivate(Sender: TObject);
begin
  edtName.Text := sGridData[1];
  edtPhoneNumber.Text := sGridData[2];
  edtAlternateNumber.Text := sGridData[3];
  edtEmailId.Text := sGridData[4];
end;

end.
