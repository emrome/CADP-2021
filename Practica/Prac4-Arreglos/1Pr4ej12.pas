{En astrofísica, una galaxia se identifica por su nombre, su tipo (1. elíptica; 2. espiral; 3. lenticular; 4.irregular), su masa (medida en kg) y la distancia en pársecs (pc) medida desde la Tierra. La Unión Astronómica Internacional cuenta con datos correspondientes a las 53 galaxias que componen el Grupo Local. Realizar un programa que lea y almacene estos datos y, una vez finalizada la carga, informe:
a) la cantidad de galaxias de cada tipo.
b) la masa total acumulada de las 3 galaxias principales (la Vía Láctea, Andrómeda y Triángulo) y el
porcentaje que esto representa respecto a la masa de todas las galaxias.
c) la cantidad de galaxias no irregulares que se encuentran a menos de 1000 pc.
d) el nombre de las dos galaxias con mayor masa y el de las dos galaxias con menor masa.}

program Pr4ej12;
const
    dimF=3;
type
    rango=1..4;
    galax=record
       nombre:string;
       tipo:rango;
       kg:integer;
       pc:integer;
    end;
    tipoGalax=array[rango]of integer;
    galaxias=array[1..dimF] of galax;
    
procedure leerGalaxia(var gal:galax);
 begin
    writeln('Ingrese de la galaxia ');readln(gal.nombre);
    writeln('Ingrese tipo (1. eliptica; 2. espiral; 3. lenticular; 4.irregular) de la galaxia ');readln(gal.tipo);
    writeln('Ingrese masa de la galaxia ');readln(gal.kg);
    writeln('Ingrese la distancia en pársecs de la galaxia ');readln(gal.pc);
 end;
 
procedure inicializar(var tip:tipoGalax);
 var
   i:rango;
 begin
    for i:=1 to 4 do
       tip[i]:=0;
 end;
 
procedure cargarTipo(var tip:tipoGalax;t:rango);
 begin
    tip[t]:=tip[t]+1;
 end;
 
procedure cargarGalaxia(var g:galaxias);
 var
   i:integer;
 begin
    for i:=1 to dimF do
       leerGalaxia(g[i]); 
 end;

procedure maximosYminimos (num:integer;nom:string;var max1,max2,min1,min2:integer;var nomMax1,nomMax2,nomMin1,nomMin2:string);
 begin
  if (num>max1)then begin
    max2:=max1;
    max1:=num;
    nomMax2:=nomMax1;
    nomMax1:=nom;
   end
  else
   if (num>max2)then begin
     max2:=num;
     nomMax2:=nom;
   end;
   
  if (num<min1)then begin
    min2:=min1;
    min1:=num;
    nomMin2:=nomMin1;
    nomMin1:=nom;
   end
  else
   if (num<min2)then begin
     min2:=num;
     nomMin2:=nom;
   end;
 end;
       
procedure recorrerGalaxias(g:galaxias;var tip:tipoGalax;var kg3Galaxias,IrregMenos1K:integer;var porcentaje3Gal:real;var max1,max2,min1,min2:integer;var nomMax1,nomMax2,nomMin1,nomMin2:string);
 var
   i,masaTotal:integer;
 begin
     masaTotal:=0;
     max1:=0;
     min1:=32767;
     nomMax1:='';
     nomMin1:='';
     kg3Galaxias:=0;
     IrregMenos1K:=0;
     for i:=1 to dimF do begin
       cargarTipo(tip,g[i].tipo); {Inciso A}
       masaTotal:=masaTotal+g[i].kg;
       
       if((g[i].nombre='Via Lactea')or (g[i].nombre='Andromeda')or (g[i].nombre='Triangulo'))then
          kg3Galaxias:=kg3Galaxias+ g[i].kg;  {Inciso B}
       if ((g[i].tipo<>4)and (g[i].pc<1000))then {Inciso C}
           IrregMenos1K:=IrregMenos1K + 1;
       maximosYminimos(g[i].kg,g[i].nombre,max1,max2,min1,min2,nomMax1,nomMax2,nomMin1,nomMin2); {Inciso D}
     end;
    porcentaje3Gal:=kg3Galaxias*100/masaTotal; {Inciso B}
 end; 
 {programa principal}
var
  gal:galaxias;
  tip:tipoGalax;
  kg3Galaxias,IrregMenos1K,max1,max2,min1,min2:integer;
  porcentaje3Gal:real;
  nomMax1,nomMax2,nomMin1,nomMin2:string;
begin
   inicializar(tip);
   cargarGalaxia(gal);
   recorrerGalaxias(gal,tip,kg3Galaxias,IrregMenos1K,porcentaje3Gal,max1,max2,min1,min2,nomMax1,nomMax2,nomMin1,nomMin2);
   writeln('La cantidad de galaxias de tipo: 1.eliptica es ',tip[1],' ; 2. espiral es ',tip[2],' ; 3. lenticular es ',tip[3],' ; 4.irregular es ',tip[4]);
   writeln('La masa total acumulada de las 3 galaxias principales (la Via Lactea, Andromeda y Triangulo) es ',kg3Galaxias,'kg, y el porcentaje que esto representa respecto a la masa de todas las galaxias es %',porcentaje3Gal:2:2);
   writeln('Son ',IrregMenos1K,' las galaxias no irregulares que se encuentran a menos de 1000 pc');
   writeln('Las dos galaxias con mayor masa son: ',nomMax1,' con ',max1,'kg y ',nomMax2,' con ',max2,'kg. Las dos galaxias con menor masa son: ',nomMin1,' con ',min1,'kg y ',nomMin2,' con ',min2,'kg.');
end.
