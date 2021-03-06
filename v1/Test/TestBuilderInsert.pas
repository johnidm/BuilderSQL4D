unit TestBuilderInsert;

interface

uses
  TestFramework, System.SysUtils, Base.CommandSQL, Base.BuilderSQL.Insert;

type
  TestTBuilderInsert = class(TTestCase)
  published
    procedure TestSQL;
    procedure TestSQLWithTwoFields();
    procedure TestSQLWithTreeFields();

    procedure TestSQLDataTypeByte();
    procedure TestSQLDataTypeSmallint();
    procedure TestSQLDataTypeInteger();
    procedure TestSQLDataTypeWord();
    procedure TestSQLDataTypeLongWord();
    procedure TestSQLDataTypeInt64();
    procedure TestSQLDataTypeShortInt();

    procedure TestSQLDataTypeDate();
    procedure TestSQLDataTypeTime();
    procedure TestSQLDataTypeDateTime();

    procedure TestSQLDataTypeSingle();
    procedure TestSQLDataTypeDouble();
    procedure TestSQLDataTypeCurrency();

    procedure TestSQLDataTypeString();
  end;

implementation


{$REGION 'Testes com manipula��o de data e hora' }
procedure TestTBuilderInsert.TestSQLDataTypeDate;
var
  data: TDateTime;
begin
  data:= StrToDate( '01/08/2015' );

  CheckEqualsString(
    'insert into dados ( data ) values ( ''01.08.2015'' )',

    TInsertSQL.Builder().Table( 'dados' ).AddField( 'data', data ) .ToSQL()

  );
end;



procedure TestTBuilderInsert.TestSQLDataTypeTime;
var
  tempo: TDateTime;
begin
  tempo:= StrToTime( '01:05:06' );

  CheckEqualsString(
    'insert into dados ( tempo ) values ( ''01:05:06'' )',
    TInsertSQL.Builder().Table( 'dados' ).AddField( 'tempo', tempo ).ToSQL
  );

end;

procedure TestTBuilderInsert.TestSQLDataTypeDateTime;
var
  data_tempo: TDateTime;
begin
  data_tempo:= Now();

  CheckEqualsString(
    'insert into dados ( data_tempo ) values ( '+ QuotedStr( FormatDateTime( 'dd.mm.yyyy hh:nn:sss', Now() ) ) + ' )',

    TInsertSQL.Builder.Table( 'dados' ).AddField( 'data_tempo', data_tempo ).ToSQL
  );
end;

{$ENDREGION }


{$REGION 'Teste com valores ponto flutuante' }
procedure TestTBuilderInsert.TestSQLDataTypeDouble;
var
  valor: Double;

begin
  valor:= 1235.874;

  CheckEqualsString(
    'insert into dados ( valor ) values ( 1235.874 )',

   TInsertSQL.Builder.Table('dados').AddField('valor', valor ).ToSQL()


  );


end;


procedure TestTBuilderInsert.TestSQLDataTypeCurrency;
var
  valor: Currency;
begin
  valor:= 12678.584;

  CheckEqualsString(
    'insert into dados ( valor ) values ( 12678.584 )',

    TInsertSQL.Builder().Table( 'dados' ).AddField( 'valor', valor ).ToSQL()

  );


end;


procedure TestTBuilderInsert.TestSQLDataTypeSingle;
var
  valor: Single;

begin
  valor:= 1254.98;

  CheckEqualsString(
    'insert into dados ( valor ) values ( 1254.98 )',
     TInsertSQL.Builder().Table( 'dados' ).AddField( 'valor', valor ).ToSQL()
  );

end;

{$ENDREGION}


procedure TestTBuilderInsert.TestSQL;
begin
  CheckEquals( 'insert into clientes ( id ) values ( 1 )' ,

      TInsertSQL.Builder()
        .Table( 'clientes' )
        .AddField( 'id', 01 ).ToSQL()

   );


end;

procedure TestTBuilderInsert.TestSQLDataTypeByte;
var
  id: Byte;
begin
  id:= 125;

  CheckEquals(
    'insert into dados ( id ) values ( 125 )',


        TInsertSQL.Builder().Table( 'dados' ).AddField( 'id', id ).ToSQL()

   );

end;


procedure TestTBuilderInsert.TestSQLDataTypeInt64;
var
  id: Int64;
begin
  id:= 123456789123456789;

  CheckEquals(
    'insert into dados ( id ) values ( 123456789123456789 )',


      TInsertSQL.Builder.Table( 'dados' ).AddField( 'id', id ).ToSQL()


   );

end;

procedure TestTBuilderInsert.TestSQLDataTypeInteger;
var
  id: integer;
begin
  id:= 2147483640;

  CheckEquals(
    'insert into dados ( id ) values ( 2147483640 )',

   TInsertSQL.Builder.Table('dados').AddField( 'id', id ).ToSQL()
  );
end;


procedure TestTBuilderInsert.TestSQLDataTypeLongWord;
var
  id: LongWord;

begin
  id:= 4294967295;

  CheckEquals(
    'insert into dados ( id ) values ( 4294967295 )',

     TInsertSQL.Builder().Table('dados').AddField( 'id', id ).ToSQL()

  );

end;

procedure TestTBuilderInsert.TestSQLDataTypeShortInt;
var
  id: ShortInt;
begin
  id:= 125;

  CheckEqualsString( 'insert into dados ( id ) values ( 125 )',
        TInsertSQL.Builder.Table('dados').AddField( 'id', id ).ToSQL()
  );

end;


procedure TestTBuilderInsert.TestSQLDataTypeSmallint;
var
  id: SmallInt;

begin
  id:= 32767;

  CheckEqualsString(
    'insert into dados ( id ) values ( 32767 )',


      TInsertSQL.Builder().Table( 'dados' ).AddField('id', id).ToSQL()



    );

end;



{$REGION 'Teste com string' }
procedure TestTBuilderInsert.TestSQLDataTypeString;
var
  texto: string;

begin
  texto:=
    'ACM/IEEE-CS. Software Engineering 2004. Curriculum Guidelines for Undergraduate Degree Programs in Software Engineering. 2004. Dispon�vel em: <http://sites.computer.org/ccse/SE2004Volume.pdf>, Acesso em: 05 jun. 2011.' +
    'ACM; AIS; IEEE-CS. Computing Curricula 2005. 2006. Dispon�vel em: <www.acm.org/education/curric_vols/CC2005-March06Final.pdf>. Acesso em: 05 jun. 2011.' +
    'BASTOS, Aderson; RIOS, Emerson; CRISTALLI, Ricardo; MOREIRA, Tryah�. Base de Conhecimento em Teste de Software.' +
    'DELAMARO, M�rcio Eduardo; JINO, Mario; MALDONADO, Jos� Carlos. Introdu��o ao teste de software. Rio de Janeiro: Elsevier, 2007.' +
    'MYERS, Glenford J. The art of software testing. 2 ed. New York: John Wiley & Sons, 2004.' +
    'PAULA FILHO, Wilson de P�dua. Engenharia de Software: fundamentos, m�todos e padr�es. 3 ed. Rio de Janeiro: LTC, 2009.' +
    'PFLEEGER, Shari Lawrence. Engenharia de software: teoria e pr�tica. 2� ed. S�o Paulo: Prentice Hall, 2004.' +
    'PRESSMAN. Engenharia de software. 6 ed. S�o Paulo: McGraw Hill, 2006.' +
    'RIOS, Emerson; MOREIRA, Trayah�. Teste de Software. 2 ed. Rio de Janeiro: Alta Books, 2006.';

  CheckEqualsString(
    'insert into dados ( texto ) values ( ' + QuotedStr( texto ) + ' )',

      TInsertSQL.Builder().Table( 'dados' ).AddField('texto', texto).ToSQL()

  );

end;

{$ENDREGION}

procedure TestTBuilderInsert.TestSQLDataTypeWord;
var
  id: Word;
begin
  id:= 65535;

  CheckEqualsString(
    'insert into dados ( id ) values ( 65535 )',
     TInsertSQL.Builder().Table('dados').AddField( 'id', id ).ToSQL()
  );

end;

procedure TestTBuilderInsert.TestSQLWithTreeFields;
begin
  CheckEquals( 'insert into clientes ( id, nm, dt ) values ( 1, ''Johni Douglas'', ''01.01.2011'' )' ,
    TInsertSQL.Builder()
      .Table( 'clientes' )
      .AddField( 'id', 01 )
      .AddField( 'nm', 'Johni Douglas' )
      .AddField( 'dt', StrToDateTime( '01/01/2011' ) ).ToSQL()

  );
end;

procedure TestTBuilderInsert.TestSQLWithTwoFields;
begin
  CheckEquals( 'insert into clientes ( id, nm ) values ( 1, ''Johni Douglas'' )' ,
    TInsertSQL.Builder()
      .Table( 'clientes' )
      .AddField( 'id', 01 )
      .AddField( 'nm', 'Johni Douglas' ).ToSQL()

   );
end;

initialization


end.



{

TODO : nao tem suporte a variaveis do tipo TDate
TODO : n�o tem suporte campos blob


}

