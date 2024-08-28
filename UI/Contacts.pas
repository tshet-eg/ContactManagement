unit Contacts;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.Grids, Vcl.StdCtrls,
  AddContact, Vcl.WinXCtrls, Generics.Collections,
  UILogicService, UIComponentsLogic, Vcl.Menus, EditContact, DeleteContact_u,
  Helper_u;

type
  TfrmContacts = class(TForm)
    pnlBody: TPanel;
    sdgContactList: TStringGrid;
    pnlHeader: TPanel;
    btnAddContact: TButton;
    sbxSearchContact: TSearchBox;
    cbxSortByName: TCheckBox;
    pmEditOrDelete: TPopupMenu;
    EditContact: TMenuItem;
    DeleteContact: TMenuItem;
    procedure FormCreate(Sender: TObject);
    procedure LoadToStringGrid;
    procedure btnAddContactClick(Sender: TObject);
    procedure sbxSearchContactInvokeSearch(Sender: TObject);
    procedure cbxSortByNameClick(Sender: TObject);
    procedure sdgContactListMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure sbxSearchContactChange(Sender: TObject);
    procedure SearchByName;
    procedure FormResize(Sender: TObject);
    procedure sdgContactListContextPopup(Sender: TObject; MousePos: TPoint;
      var Handled: Boolean);
    procedure EditContactClick(Sender: TObject);
    procedure DeleteContactClick(Sender: TObject);
  private
    { Private declarations }
    FContactsList: TList<TArray<string>>;
    FSelectedRow: TArray<string>;
  public
    { Public declarations } end;

var
  frmContacts: TfrmContacts;

implementation

{$R *.dfm}

procedure TfrmContacts.btnAddContactClick(Sender: TObject);
begin
  frmAddContact := TfrmAddContact.Create(nil);
  try
    frmAddContact.ShowModal;
  finally
    frmAddContact.Free;
    LoadToStringGrid;
  end;
end;

procedure TfrmContacts.cbxSortByNameClick(Sender: TObject);
var
  vUILogicService: TUILogicService;
begin
  if cbxSortByName.Checked then
  begin
    vUILogicService := TUILogicService.Create(TUILogic.Create);
    try
      sdgContactList := vUILogicService.SortGridByName(sdgContactList);
    finally
      vUILogicService.Free;
    end;
  end
  else if sbxSearchContact.Text = '' then
    LoadToStringGrid;
end;

procedure TfrmContacts.DeleteContactClick(Sender: TObject);
begin
  try
    TDeleteContact.FGridData := THelper.CopySelectedRow(FSelectedRow,
      TDeleteContact.FGridData);
    TDeleteContact.DeleteContact;
    ShowMessage('Contact deleted successfully');
  finally
    LoadToStringGrid;
  end;
end;

procedure TfrmContacts.EditContactClick(Sender: TObject);
begin
  frmEditContact := TfrmEditContact.Create(nil);
  try
    frmEditContact.sGridData := THelper.CopySelectedRow(FSelectedRow,
      frmEditContact.sGridData);
    frmEditContact.ShowModal;
  finally
    frmEditContact.Free;
  end;
  LoadToStringGrid;
end;

procedure TfrmContacts.FormCreate(Sender: TObject);
begin
  sdgContactList.Cells[1, 0] := 'Name';
  sdgContactList.Cells[2, 0] := 'Contact Number';
  sdgContactList.Cells[3, 0] := 'Alternate Contact';
  sdgContactList.Cells[4, 0] := 'Email ID';
  sdgContactList.ColWidths[0] := 0;
  LoadToStringGrid;
end;

procedure TfrmContacts.FormResize(Sender: TObject);
begin
  pnlBody.Left := (ClientWidth - pnlBody.Width) div 2;
  pnlBody.Top := (ClientHeight - pnlBody.Height) div 2;
end;

procedure TfrmContacts.LoadToStringGrid;
begin
  sdgContactList := THelper.LoadTxtToGrid(sdgContactList);
end;

procedure TfrmContacts.sbxSearchContactChange(Sender: TObject);
begin
  SearchByName;
end;

procedure TfrmContacts.sbxSearchContactInvokeSearch(Sender: TObject);
begin
  SearchByName;
end;

procedure TfrmContacts.sdgContactListContextPopup(Sender: TObject;
  MousePos: TPoint; var Handled: Boolean);
var
  vRow, vCol: Integer;
begin
  sdgContactList.MouseToCell(MousePos.X, MousePos.Y, vCol, vRow);
  SetLength(FSelectedRow, sdgContactList.ColCount);
  if (vRow > 0) and (vRow < sdgContactList.RowCount) then
  begin
    pmEditOrDelete.AutoPopup := True;
    for var vColumn := 0 to sdgContactList.ColCount - 1 do
    begin
      FSelectedRow[vColumn] := sdgContactList.Cells[vColumn, vRow];
    end;
  end
  else
    pmEditOrDelete.AutoPopup := False;
end;

procedure TfrmContacts.sdgContactListMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
var
  vRow, vCol: Integer;
  vUILogicService: TUILogicService;
begin
  sdgContactList.MouseToCell(X, Y, vCol, vRow);
  if (vRow = 0) and (vCol = 1) then
  begin
    vUILogicService := TUILogicService.Create(TUILogic.Create);
    try
      if cbxSortByName.Checked = False then
      begin

        sdgContactList := vUILogicService.SortGridByName(sdgContactList);
        cbxSortByName.Checked := True;
      end
      else if sbxSearchContact.Text = '' then
      begin
        LoadToStringGrid;
        cbxSortByName.Checked := False;
      end;
    finally
      vUILogicService.Free;
    end;

  end;
end;

procedure TfrmContacts.SearchByName;
var
  vSearchName: string;
  vUILogicService: TUILogicService;
begin
  vSearchName := sbxSearchContact.Text;
  if vSearchName = '' then
  begin
    LoadToStringGrid;
    exit;
  end;
  vUILogicService := TUILogicService.Create(TUILogic.Create);
  try
    FContactsList := vUILogicService.SearchByName(vSearchName, sdgContactList);
  finally
    vUILogicService.Free;
  end;
end;

end.
