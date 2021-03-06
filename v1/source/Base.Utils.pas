unit Base.Utils;

interface

uses
  System.StrUtils, System.Variants, DateUtils;


type
  TOperatorLogical = (toplogEmpty, toplogAnd, toplogOr);
  TOperatorComparison = ( topcompEmpty, topcompEqual );
 
  function VariantToString( const AValue: Variant ): string;

  function HasTimeValidIn( const ADateTime: TDateTime ): Boolean;
  function HasDateValidIn( const ADateTime: TDateTime ): Boolean;


implementation

uses
  System.SysUtils;


function HasDateValidIn( const ADateTime: TDateTime ): Boolean;
var
  Day, Mounth, Year: Word;

begin
  Day:= DayOf( ADateTime );
  Mounth:= MonthOf( ADateTime );
  Year:= YearOf( ADateTime );

  Result:=
    (    Day in [ 1..31 ] ) and
    ( Mounth in [ 1..12 ] ) and
    (   Year > 0 ) and
    ( EncodeDate( Year, Mounth, Day ) > 0 )
end;


function HasTimeValidIn( const ADateTime: TDateTime ): Boolean;
var
  Hour, Minute, Second: Word;

begin
  Hour:= HourOf( ADateTime );
  Minute:= MinuteOf( ADateTime );
  Second:= SecondOf( ADateTime );

  Result:=
      ( Hour in [ 0 .. 23 ] ) and
    ( Minute in [ 0 .. 59 ] ) and
    ( Second in [ 0 .. 59 ] ) and

    (  ( Hour <> 0 ) or ( Minute <> 0 ) or ( Second <> 0 ) )
end;



function VariantToString( const AValue: Variant ): string;
var
  DateTime: TDateTime;

  FmtSet: TFormatSettings;
begin
  FmtSet.DecimalSeparator := '.';

  if ( VarIsOrdinal( AValue ) ) then
    Result:= IntToStr( AValue )
  else if ( VarIsFloat( AValue ) ) then
    Result:= FloatToStrF( AValue, ffGeneral, 8, 4, FmtSet )
  else if ( VarIsStr( AValue ) ) then
    Result:=  QuotedStr( VarToStr( AValue ) )
  else if ( VarIsType( AValue, varDate ) ) then
  begin
    DateTime:= VarToDateTime( AValue ) ;
    if ( HasTimeValidIn( DateTime ) and ( HasDateValidIn ( DateTime ) ) ) then
      Result:= FormatDateTime( 'dd.mm.yyyy hh:nn:ss', DateTime )
    else if ( HasTimeValidIn( DateTime ) ) then
      Result:= FormatDateTime( 'hh:nn:ss', DateTime )
    else if ( HasDateValidIn( DateTime ) ) then
      Result:= FormatDateTime( 'dd.mm.yyyy', DateTime )
    else
      raise Exception.Create('Tipo de par�metro data n�o definido');

    Result:= QuotedStr( Result );

  end
  else
    raise Exception.Create('Tipo da vari�vel n�o definida');

end;


end.
