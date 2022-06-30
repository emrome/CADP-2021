Program Pr1ej1;
var
  i,num,sumatotal:integer;
begin
  sumatotal:=0;
  for i:= 1 to 10 do
    begin
      write('Ingrese un numero entero: ' );
      readln(num);
      sumatotal:=sumatotal+num;
    end;
  writeln('La suma total de los numeros leidos es: ',sumatotal);
end.
