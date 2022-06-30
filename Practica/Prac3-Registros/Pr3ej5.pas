{Realizar un programa que lea información de autos que están a la venta en una concesionaria. De cada auto se lee:
marca, modelo y precio. La lectura finaliza cuando se ingresa la marca “ZZZ” que no debe procesarse. La
información se ingresa ordenada por marca. Se pide calcular e informar:
a. El precio promedio por marca.
b. Marca y modelo del auto más caro.}

program Pr3ej5;
type
 info=record
   modelo:string;
   precio:real;
 end;
 auto= record
   marca:string;
   infoCada:info;
 end;

procedure leerMarca(var m:string);
 begin
   write('Ingrese marca ');
   readln(m);
 end;

procedure leerInfo(var n:info);
 begin
   with n do 
     begin
       write('Ingrese modelo del auto ');
       readln(modelo);
       write('Ingrese precio del auto ');
       readln(precio);
     end;
 end;
 
procedure masCaro(a:auto;var max:real;var modelo1,marca1:string);
 begin
   if (a.infoCada.precio>max)then begin
     max:=a.infoCada.precio;
     modelo1:=a.infoCada.modelo;
     marca1:=a.marca;
   end;
 end;
 
function precioPromedio(n:integer;precio:real):real;
 begin
   precioPromedio:=precio/n;
 end;
 
var
  max,precioTotal:real;
  aux,modelo1,marca1:string;
  au:auto;
  cant:integer;
begin
  max:=0;
  modelo1:=' ';
  marca1:=' ';
  leerMarca(au.marca);
  while (au.marca<>'ZZZ')do 
   begin
     aux:=au.marca;
     precioTotal:=0;
     cant:=0;
     while ((au.marca<>'ZZZ')and(aux=au.marca))do
       begin
         cant:=cant+1;
         leerInfo(au.infoCada);
         precioTotal:=precioTotal+au.infoCada.precio;
         masCaro(au,max,modelo1,marca1);
         leerMarca(au.marca);
       end;
     writeln('El precio promedio de la marca ',aux,' es: $',precioPromedio(cant,precioTotal):2:2);
   end;
  writeln('El modelo ',modelo1,' de la marca ',marca1,' es el auto mas caro.');
end.
