unit TailwindCSS;

interface

uses
  Vcl.Graphics;

type
  TTailwind = class
  public
    const

      // Red
      Red50:  TColor = $F2F2FE;
      Red100: TColor = $E2E2FE;
      Red200: TColor = $CACAFE;
      Red300: TColor = $A5A5FC;
      Red400: TColor = $7171F8;
      Red500: TColor = $4444EF;
      Red600: TColor = $2626DC;
      Red700: TColor = $1C1CB9;
      Red800: TColor = $1B1B99;
      Red900: TColor = $1D1D7F;
      Red950: TColor = $0A0A45;

      // Orange
      Orange50:  TColor = $EDF7FF;
      Orange100: TColor = $D5EDFF;
      Orange200: TColor = $AAD7FE;
      Orange300: TColor = $74BAFD;
      Orange400: TColor = $3C92FB;
      Orange500: TColor = $1673F9;
      Orange600: TColor = $0C58EA;
      Orange700: TColor = $0C41C2;
      Orange800: TColor = $12349A;
      Orange900: TColor = $122D7C;
      Orange950: TColor = $071443;

      // Amber
      Amber50:  TColor = $EBFBFF;
      Amber100: TColor = $C7F3FE;
      Amber200: TColor = $8AE6FD;
      Amber300: TColor = $4DD3FC;
      Amber400: TColor = $24BFFB;
      Amber500: TColor = $0B9EF5;
      Amber600: TColor = $0677D9;
      Amber700: TColor = $0953B4;
      Amber800: TColor = $0E4092;
      Amber900: TColor = $0F3578;
      Amber950: TColor = $031A45;

      // Yellow
      Yellow50:  TColor = $E8FCFE;
      Yellow100: TColor = $C3F9FE;
      Yellow200: TColor = $8AF0FE;
      Yellow300: TColor = $47E0FD;
      Yellow400: TColor = $15CCFA;
      Yellow500: TColor = $08B3EA;
      Yellow600: TColor = $048ACA;
      Yellow700: TColor = $0762A1;
      Yellow800: TColor = $0E4D85;
      Yellow900: TColor = $123F71;
      Yellow950: TColor = $062042;

      // Lime
      Lime50:  TColor = $E7FEF7;
      Lime100: TColor = $CBFCEC;
      Lime200: TColor = $9DF9D9;
      Lime300: TColor = $64F2BE;
      Lime400: TColor = $35E6A3;
      Lime500: TColor = $16CC84;
      Lime600: TColor = $0DA365;
      Lime700: TColor = $0F7C4D;
      Lime800: TColor = $12623F;
      Lime900: TColor = $145336;
      Lime950: TColor = $052E1A;

      // Green
      Green50:  TColor = $F4FDF0;
      Green100: TColor = $E7FCDC;
      Green200: TColor = $D0F7BB;
      Green300: TColor = $ACEF86;
      Green400: TColor = $80DE4A;
      Green500: TColor = $5EC522;
      Green600: TColor = $4AA316;
      Green700: TColor = $3D8015;
      Green800: TColor = $346516;
      Green900: TColor = $2D5314;
      Green950: TColor = $162E05;

      // Emerald
      Emerald50:  TColor = $F5FDEC;
      Emerald100: TColor = $E5FAD1;
      Emerald200: TColor = $D0F3A7;
      Emerald300: TColor = $B7E76E;
      Emerald400: TColor = $99D334;
      Emerald500: TColor = $81B910;
      Emerald600: TColor = $699605;
      Emerald700: TColor = $577804;
      Emerald800: TColor = $465F06;
      Emerald900: TColor = $3B4E06;
      Emerald950: TColor = $222C02;

      // Teal
      Teal50:  TColor = $FAFDF0;
      Teal100: TColor = $F1FBCC;
      Teal200: TColor = $E4F699;
      Teal300: TColor = $D4EA5E;
      Teal400: TColor = $BFD42D;
      Teal500: TColor = $A6B814;
      Teal600: TColor = $88940D;
      Teal700: TColor = $6E760F;
      Teal800: TColor = $595E11;
      Teal900: TColor = $4A4E13;
      Teal950: TColor = $2E2F04;

      // Cyan
      Cyan50:  TColor = $FFFEEC;
      Cyan100: TColor = $FEFACF;
      Cyan200: TColor = $FCF3A5;
      Cyan300: TColor = $F9E867;
      Cyan400: TColor = $EED322;
      Cyan500: TColor = $D4B606;
      Cyan600: TColor = $B29108;
      Cyan700: TColor = $90740E;
      Cyan800: TColor = $755E15;
      Cyan900: TColor = $634E16;
      Cyan950: TColor = $443308;

      // Sky
      Sky50:  TColor = $FFF9F0;
      Sky100: TColor = $FEF2E0;
      Sky200: TColor = $FDE6BA;
      Sky300: TColor = $FCD37D;
      Sky400: TColor = $F8BD38;
      Sky500: TColor = $E9A50E;
      Sky600: TColor = $C78402;
      Sky700: TColor = $A16903;
      Sky800: TColor = $855907;
      Sky900: TColor = $6E4A0C;
      Sky950: TColor = $492F08;

      // Blue
      Blue50:  TColor = $FFF6EF;
      Blue100: TColor = $FEEADB;
      Blue200: TColor = $FEDBBF;
      Blue300: TColor = $FDC593;
      Blue400: TColor = $FAA560;
      Blue500: TColor = $F6823B;
      Blue600: TColor = $EB6325;
      Blue700: TColor = $D84E1D;
      Blue800: TColor = $AF401E;
      Blue900: TColor = $8A3A1E;
      Blue950: TColor = $542517;

      // Indigo
      Indigo50:  TColor = $FFF2EE;
      Indigo100: TColor = $FFE7E0;
      Indigo200: TColor = $FED2C7;
      Indigo300: TColor = $FCB4A5;
      Indigo400: TColor = $F88C81;
      Indigo500: TColor = $F16663;
      Indigo600: TColor = $E5464F;
      Indigo700: TColor = $CA3843;
      Indigo800: TColor = $A33037;
      Indigo900: TColor = $812E31;
      Indigo950: TColor = $4B1B1E;

      // Violet
      Violet50:  TColor = $FFF3F5;
      Violet100: TColor = $FEE9ED;
      Violet200: TColor = $FED6DD;
      Violet300: TColor = $FDB5C4;
      Violet400: TColor = $FA8BA7;
      Violet500: TColor = $F65C8B;
      Violet600: TColor = $ED3A7C;
      Violet700: TColor = $D9286D;
      Violet800: TColor = $B6215B;
      Violet900: TColor = $951D4C;
      Violet950: TColor = $65102E;

      // Purple
      Purple50:  TColor = $FFF5FA;
      Purple100: TColor = $FFE8F3;
      Purple200: TColor = $FFD5E9;
      Purple300: TColor = $FEB4D8;
      Purple400: TColor = $FC84C0;
      Purple500: TColor = $F755A8;
      Purple600: TColor = $EA3393;
      Purple700: TColor = $CE227E;
      Purple800: TColor = $A8216B;
      Purple900: TColor = $871C58;
      Purple950: TColor = $64073B;

      // Fuchsia
      Fuchsia50:  TColor = $FFF4FD;
      Fuchsia100: TColor = $FFE8FA;
      Fuchsia200: TColor = $FED0F5;
      Fuchsia300: TColor = $FCABF0;
      Fuchsia400: TColor = $F979E8;
      Fuchsia500: TColor = $EF46D9;
      Fuchsia600: TColor = $D326C0;
      Fuchsia700: TColor = $AF1CA2;
      Fuchsia800: TColor = $8F1986;
      Fuchsia900: TColor = $751A70;
      Fuchsia950: TColor = $4E044A;

      // Pink
      Pink50:  TColor = $F8F2FD;
      Pink100: TColor = $F3E7FC;
      Pink200: TColor = $E8CFFB;
      Pink300: TColor = $D4A8F9;
      Pink400: TColor = $B672F4;
      Pink500: TColor = $9948EC;
      Pink600: TColor = $7727DB;
      Pink700: TColor = $5D18BE;
      Pink800: TColor = $4D179D;
      Pink900: TColor = $431883;
      Pink950: TColor = $240750;

      // Rose
      Rose50:  TColor = $F2F1FF;
      Rose100: TColor = $E6E4FF;
      Rose200: TColor = $D3CDFE;
      Rose300: TColor = $AFA4FD;
      Rose400: TColor = $8571FB;
      Rose500: TColor = $5E3FF4;
      Rose600: TColor = $481DE1;
      Rose700: TColor = $3C12BE;
      Rose800: TColor = $39129F;
      Rose900: TColor = $371388;
      Rose950: TColor = $19054C;

      // Stone
      Stone50:  TColor = $F9FAFA;
      Stone100: TColor = $F4F5F5;
      Stone200: TColor = $E4E5E7;
      Stone300: TColor = $D1D3D6;
      Stone400: TColor = $9EA2A8;
      Stone500: TColor = $6C7178;
      Stone600: TColor = $4E5357;
      Stone700: TColor = $3C4044;
      Stone800: TColor = $242529;
      Stone900: TColor = $17191C;
      Stone950: TColor = $090A0C;

      // Neutral
      Neutral50:  TColor = $FAFAFA;
      Neutral100: TColor = $F5F5F5;
      Neutral200: TColor = $E5E5E5;
      Neutral300: TColor = $D4D4D4;
      Neutral400: TColor = $A3A3A3;
      Neutral500: TColor = $737373;
      Neutral600: TColor = $525252;
      Neutral700: TColor = $404040;
      Neutral800: TColor = $262626;
      Neutral900: TColor = $171717;
      Neutral950: TColor = $0A0A0A;

      // Zinc
      Zinc50:  TColor = $FAFAFA;
      Zinc100: TColor = $F5F4F4;
      Zinc200: TColor = $E7E4E4;
      Zinc300: TColor = $D8D4D4;
      Zinc400: TColor = $AAA1A1;
      Zinc500: TColor = $7A7171;
      Zinc600: TColor = $5B5252;
      Zinc700: TColor = $463F3F;
      Zinc800: TColor = $2A2727;
      Zinc900: TColor = $1B1818;
      Zinc950: TColor = $0B0909;

      // Gray
      Gray50:  TColor = $FBFAF9;
      Gray100: TColor = $F6F4F3;
      Gray200: TColor = $EBE7E5;
      Gray300: TColor = $DBD5D1;
      Gray400: TColor = $AFA39C;
      Gray500: TColor = $80726B;
      Gray600: TColor = $63554B;
      Gray700: TColor = $514137;
      Gray800: TColor = $37291F;
      Gray900: TColor = $271811;
      Gray950: TColor = $120703;

      // Slate
      Slate50:  TColor = $FCFAF8;
      Slate100: TColor = $F9F5F1;
      Slate200: TColor = $F0E8E2;
      Slate300: TColor = $E1D5CB;
      Slate400: TColor = $B8A394;
      Slate500: TColor = $8B7464;
      Slate600: TColor = $695547;
      Slate700: TColor = $554133;
      Slate800: TColor = $3B291E;
      Slate900: TColor = $2A170F;
      Slate950: TColor = $170602;

  end;

implementation

end.