{2-El registro civil de La Plata ha solicitado un programa para analizar la distribución de casamientos durante el año
2019. Para ello, cuenta con información de las fechas de todos los casamientos realizados durante ese año.
a) Analizar y definir un tipo de dato adecuado para almacenar la información de la fecha de cada casamiento.
b) Implementar un módulo que lea una fecha desde teclado y la retorne en un parámetro cuyo tipo es el definido en el inciso a).
c) Implementar un programa que lea la fecha de todos los casamientos realizados en 2019. La lectura finaliza al
ingresar el año 2020, que no debe procesarse, e informe la cantidad de casamientos realizados durante los meses de verano (enero, febrero y marzo) y la cantidad de casamientos realizados en los primeros 10 días de cada mes. Nota: utilizar el módulo realizado en b) para la lectura de fecha.}

program Pr3ej2;
type
  dias= 1..31;
  meses= 1..12;
  fecha=record   {parte A del ejercicio 2}
    dia:dias;
    mes:meses;
    anio:integer;
  end;

procedure leer (var n:fecha); {parte B del ejercicio}
 begin
   with n do 
     begin
       writeln('Ingrese año del casamiento ');
       read(anio);
       if (anio=2019)then 
         begin
          writeln('Ingrese mes del casamiento ');
          read(mes);
          writeln('Ingrese dia del casamiento ');
          read(dia);
         end; {fin del if}
     end; {fin del with}
 end; {fin del proceso}
 
function esVerano (m:meses):boolean;  {analiza se se hizo en enero=1,febrero=2 o marzo=3}
 begin
   esVerano:= (m <=3);
 end;

function primeros10 (d:dias):boolean; {analiza si fue en los primeros 10 dias}
 begin
   primeros10:= ((d>=1) and (d<=10));
 end;
 
var
  fechaCasorio:fecha;
  cantVerano,cant10:integer;
begin
  cantVerano:=0;
  cant10:=0;
  leer(fechaCasorio);
  while (fechaCasorio.anio=2019)do 
   begin
     if (esVerano(fechaCasorio.mes))then
       cantVerano:=cantVerano+1;
     if (primeros10(fechaCasorio.dia))then
       cant10:=cant10+1;
     leer(fechaCasorio);
   end;
  writeln('Fueron ',cantVerano,' los casamientos realizados en los meses de verano, y ',cant10,' los realizados en los primeros 10 dias de cada mes');
end.
  
