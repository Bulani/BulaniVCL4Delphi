unit BulaniEdit;

interface

uses
  System.SysUtils, System.Classes, Vcl.Controls, Vcl.ExtCtrls, Vcl.StdCtrls, Vcl.Graphics,
  Vcl.Forms, Colors, Windows, Messages;

type
  TBulaniEdit = class(TCustomPanel)
  private
    FEdit: TEdit;
    FFocused: Boolean;
    procedure EditEnter(Sender: TObject);
    procedure EditExit(Sender: TObject);
    procedure SetText(const Value: string);
    function GetText: string;
    procedure UpdateStyles;
    procedure AdjustEditPosition;
  protected
    procedure Resize; override;
    procedure Paint; override;
  public
    constructor Create(AOwner: TComponent); override;
    property EditControl: TEdit read FEdit;
    property Text: string read GetText write SetText;
  end;

procedure Register;

implementation

procedure Register;
begin
  RegisterComponents('Bulani', [TBulaniEdit]);
end;

{ TBulaniEdit }

constructor TBulaniEdit.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);

  BevelOuter := bvNone;
  Height := 30;
  Width := 200;
  Color := TThemeColors.Slate200;
  ParentBackground := False;

  FEdit := TEdit.Create(Self);
  FEdit.Parent := Self;
  FEdit.BorderStyle := bsNone;
  FEdit.Align := alNone;
  FEdit.Color := Color;
  FEdit.Font.Name := 'Inter';
  FEdit.Font.Size := 10;
  FEdit.OnEnter := EditEnter;
  FEdit.OnExit := EditExit;

  AdjustEditPosition;
  UpdateStyles;
end;

procedure TBulaniEdit.AdjustEditPosition;
var
  EditHeight: Integer;
begin
  if not Assigned(FEdit) then Exit;

  EditHeight := FEdit.Font.Size + 8;

  if EditHeight > Height - 4 then
    EditHeight := Height - 4;

  FEdit.Height := EditHeight;
  FEdit.Top := (Height - FEdit.Height) div 2;
  FEdit.Left := 8;
  FEdit.Width := Width - 16;
end;

procedure TBulaniEdit.EditEnter(Sender: TObject);
begin
  FFocused := True;
  UpdateStyles;
end;

procedure TBulaniEdit.EditExit(Sender: TObject);
begin
  FFocused := False;
  UpdateStyles;
end;

function TBulaniEdit.GetText: string;
begin
  Result := FEdit.Text;
end;

procedure TBulaniEdit.SetText(const Value: string);
begin
  FEdit.Text := Value;
end;

procedure TBulaniEdit.UpdateStyles;
begin
  if not Enabled then
  begin
    Color := TThemeColors.Slate200;
    FEdit.Color := TThemeColors.Slate200;
    Font.Color := TThemeColors.Gray400;
  end
  else if FFocused then
  begin
    Color := TThemeColors.Slate200;
    FEdit.Color := TThemeColors.Slate200;
    Font.Color := TThemeColors.Gray900;
  end
  else
  begin
    Color := TThemeColors.Slate200;
    FEdit.Color := TThemeColors.Slate200;
    Font.Color := TThemeColors.Gray700;
  end;
  Invalidate;
end;

procedure TBulaniEdit.Resize;
begin
  inherited;
  AdjustEditPosition;
end;

procedure TBulaniEdit.Paint;
var
  R: TRect;
begin
  inherited;
  R := ClientRect;
  InflateRect(R, -1, -1);

  Canvas.Brush.Style := bsClear;
  Canvas.Pen.Width := 1;

  if not Enabled then
    Canvas.Pen.Color := TThemeColors.Slate300
  else if FFocused then
    Canvas.Pen.Color := TThemeColors.Sky500
  else
    Canvas.Pen.Color := TThemeColors.Slate400;

  Canvas.Rectangle(R.Left, R.Top, R.Right, R.Bottom);
end;

end.
