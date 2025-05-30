unit BulaniDBEdit;

interface

uses
  System.SysUtils, System.Classes, Vcl.Controls, Vcl.StdCtrls, Vcl.Mask,
  Vcl.ExtCtrls, Vcl.DBCtrls, Vcl.Graphics, Colors;

type
  TBulaniDBEdit = class(TDBEdit)
  private
    { Private declarations }
    FMudarCor: TColor;
    procedure SetMudarCor(const Value: TColor);
  protected
    { Protected declarations }
    procedure DoEnter; override;
    procedure DoExit; override;
  public
    { Public declarations }
    constructor Create(AOwner : TComponent); override;
  published
    { Published declarations }
    property MudarCor : TColor read FMudarCor write SetMudarCor;
  end;

procedure Register;

implementation

procedure Register;
begin
  RegisterComponents('Bulani', [TBulaniDBEdit]);
end;

{ TBulaniDBEdit }

constructor TBulaniDBEdit.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  FMudarCor := Colors.TThemeColors.Sky500;
end;

procedure TBulaniDBEdit.DoEnter;
begin
  inherited;
  Color := FMudarCor;
end;

procedure TBulaniDBEdit.DoExit;
begin
  inherited;
  Color := clWindow;
end;

procedure TBulaniDBEdit.SetMudarCor(const Value: TColor);
begin
  FMudarCor := Value;
end;

end.
