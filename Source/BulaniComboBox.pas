unit BulaniComboBox;

interface

uses
  System.SysUtils, System.Classes, Vcl.Controls, Vcl.StdCtrls, Vcl.Graphics;

type
  TBulaniComboBox = class(TComboBox)
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
  RegisterComponents('Bulani', [TBulaniComboBox]);
end;

{ TBulaniComboBox }

constructor TBulaniComboBox.Create(AOwner : TComponent);
begin
  inherited Create(AOwner);
  FMudarCor := $00D6F4FE;
end;

procedure TBulaniComboBox.DoEnter;
begin
  inherited;
  Color := FMudarCor;
end;

procedure TBulaniComboBox.DoExit;
begin
  inherited;
  Color := clWindow;
end;

procedure TBulaniComboBox.SetMudarCor(const Value: TColor);
begin
  FMudarCor := Value;
end;

end.
