{a. Realizar un módulo que reciba como parámetro el radio de un círculo y retorne su diámetro y su
perímetro.
b. Utilizando el módulo anterior, realizar un programa que analice información de planetas obtenidas del
Telescopio Espacial Kepler. De cada planeta se lee su nombre, su radio (medido en kilómetros) y la distancia
(medida en años luz) a la Tierra. La lectura finaliza al leer un planeta con radio 0, que no debe procesarse.
Informar:
 ● Nombre y distancia de los planetas que poseen un diámetro menor o igual que el de la Tierra (12.700
km) y mayor o igual que el de Marte (6.780 km).
 ● Cantidad de planetas con un perímetro superior al del planeta Júpiter (439.264 km).}
 
program Adic4;
procedure diametroPerimetro (radio:integer;var diametro:integer;var perimetro:real);
begin
  diametro:= radio* 2;
  perimetro:= diametro * (3.14159);
end;           {modulo parte A del ejercicio 3}

procedure leerDatos(var nombre:string; var radio, distancia:integer);
begin
  writeln('Ingrese nombre del planeta: ');
  readln(nombre);
  write('Ingrese radio del planeta: ');
  readln(radio);
  write('Ingrese distancia del planeta: ');
  readln(distancia);
end;
{programa principal parte B del ejercicio 4}
var
  nombre:string;
  radio,distancia,diametro,supJupiter:integer; 
  perimetro:real;
begin
  supJupiter:=0;
  leerDatos(nombre,radio,distancia);
  while (radio>0) do
    begin
      diametroPerimetro(radio,diametro,perimetro);
      writeln('El diametro es de ',diametro,' km y su perimetro es ',perimetro:2:2,' km');
      if ((diametro<= 12700)and (diametro>=6780))then
        writeln('El planeta ',nombre,' con una distancia de ',distancia,' años luz posen un diametro menor o igual que el de la Tierra (12.700 km) y mayor o igual que el de Marte (6.780 km)');
      if (perimetro>439264)then
        supJupiter:=supJupiter+1;
      leerDatos(nombre,radio,distancia);
    end;
  writeln('Hay ',supJupiter,' planetas con un perimetro superior al de Jupiter(439.264 km)');
end.
