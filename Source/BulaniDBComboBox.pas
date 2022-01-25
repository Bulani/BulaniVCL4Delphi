unit BulaniDBComboBox;

interface

uses
  System.SysUtils, System.Classes, Vcl.Controls, Vcl.StdCtrls, Vcl.DBCtrls,
  Vcl.Graphics;

type
  TBulaniDBComboBox = class(TDBComboBox)
  private
    { Private declarations }
    FMudarCor : TColor;
    procedure SetMudarCor(const Value: TColor);
  protected
    { Protected declarations }
    procedure DoEnter; override;
    procedure DoExit; override;
  public
    { Public declarations }
    constructor Create(AOwner: TComponent); override;
  published
    { Published declarations }
    property MudarCor : TColor read FMudarCor write SetMudarCor;
  end;

procedure Register;

implementation

procedure Register;
begin
  RegisterComponents('Bulani', [TBulaniDBComboBox]);
end;

{ TBulaniDBComboBox }

constructor TBulaniDBComboBox.Create(AOwner : TComponent);
begin
  inherited Create(AOwner);
  FMudarCor := $00D6F4FE;
end;

procedure TBulaniDBComboBox.DoEnter;
begin
  inherited;
  Color := FMudarCor;
end;

procedure TBulaniDBComboBox.DoExit;
begin
  inherited;
  Color := clWindow;
end;

procedure TBulaniDBComboBox.SetMudarCor(const Value: TColor);
begin
  FMudarCor := Value;
end;

end.

