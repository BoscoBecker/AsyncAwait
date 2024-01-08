unit Main;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, OtlParallel;
type
  TForm1 = class(TForm)
    Button1: TButton;
    procedure Button1Click(Sender: TObject);
  private
    button: TButton;
    procedure DoStart(Sender: TObject);
    procedure DoSleep;
    procedure DoDone;
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.Button1Click(Sender: TObject);
begin
  DoStart(Sender);
  Async(DoSleep)
    .Await(DoDone);
end;

procedure TForm1.DoDone;
begin
  button.Caption := 'Done';
  button.Enabled := True;
end;

procedure TForm1.DoSleep;
begin
  Sleep(3000);
end;

procedure TForm1.DoStart(Sender: TObject);
begin
  button := Sender as TButton;
  button.Caption := 'Working ...';
  button.Enabled := false;
end;

end.
