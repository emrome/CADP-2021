Program Pr1ej4;
var
  numX,numero:real;
begin
  readln(numX);
  readln(numero);
  while(numero<>numX*2) do
    begin
      writeln('Ingrese otro numero');
      readln(numero);
    end;
end.
