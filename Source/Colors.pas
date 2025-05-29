unit Colors;

interface

uses
  Vcl.Graphics;

type
  TThemeColors = class
  public
    const

      // Slate
      Slate50:  TColor = $FCFAF8;  // Original: $F8FAFC
      Slate100: TColor = $F9F5F1;  // Original: $F1F5F9
      Slate200: TColor = $F0E8E2;  // Original: $E2E8F0
      Slate300: TColor = $E1D5CB;  // Original: $CBD5E1
      Slate400: TColor = $B8A394;  // Original: $94A3B8
      Slate500: TColor = $8B7464;  // Original: $64748B
      Slate600: TColor = $695547;  // Original: $475569
      Slate700: TColor = $554133;  // Original: $334155
      Slate800: TColor = $3B291E;  // Original: $1E293B
      Slate900: TColor = $2A170F;  // Original: $0F172A
      Slate950: TColor = $170602;  // Original: $020617

      // Gray
      Gray50:  TColor = $FBFAF9;  // Original: $F9FAFB
      Gray100: TColor = $F6F4F3;  // Original: $F3F4F6
      Gray200: TColor = $EBE7E5;  // Original: $E5E7EB
      Gray300: TColor = $DBD5D1;  // Original: $D1D5DB
      Gray400: TColor = $AFA39C;  // Original: $9CA3AF
      Gray500: TColor = $80726B;  // Original: $6B7280
      Gray600: TColor = $63554B;  // Original: $4B5563
      Gray700: TColor = $514137;  // Original: $374151
      Gray800: TColor = $37291F;  // Original: $1F2937
      Gray900: TColor = $271811;  // Original: $111827
      Gray950: TColor = $120703;  // Original: $030712

      // Zinc
      Zinc50:  TColor = $FAFAFA;  // Original: $fafafa
      Zinc100: TColor = $F5F4F4;  // Original: $f4f4f5
      Zinc200: TColor = $E7E4E4;  // Original: $e4e4e7
      Zinc300: TColor = $D8D4D4;  // Original: $d4d4d8
      Zinc400: TColor = $AAA1A1;  // Original: $a1a1aa
      Zinc500: TColor = $7A7171;  // Original: $71717a
      Zinc600: TColor = $5B5252;  // Original: $52525b
      Zinc700: TColor = $463F3F;  // Original: $3f3f46
      Zinc800: TColor = $2A2727;  // Original: $27272a
      Zinc900: TColor = $1B1818;  // Original: $18181b
      Zinc950: TColor = $0B0909;  // Original: $09090b

      // Neutral
      Neutral50:  TColor = $FAFAFA;  // Original: $fafafa
      Neutral100: TColor = $F5F5F5;  // Original: $f5f5f5
      Neutral200: TColor = $E5E5E5;  // Original: $e5e5e5
      Neutral300: TColor = $D4D4D4;  // Original: $d4d4d4
      Neutral400: TColor = $A3A3A3;  // Original: $a3a3a3
      Neutral500: TColor = $737373;  // Original: $737373
      Neutral600: TColor = $525252;  // Original: $525252
      Neutral700: TColor = $404040;  // Original: $404040
      Neutral800: TColor = $262626;  // Original: $262626
      Neutral900: TColor = $171717;  // Original: $171717
      Neutral950: TColor = $0A0A0A;  // Original: $0a0a0a

      // Stone
      Stone50:  TColor = $F9FAFA;  // Original: $fafaf9
      Stone100: TColor = $F4F5F5;  // Original: $f5f5f4
      Stone200: TColor = $E4E5E7;  // Original: $e7e5e4
      Stone300: TColor = $D1D3D6;  // Original: $d6d3d1
      Stone400: TColor = $9EA2A8;  // Original: $a8a29e
      Stone500: TColor = $6C7178;  // Original: $78716c
      Stone600: TColor = $4E5357;  // Original: $57534e
      Stone700: TColor = $3C4044;  // Original: $44403c
      Stone800: TColor = $242529;  // Original: $292524
      Stone900: TColor = $17191C;  // Original: $1c1917
      Stone950: TColor = $090A0C;  // Original: $0c0a09

      // Red
      Red50:  TColor = $F2F2FE;  // Original: $fef2f2
      Red100: TColor = $E2E2FE;  // Original: $fee2e2
      Red200: TColor = $CACAFE;  // Original: $fecaca
      Red300: TColor = $A5A5FC;  // Original: $fca5a5
      Red400: TColor = $7171F8;  // Original: $f87171
      Red500: TColor = $4444EF;  // Original: $ef4444
      Red600: TColor = $2626DC;  // Original: $dc2626
      Red700: TColor = $1C1CB9;  // Original: $b91c1c
      Red800: TColor = $1B1B99;  // Original: $991b1b
      Red900: TColor = $1D1D7F;  // Original: $7f1d1d
      Red950: TColor = $0A0A45;  // Original: $450a0a

      // Orange
      Orange50:  TColor = $EDF7FF;  // Original: $fff7ed
      Orange100: TColor = $D5EDFF;  // Original: $ffedd5
      Orange200: TColor = $AAD7FE;  // Original: $fed7aa
      Orange300: TColor = $74BAFD;  // Original: $fdba74
      Orange400: TColor = $3C92FB;  // Original: $fb923c
      Orange500: TColor = $1673F9;  // Original: $f97316
      Orange600: TColor = $0C58EA;  // Original: $ea580c
      Orange700: TColor = $0C41C2;  // Original: $c2410c
      Orange800: TColor = $12349A;  // Original: $9a3412
      Orange900: TColor = $122D7C;  // Original: $7c2d12
      Orange950: TColor = $071443;  // Original: $431407

      // Amber
      Amber50:  TColor = $EBFBFF;  // Original: $fffbeb
      Amber100: TColor = $C7F3FE;  // Original: $fef3c7
      Amber200: TColor = $8AE6FD;  // Original: $fde68a
      Amber300: TColor = $4DD3FC;  // Original: $fcd34d
      Amber400: TColor = $24BFFB;  // Original: $fbbf24
      Amber500: TColor = $0B9EF5;  // Original: $f59e0b
      Amber600: TColor = $0677D9;  // Original: $d97706
      Amber700: TColor = $0953B4;  // Original: $b45309
      Amber800: TColor = $0E4092;  // Original: $92400e
      Amber900: TColor = $0F3578;  // Original: $78350f
      Amber950: TColor = $031A45;  // Original: $451a03

      // Yellow
      Yellow50:  TColor = $E8FCFE;  // Original: $fefce8
      Yellow100: TColor = $C3F9FE;  // Original: $fef9c3
      Yellow200: TColor = $8AF0FE;  // Original: $fef08a
      Yellow300: TColor = $47E0FD;  // Original: $fde047
      Yellow400: TColor = $15CCFA;  // Original: $facc15
      Yellow500: TColor = $08B3EA;  // Original: $eab308
      Yellow600: TColor = $048ACA;  // Original: $ca8a04
      Yellow700: TColor = $0762A1;  // Original: $a16207
      Yellow800: TColor = $0E4D85;  // Original: $854d0e
      Yellow900: TColor = $123F71;  // Original: $713f12
      Yellow950: TColor = $062042;  // Original: $422006

      // Lime
      Lime50:  TColor = $E7FEF7;  // Original: $f7fee7
      Lime100: TColor = $CBFCEC;  // Original: $ecfccb
      Lime200: TColor = $9DF9D9;  // Original: $d9f99d
      Lime300: TColor = $64F2BE;  // Original: $bef264
      Lime400: TColor = $35E6A3;  // Original: $a3e635
      Lime500: TColor = $16CC84;  // Original: $84cc16
      Lime600: TColor = $0DA365;  // Original: $65a30d
      Lime700: TColor = $0F7C4D;  // Original: $4d7c0f
      Lime800: TColor = $12623F;  // Original: $3f6212
      Lime900: TColor = $145336;  // Original: $365314
      Lime950: TColor = $052E1A;  // Original: $1a2e05

      // Green
      Green50:  TColor = $F4FDF0;  // Original: $f0fdf4
      Green100: TColor = $E7FCDC;  // Original: $dcfce7
      Green200: TColor = $D0F7BB;  // Original: $bbf7d0
      Green300: TColor = $ACEF86;  // Original: $86efac
      Green400: TColor = $80DE4A;  // Original: $4ade80
      Green500: TColor = $5EC522;  // Original: $22c55e
      Green600: TColor = $4AA316;  // Original: $16a34a
      Green700: TColor = $3D8015;  // Original: $15803d
      Green800: TColor = $346516;  // Original: $166534
      Green900: TColor = $2D5314;  // Original: $14532d
      Green950: TColor = $162E05;  // Original: $052e16

      // Emerald
      Emerald50:  TColor = $F5FDEC;  // Original: $ecfdf5
      Emerald100: TColor = $E5FAD1;  // Original: $d1fae5
      Emerald200: TColor = $D0F3A7;  // Original: $a7f3d0
      Emerald300: TColor = $B7E76E;  // Original: $6ee7b7
      Emerald400: TColor = $99D334;  // Original: $34d399
      Emerald500: TColor = $81B910;  // Original: $10b981
      Emerald600: TColor = $699605;  // Original: $059669
      Emerald700: TColor = $577804;  // Original: $047857
      Emerald800: TColor = $465F06;  // Original: $065f46
      Emerald900: TColor = $3B4E06;  // Original: $064e3b
      Emerald950: TColor = $222C02;  // Original: $022c22

      // Teal
      Teal50:  TColor = $FAFDF0;  // Original: $f0fdfa
      Teal100: TColor = $F1FBCC;  // Original: $ccfbf1
      Teal200: TColor = $E4F699;  // Original: $99f6e4
      Teal300: TColor = $D4EA5E;  // Original: $5eead4
      Teal400: TColor = $BFD42D;  // Original: $2dd4bf
      Teal500: TColor = $A6B814;  // Original: $14b8a6
      Teal600: TColor = $88940D;  // Original: $0d9488
      Teal700: TColor = $6E760F;  // Original: $0f766e
      Teal800: TColor = $595E11;  // Original: $115e59
      Teal900: TColor = $4A4E13;  // Original: $134e4a
      Teal950: TColor = $2E2F04;  // Original: $042f2e

      // Cyan
      Cyan50:  TColor = $FFFEEC;  // Original: $ecfeff
      Cyan100: TColor = $FEFACF;  // Original: $cffafe
      Cyan200: TColor = $FCF3A5;  // Original: $a5f3fc
      Cyan300: TColor = $F9E867;  // Original: $67e8f9
      Cyan400: TColor = $EED322;  // Original: $22d3ee
      Cyan500: TColor = $D4B606;  // Original: $06b6d4
      Cyan600: TColor = $B29108;  // Original: $0891b2
      Cyan700: TColor = $90740E;  // Original: $0e7490
      Cyan800: TColor = $755E15;  // Original: $155e75
      Cyan900: TColor = $634E16;  // Original: $164e63
      Cyan950: TColor = $443308;  // Original: $083344

      // Sky
      Sky50:  TColor = $FFF9F0;  // Original: $f0f9ff
      Sky100: TColor = $FEF2E0;  // Original: $e0f2fe
      Sky200: TColor = $FDE6BA;  // Original: $bae6fd
      Sky300: TColor = $FCD37D;  // Original: $7dd3fc
      Sky400: TColor = $F8BD38;  // Original: $38bdf8
      Sky500: TColor = $E9A50E;  // Original: $0ea5e9
      Sky600: TColor = $C78402;  // Original: $0284c7
      Sky700: TColor = $A16903;  // Original: $0369a1
      Sky800: TColor = $855907;  // Original: $075985
      Sky900: TColor = $6E4A0C;  // Original: $0c4a6e
      Sky950: TColor = $492F08;  // Original: $082f49

      // Blue
      Blue50:  TColor = $FFF6EF;  // Original: $eff6ff
      Blue100: TColor = $FEEADB;  // Original: $dbeafe
      Blue200: TColor = $FEDBBF;  // Original: $bfdbfe
      Blue300: TColor = $FDC593;  // Original: $93c5fd
      Blue400: TColor = $FAA560;  // Original: $60a5fa
      Blue500: TColor = $F6823B;  // Original: $3b82f6
      Blue600: TColor = $EB6325;  // Original: $2563eb
      Blue700: TColor = $D84E1D;  // Original: $1d4ed8
      Blue800: TColor = $AF401E;  // Original: $1e40af
      Blue900: TColor = $8A3A1E;  // Original: $1e3a8a
      Blue950: TColor = $542517;  // Original: $172554

      // Indigo
      Indigo50:  TColor = $FFF2EE;  // Original: $eef2ff
      Indigo100: TColor = $FFE7E0;  // Original: $e0e7ff
      Indigo200: TColor = $FED2C7;  // Original: $c7d2fe
      Indigo300: TColor = $FCB4A5;  // Original: $a5b4fc
      Indigo400: TColor = $F88C81;  // Original: $818cf8
      Indigo500: TColor = $F16663;  // Original: $6366f1
      Indigo600: TColor = $E5464F;  // Original: $4f46e5
      Indigo700: TColor = $CA3843;  // Original: $4338ca
      Indigo800: TColor = $A33037;  // Original: $3730a3
      Indigo900: TColor = $812E31;  // Original: $312e81
      Indigo950: TColor = $4B1B1E;  // Original: $1e1b4b

      // Violet
      Violet50:  TColor = $FFF3F5;  // Original: $f5f3ff
      Violet100: TColor = $FEE9ED;  // Original: $ede9fe
      Violet200: TColor = $FED6DD;  // Original: $ddd6fe
      Violet300: TColor = $FDB5C4;  // Original: $c4b5fd
      Violet400: TColor = $FA8BA7;  // Original: $a78bfa
      Violet500: TColor = $F65C8B;  // Original: $8b5cf6
      Violet600: TColor = $ED3A7C;  // Original: $7c3aed
      Violet700: TColor = $D9286D;  // Original: $6d28d9
      Violet800: TColor = $B6215B;  // Original: $5b21b6
      Violet900: TColor = $951D4C;  // Original: $4c1d95
      Violet950: TColor = $65102E;  // Original: $2e1065

      // Purple
      Purple50:  TColor = $FFF5FA;  // Original: $faf5ff
      Purple100: TColor = $FFE8F3;  // Original: $f3e8ff
      Purple200: TColor = $FFD5E9;  // Original: $e9d5ff
      Purple300: TColor = $FEB4D8;  // Original: $d8b4fe
      Purple400: TColor = $FC84C0;  // Original: $c084fc
      Purple500: TColor = $F755A8;  // Original: $a855f7
      Purple600: TColor = $EA3393;  // Original: $9333ea
      Purple700: TColor = $CE227E;  // Original: $7e22ce
      Purple800: TColor = $A8216B;  // Original: $6b21a8
      Purple900: TColor = $871C58;  // Original: $581c87
      Purple950: TColor = $64073B;  // Original: $3b0764

      // Fuchsia
      Fuchsia50:  TColor = $FFF4FD;  // Original: $fdf4ff
      Fuchsia100: TColor = $FFE8FA;  // Original: $fae8ff
      Fuchsia200: TColor = $FED0F5;  // Original: $f5d0fe
      Fuchsia300: TColor = $FCABF0;  // Original: $f0abfc
      Fuchsia400: TColor = $F979E8;  // Original: $e879f9
      Fuchsia500: TColor = $EF46D9;  // Original: $d946ef
      Fuchsia600: TColor = $D326C0;  // Original: $c026d3
      Fuchsia700: TColor = $AF1CA2;  // Original: $a21caf
      Fuchsia800: TColor = $8F1986;  // Original: $86198f
      Fuchsia900: TColor = $751A70;  // Original: $701a75
      Fuchsia950: TColor = $4E044A;  // Original: $4a044e

      // Pink
      Pink50:  TColor = $F8F2FD;  // Original: $fdf2f8
      Pink100: TColor = $F3E7FC;  // Original: $fce7f3
      Pink200: TColor = $E8CFFB;  // Original: $fbcfe8
      Pink300: TColor = $D4A8F9;  // Original: $f9a8d4
      Pink400: TColor = $B672F4;  // Original: $f472b6
      Pink500: TColor = $9948EC;  // Original: $ec4899
      Pink600: TColor = $7727DB;  // Original: $db2777
      Pink700: TColor = $5D18BE;  // Original: $be185d
      Pink800: TColor = $4D179D;  // Original: $9d174d
      Pink900: TColor = $431883;  // Original: $831843
      Pink950: TColor = $240750;  // Original: $500724

      // Rose
      Rose50:  TColor = $F2F1FF;  // Original: $fff1f2
      Rose100: TColor = $E6E4FF;  // Original: $ffe4e6
      Rose200: TColor = $D3CDFE;  // Original: $fecdd3
      Rose300: TColor = $AFA4FD;  // Original: $fda4af
      Rose400: TColor = $8571FB;  // Original: $fb7185
      Rose500: TColor = $5E3FF4;  // Original: $f43f5e
      Rose600: TColor = $481DE1;  // Original: $e11d48
      Rose700: TColor = $3C12BE;  // Original: $be123c
      Rose800: TColor = $39129F;  // Original: $9f1239
      Rose900: TColor = $371388;  // Original: $881337
      Rose950: TColor = $19054C;  // Original: $4c0519
  end;

implementation

end.
