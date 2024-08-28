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
  OnResize = FormResize
  TextHeight = 15
  object pnlBody: TPanel
    Left = -8
    Top = 0
    Width = 825
    Height = 593
    TabOrder = 0
    object sdgContactList: TStringGrid
      Left = 18
      Top = 152
      Width = 796
      Height = 417
      DefaultColWidth = 194
      FixedCols = 0
      RowCount = 50
      Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goFixedColClick, goFixedRowClick]
      PopupMenu = pmEditOrDelete
      TabOrder = 0
      OnContextPopup = sdgContactListContextPopup
      OnMouseDown = sdgContactListMouseDown
    end
    object pnlHeader: TPanel
      Left = 18
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
      Left = 18
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
    object sbxSearchContact: TSearchBox
      Left = 648
      Top = 100
      Width = 164
      Height = 29
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      TabOrder = 3
      TextHint = 'Search'
      OnChange = sbxSearchContactChange
      OnInvokeSearch = sbxSearchContactInvokeSearch
    end
  end
  object cbxSortByName: TCheckBox
    Left = 248
    Top = 106
    Width = 130
    Height = 17
    Caption = 'Sort by Name'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
    Visible = False
    OnClick = cbxSortByNameClick
  end
  object pmEditOrDelete: TPopupMenu
    Left = 784
    Top = 592
    object EditContact: TMenuItem
      Caption = 'Edit'
      OnClick = EditContactClick
    end
    object DeleteContact: TMenuItem
      Caption = 'Delete'
      OnClick = DeleteContactClick
    end
  end
end
