unit FileHandler;

interface

uses ContactsModel, System.Classes, System.SysUtils;

type
  TFileHandler = class
    procedure WriteToLog(AContact: TContactModel);
    function ReadFromLog: TstringList;
  end;

var
  FileHandlerObj: TFileHandler;

implementation

function TFileHandler.ReadFromLog: TstringList;
var
  vFile: TstringList;
begin
  vFile := TstringList.Create;
  try
    if FileExists('ContactsLog.txt') then
      vFile.LoadFromFile('ContactsLog.txt');

  finally
    vFile.Free;
  end;
  Result := vFile;
end;

procedure TFileHandler.WriteToLog(AContact: TContactModel);
var
  LogText: string;
  vFile: TstringList;
begin
  LogText := AContact.Id + ',' + AContact.Name + ',' + AContact.PhoneNumber +
    ',' + AContact.AlternateNumber + ',' + AContact.EmailID;
  vFile := TstringList.Create;
  try
    if FileExists('ContactsLog.txt') then
      vFile.LoadFromFile('ContactsLog.txt');
    vFile.Add(LogText);
    vFile.SaveToFile('ContactsLog.txt');
  finally
    vFile.Free;
  end;
end;

end.
