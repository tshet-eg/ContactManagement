unit Helper_u;

interface

uses System.SysUtils, Generics.Collections, System.Classes, Vcl.Grids,
  ContactsModel, FileHandler;

type
  THelper = class
    class function GenerateID: string;
    class function LoadTxtToGrid(AGrid: TStringGrid): TStringGrid;
    class procedure SaveToLog(const AFileName: string; AFileLog: string);
    class function LoadTxtToList: TList<TArray<string>>;
    class function CopySelectedRow(ASelectedRow, ADestRow: TArray<string>)
      : TArray<string>;
  end;

var
  tHelperObj: THelper;

implementation

{ THelper }

class function THelper.CopySelectedRow(ASelectedRow, ADestRow: TArray<string>)
  : TArray<string>;
begin
  SetLength(ADestRow, length(ASelectedRow));
  for var vCol := 0 to length(ASelectedRow) - 1 do
  begin
    ADestRow[vCol] := ASelectedRow[vCol];
  end;
  Result := ADestRow;
end;

class function THelper.GenerateID: string;
begin
  Result := FormatDateTime('yyyymmddhhnnsszzz', Now);
end;

class function THelper.LoadTxtToGrid(AGrid: TStringGrid): TStringGrid;
var
  vFile: TStringList;
  vFileLine: string;
  vFileRow: TArray<string>;
  vRow, vCol: integer;
begin
  vFile := TStringList.Create;
  FileHandlerObj := TFileHandler.Create;
  try
    FileHandlerObj.ReadFromFile(vFile);
    AGrid.RowCount := vFile.Count + 1;
    for vRow := 0 to vFile.Count - 1 do
    begin
      vFileLine := vFile[vRow];
      vFileRow := vFileLine.Split([',']);
      for vCol := 0 to length(vFileRow) - 1 do
      begin
        AGrid.Cells[vCol, vRow + 1] := vFileRow[vCol];
      end;
    end;
  finally
    vFile.Free;
    FileHandlerObj.Free;
  end;
  Result := AGrid;
end;

class function THelper.LoadTxtToList: TList<TArray<string>>;
var
  vFile: TStringList;
  vFileRow: string;
  vContactRowArr: TArray<string>;
  vContactsList: TList<TArray<string>>;
begin
  vFile := TStringList.Create;
  FileHandlerObj := TFileHandler.Create;
  try
    FileHandlerObj.ReadFromFile(vFile);
    for var vRow := 0 to vFile.Count - 1 do
    begin
      vFileRow := vFile[vRow];
      vContactRowArr := vFileRow.Split([',']);
      vContactsList.Add(vContactRowArr);
    end;
  finally
    vFile.Free;
    FileHandlerObj.Free;
  end;
  Result := vContactsList;
end;

class procedure THelper.SaveToLog(const AFileName: string; AFileLog: string);
var
  vFile: TStringList;
begin
  vFile := TStringList.Create;
  try
    if FileExists(AFileName) then
      vFile.LoadFromFile(AFileName);
    vFile.Add(AFileLog);
    vFile.SaveToFile(AFileName);
  finally
    vFile.Free;
  end;
end;

end.
