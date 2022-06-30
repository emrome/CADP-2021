Program Pr0ej6;
var
  caramelos,clientes,car_cli,car_kios:integer;
  precioCar:real;
begin
  writeln('Ingrese la cantidad de caramelos');
  readln(caramelos);
  writeln('Ingrese la cantidad de clientes');
  readln(clientes);
  car_cli:= caramelos div clientes;
  car_kios:= caramelos mod clientes;
  precioCar:= 1.60*car_cli*clientes;
  writeln('Para cada cliente son ',car_cli,' caramelos');
  writeln('Le quedan ',car_kios,' caramelos al kisquero');
  writeln('El kiosquero debera cobrar $ ',precioCar:1:2);
end.
