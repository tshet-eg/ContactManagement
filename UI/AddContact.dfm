object frmAddContact: TfrmAddContact
  Left = 0
  Top = 0
  Caption = 'Create Contact'
  ClientHeight = 354
  ClientWidth = 513
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  TextHeight = 15
  object pnlAdd: TPanel
    Left = 0
    Top = 8
    Width = 505
    Height = 344
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    object lblName: TLabel
      Left = 104
      Top = 61
      Width = 45
      Height = 21
      Caption = 'Name:'
    end
    object lblPhoneNumber: TLabel
      Left = 104
      Top = 96
      Width = 109
      Height = 21
      Caption = 'Phone Number:'
    end
    object lblAlternatePhone: TLabel
      Left = 104
      Top = 130
      Width = 128
      Height = 21
      Caption = 'Alternate Number:'
    end
    object lblEmailId: TLabel
      Left = 104
      Top = 168
      Width = 58
      Height = 21
      Caption = 'Email Id:'
    end
    object edtName: TEdit
      Left = 240
      Top = 58
      Width = 153
      Height = 29
      TabOrder = 0
    end
    object edtPhoneNumber: TEdit
      Left = 240
      Top = 93
      Width = 153
      Height = 29
      MaxLength = 10
      TabOrder = 1
    end
    object edtAlternatePhone: TEdit
      Left = 240
      Top = 127
      Width = 153
      Height = 29
      MaxLength = 10
      TabOrder = 2
    end
    object edtEmailId: TEdit
      Left = 240
      Top = 162
      Width = 153
      Height = 29
      TabOrder = 3
    end
    object btnSaveContact: TButton
      Left = 88
      Top = 272
      Width = 101
      Height = 33
      Caption = 'Save Contact'
      TabOrder = 4
      OnClick = btnSaveContactClick
    end
    object btnCancel: TButton
      Left = 296
      Top = 272
      Width = 97
      Height = 33
      Caption = 'Cancel'
      TabOrder = 5
      OnClick = btnCancelClick
    end
  end
end
