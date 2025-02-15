unit UIComponentsLogic;

interface

uses UILogicInterface, Vcl.Grids, System.Classes, System.SysUtils, Helper_u,
  Generics.Collections;

type
  TUILogic = class(TInterfacedObject, IUILogic)
    function SortGridByName(AGrid: TStringGrid): TStringGrid;
    function SearchByName(ASearchName: string; AGrid: TStringGrid)
      : TList<TArray<string>>;
    function DeleteContact(AContactRow: TArray<string>;
      const AFileName: String): string;
  end;

implementation

{ TUILogic }

function TUILogic.DeleteContact(AContactRow: TArray<string>;
  const AFileName: String): string;
var
  vFileLine: TStringList;
  vLine, vDeletedContact: string;
  vRowArray: TArray<string>;
begin
  vFileLine := TStringList.Create;
  try
    if FileExists(AFileName) then
      vFileLine.LoadFromFile(AFileName);

    for var vRow := vFileLine.Count - 1 downto 0 do
    begin
      vLine := vFileLine[vRow];
      vRowArray := vLine.split([',']);
      if vRowArray[0] = AContactRow[0] then
      begin
        vDeletedContact := string.join(',', vRowArray);
        vFileLine.Delete(vRow);
      end;
    end;
    vFileLine.SaveToFile(AFileName);
  finally
    vFileLine.Free;
  end;
  Result := vDeletedContact;
end;

function TUILogic.SearchByName(ASearchName: string; AGrid: TStringGrid)
  : TList<TArray<string>>;
var
  vRow, vCol: Integer;
  vContactsList: TList<TArray<string>>;
  vRowData: TArray<string>;
begin
  tHelperObj := THelper.Create;
  vContactsList := TList < TArray < string >>.Create;
  try
    vContactsList := tHelperObj.LoadTxtToList;
    for vRow := vContactsList.Count - 1 downto 0 do
    begin
      vRowData := vContactsList[vRow];
      if AnsiCompareText(ASearchName, vRowData[1]) <> 0 then
      begin
        vContactsList.Remove(vRowData);
      end;
    end;
    AGrid.RowCount := vContactsList.Count + 1;
    for vRow := 0 to vContactsList.Count - 1 do
    begin
      vRowData := vContactsList[vRow];
      for vCol := 1 to Length(vRowData) - 1 do
      begin
        AGrid.Cells[vCol, vRow + 1] := vRowData[vCol];
      end;
    end;
  finally
    vContactsList.Free;
    tHelperObj.Free;
  end;

end;

function TUILogic.SortGridByName(AGrid: TStringGrid): TStringGrid;
var
  vRow, vNextRow: Integer;
  vTempRow: TStringList;
begin
  for vRow := 1 to AGrid.RowCount - 1 do
  begin
    for vNextRow := vRow + 1 to AGrid.RowCount - 1 do
    begin
      if CompareText(AGrid.Cells[1, vRow], AGrid.Cells[1, vNextRow]) > 0 then
      begin
        vTempRow := TStringList.Create;
        try
          vTempRow.Assign(AGrid.Rows[vRow]);
          AGrid.Rows[vRow] := AGrid.Rows[vNextRow];
          AGrid.Rows[vNextRow].Assign(vTempRow);
        finally
          vTempRow.Free;
        end;
      end;
    end;
  end;
  Result := AGrid;
end;

end.
