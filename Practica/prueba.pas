program prueba;
type
   base=integer;
   tfila=3;
   tcol=4;
   matriz=array[tfila,tcol]of base;
var
   m:matriz;
   i,j:integer;
begin
    for i:=0 to 2 do begin
        for j:=0 to 2 do begin
           readln(m[i][j]);
        end;
    end;
end.
