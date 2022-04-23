{-----------------------------------------------------------------------------
The contents of this file are subject to the Mozilla Public License
Version 1.1 (the "License"); you may not use this file except in compliance
with the License. You may obtain a copy of the License at
http://www.mozilla.org/MPL/MPL-1.1.html

Software distributed under the License is distributed on an "AS IS" basis,
WITHOUT WARRANTY OF ANY KIND, either expressed or implied. See the License for
the specific language governing rights and limitations under the License.

The Original Code is: JvgSpeedButton.PAS, released on 2003-01-15.

The Initial Developer of the Original Code is Andrey V. Chudin,  [chudin att yandex dott ru]
Portions created by Andrey V. Chudin are Copyright (C) 2003 Andrey V. Chudin.
All Rights Reserved.

Contributor(s):
Michael Beck [mbeck att bigfoot dott com].

You may retrieve the latest version of this file at the Project JEDI's JVCL home page,
located at http://jvcl.delphi-jedi.org

Known Issues:
-----------------------------------------------------------------------------}
// $Id$

unit BulaniButton;

{$I jvcl.inc}

interface

uses
  {$IFDEF UNITVERSIONING}
  JclUnitVersioning,
  {$ENDIF UNITVERSIONING}
  Windows, Messages, Classes, Controls, Graphics,
  ExtCtrls, Buttons, StdCtrls, Forms,
  JVCLVer,
  JvgTypes, JvgCommClasses, JvgUtils;

type
  TTipoButton = (tbRed, tbGreen, tbBlue, tbYellow, tbNone);
  TBulaniButton = class(TSpeedButton)
  private
    FAboutJVCL: TJVCLAboutInfo;
    FMouseEnter: Boolean;
    FColor: TColor;
    FIsDown: Boolean;
    FControl: TControl;
    FFrame: Boolean;
    FCaptionLabel: TLabel;
    FDefaultStyle: Boolean;
    FModalResult: TModalResult;
    FFrameColor: TColor;
    FActiveColor: TColor;
    FTipoButton: TTipoButton;
    procedure CMMouseEnter(var Msg: TMessage); message CM_MOUSEENTER;
    procedure CMMouseLeave(var Msg: TMessage); message CM_MOUSELEAVE;
    procedure SetControl(const Value: TControl);
    procedure SetFrame(const Value: Boolean);
    procedure SetCaptionLabel(const Value: TLabel);
    procedure SetDefaultStyle(const Value: Boolean);
    procedure SetColor(const Value: TColor);
    procedure SetFrameColor(const Value: TColor);
    procedure SetTipoButton(const Value: TTipoButton);
  protected
    procedure MouseEnter(Control: TControl); dynamic;
    procedure MouseLeave(Control: TControl); dynamic;
    { (rb) Better respond to CM_ENABLEDCHANGED, but don't know if that works on D5,D6 }
    procedure SetEnabled(Value: Boolean); override;
    function GetEnabled: Boolean; override;
    procedure Paint; override;
    procedure MouseDown(Button: TMouseButton; Shift: TShiftState; X, Y: Integer); override;
    procedure MouseUp(Button: TMouseButton; Shift: TShiftState; X, Y: Integer); override;
  public
    constructor Create(AOwner: TComponent); override;
    procedure Click; override;
    property Canvas;
  published
    property AboutJVCL: TJVCLAboutInfo read FAboutJVCL write FAboutJVCL stored False;
    property Color: TColor read FColor write SetColor;
    property ActiveColor: TColor read FActiveColor write FActiveColor;
    property Control: TControl read FControl write SetControl;
    property CaptionLabel: TLabel read FCaptionLabel write SetCaptionLabel;
    property Frame: Boolean read FFrame write SetFrame default True;
    property FrameColor: TColor read FFrameColor write SetFrameColor;
    property DefaultStyle: Boolean read FDefaultStyle write SetDefaultStyle;
    property Enabled: Boolean read GetEnabled write SetEnabled;
    property ModalResult: TModalResult read FModalResult write FModalResult;
    property TipoButton : TTipoButton read FTipoButton write SetTipoButton;
  end;

  TBulaniExtButton = class(TBulaniButton)
  private
    FStyle: TJvgSpeedButtonStyle;
    FStyleActive: TJvgSpeedButtonStyle;
    FStylePushed: TJvgSpeedButtonStyle;
    procedure SetColor(const Value: TColor);
    procedure SetActiveColor(const Value: TColor);
    function GetFont: TFont;
    procedure SetFont(const Value: TFont);
    function GetActiveColor: TColor;
    function GetColor: TColor;
    procedure SetStyle(Value: TJvgSpeedButtonStyle);
    procedure SetStyleActive(Value: TJvgSpeedButtonStyle);
    procedure SetStylePushed(Value: TJvgSpeedButtonStyle);
    procedure ButtonChanged(Sender: TObject);
  protected
    procedure MouseEnter(Control: TControl); override;
    procedure MouseLeave(Control: TControl); override;
    procedure Paint; override;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
  published
    property ActiveColor: TColor read GetActiveColor write SetActiveColor stored False;
    property Color: TColor read GetColor write SetColor stored False;
    property Style: TJvgSpeedButtonStyle read FStyle write SetStyle;
    property StyleActive: TJvgSpeedButtonStyle read FStyleActive write SetStyleActive;
    property StylePushed: TJvgSpeedButtonStyle read FStylePushed write SetStylePushed;
    property Font: TFont read GetFont write SetFont;
  end;

{$IFDEF UNITVERSIONING}
const
  UnitVersioning: TUnitVersionInfo = (
    RCSfile: '$URL$';
    Revision: '$Revision$';
    Date: '$Date$';
    LogPath: 'JVCL\run'
  );
{$ENDIF UNITVERSIONING}

procedure Register;

implementation

procedure Register;
begin
  RegisterComponents('Bulani', [TBulaniButton]);
end;

//=== { TBulaniButton } ====================================================

constructor TBulaniButton.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  //..defaults
  FColor := IncColor(GetSysColor(COLOR_BTNFACE), 30);
  FActiveColor := IncColor(FColor, 10);
  FFrame := True;
  FTipoButton := tbNone;
end;

procedure TBulaniButton.Paint;
var
  R: TRect;
  BevelOuter: TPanelBevel;
begin
  if csDestroying in ComponentState then
    Exit;
  if DefaultStyle then
  begin
    inherited Paint;
    Exit;
  end;
  if SystemColorDepth < 16 then
    FColor := GetNearestColor(Canvas.Handle, FColor);

  R := ClientRect;

  if Down or (FIsDown and FMouseEnter) then
    BevelOuter := bvLowered
  else
    BevelOuter := bvRaised;
  if Flat and not FIsDown then
    BevelOuter := bvNone;

  if FFrame then
    InflateRect(R, -1, -1);
  Dec(R.Right);
  Dec(R.Bottom);
  DrawBoxEx(Canvas.Handle, R, ALLGLSIDES, bvNone, BevelOuter, False,
    IIF(FMouseEnter, ActiveColor, Color), False);

  if Transparent then
    SetBkMode(Canvas.Handle, Windows.TRANSPARENT)
  else
    SetBkMode(Canvas.Handle, Windows.OPAQUE);

  Canvas.Font.Assign(Font);
  if not Enabled then
    Canvas.Font.Color := clGrayText;
  if Assigned(Glyph) then
    Inc(R.Left, Glyph.Width);

  if FIsDown then
    OffsetRect(R, 1, 1);
  Windows.DrawText(Canvas.Handle, PChar(Caption), Length(Caption), R,
    DT_SINGLELINE or DT_CENTER or DT_VCENTER);

  R := ClientRect;
  Canvas.Brush.Color := clBlack;
  if FFrame then
  begin
    Canvas.Font.Color := FFrameColor;
    Canvas.FrameRect(R);
  end;

  if Assigned(Glyph) then
    CreateBitmapExt(Canvas.Handle, Glyph, ClientRect, (Width - Glyph.Width -
      Canvas.TextWidth(Caption)) div 2 + Integer(FIsDown) - 1 - Spacing, 1 +
      (Height - Glyph.Height) div 2 + Integer(FIsDown),
      fwoNone, fdsDefault,
      True, GetTransparentColor(Glyph, ftcLeftBottomPixel), 0);
end;

procedure TBulaniButton.CMMouseEnter(var Msg: TMessage);
begin
  inherited;
  MouseEnter(TControl(Msg.LParam));
end;

procedure TBulaniButton.CMMouseLeave(var Msg: TMessage);
begin
  inherited;
  MouseLeave(TControl(Msg.LParam));
end;

procedure TBulaniButton.MouseEnter(Control: TControl);
begin
  if csDesigning in ComponentState then
    Exit;
  FMouseEnter := True;
  if FIsDown or (Color <> ActiveColor) then
    Invalidate;
end;

procedure TBulaniButton.MouseLeave(Control: TControl);
begin
  if csDesigning in ComponentState then
    Exit;
  FMouseEnter := False;
  if FIsDown or (Color <> ActiveColor) then
    Invalidate;
end;

procedure TBulaniButton.MouseDown(Button: TMouseButton; Shift: TShiftState;
  X, Y: Integer);
begin
  inherited MouseDown(Button, Shift, X, Y);
  FIsDown := True;
  Invalidate;
end;

procedure TBulaniButton.MouseUp(Button: TMouseButton; Shift: TShiftState;
  X, Y: Integer);
begin
  inherited MouseUp(Button, Shift, X, Y);
  FIsDown := False;
  Invalidate;
end;

procedure TBulaniButton.Click;
var
  Form: TCustomForm;
begin
  inherited Click;
  if ModalResult = mrNone then
    Exit;
  Form := GetParentForm(Self);
  if Form <> nil then
    Form.ModalResult := ModalResult;
end;

procedure TBulaniButton.SetControl(const Value: TControl);
begin
  FControl := Value;
end;

procedure TBulaniButton.SetFrame(const Value: Boolean);
begin
  if FFrame <> Value then
  begin
    FFrame := Value;
    Invalidate;
  end;
end;

procedure TBulaniButton.SetCaptionLabel(const Value: TLabel);
begin
  if FCaptionLabel <> Value then
  begin
    FCaptionLabel := Value;
    Invalidate;
  end;
end;

procedure TBulaniButton.SetDefaultStyle(const Value: Boolean);
begin
  if FDefaultStyle <> Value then
  begin
    FDefaultStyle := Value;
    Invalidate;
  end;
end;

procedure TBulaniButton.SetEnabled(Value: Boolean);
begin
  inherited SetEnabled(Value);
  if Assigned(FControl) then
    FControl.Enabled := Value;
end;

function TBulaniButton.GetEnabled: Boolean;
begin
  Result := inherited GetEnabled;
end;

procedure TBulaniButton.SetColor(const Value: TColor);
begin
  if FColor <> Value then
  begin
    FColor := Value;
    Invalidate;
  end;
end;

procedure TBulaniButton.SetFrameColor(const Value: TColor);
begin
  if FFrameColor <> Value then
  begin
    FFrameColor := Value;
    Invalidate;
  end;
end;

procedure TBulaniButton.SetTipoButton(const Value: TTipoButton);
begin
  FTipoButton := Value;

  case value of

    tbGreen:
    begin
      FColor       := $0051C800;
      FActiveColor := $0060AE27;
      Cursor       := crHandPoint;
      Flat         := True;
      Frame        := False;
      Height       := 40;
      ParentFont   := False;
      Width        := 120;
      Invalidate;
    end;

    tbRed:
    begin
      FColor       := $004444FF;
      FActiveColor := $002B39C0;
      Cursor       := crHandPoint;
      Flat         := True;
      Frame        := False;
      Height       := 40;
      ParentFont   := False;
      Width        := 120;
      Invalidate;
    end;

    tbBlue:
    begin
      FColor       := $00E5B533;
      FActiveColor := $00B98029;
      Cursor       := crHandPoint;
      Flat         := True;
      Frame        := False;
      Height       := 40;
      ParentFont   := False;
      Width        := 120;
      Invalidate;
    end;

    tbYellow:
    begin
      FColor       := $0033BBFF;
      FActiveColor := $00129CF3;
      Cursor       := crHandPoint;
      Flat         := True;
      Frame        := False;
      Height       := 40;
      ParentFont   := False;
      Width        := 120;
      Invalidate;
    end;

    tbNone:
    begin
      Invalidate;
    end;

  end;

end;

//=== { TBulaniExtButton } =================================================

constructor TBulaniExtButton.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  FStyle := TJvgSpeedButtonStyle.Create;
  FStyleActive := TJvgSpeedButtonStyle.Create;
  FStylePushed := TJvgSpeedButtonStyle.Create;

  FStyle.OnChanged := ButtonChanged;
  FStyleActive.OnChanged := ButtonChanged;
  FStylePushed.OnChanged := ButtonChanged;
  //..defaults
  FStyle.Color := IncColor(clBtnFace, 30);
  FStyleActive.Color := IncColor(FStyle.Color, 10);
  FStylePushed.Color := DecColor(FStyle.Color, 10);
  FStyle.Bevel.Inner := bvRaised;
  FStyleActive.Bevel.Inner := bvRaised;
  FStylePushed.Bevel.Inner := bvLowered;
end;

destructor TBulaniExtButton.Destroy;
begin
  FStyle.Free;
  FStyleActive.Free;
  FStylePushed.Free;
  inherited Destroy;
end;

procedure TBulaniExtButton.Paint;
var
  R: TRect;
  Offset: Integer;
  LStyle: TJvgSpeedButtonStyle;

  function TextStyle: TglTextStyle;
  begin
    if Enabled then
      Result := LStyle.TextStyle
    else
      Result := fstPushed;
  end;

begin
  if DefaultStyle then
  begin
    inherited Paint;
    Exit;
  end;
  R := ClientRect;

  if Down or (FIsDown and FMouseEnter) then
    LStyle := StylePushed
  else
  if FMouseEnter then
    LStyle := StyleActive
  else
    LStyle := Style;

  if FFrame then
    InflateRect(R, -1, -1);
  Dec(R.Right);
  Dec(R.Bottom);

  with LStyle do
  begin
    R := DrawBoxEx(Canvas.Handle, R, Bevel.Sides, Bevel.Inner, Bevel.Outer, Bevel.Bold, Color, Gradient.Active);
    if Gradient.Active then
    begin
      Inc(R.Right);
      Inc(R.Bottom);
      Gradient.Draw(Canvas.Handle, R, Integer(psSolid), 1);
      Dec(R.Right);
      Dec(R.Bottom);
    end;
  end;

  if not Glyph.Empty then
    Inc(R.Left, Glyph.Width);

  Canvas.Font.Assign(LStyle.Font);
  if FIsDown then
    Offset := 1
  else
    Offset := 0;
  ExtTextOutExt(Canvas.Handle, R.Left + Offset + (R.Right - R.Left - Canvas.TextWidth(Caption)) div 2, R.Top + Offset +
    (R.Bottom - R.Top - Canvas.TextHeight(Caption)) div 2, R, Caption,
    TextStyle, False { fcoDelineatedText in Options},
    False, LStyle.Font.Color, LStyle.DelineateColor,
    LStyle.HighlightColor, LStyle.ShadowColor,
    nil, LStyle.TextGradient, LStyle.Font);

  R := ClientRect;
  Canvas.Brush.Color := 0;
  if FFrame then
  begin
    Canvas.Font.Color := FFrameColor;
    Canvas.FrameRect(R);
  end;

  if Assigned(Glyph) then
    CreateBitmapExt(Canvas.Handle, Glyph, ClientRect, (Width - Glyph.Width - Canvas.TextWidth(Caption)) div 2 +
      Integer(FIsDown) - 1 - Spacing, 1 + (Height - Glyph.Height) div 2 + Integer(FIsDown),
      fwoNone, fdsDefault,
      True, GetTransparentColor(Glyph, ftcLeftBottomPixel), 0);
end;

procedure TBulaniExtButton.MouseEnter(Control: TControl);
begin
  if csDesigning in ComponentState then
    Exit;
  inherited MouseEnter(Control);
  if Enabled then
  begin
    FMouseEnter := True;
    Repaint;
  end;
end;

procedure TBulaniExtButton.MouseLeave(Control: TControl);
begin
  if csDesigning in ComponentState then
    Exit;
  inherited MouseLeave(Control);
  if Enabled then
  begin
    FMouseEnter := False;
    Repaint;
  end;
end;

procedure TBulaniExtButton.ButtonChanged(Sender: TObject);
begin
  if not (csLoading in ComponentState) then
    Invalidate;
end;

procedure TBulaniExtButton.SetColor(const Value: TColor);
begin
  if Style.Color <> Value then
  begin
    Style.Color := Value;
    Invalidate;
  end;
end;

procedure TBulaniExtButton.SetActiveColor(const Value: TColor);
begin
  if StyleActive.Color <> Value then
  begin
    StyleActive.Color := Value;
    Invalidate;
  end;
end;

function TBulaniExtButton.GetActiveColor: TColor;
begin
  Result := StyleActive.Color;
end;

function TBulaniExtButton.GetColor: TColor;
begin
  Result := Style.Color;
end;

function TBulaniExtButton.GetFont: TFont;
begin
  Result := inherited Font;
end;

procedure TBulaniExtButton.SetFont(const Value: TFont);
begin
  inherited Font.Assign(Font);
  Style.Font.Assign(Font);
end;

procedure TBulaniExtButton.SetStyle(Value: TJvgSpeedButtonStyle);
begin
  FStyle.Assign(Value);
end;

procedure TBulaniExtButton.SetStyleActive(Value: TJvgSpeedButtonStyle);
begin
  FStyleActive.Assign(Value);
end;

procedure TBulaniExtButton.SetStylePushed(Value: TJvgSpeedButtonStyle);
begin
  FStylePushed.Assign(Value);
end;

{$IFDEF UNITVERSIONING}
initialization
  RegisterUnitVersion(HInstance, UnitVersioning);

finalization
  UnregisterUnitVersion(HInstance);
{$ENDIF UNITVERSIONING}

end.
