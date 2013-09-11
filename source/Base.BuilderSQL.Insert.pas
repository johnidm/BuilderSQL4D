unit Base.BuilderSQL.Insert;

interface

uses
  Base.BuilderSQL.Utils,
  Base.BuilderSQL;

type
  TInsertSQL = class( TBuilderSQL )
    function GetSQL(): string; override;
    class function Builder(): TBuilderSQL;
  end;


implementation


class function TInsertSQL.Builder: TBuilderSQL;
begin
  Result:= TInsertSQL.Create();
end;



function TInsertSQL.GetSQL: string;
begin
  Result:=
    'insert into ' + Table + ' ( ' +

     GetListFields( Fields ) +

    ' ) values ( ' +

    GetListFieldsValues( Fields ) +

    ' )';
end;


end.
