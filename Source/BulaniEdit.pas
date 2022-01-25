unit BulaniEdit;

interface

uses
  System.SysUtils, System.Classes, Vcl.Controls, Vcl.StdCtrls, Vcl.Graphics;

type
  TBulaniEdit = class(TEdit)
  private
    FMudarCor : TColor;
    FCampoObrigatorio: Boolean;
    FMensagem: String;
    procedure SetMudarCor(const Value: TColor);
    procedure SetCampoObrigatorio(const Value: Boolean);
    procedure SetMensagem(const Value: String);
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
    property Mensagem : String read FMensagem write SetMensagem;
    property CampoObrigatorio : Boolean read FCampoObrigatorio write SetCampoObrigatorio;
   {{ Published declarations }
  end;

procedure Register;

implementation

procedure Register;
begin
  RegisterComponents('Bulani', [TBulaniEdit]);
end;

{ TBulaniEdit }

constructor TBulaniEdit.Create(AOwner : TComponent);
begin
  inherited Create(AOwner);
  FMudarCor := $00D6F4FE;
end;

procedure TBulaniEdit.DoEnter;
begin
  inherited;
  Color := FMudarCor;
end;

procedure TBulaniEdit.DoExit;
begin
  inherited;
  Color := clWindow;
end;

procedure TBulaniEdit.SetCampoObrigatorio(const Value: Boolean);
begin
  FCampoObrigatorio := Value;
end;

procedure TBulaniEdit.SetMensagem(const Value: String);
begin
  FMensagem := Value;
end;

procedure TBulaniEdit.SetMudarCor(const Value: TColor);
begin
  FMudarCor := Value;
end;

end.

