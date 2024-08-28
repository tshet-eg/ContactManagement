unit FileHandler;

interface

uses ContactsModel, System.Classes, System.SysUtils;

type
  TFileHandler = class
    procedure WriteToLog(AContact: TContactModel);
    procedure ReadFromFile(out AFile: TstringList);
    procedure SaveChangesToFile(const AFile: TstringList);
  end;

var
  FileHandlerObj: TFileHandler;

implementation

procedure TFileHandler.ReadFromFile(out AFile: TstringList);
begin
  AFile := TstringList.Create;
  if FileExists('ContactsLog.txt') then
    AFile.LoadFromFile('ContactsLog.txt');
end;

procedure TFileHandler.SaveChangesToFile(const AFile: TstringList);
begin
  AFile.SaveToFile('ContactsLog.txt');
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
    ReadFromFile(vFile);
    vFile.Add(LogText);
    vFile.SaveToFile('ContactsLog.txt');
  finally
    vFile.Free;
  end;
end;

end.
