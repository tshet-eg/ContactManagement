unit Helper_u;

interface

uses System.SysUtils, Generics.Collections, System.Classes, Vcl.Grids;

type
  THelper = class
    FLastId: integer;
    function GenerateID: integer;
    function LoadTxtToGrid(AGrid: TStringGrid): TStringGrid;
    procedure SaveToLog(const AFileName: string; AFileLog: string);
    function GetLargestIDFromFile(const AFileName: string): integer;
    function LoadTxtToList: TList<TArray<string>>;
    procedure GetLargestId;
  end;

var
  tHelperObj: THelper;

implementation

{ THelper }

function THelper.GenerateID: integer;
begin
  GetLargestId;
  inc(FLastId);
  Result := FLastId;
end;

procedure THelper.GetLargestId;
var
  vFileId, vDeleteFileiD: integer;
begin
  vFileId := GetLargestIDFromFile('ContactsLog.txt');
  vDeleteFileiD := GetLargestIDFromFile('DeletedContacts.txt');
  if vFileId > vDeleteFileiD then
    FLastId := vFileId
  else
    FLastId := vDeleteFileiD;
end;

function THelper.GetLargestIDFromFile(const AFileName: string): integer;
var
  vFile: TextFile;
  vFileLine: string;
  vPos, vCurrentId, vMaxId: integer;
begin
  vMaxId := 0;
  AssignFile(vFile, AFileName);
  Reset(vFile);
  try
    while not Eof(vFile) do
    begin
      Readln(vFile, vFileLine);
      vPos := Pos(',', vFileLine);
      vCurrentId := StrToInt(Copy(vFileLine, 1, vPos - 1));
      if vCurrentId > vMaxId then
        vMaxId := vCurrentId;
    end;
  finally
    CloseFile(vFile);
  end;
  Result := vMaxId;
end;

function THelper.LoadTxtToGrid(AGrid: TStringGrid): TStringGrid;
var
  vFile: TStringList;
  vFileLine: string;
  vFileRow: TArray<string>;
  vRow, vCol: integer;
begin
  vFile := TStringList.Create;
  try
    if FileExists('ContactsLog.txt') then
      vFile.LoadFromFile('ContactsLog.txt');
    AGrid.RowCount := vFile.Count + 1;
    for vRow := 0 to vFile.Count - 1 do
    begin
      vFileLine := vFile[vRow];
      vFileRow := vFileLine.Split([',']);
      for vCol := 0 to Length(vFileRow) - 1 do
      begin
        AGrid.Cells[vCol, vRow + 1] := vFileRow[vCol];
      end;
    end;
  finally
    vFile.Free;
  end;
  Result := AGrid;
end;

function THelper.LoadTxtToList: TList<TArray<string>>;
var
  vFile: TStringList;
  vFileRow: string;
  vContactRowArr: TArray<string>;
  vContactsList: TList<TArray<string>>;
begin
  vFile := TStringList.Create;
  try
    if FileExists('ContactsLog.txt') then
      vFile.LoadFromFile('ContactsLog.txt');
    for var vRow := 0 to vFile.Count - 1 do
    begin
      vFileRow := vFile[vRow];
      vContactRowArr := vFileRow.Split([',']);
      vContactsList.Add(vContactRowArr);
    end;
  finally
    vFile.Free;
  end;
  Result := vContactsList;
end;

procedure THelper.SaveToLog(const AFileName: string; AFileLog: string);
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
