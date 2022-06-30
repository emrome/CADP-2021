Program Pr1ej1;
var
  i,num,sumatotal,mayor5:integer;
begin
  sumatotal:=0;
  mayor5:=0;
  for i:= 1 to 10 do
    begin
      write('Ingrese un numero entero: ' );
      readln(num);
      sumatotal:=sumatotal+num;
      if(num>5)then
        mayor5:=mayor5+1;
    end;
  writeln('La suma total de los numeros leidos es: ',sumatotal);
  writeln('La cantidad de numeros mayores a 5 es: ',mayor5);
end.
