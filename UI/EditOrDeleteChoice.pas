unit EditOrDeleteChoice;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, EditContact,
  DeleteContact_u;

type
  TfrmEditOrDelete = class(TForm)
    pnlEditOrDelete: TPanel;
    btnEdit: TButton;
    btnDelete: TButton;
    procedure btnEditClick(Sender: TObject);
    procedure btnDeleteClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations } sGridRowData: TArray<string>;
    FSelectedRow: Integer;
  end;

var
  frmEditOrDelete: TfrmEditOrDelete;

implementation

{$R *.dfm}

procedure TfrmEditOrDelete.btnDeleteClick(Sender: TObject);
begin
  try
    SetLength(clsDeleteContact.FGridData, length(sGridRowData));
    for var vCol := 0 to length(sGridRowData) - 1 do
    begin
      TDeleteContact.FGridData[vCol] := sGridRowData[vCol];
    end;
    TDeleteContact.DeleteContact;
    ShowMessage('Contact deleted successfull!');
  finally
    ModalResult := mrCancel;
  end;
end;

procedure TfrmEditOrDelete.btnEditClick(Sender: TObject);
begin
  frmEditContact := TfrmEditContact.Create(nil);
  try
    SetLength(frmEditContact.sGridData, length(sGridRowData));
    for var vCol := 0 to length(sGridRowData) - 1 do
    begin
      frmEditContact.sGridData[vCol] := sGridRowData[vCol];
    end;
    frmEditContact.FSelectedRow := FSelectedRow;
    frmEditContact.ShowModal;
  finally
    frmEditContact.Free;
    ModalResult := mrCancel;
  end;
end;

end.
