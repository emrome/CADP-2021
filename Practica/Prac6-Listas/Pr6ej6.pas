{6.La Agencia Espacial Europea (ESA) está realizando un relevamiento de todas las sondas espaciales lanzadas 
al espacio en la última década. De cada sonda se conoce su nombre, duración estimada de la misión (cantidad 
de meses que permanecerá activa), el costo de construcción, el costo de mantenimiento mensual y rango del 
espectro electromagnético sobre el que realizará estudios. 
Dicho rango se divide en 7 categorías: 
1. radio; 2. microondas; 3.infrarrojo; 4. luz visible; 5. ultravioleta; 6. rayos X; 7. rayos gamma

Realizar un programa que lea y almacene la información de todas las sondas espaciales. La lectura finaliza al ingresar la sonda llamada “GAIA”, que debe procesarse.
Una vez finalizada la lectura, informar:
a. El nombre de la sonda más costosa (considerando su costo de construcción y de mantenimiento).
b. La cantidad de sondas que realizarán estudios en cada rango del espectro electromagnético.
c. La cantidad de sondas cuya duración estimada supera la duración promedio de todas las sondas.
d. El nombre de las sondas cuyo costo de construcción supera el costo promedio entre todas las sondas.
Nota: para resolver los incisos a), b), c) y d), la lista debe recorrerse una única vez.
}

program Pr6ej6;
 const
	corte='GAIA';
 type
	subrango=1..7;
	rangos=array[subrango]of integer;
	sonda=record
		nombre:string;
		duracion:integer;
		costoConst:real;
		costoMant:real;
		espectro:subrango;
	end;
	lista=^nodo;
	nodo=record
		dato:sonda;
		sig:lista;
	end;
	
procedure leerSonda(var s:sonda);
 begin
	writeln('Ingrese nombre de la sonda ');readln(s.nombre);
	writeln('Ingrese duracion estimada de la mision ');readln(s.duracion);
	writeln('Ingrese costo de construccion ');readln(s.costoConst);
	writeln('Ingrese costo de mantenimiento ');readln(s.costoMant);
	writeln('Ingrese rango del espectro electromagnetico sobre el que realizara estudios ');readln(s.espectro);
 end;

procedure agregarNodoAtras(var pri,ult:lista; data:sonda);
 var
	nue:lista;
 begin
	new(nue); 
	nue^.dato:=data; 
	nue^.sig:=nil;
	if(pri=nil)then pri:=nue
	else ult^.sig:=nue;
	ult:=nue;
 end;
procedure cargarLista(var l:lista);
 var
	s:sonda;
	ult:lista;
 begin
	repeat
		leerSonda(s);
		agregarNodoAtras(l,ult,s);
	until(s.nombre=corte);
 end;
//modulo inciso A
procedure maximo(nombre:string;num:real;var max:real;var nom:string);
 begin
   if (num>max)then begin
     max:=num;
     nom:=nombre;
   end;
 end;
//modulos inciso B
procedure inicializarRangos(var vrango:rangos);
 var
	i:subrango;
 begin
	for i:= 1 to 7 do
		vrango[i]:=0;
 end;
 
procedure cargarRangos(var vrango:rangos;num:integer);
 begin
	vrango[num]:= vrango[num]+1;
 end;
 
procedure imprimirRangos(vrango:rangos);
 var
	i:subrango;
 begin
	for i:=1 to 7 do
		writeln('Son ',vrango[i],' las sondas que realizaran estudios en rango ',i);
 end;
 
//modulos inciso C
procedure superaDuracion(prom:real;num:integer;var cant:integer);
 begin
	if(num>prom)then cant:= cant+1;
 end;
 
//modulos inciso D
procedure costoSuperaProm(prom,costo:real; nombre:string);
 begin
	if(costo>prom)then
		writeln('El costo de construccion de la sonda ', nombre,' supera el costo de construccion promedio');
 end;
 
//modulos procesamiento de datos
procedure recorrerLista1(l:lista; var costoProm,duracionProm,costoMax:real; var nomMax:string; var vrangos:rangos);
 var
	sondasTotales,duracionTotal:integer;
	costoConstTotal,costoTotalSonda:real;
 begin
	sondasTotales:=0; costoConstTotal:=0; duracionTotal:=0; costoMax:=0;
	inicializarRangos(vrangos);
	while(l<>nil) do begin
		sondasTotales:= sondasTotales+1;
		costoTotalSonda:= l^.dato.costoConst + l^.dato.costoMant;
		costoConstTotal:= costoConstTotal+ l^.dato.costoConst;
		maximo(l^.dato.nombre,costoTotalSonda,costoMax,nomMax);//inciso A
		cargarRangos(vrangos,l^.dato.espectro); //inciso B
		duracionTotal:= duracionTotal+ l^.dato.duracion;
		l:= l^.sig;
	end;
	duracionProm:= duracionTotal/sondasTotales;//para inciso C
	costoProm:= costoConstTotal/sondasTotales; //para inciso D
 end;
 
procedure recorrerLista2(l:lista; var cantSuperaDuracion:integer;promDuracion,promCosto:real);
 begin
	while(l<>nil)do begin
		superaDuracion(promDuracion,l^.dato.duracion,cantSuperaDuracion);
		costoSuperaProm(promCosto,l^.dato.costoConst,l^.dato.nombre); //imprime inciso D
		l:=l^.sig;
	end;
  end;
  
//program principal
var
	l:lista;
	vrango:rangos;
	cantSuperaDuracion:integer;
	nomMax:string;
	costoMax,costoProm,duracionProm:real;
 begin
	l:=nil;
	cargarLista(l);
	recorrerLista1(l,costoProm,duracionProm,costoMax,nomMax,vrango);
	writeln(nomMax,' es la sonda mas costosa. ');//inciso A
	imprimirRangos(vrango);// inciso B
	recorrerLista2(l,cantSuperaDuracion,duracionProm,costoProm);//informa nombre de sonda q supera el costo prom de construccion
	writeln('Son ', cantSuperaDuracion,' las sondas cuya duración estimada supera la duración promedio de todas las sondas.');
 end.
