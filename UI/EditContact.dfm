object frmEditContact: TfrmEditContact
  Left = 0
  Top = 0
  Caption = 'Edit Contact'
  ClientHeight = 441
  ClientWidth = 624
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  OnActivate = FormActivate
  TextHeight = 15
  object pnlEdit: TPanel
    Left = 0
    Top = 8
    Width = 616
    Height = 425
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    object lblName: TLabel
      Left = 128
      Top = 84
      Width = 45
      Height = 21
      Caption = 'Name:'
    end
    object lblPhoneNumber: TLabel
      Left = 128
      Top = 136
      Width = 109
      Height = 21
      Caption = 'Phone Number:'
    end
    object lblAlternateNumber: TLabel
      Left = 128
      Top = 189
      Width = 128
      Height = 21
      Caption = 'Alternate Number:'
    end
    object lblEmailId: TLabel
      Left = 128
      Top = 243
      Width = 60
      Height = 21
      Caption = 'Email ID:'
    end
    object edtName: TEdit
      Left = 304
      Top = 81
      Width = 185
      Height = 29
      TabOrder = 0
    end
    object btnSave: TButton
      Left = 102
      Top = 328
      Width = 131
      Height = 41
      Caption = 'Save Changes'
      TabOrder = 1
      OnClick = btnSaveClick
    end
    object edtPhoneNumber: TEdit
      Left = 304
      Top = 134
      Width = 185
      Height = 29
      TabOrder = 2
    end
    object edtAlternateNumber: TEdit
      Left = 304
      Top = 186
      Width = 185
      Height = 29
      TabOrder = 3
    end
    object edtEmailId: TEdit
      Left = 304
      Top = 235
      Width = 185
      Height = 29
      TabOrder = 4
    end
    object btnCancel: TButton
      Left = 374
      Top = 328
      Width = 131
      Height = 41
      Caption = 'Cancel'
      TabOrder = 5
      OnClick = btnCancelClick
    end
  end
end
