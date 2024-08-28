unit AddContact;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, Helper_u,
  ContactsModel, FileHandler;

type
  TfrmAddContact = class(TForm)
    pnlAdd: TPanel;
    lblName: TLabel;
    lblPhoneNumber: TLabel;
    lblAlternatePhone: TLabel;
    lblEmailId: TLabel;
    edtName: TEdit;
    edtPhoneNumber: TEdit;
    edtAlternatePhone: TEdit;
    edtEmailId: TEdit;
    btnSaveContact: TButton;
    btnCancel: TButton;
    procedure btnSaveContactClick(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmAddContact: TfrmAddContact;

implementation

{$R *.dfm}

procedure TfrmAddContact.btnCancelClick(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

procedure TfrmAddContact.btnSaveContactClick(Sender: TObject);
var
  vFileLog, vId: string;
begin
  FileHandlerObj := TFileHandler.Create;
  ContactModel := TContactModel.Create;
  try
    vId := THelper.GenerateID;
    try
      ContactModel.ID := vId;
      ContactModel.Name := edtName.Text;
      ContactModel.PhoneNumber := edtPhoneNumber.Text;
      ContactModel.AlternateNumber := edtAlternatePhone.Text;
      ContactModel.EmailID := edtEmailId.Text;

      FileHandlerObj.WriteToLog(ContactModel);
      ModalResult := mrCancel;
    except
      on E: Exception do
      begin
        ShowMessage(E.Message);
      end;
    end;
  finally
    FileHandlerObj.Free;
    ContactModel.Free;
  end;

end;

end.
