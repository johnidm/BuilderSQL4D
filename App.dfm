object Form2: TForm2
  Left = 0
  Top = 0
  Caption = 'Form2'
  ClientHeight = 419
  ClientWidth = 749
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 749
    Height = 57
    Align = alTop
    BevelKind = bkTile
    BevelOuter = bvNone
    Caption = 'Top'
    TabOrder = 0
  end
  object Panel2: TPanel
    Left = 0
    Top = 352
    Width = 749
    Height = 67
    Align = alBottom
    BevelKind = bkTile
    BevelOuter = bvNone
    Caption = 'Bottom'
    TabOrder = 1
  end
  object Panel3: TPanel
    Left = 536
    Top = 57
    Width = 213
    Height = 295
    Align = alRight
    BevelKind = bkTile
    BevelOuter = bvNone
    Caption = 'Right'
    TabOrder = 2
    object Button2: TButton
      Left = 2
      Top = 20
      Width = 173
      Height = 29
      Caption = 'Insert'
      TabOrder = 0
      OnClick = Button2Click
    end
    object Button1: TButton
      Left = 4
      Top = 64
      Width = 173
      Height = 33
      Caption = 'Delete'
      TabOrder = 1
      OnClick = Button1Click
    end
    object Button3: TButton
      Left = 4
      Top = 112
      Width = 173
      Height = 33
      Caption = 'Update'
      TabOrder = 2
      OnClick = Button3Click
    end
  end
  object Panel4: TPanel
    Left = 0
    Top = 57
    Width = 536
    Height = 295
    Align = alClient
    BevelKind = bkTile
    BevelOuter = bvNone
    Caption = 'Client'
    TabOrder = 3
    object PageControl1: TPageControl
      Left = 0
      Top = 0
      Width = 532
      Height = 291
      ActivePage = TabSheet1
      Align = alClient
      TabOrder = 0
      OnChange = PageControl1Change
      object TabSheet1: TTabSheet
        Caption = 'Trace'
        object Memo1: TMemo
          Left = 0
          Top = 0
          Width = 524
          Height = 263
          Align = alClient
          TabOrder = 0
        end
      end
      object TabSheet2: TTabSheet
        Caption = 'SQLMonitor'
        ImageIndex = 1
        ExplicitLeft = -36
        ExplicitTop = 4
        ExplicitWidth = 0
        ExplicitHeight = 0
        object Memo2: TMemo
          Left = 0
          Top = 0
          Width = 524
          Height = 263
          Align = alClient
          TabOrder = 0
          ExplicitLeft = 144
          ExplicitTop = 72
          ExplicitWidth = 185
          ExplicitHeight = 89
        end
      end
    end
  end
  object FBConnection: TSQLConnection
    ConnectionName = 'FBConnection'
    DriverName = 'Firebird'
    LoginPrompt = False
    Params.Strings = (
      'DriverName=Firebird'
      'Database=F:\BuilderSQL\data\dados.fdb'
      'RoleName=RoleName'
      'User_Name=sysdba'
      'Password=masterkey'
      'ServerCharSet='
      'SQLDialect=3'
      'ErrorResourceFile='
      'LocaleCode=0000'
      'BlobSize=-1'
      'CommitRetain=False'
      'WaitOnLocks=True'
      'IsolationLevel=ReadCommitted'
      'Trim Char=False')
    AfterConnect = FBConnectionAfterConnect
    AfterDisconnect = FBConnectionAfterDisconnect
    Connected = True
    Left = 368
    Top = 101
  end
  object SQLMonitor1: TSQLMonitor
    SQLConnection = FBConnection
    Left = 456
    Top = 113
  end
end
