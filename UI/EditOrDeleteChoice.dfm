object frmEditOrDelete: TfrmEditOrDelete
  Left = 0
  Top = 0
  ClientHeight = 102
  ClientWidth = 148
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  TextHeight = 15
  object pnlEditOrDelete: TPanel
    Left = 0
    Top = 8
    Width = 145
    Height = 89
    TabOrder = 0
    object btnEdit: TButton
      Left = 8
      Top = 8
      Width = 129
      Height = 33
      Caption = 'Edit Contact'
      TabOrder = 0
      OnClick = btnEditClick
    end
    object btnDelete: TButton
      Left = 8
      Top = 47
      Width = 129
      Height = 34
      Caption = 'Delete Contact'
      TabOrder = 1
      OnClick = btnDeleteClick
    end
  end
end
