Program Pr1ej7;
var
  codigo:integer;
  precio,nuevo,aumento,porcentaje:real;
begin
  repeat
    writeln('Ingrese codigo del producto');
    readln(codigo);
    writeln('Ingrese precio actual del producto');
    readln(precio);
    writeln('Ingrese nuevo precio del producto');
    readln(nuevo);
    aumento:= nuevo-precio;
    porcentaje:= (10*precio)/100;
    if(aumento>porcentaje)then
      writeln('El aumento de precio del producto ',codigo,' es superior al %10')
    else
      writeln('El aumento de precio del producto ',codigo,' no supera el %10');
  until(codigo=32767);
end.
