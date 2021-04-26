unit MyUnit;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, Menus, StdCtrls,
  ExtCtrls;

type

  { TForm1 }

  TForm1 = class(TForm)
    MainMenu1: TMainMenu;
    FileItem: TMenuItem;
    ExitGame: TMenuItem;
    NewGame: TMenuItem;
    RulesGame: TMenuItem;
    procedure ExitGameClick(Sender: TObject);
    procedure Memo1Change(Sender: TObject);
    procedure NewGameClick(Sender: TObject);
  private

  public

  end;

var
  Form1: TForm1;

implementation

{$R *.lfm}

{ TForm1 }

procedure TForm1.Memo1Change(Sender: TObject);
begin

end;

procedure TForm1.ExitGameClick(Sender: TObject);
begin
  Form1.Close;
end;

procedure TForm1.NewGameClick(Sender: TObject);
begin
  MessageDlg('Новая игра','Игра началась', mtConfirmation, [mbOK],'');
end;

end.

