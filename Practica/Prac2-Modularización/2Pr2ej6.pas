{Realizar un programa modularizado que lea datos de 100 productos de una tienda de ropa. Para cada
producto debe leer el precio, código y tipo (pantalón, remera, camisa, medias, campera, etc.). Informar:
● Código de los dos productos más baratos.
● Código del producto de tipo “pantalón” más caro.
● Precio promedio.}

program Pr2ej6;

procedure leerDatos(var codigo:integer; var precio:real; var tipo:string);
  begin
    write('Ingrese codigo del producto: ');
    readln(codigo);
    write('Ingrese precio del producto: '); 
    readln(precio);
    write('Ingrese tipo del producto: ');
    readln(tipo);
  end;  {lee los datos del producto}
function esPantalon (tipo:string):boolean;
  begin
    if(tipo='pantalon')then
      esPantalon:=true
    else
      esPantalon:=false;
  end;            {comprueba si es pantalon}
  
procedure minimos (var min1,min2:real; precio:real; var cod1,cod2:integer; codigo:integer);
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
  
{programa principal}
var
  precio,precioTotal,min2,min1,max:real;
  tipo:string;
  i,codigo,cod1,cod2,codMax:integer;
  
begin
  precioTotal:=0; 
  min1:=32767;
  min2:=32767;
  cod1:=0;
  cod2:=0;
  max:=0;
  for i:=1 to 100 do
    begin
     leerDatos(codigo,precio,tipo);
     precioTotal:=precioTotal + precio;
     minimos(min1,min2,precio,cod1,cod2,codigo);
     if (esPantalon(tipo))then 
       begin
        if(precio>max)then 
         begin
           max:=precio;
           codMax:=codigo;
         end;
       end;
    end;   
  writeln('Los productos mas baratos son: ',cod1,' y ',cod2);
  writeln('El pantalon mas caro es: ',codMax);
  writeln('El precio promedio es: ',(precioTotal/100):2:2);
end.
    
