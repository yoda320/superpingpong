unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, ExtCtrls, Menus,
  StdCtrls, Buttons;

type

  { TForm1 }

  TForm1 = class(TForm)
    BitBtn1: TBitBtn;
    Button1: TButton;
    Button2: TButton;
    Label1: TLabel;
    Label2: TLabel;
    Shape1: TShape;
    Shape2: TShape;
    Timer1: TTimer;
    procedure BitBtn1Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure Label2Click(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
  private

  public

  end;

var
  Form1: TForm1;
  xSpeed: integer;
  ySpeed: integer;
  score: integer;

implementation

{$R *.lfm}

{ TForm1 }

procedure TForm1.Timer1Timer(Sender: TObject);
begin
  shape1.top:=shape1.top + ySpeed;
  shape1.left:=shape1.Left + xSpeed;

  if (shape1.left<=0) then xSpeed:=-xSpeed; //левый край
  if (shape1.left>=992-shape1.Width) then xSpeed:=-xSpeed; //правый край
  if (shape1.top<=0) then ySpeed:=-ySpeed;

  if ( (shape1.top>=632-shape1.Height) and (shape1.left>=shape2.left) and (shape1.Left<=shape2.left+shape2.Width)) then
  begin
  score:=score+1;
  label1.caption:='Score : ' + inttostr(score);
  ySpeed:=-ySpeed;
  end;
  if (shape1.Top>=686-shape1.Height) then
  begin
  button1.caption:='Restart';
  label2.caption:='GAME OVER';
  button1.visible:=true;
  button2.visible:=true;
  timer1.enabled:=false;


  end;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
   xSpeed:=10;
   ySpeed:=10;
   timer1.Enabled:=false;
end;

procedure TForm1.Button1Click(Sender: TObject);// старт / новая попытка
begin
shape1.left:=400;
shape1.Top:=320;
timer1.Enabled:=true;
button1.visible:=false;
button2.visible:=false;
label2.caption:='';
shape2.left:=461;
label1.caption:='Score :';
end;

procedure TForm1.BitBtn1Click(Sender: TObject);
begin
  if timer1.Enabled=false then timer1.Enabled:=true
  else timer1.enabled:=false;
end;

procedure TForm1.Button2Click(Sender: TObject);// конец игры
begin
close;
end;

procedure TForm1.FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState
  );
begin
     if Key = 37 then shape2.left:=shape2.Left-8; //налево
     if Key = 39 then shape2.left:=shape2.Left+8; //направо
     if (shape2.left<=0) then shape2.Left:=0;
     if (shape2.left>=992-shape2.width) then (shape2.Left:=992-shape2.width);
end;

procedure TForm1.Label2Click(Sender: TObject);
begin

end;

end.

