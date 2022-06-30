{ El Observatorio Astronómico de La Plata ha realizado un relevamiento sobre los distintos objetos
astronómicos observados durante el año 2015. Los objetos se clasifican en 7 categorías: 1: estrellas,
2: planetas, 3: satélites, 4: galaxias, 5: asteroides, 6: cometas y 7: nebulosas.
Al observar un objeto, se registran los siguientes datos: código del objeto, categoría del objeto (1..7),
nombre del objeto, distancia a la Tierra (medida en años luz), nombre del descubridor y año de su
descubrimiento.
A. Desarrolle un programa que lea y almacene la información de los objetos que han sido observados. 
Dicha información se lee hasta encontrar un objeto con código -1 (el cual no debe procesarse). 
La estructura generada debe mantener el orden en que fueron leídos los datos.
B. Una vez leídos y almacenados todos los datos, se pide realizar un reporte con la siguiente
información:
1. Los códigos de los dos objetos más lejanos de la tierra que se hayan observado.
2. La cantidad de planetas descubiertos por "Galileo Galilei" antes del año 1600.
3. La cantidad de objetos observados por cada categoría.
4. Los nombres de las estrellas cuyos códigos de objeto poseen más dígitos pares que impares.
}


program Pr7ej6;
const
    CORTE=-1;
    COND1='Galileo Galilei';
    COND2=1600;
 type
    rango=1..7;
    objetos=array[rango]of integer;
    objeto=record
       cod:integer;
       cat:rango;
       nombre:string;
       dist:integer;
       descubridor:string;
       anio:integer;
    end;
    
    lista=^nodo;
    nodo=record
       dato:objeto;
       sig:lista;
    end;
    
procedure inicializarObjetos(var ob:objetos);
 var
    i:rango;
 begin
    for i:=1 to 7 do
       ob[i]:=0;
 end;
procedure imprimirObjetos(ob:objetos);
 var
    i:integer;
 begin
    for i:=1 to 7 do 
       writeln('Objetos de la categoria ',i,': ',ob[i]);
 end;
 
procedure leerObjeto(var ob:objeto);
 begin
    writeln('Ingrese codigo de objeto ');readln(ob.cod);
    if(ob.cod<>CORTE)then begin
       writeln('Ingres categoria del objeto ');readln(ob.cat);
       writeln('Ingrese nombre del objeto ');readln(ob.nombre);
       writeln('Ingrese distancia a la Tierra ');readln(ob.dist);
       writeln('Ingrese nombre del descubridor ');readln(ob.descubridor);
       writeln('Ingrese anio de descubrimiento ');readln(ob.anio);
    end;
 end;
procedure agregarFinal(var l,ult:lista; ob:objeto);
 var
    nue:lista;
 begin
    new(nue);
    nue^.dato:=ob;
    nue^.sig:=nil;
    if(l=nil)then l:=nue
    else ult^.sig:=nue;
    ult:=nue;
 end;
procedure cargarLista(var l:lista);
 var
   ult:lista;
   ob:objeto;
 begin
   leerObjeto(ob);
   while (ob.cod<>CORTE)do begin
       agregarFinal(l,ult,ob);
       leerObjeto(ob);
   end;
 end;
procedure maximos(cod,dist:integer; var max1,max2,cod1,cod2:integer);
begin
  if (dist>max1)then begin
    max2:=max1;
    max1:=dist;
    cod2:=cod1;
    cod1:=cod;
   end
  else
   if (dist>max2)then begin
     max2:=dist;
     cod2:=cod;
   end;
 end;
function galileo1600(nom:string;anio:integer):boolean;
 begin
    galileo1600:=((nom=COND1)and(anio<COND2));
 end;
procedure descomponer(num:integer; var pares,impares:integer);
 begin
    while (num<>0)do begin
       if(num MOD 2=0)then 
          pares:=pares+1
       else
          impares:=impares+1;
       num:= num DIV 10
    end;
 end;
function masPares(num:integer):boolean;
 var
    pares,impares:integer;
 begin
    pares:=0;impares:=0;
    descomponer(num,pares,impares);
    masPares:= pares>impares;
 end;
procedure recorrerLista(l:lista;var vObj:objetos;var cod1,cod2,cantGalileo:integer);
 var
    max1,max2:integer;
 begin
    max1:=0;
    cod1:=0;
    cantGalileo:=0;
    while(l<>nil)do begin
        maximos(l^.dato.cod,l^.dato.dist,max1,max2,cod1,cod2);
        vObj[l^.dato.cat]:=vObj[l^.dato.cat]+1;
        if((l^.dato.cat=2)and (galileo1600(l^.dato.descubridor,l^.dato.anio)))then
           cantGalileo:=cantGalileo+1;
        if((masPares(l^.dato.cod))and(l^.dato.cat=1))then
           writeln('La estrella ',l^.dato.nombre,' posee codigo de objeto con mas digitos pares que impares.');
        l:=l^.sig;
    end;
 end;
//programa principal
var
   l:lista;
   vObj:objetos;
   cod1,cod2,cantGalileo:integer;
begin
   l:=nil;
   inicializarObjetos(vObj);
   cargarLista(l);
   recorrerLista(l,vObj,cod1,cod2,cantGalileo);
   writeln('codigo de los dos objetos mas lejanos de la Tierra: 1: ',cod1,', 2: ',cod2); 
   writeln('Son ',cantGalileo,' los planetas descubiertos por Galileo Galilei antes del año 1600.');
   writeln('Objetos por categoria ');
   imprimirObjetos(vObj);
end.
