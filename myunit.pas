unit MyUnit;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, Menus, StdCtrls,
  ExtCtrls;
 const w=52;
type

  { TForm1 }

  TForm1 = class(TForm)
    Button1: TButton;
    Image1: TImage;
    Image2: TImage;

    MainMenu1: TMainMenu;
    FileItem: TMenuItem;
    ExitGame: TMenuItem;
    NewGame: TMenuItem;
    RulesGame: TMenuItem;

    procedure Button2Click(Sender: TObject);
    procedure ExitGameClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Image1Click(Sender: TObject);
    procedure Image1MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure Image2Click(Sender: TObject);
    procedure Memo1Change(Sender: TObject);
    procedure NewGameClick(Sender: TObject);
  private
    Images : array[1..w] of TImage;
    ImagesNum : array[1..w] of integer;
    ImagesVid : array[1..w] of integer;
    IsSelected : array[1..w] of boolean;
  public

  end;

var
  Form1: TForm1;
  card: array[1..11] of integer;
  cntOfSel, sumOfSel:integer;
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

procedure TForm1.Button2Click(Sender: TObject);
begin

end;

procedure TForm1.FormCreate(Sender: TObject);
var i,v,idx:integer;
    s:string;
    u:array [1..w] of boolean;
begin
  cntOfSel:=0;
  sumOfSel:=0;
  ImagesNum[1]:=2;
  ImagesNum[2]:=2;
  ImagesNum[3]:=2;
  ImagesNum[4]:=2;
  ImagesNum[5]:=3;
  ImagesNum[6]:=3;
  ImagesNum[7]:=3;
  ImagesNum[8]:=3;
  ImagesNum[9]:=4;
  ImagesNum[10]:=4;
  ImagesNum[11]:=4;
  ImagesNum[12]:=4;
  ImagesNum[13]:=5;
  ImagesNum[14]:=5;
  ImagesNum[15]:=5;
  ImagesNum[16]:=5;
  ImagesNum[17]:=6;
  ImagesNum[18]:=6;
  ImagesNum[19]:=6;
  ImagesNum[20]:=6;
  ImagesNum[21]:=7;
  ImagesNum[22]:=7;
  ImagesNum[23]:=7;
  ImagesNum[24]:=7;
  ImagesNum[25]:=8;
  ImagesNum[26]:=8;
  ImagesNum[27]:=8;
  ImagesNum[28]:=8;
  ImagesNum[29]:=9;
  ImagesNum[30]:=9;
  ImagesNum[31]:=9;
  ImagesNum[32]:=9;
  ImagesNum[33]:=10;
  ImagesNum[34]:=10;
  ImagesNum[35]:=10;
  ImagesNum[36]:=10;
  ImagesNum[37]:=2;
  ImagesNum[38]:=2;
  ImagesNum[39]:=2;
  ImagesNum[40]:=2;
  ImagesNum[41]:=3;
  ImagesNum[42]:=3;
  ImagesNum[43]:=3;
  ImagesNum[44]:=3;
  ImagesNum[45]:=4;
  ImagesNum[46]:=4;
  ImagesNum[47]:=4;
  ImagesNum[48]:=4;
  ImagesNum[49]:=11;
  ImagesNum[50]:=11;
  ImagesNum[51]:=11;
  ImagesNum[52]:=11;

  randomize;
  for i:=1 to w do
  begin
    u[i] := false;
  end;
  for i:=1 to w do
  begin
       v:=random(w)+1;
       while (u[v]=true) do
             v:=random(w)+1;
       u[v]:=true;
       ImagesVid[i]:=v;
  end;

 begin
  for i:=1 to w do
  begin
       idx:= ImagesVid[i];
    IsSelected[idx]:=false;
    Images[idx]:=TImage.Create(Self);
    Images[idx].Parent:=Form1;
    Images[idx].Width:=100;
    Images[idx].Height:=150;

    Images[idx].Visible:= true;
    Images[idx].Stretch:=true;
    Images[idx].Tag:=idx;

    s:='./pic'+IntToStr(idx)+'.bmp';
    Images[idx].Picture.LoadFromFile(s);
    Caption:=ExtractFilePath(Application.ExeName);
    Images[idx].OnClick:=@Image1Click;
    if (i<29) then
    begin
      Images[idx].Left:=(i mod 5)*150;
      Images[idx].Top:=(i div 5)*50;
    end else
    begin
      Images[idx].Left:=176;
      Images[idx].Top:=592;
    end;
  end;
 end;
end;

procedure TForm1.Image1Click(Sender: TObject);
var num :integer;
var i:integer;
begin
     num := TImage(Sender).Tag;
     IsSelected[num]:=not IsSelected[num];
     if (IsSelected[num]) then
     begin
        cntOfSel:=cntOfSel+1;
        sumOfSel:=sumOfSel+ImagesNum[num];
        Images[num].Picture.LoadFromFile('./pic'+IntToStr(num)+'select.bmp')
     end
     else
     begin
        cntOfSel:=cntOfSel-1;
        Images[num].Picture.LoadFromFile('./pic'+IntToStr(num)+'.bmp');
        sumOfSel:=sumOfSel-ImagesNum[num];
     end;

     if sumOfSel=13 then
     begin
        for i:=1 to w do
        begin
         if (IsSelected[i]) then
            Images[i].Visible:=false;
        end;
        sumOfSel:=0;
     end;
end;


procedure TForm1.Image1MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin

end;

procedure TForm1.Image2Click(Sender: TObject);

begin

end;

procedure TForm1.NewGameClick(Sender: TObject);
 begin
   MessageDlg('Новая игра','Игра началась', mtConfirmation, [mbOK],'');
 end;

end.

