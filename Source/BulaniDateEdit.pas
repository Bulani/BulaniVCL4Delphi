unit BulaniDateEdit;

interface

uses
  System.SysUtils, System.Classes, Vcl.Controls, Vcl.StdCtrls, Vcl.Mask,
  JvExMask, JvToolEdit, Vcl.Graphics, TailwindCSS;

type
  TBulaniDateEdit = class(TJvDateEdit)
  private
  { Private declarations }
    FMudarCor : TColor;
    procedure SetMudarCor(const Value: TColor);
  protected
    procedure DoEnter; override;
    procedure DoExit; override;
    { Protected declarations }
  public
    constructor Create(AOwner: TComponent); override;
    { Public declarations }
  published
    property MudarCor : TColor read FMudarCor write SetMudarCor;
   { Published declarations }
  end;

procedure Register;

implementation

procedure Register;
begin
  RegisterComponents('Bulani', [TBulaniDateEdit]);
end;

{ TBulaniDateEdit }

constructor TBulaniDateEdit.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  FMudarCor := TTailwind.Sky500;
end;

procedure TBulaniDateEdit.DoEnter;
begin
  inherited;
  Color := FMudarCor;
end;

procedure TBulaniDateEdit.DoExit;
begin
  inherited;
  Color := clWindow;
end;

procedure TBulaniDateEdit.SetMudarCor(const Value: TColor);
begin
  FMudarCor := Value;
end;

end.
