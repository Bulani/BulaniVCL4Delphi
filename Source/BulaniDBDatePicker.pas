unit BulaniDBDatePicker;

interface

uses
  System.SysUtils, System.Classes, Vcl.Controls, Vcl.StdCtrls, Vcl.Mask,
  JvExMask, JvToolEdit, JvMaskEdit, JvCheckedMaskEdit, JvDatePickerEdit,
  JvDBDatePickerEdit, Vcl.Graphics;

type
  TBulaniDBDatePicker = class(TJvDBDatePickerEdit)
  private
    { Private declarations }
    FMudarCor: TColor;
    procedure SetMudarCor(const Value: TColor);
  protected
    { Protected declarations }
    procedure DoEnter; override;
    procedure DoExit; override;
  public
    constructor Create(AOwner : TComponent); override;
  published
    { Published declarations }
    property MudarCor : TColor read FMudarCor write SetMudarCor;
  end;

procedure Register;

implementation

procedure Register;
begin
  RegisterComponents('Bulani', [TBulaniDBDatePicker]);
end;

{ TBulaniDBDatePicker }

constructor TBulaniDBDatePicker.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  FMudarCor := $00D6F4FE;
end;

procedure TBulaniDBDatePicker.DoEnter;
begin
  inherited;
  Color := FMudarCor;
end;

procedure TBulaniDBDatePicker.DoExit;
begin
  inherited;
  Color := clWindow;
end;

procedure TBulaniDBDatePicker.SetMudarCor(const Value: TColor);
begin
  FMudarCor := Value;
end;

end.
