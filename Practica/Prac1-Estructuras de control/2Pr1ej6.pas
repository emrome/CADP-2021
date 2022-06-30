Program Pr1ej6;
var
  i,codigo,codMin1,codMin2,par16:integer;
  precio,precioMin1,precioMin2:real;
begin
  par16:=0;
  precioMin1:=999;
  codMin1:=0;
  for i:=1 to 4 do
    begin
      write('Ingrese codigo: ');
      read(codigo);
      write('Ingrese precio: ');
      readln(precio);
      if (precio<precioMin1)then 
        begin
          precioMin2:=precioMin1;
          precioMin1:=precio;
          codMin2:=codMin1;
          codMin1:=codigo;
        end;
      if(precio<precioMin2)and(precio>precioMin1)then
        begin
          precioMin2:=precio;
          codMin2:=codigo;
        end;
      if ((precio>16)and(codigo MOD 2=0))then 
        par16:=par16+1;
    end;
  writeln('El producto mas barato: ',codMin1);
  writeln('El segundo producto mas barato es: ',codMin2);
  writeln('La cantidad de productos con precio mayor a 16 y codigo par es: ',par16);
end.
