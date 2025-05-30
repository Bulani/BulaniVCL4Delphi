unit BulaniDBLookupComboBox;

interface

uses
  System.SysUtils, System.Classes, Vcl.Controls, Vcl.DBCtrls, Vcl.Graphics,
  Colors;

type
  TBulaniDBLookupComboBox = class(TDBLookupComboBox)
  private
    FMudarCor : TColor;
    procedure SetMudarCor(const Value: TColor);
    { Private declarations }
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
  RegisterComponents('Bulani', [TBulaniDBLookupComboBox]);
end;

{ TBulaniDBLookupComboBox }

constructor TBulaniDBLookupComboBox.Create(AOwner : TComponent);
begin
  inherited;
  inherited Create(AOwner);
  FMudarCor := Colors.TThemeColors.Sky500;
end;

procedure TBulaniDBLookupComboBox.DoEnter;
begin
  inherited;
  Color := FMudarCor;
end;

procedure TBulaniDBLookupComboBox.DoExit;
begin
  inherited;
  Color := clWindow;
end;

procedure TBulaniDBLookupComboBox.SetMudarCor(const Value: TColor);
begin
  FMudarCor := Value;
end;

end.

