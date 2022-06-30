Program Pr1ej7;
var
  codigo:integer;
  precio,nuevo,aumento,porcentaje:real;
begin
  writeln('Ingrese codigo del producto');
  readln(codigo); 
  while(codigo<>32767)do
    begin   
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
      writeln('Ingrese codigo del producto');
      readln(codigo);
    end;
  if(codigo=32767)then
    begin
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
    end;  
end.
