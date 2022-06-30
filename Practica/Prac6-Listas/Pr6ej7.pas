{El Programa Horizonte 2020 (H2020) de la Unión Europea ha publicado los criterios para financiar proyectos de investigación avanzada. Para los proyectos de sondas espaciales vistos en el ejercicio anterior, se han determinado los siguientes criterios:
-sólo se financiarán proyectos cuyo costo de mantenimiento no supere el costo de construcción.
- no se financiarán proyectos espaciales que analicen ondas de radio, ya que esto puede realizarse desde la superficie terrestre con grandes antenas.

A partir de la información disponible de las sondas espaciales (la lista generada en ejercicio 6), implementar un programa que:
a. Invoque un módulo que reciba la información de una sonda espacial, y retorne si cumple o no con los nuevos criterios H2020.
b. Utilizando el módulo desarrollado en a) implemente un módulo que procese la lista de sondas de la ESA y retorne dos listados, uno con los proyectos que cumplen con los nuevos criterios y otro con aquellos que no los cumplen.
c. Invoque a un módulo que reciba una lista de proyectos de sondas espaciales e informe la cantidad y el costo total (construcción y mantenimiento) de los proyectos que no serán financiados por H2020. Para ello, utilice el módulo realizado en b.
}


program Pr6ej7;
 const
	corte='GAIA';
	condicion=1;
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

//inciso A
function cumpleRequisitos(s:sonda):boolean;
 begin
	cumpleRequisitos:= (s.espectro<>condicion) and (s.costoMant< s.costoConst);
 end;
 
//inciso C
procedure noFinanciacion(l:lista);
 var
	cantTotal:integer;
	costoSonda,costoTotal:real;
 begin
	costoTotal:=0; cantTotal:=0;
	while(l<>nil)do begin
		cantTotal:=cantTotal+1;
		costoSonda:=l^.dato.costoConst + l^.dato.costoMant;
		costoTotal:= costoTotal+costoSonda;
		writeln('Proyecto ',l^.dato.nombre,' no financiado tiene un costo total de ',costoSonda:2:2);
		l:=l^.sig;
	end;
	writeln('Son ',cantTotal,' los proyectos no financiados');
	writeln('El costo total de todos los proyectos no financiados es ',costoTotal:2:2);
 end;
 
//inciso B
procedure recorrerLista(l:lista; var si,no:lista);
 var
	ult,ultNo:lista;
 begin
	while(l<>nil) do begin //inciso A y B
		if(cumpleRequisitos(l^.dato))then begin//lista que cumple
			writeln('El proyecto ',l^.dato.nombre,' cumple con los nuevos criterios H2020.');
			agregarNodoAtras(si,ult,l^.dato);
		end
		else begin//en lista que no cumple
			writeln('El proyecto ',l^.dato.nombre,' no cumple con los nuevos criterios H2020.');
			agregarNodoAtras(no,ultNo,l^.dato);
		end;
		l:=l^.sig;
	end;
	//noFinanciacion(noCumple); //inciso C
 end;
procedure imprimir(l:lista); //PARA VERIFICAR
 begin
	while(l<>nil)do begin
		writeln('Proyecto ',l^.dato.nombre);
		l:=l^.sig;
	end;
 end;

//programa principal
var
	l,siCumple,noCumple:lista;
begin
	l:=nil;
	siCumple:=nil;
	noCumple:=nil;
	cargarLista(l); 
	writeln();
	recorrerLista(l,siCumple,noCumple);
    writeln();
	//PARA VERIFICAR 
	writeln('LISTA CUMPLE'); imprimir(siCumple);writeln();
	writeln('LISTA NO CUMPLE');imprimir(noCumple);
	writeln();
	noFinanciacion(noCumple); //inciso C
end.
