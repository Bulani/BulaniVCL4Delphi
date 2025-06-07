unit BulaniEdit;

interface

uses
  System.SysUtils, System.Classes, Vcl.Controls, Vcl.ExtCtrls, Vcl.StdCtrls, Vcl.Graphics,
  Vcl.Forms, TailwindCSS, Windows, Messages;

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
    procedure SetEnabled(Value: Boolean); override;
  protected
    procedure Resize; override;
    procedure Paint; override;
  public
    constructor Create(AOwner: TComponent); override;
    property EditControl: TEdit read FEdit;
  published
    property Text: string read GetText write SetText;
    property Enabled write SetEnabled default True;
    property Align;
    property Anchors;
    property BevelOuter;
    property BevelInner;
    property BevelKind;
    property BevelWidth;
    property BorderWidth;
    property BorderStyle;
    property Color;
    property Ctl3D;
    property Font;
    property ParentBackground;
    property ParentColor;
    property ParentCtl3D;
    property ParentFont;
    property ParentShowHint;
    property PopupMenu;
    property ShowHint;
    property TabOrder;
    property TabStop;
    property Visible;
    property OnClick;
    property OnDblClick;
    property OnEnter;
    property OnExit;
    property OnMouseDown;
    property OnMouseMove;
    property OnMouseUp;
    property OnResize;
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
  Color := TTailwind.Slate200;
  ParentBackground := False;
  inherited Enabled := True;

  FEdit := TEdit.Create(Self);
  FEdit.Parent := Self;
  FEdit.BorderStyle := bsNone;
  FEdit.Align := alNone;
  FEdit.Color := Color;
  FEdit.Font.Name := 'Inter';
  FEdit.Font.Size := 10;
  FEdit.OnEnter := EditEnter;
  FEdit.OnExit := EditExit;
  FEdit.Enabled := Enabled;

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

procedure TBulaniEdit.SetEnabled(Value: Boolean);
begin
  if Enabled <> Value then
  begin
    inherited SetEnabled(Value);
    FEdit.Enabled := Value;
    UpdateStyles;
  end;
end;

procedure TBulaniEdit.UpdateStyles;
begin
  if not Enabled then
  begin
    Color := TTailwind.Slate200;
    FEdit.Color := TTailwind.Slate200;
    FEdit.Font.Color := TTailwind.Gray500;
    FEdit.ParentFont := False;
  end
  else if FFocused then
  begin
    Color := TTailwind.Slate200;
    FEdit.Color := TTailwind.Slate200;
    FEdit.Font.Color := TTailwind.Gray900;
    FEdit.ParentFont := False;
  end
  else
  begin
    Color := TTailwind.Slate200;
    FEdit.Color := TTailwind.Slate200;
    FEdit.Font.Color := TTailwind.Gray700;
    FEdit.ParentFont := False;
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
    Canvas.Pen.Color := TTailwind.Slate300
  else if FFocused then
    Canvas.Pen.Color := TTailwind.Sky500
  else
    Canvas.Pen.Color := TTailwind.Slate400;

  Canvas.Rectangle(R.Left, R.Top, R.Right, R.Bottom);
end;

end.