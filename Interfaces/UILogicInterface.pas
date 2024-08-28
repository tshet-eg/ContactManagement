unit UILogicInterface;

interface

uses Vcl.Grids, Generics.Collections, ContactsModel;

type
  IUILogic = interface
    function SortGridByName(AGrid: TStringGrid): TStringGrid;
    function SearchByName(ASearchName: string; AGrid: TStringGrid)
      : TList<TArray<string>>;
    function DeleteContact(AContactRow: TArray<string>): string;
    procedure EditContact(AContact: TContactModel);
  end;

implementation

end.
