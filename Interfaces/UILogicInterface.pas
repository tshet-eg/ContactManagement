unit UILogicInterface;

interface

uses Vcl.Grids, Generics.Collections;

type
  IUILogic = interface
    function SortGridByName(AGrid: TStringGrid): TStringGrid;
    function SearchByName(ASearchName: string; AGrid: TStringGrid)
      : TList<TArray<string>>;
    function DeleteContact(AContactRow: TArray<string>;
      const AFileName: String): string;
  end;

implementation

end.
