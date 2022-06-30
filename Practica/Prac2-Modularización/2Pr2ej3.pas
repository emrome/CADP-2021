program ejercicio5; { suma los números entre a y b, y retorna el resultado en c }
procedure sumar(a, b: integer; var c:integer);
var
  i,suma : integer;
begin
 suma:=0;
 for i := a to b do
  suma := suma + i;
 c := c + suma;
end;
var
  a,b,result: integer;
  ok:boolean;
begin
  result := 0;
  readln(a); readln(b);
  sumar(a, b, result);
  writeln('La suma total es ',result);
  ok := (result >= 10) and (result <= 30); { averigua si el resultado final estuvo entre 10 y 30}
  if (not ok) then
    writeln ('La suma no quedo entre 10 y 30');
end.
