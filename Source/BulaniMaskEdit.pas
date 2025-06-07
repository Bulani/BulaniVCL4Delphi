unit BulaniMaskEdit;

interface

uses
  System.SysUtils, System.Classes, Vcl.Controls, Vcl.StdCtrls, Vcl.Mask,
  Vcl.Graphics, TailwindCSS;

type
  TTipoMascara = (tmData, tmCPF, tmCNPJ, tmCEP, tmTelefone, tmCelular, tmHora, tmValor, tmNone);
  TCasasDecimais = (Uma, Duas, Tres, Quatro, Cinco);
  TBulaniMaskEdit = class(TMaskEdit)
  private
    { Private declarations }
    FMudarCor: TColor;
    FTipoMascara: TTipoMascara;
    FCasasDecimais: TCasasDecimais;
    procedure SetMudarCor(const Value: TColor);
    procedure SetTipoMascara(const Value: TTipoMascara);
    procedure SetCasasDecimais(const Value: TCasasDecimais);
  protected
    { Protected declarations }
    procedure DoEnter; override;
    procedure DoExit; override;
  public
    { Public declarations }
    constructor Create(AOwner : TComponent); override;
  published
    { Published declarations }
    property TipoMascara : TTipoMascara read FTipoMascara write SetTipoMascara;
    property MudarCor : TColor read FMudarCor write SetMudarCor;
    property CasasDecimais : TCasasDecimais read FCasasDecimais write SetCasasDecimais;
  end;

procedure Register;

implementation

procedure Register;
begin
  RegisterComponents('Bulani', [TBulaniMaskEdit]);
end;

{ TBulaniMaskEdit }
function FormataValor(Valor : String) : Double;
Var
  i: Integer;
  NovoValor : String;
begin

  NovoValor :='';

  if Valor = '' then
  begin
    Valor := '0,00';
  end;

  for i := 1 to Length(Valor) do
  begin
    if Valor[i] <> '.' then
    begin
      NovoValor := NovoValor + Valor[i];
    end;
  end;

  Result := StrToFLoat (NovoValor);

end;

constructor TBulaniMaskEdit.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  FMudarCor    := TTailwind.Sky500;
  FTipoMascara := tmNone;
end;

procedure TBulaniMaskEdit.DoEnter;
begin
  inherited;
  Color := FMudarCor;
end;

procedure TBulaniMaskEdit.DoExit;
begin
  inherited;

  Color := clWindow;

  if (FTipoMascara = tmValor) and (Self.Text <> '') then
  begin

    case CasasDecimais of
      Uma    : Self.Text := FormatFloat('#,###,###,##0.0', FormataValor (Self.Text));
      Duas   : Self.Text := FormatFloat('#,###,###,##0.00', FormataValor (Self.Text));
      Tres   : Self.Text := FormatFloat('#,###,###,##0.000', FormataValor (Self.Text));
      Quatro : Self.Text := FormatFloat('#,###,###,##0.0000', FormataValor (Self.Text));
      Cinco  : Self.Text := FormatFloat('#,###,###,##0.00000', FormataValor (Self.Text));
    end;

  end;

end;

procedure TBulaniMaskEdit.SetCasasDecimais(const Value: TCasasDecimais);
begin
  FCasasDecimais:= Value;
end;

procedure TBulaniMaskEdit.SetMudarCor(const Value: TColor);
begin
  FMudarCor := Value;
end;

procedure TBulaniMaskEdit.SetTipoMascara(const Value: TTipoMascara);
begin

  FTipoMascara := Value;

  case value of
    tmData:
      EditMask:= '99/99/9999;1;_';

    tmCPF:
      EditMask:= '999.999.999-99;0;_';

    tmCNPJ:
      EditMask:= '99.999.999/9999-99;0;_';

    tmCEP:
      EditMask:= '99.999-999;0;_';

    tmTelefone:
      EditMask:= '(99) 9999-9999;0;_';

    tmCelular:
      EditMask:= '(99) 9 9999-9999;0;_';

    tmHora:
      EditMask:= '99:99;1;_';

    tmValor:
      EditMask:= '';

    tmNone:
      EditMask:= '';

  end;

end;

end.

