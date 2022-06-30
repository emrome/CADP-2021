program Pr0ej4;
const
  PI=3.14159265;
var
  D,radio,area,per:real;
begin
  readln(D);
  radio:= D/2;
  area:=PI*(radio*radio);
  per:= D*PI;
  writeln('El radio del circulo es',radio:1:2);
  writeln('El area del circulo es', area:1:2);
  writeln('El perimetro del circulo es', per:1:2);
end.
