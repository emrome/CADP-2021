{El Grupo Intergubernamental de Expertos sobre el Cambio Climático de la ONU (IPCC) realiza todos los años mediciones de temperatura en 100 puntos diferentes del planeta y, para cada uno de estos lugares, obtiene un promedio anual. Este relevamiento se viene realizando desde hace 50 años, y con todos los datos recolectados, el IPCC se encuentra en condiciones de realizar análisis estadísticos. Realizar un programa que lea y almacene los datos correspondientes a las mediciones de los últimos 50 años (la información se ingresa ordenada por año). Una vez finalizada la carga de la información, obtener:
a) el año con mayor temperatura promedio a nivel mundial.
b) el año con la mayor temperatura detectada en algún punto del planeta en los últimos 50 años.}

program Pr4ej13;
const
   dimFA=2020;
   dimFP=100;
type
   puntos=array[1..dimFP] of real;
   anios=array[1970..dimFA] of puntos;
   

procedure cargarPuntos(var p:puntos);
 var
    i,num:integer;
 begin
    for i:=1 to dimFP do begin
       writeln('Ingrese temperatura promedio del punto ',i);
       readln(num);
       p[i]:=num;
     end;
 end;
       
procedure cargarAnios(var a:anios);
 var
   i:integer;
   point:puntos;
 begin
    for i:=1970 to dimFA do begin
      writeln('Datos del año ',i);
      cargarPuntos(point);
      a[i]:=point;
    end;
 end;

function tempPromedio(temp:integer;
procedure recorrerAnios (anio:anios; 
      
