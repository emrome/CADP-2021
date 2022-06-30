{Una productora nacional realiza un casting de personas para la selección de actores extras de una
nueva película, para ello se debe leer y almacenar la información de las personas que desean
participar de dicho casting. De cada persona se lee: DNI, apellido y nombre, edad y el código de
género de actuación que prefiere (1: drama, 2: romántico, 3: acción, 4: suspenso, 5: terror). La lectura
finaliza cuando llega una persona con DNI 33555444, la cual debe procesarse.
Una vez finalizada la lectura de todas las personas, se pide:
a. Informar la cantidad de personas cuyo DNI contiene más dígitos pares que impares.
b. Informar los dos códigos de género más elegidos.
c. Realizar un módulo que reciba un DNI, lo busque y lo elimine de la estructura. El DNI puede no
existir. Invocar dicho módulo en el programa principal.
}


program Pr7ej1;
const
   CORTE=33555444;
 type
    rango=1..5;
    edades=1..100;
    str=string[20];
    persona=record
      dni:integer;
      apellido:str;
      nombre:str;
      edad:edades;
      cod:rango;
    end;
    generos=array[rango]of integer;
    lista=^nodo;
    nodo=record
       dato:persona;
       sig:lista;
    end;
    
procedure leerPersona(var p:persona);
 begin
    writeln('Ingrese dni: ');readln(p.dni);
    writeln('Ingrese apellido: ');readln(p.apellido);
    writeln('Ingrese nombre: ');readln(p.nombre);
    writeln('Ingrese edad: ');readln(p.edad);
    writeln('Ingrese codigo de genero de actuacion que prefiere (1: drama, 2: romantico, 3: accion, 4: suspenso, 5: terror); ');readln(p.cod);
 end;
procedure agregarOrdenado(var l:lista;p:persona);
 var
    nue,ant,act:lista;
 begin
    new(nue);
    nue^.dato:=p;
    act:=l;
    ant:=l;
    while((act<>nil)and (p.dni<act^.dato.dni))do begin
       ant:=act;
       act:=act^.sig;
    end;
    if(act=ant)then
       l:=nue
    else
       ant^.sig:=nue;
    nue^.sig:=act;
 end;
procedure cargarLista(var l:lista);
 var
    p:persona;
 begin
    repeat
       leerPersona(p);
       agregarOrdenado(l,p);
    until(p.dni=CORTE)
 end;
procedure inicializarVecGeneros(var g:generos);
 var
    i:integer;//rango 
 begin
    for i:= 1 to 5 do 
       g[i]:=0;
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
procedure maximos(num,cod:integer; var max1,max2,cod1,cod2:integer);
 begin
  if (num>max1)then begin
    max2:=max1;
    max1:=num;
    cod2:=cod1;
    cod1:=cod;
   end
  else
   if (num>max2)then begin
     max2:=num;
     cod2:=cod;
   end;
 end;
 
procedure maxGeneros(g:generos;var cod1,cod2:integer);
 var
    i,max1,max2:integer;
 begin
    max1:=0;
    cod1:=0;
    for i:=1 to 5 do 
       maximos(g[i],i,max1,max2,cod1,cod2);
 end;
 
procedure eliminarDni(var l:lista;var exito:boolean;valor:integer);
 var
    ant,act:lista;
 begin
    ant:=l;
    act:=l;
    exito:=false;
    while((act<>nil)and (act^.dato.dni<valor))do begin
       ant:=act;
       act:=act^.sig;
    end;
    if((act<>nil)and (act^.dato.dni=valor))then begin
        exito:=true;
        if(act=l)then
           l:=l^.sig
        else
           ant^.sig:=act^.sig;
        dispose(act);
    end;
 end;
procedure recorrerLista(l:lista;var vGenero:generos;var cantMasPares:integer);
 begin
   cantMasPares:=0;
   while (l<>nil) do begin
        if(masPares(l^.dato.dni))then
          cantMasPares:=cantMasPares+1;
        vGenero[l^.dato.cod]:=vGenero[l^.dato.cod]+1;
        l:=l^.sig;
    end;
 end;
//programa principal
var
  exito:boolean;
  l:lista;
  vGeneros:generos;
  cantMasPares,dniEliminar,cod1,cod2:integer;

begin
  l:=nil;
  inicializarVecGeneros(vGeneros);
  cargarLista(l);
  
  recorrerLista(l,vGeneros,cantMasPares);
  maxGeneros(vGeneros,cod1,cod2);
  
  writeln('El genero con codigo ',cod1,' fue el mas elegido y le sigue el genero con codigo ',cod2);
  writeln('Son ',cantMasPares,' las personas cuyo DNI contiene mas digitos pares que impares.');
  
  writeln('Ingrese DNI a eliminar ');readln(dniEliminar);
  eliminarDni(l,exito,dniEliminar);
  if(exito)then writeln('El dni ',dniEliminar,' se elimino de la lista.')
  else writeln('El dni no se encontraba en la lista.');
end.
       
