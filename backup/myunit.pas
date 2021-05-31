unit MyUnit;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, Menus, StdCtrls,
  ExtCtrls;

type

  { TForm1 }

  TForm1 = class(TForm)
    Image1: TImage;

    MainMenu1: TMainMenu;
    FileItem: TMenuItem;
    ExitGame: TMenuItem;
    NewGame: TMenuItem;
    RulesGame: TMenuItem;
    procedure ExitGameClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Image1Click(Sender: TObject);
    procedure Memo1Change(Sender: TObject);
    procedure NewGameClick(Sender: TObject);
  private
    Images : array[1..52] of TImage;
    IsSelected : array[1..52] of boolean;
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

procedure TForm1.FormCreate(Sender: TObject);
var i:integer;
    s:string;
begin
  for i:=1 to 28 do
  begin
    IsSelected[i]:=false;
    Images[i]:=TImage.Create(Self);
    Images[i].Parent:=Form1;
    Images[i].Width:=100;
    Images[i].Height:=150;
    Images[i].Left:=(i mod 5)*150;
    Images[i].Top:=(i div 5)*50;
    Images[i].Visible:= true;
    Images[i].Stretch:=true;
    Images[i].Tag:=i;
    s:='./pic'+IntToStr(i)+'.bmp';
    Images[i].Picture.LoadFromFile(s);
    Caption:=ExtractFilePath(Application.ExeName);
    Images[i].OnClick:=@Image1Click;
  end;
end;

procedure TForm1.Image1Click(Sender: TObject);
var num :integer;
    i:integer;
    s:string;
begin
  s:='./pic'+IntToStr(i)+'.bmp';
     num := TImage(Sender).Tag;
     IsSelected[num]:=not IsSelected[num];
     if (IsSelected[num]) then
        Images[num].Picture.LoadFromFile(s+'select.png')
     else
        Images[num].Picture.LoadFromFile(s);
end;

procedure TForm1.NewGameClick(Sender: TObject);
begin
  MessageDlg('Новая игра','Игра началась', mtConfirmation, [mbOK],'');

end;

end.

