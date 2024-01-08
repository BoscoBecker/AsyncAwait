Sample 

procedure TForm125.Button1Click(Sender: TObject);
var
  button: TButton;
begin
  button := Sender as TButton;
  button.Caption := 'Working ...';
  button.Enabled := false;
  Async(
    procedure begin
      Sleep(5000);
    end).
  Await(
    procedure begin
      button.Enabled := true;
      button.Caption := 'Done!';
    end);
end;

https://www.thedelphigeek.com/2012/07/asyncawait-in-delphi.html
