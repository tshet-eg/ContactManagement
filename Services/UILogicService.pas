unit UILogicService;

interface

uses UILogicInterface, UIComponentsLogic, Vcl.Grids, System.SysUtils,
  Generics.Collections, ContactsModel;

type
  TUILogicService = class
  private
    FUILogic: IUILogic;
  public
    constructor Create(AUILogic: TUILogic);
    function SortGridByName(AGrid: TStringGrid): TStringGrid;
    function SearchByName(ASearchName: string; AGrid: TStringGrid)
      : TList<TArray<string>>;
    function DeleteContact(AContactRow: TArray<string>): string;
    procedure EditContact(AContact: TContactModel);
  end;

var
  clsUILogicService: TUILogicService;

implementation

{ TUILogicService }

constructor TUILogicService.Create(AUILogic: TUILogic);
begin
  FUILogic := AUILogic.Create;
end;

function TUILogicService.DeleteContact(AContactRow: TArray<string>): string;
begin
  Result := FUILogic.DeleteContact(AContactRow);
end;

procedure TUILogicService.EditContact(AContact: TContactModel);
begin
  FUILogic.EditContact(AContact);
end;

function TUILogicService.SearchByName(ASearchName: string; AGrid: TStringGrid)
  : TList<TArray<string>>;
begin
  Result := FUILogic.SearchByName(ASearchName, AGrid);
end;

function TUILogicService.SortGridByName(AGrid: TStringGrid): TStringGrid;
begin
  Result := FUILogic.SortGridByName(AGrid);
end;

end.
