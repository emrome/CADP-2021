{Realizar un programa modularizado que lea información de 200 productos de un supermercado. De cada
producto se lee código y precio (cada código es un número entre 1 y 200). Informar en pantalla:
● Los códigos de los dos productos más baratos.
● La cantidad de productos de más de 16 pesos con código par}

program Adic3;
procedure leerDatos(var codigo:integer; var precio:real);
  begin
    write('Ingrese codigo del producto: ');
    readln(codigo);
    write('Ingrese precio del producto: '); 
    readln(precio);
  end;

procedure minimos (codigo:integer;precio:real;var min1,min2:real; var cod1,cod2:integer);
  begin
    if(precio<min1)then 
      begin
       min2:=min1;
       min1:=precio;
       cod2:=cod1;
       cod1:=codigo;
     end
    else
      if(precio<min2)then 
        begin
          min2:=precio;
          cod2:=codigo;
        end;
  end;
  
function esPar(codigo:integer):boolean;
begin
  esPar:= (codigo Mod 2 =0);
end;

var
  min1,min2,precio:real;
  codigo,i,cod1,cod2,parMas16:integer;
begin
  parMas16:=0;
  cod1:=0;
  min1:=32767;
  for i:= 1 to 4 do
    begin
      leerDatos(codigo,precio);
      minimos(codigo,precio,min1,min2,cod1,cod2);
      if (precio>16)and (esPar(i)) then
        parMas16:=parMas16+1;
    end;
   writeln('El producto ',cod1,' es el mas barato y le sigue el producto ',cod2);
   writeln('Hay ',parMas16,' productos de mas de 16 pesos con codigo par');
end.
  
