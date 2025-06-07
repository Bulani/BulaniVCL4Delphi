unit BulaniDBDateEdit;

interface

uses
  System.SysUtils, System.Classes, Vcl.Controls, Vcl.StdCtrls, Vcl.Mask,
  JvExMask, JvToolEdit, JvDBControls, Vcl.Graphics,
  TailwindCSS;

type
  TBulaniDBDateEdit = class(TJvDBDateEdit)
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
  RegisterComponents('Bulani', [TBulaniDBDateEdit]);
end;

{ TBulaniDBDateEdit }

constructor TBulaniDBDateEdit.Create(AOwner : TComponent);
begin
  inherited Create(AOwner);
  FMudarCor := TTailwind.Sky500;
end;

procedure TBulaniDBDateEdit.DoEnter;
begin
  inherited;
  Color := FMudarCor;
end;

procedure TBulaniDBDateEdit.DoExit;
begin
  inherited;
  Color := clWindow;
end;

procedure TBulaniDBDateEdit.SetMudarCor(const Value: TColor);
begin
  FMudarCor := Value;
end;

end.
