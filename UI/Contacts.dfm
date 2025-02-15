object frmContacts: TfrmContacts
  Left = 0
  Top = 0
  Caption = 'Contacts'
  ClientHeight = 619
  ClientWidth = 824
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  OnCreate = FormCreate
  TextHeight = 15
  object pnlBody: TPanel
    Left = -8
    Top = 0
    Width = 825
    Height = 593
    TabOrder = 0
    object sdgContactList: TStringGrid
      Left = 19
      Top = 152
      Width = 796
      Height = 417
      DefaultColWidth = 193
      FixedCols = 0
      RowCount = 50
      Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect]
      TabOrder = 0
      OnSelectCell = sdgContactListSelectCell
    end
    object pnlHeader: TPanel
      Left = 19
      Top = 24
      Width = 793
      Height = 57
      Caption = 'My Contacts'
      Font.Charset = OEM_CHARSET
      Font.Color = clWindowText
      Font.Height = -18
      Font.Name = 'Terminal'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
    end
    object btnAddContact: TButton
      Left = 19
      Top = 94
      Width = 182
      Height = 42
      Caption = 'Add New Contact'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      TabOrder = 2
      OnClick = btnAddContactClick
    end
  end
  object sbxSearchContact: TSearchBox
    Left = 640
    Top = 107
    Width = 164
    Height = 29
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
    TextHint = 'Search'
    OnInvokeSearch = sbxSearchContactInvokeSearch
  end
  object cbxSortByName: TCheckBox
    Left = 496
    Top = 113
    Width = 130
    Height = 17
    Caption = 'Sort by Name'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
    TabOrder = 2
    OnClick = cbxSortByNameClick
  end
end
