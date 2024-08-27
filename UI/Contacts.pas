unit Contacts;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.Grids, Vcl.StdCtrls,
  AddContact, EditOrDeleteChoice, Vcl.WinXCtrls, Generics.Collections,
  UILogicService, UIComponentsLogic;

type
  TfrmContacts = class(TForm)
    pnlBody: TPanel;
    sdgContactList: TStringGrid;
    pnlHeader: TPanel;
    btnAddContact: TButton;
    sbxSearchContact: TSearchBox;
    cbxSortByName: TCheckBox;
    procedure FormCreate(Sender: TObject);
    procedure LoadToStringGrid;
    procedure btnAddContactClick(Sender: TObject);
    procedure sdgContactListSelectCell(Sender: TObject; ACol, ARow: LongInt;
      var CanSelect: Boolean);
    procedure sbxSearchContactInvokeSearch(Sender: TObject);
    procedure cbxSortByNameClick(Sender: TObject);
    procedure sdgContactListMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
  private
    { Private declarations }
    FContactsList: TList<TArray<string>>;
  public
  { Public declarations }

    const
    cFileName = 'ContactsLog.txt';
    cdeletedFile = 'DeletedContacts.txt';
  end;

var
  frmContacts: TfrmContacts;

implementation

{$R *.dfm}

uses Helper_u;

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

procedure TfrmContacts.FormCreate(Sender: TObject);
begin
  sdgContactList.Cells[1, 0] := 'Name';
  sdgContactList.Cells[2, 0] := 'Contact Number';
  sdgContactList.Cells[3, 0] := 'Alternate Contact';
  sdgContactList.Cells[4, 0] := 'Email ID';
  sdgContactList.ColWidths[0] := 0;
  LoadToStringGrid;
end;

procedure TfrmContacts.LoadToStringGrid;
begin

  tHelperObj := THelper.Create;
  try
    sdgContactList := tHelperObj.LoadTxtToGrid(sdgContactList);
  finally
    tHelperObj.Free;
  end;
end;

procedure TfrmContacts.sbxSearchContactInvokeSearch(Sender: TObject);
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
      vUILogicService.SortGridByName(sdgContactList);
      sdgContactList.Invalidate;
      cbxSortByName.Checked := True;
    finally
      vUILogicService.Free;
    end;

  end;
end;

procedure TfrmContacts.sdgContactListSelectCell(Sender: TObject;
  ACol, ARow: LongInt; var CanSelect: Boolean);
var
  vCol: Integer;
begin
  CanSelect := True;
  frmEditOrDelete := TfrmEditOrDelete.Create(nil);
  try
    SetLength(frmEditOrDelete.sGridRowData, 5);
    for vCol := 0 to sdgContactList.ColCount - 1 do
    begin
      frmEditOrDelete.sGridRowData[vCol] := sdgContactList.Cells[vCol, ARow];
    end;
    frmEditOrDelete.FSelectedRow := ARow;
    frmEditOrDelete.ShowModal;
  finally
    frmEditOrDelete.Free;
    LoadToStringGrid;
  end;
end;

end.
