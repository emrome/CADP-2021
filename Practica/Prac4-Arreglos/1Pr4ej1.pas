program sumador;
type
 vnums = array [1..10] of integer;
var
  numeros : vnums;
  i : integer;
begin
 for i:=1 to 10 do{primer bloque for}
  numeros[i] := i;
 for i := 1 to 9 do begin{segundo bloque for}
  numeros[i+1] := numeros[i];
  writeln(numeros[i+1]);
 end;
end.
