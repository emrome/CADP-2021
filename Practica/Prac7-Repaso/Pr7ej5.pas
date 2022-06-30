{Una empresa de transporte de cargas dispone de la información de su flota compuesta por 100
camiones. De cada camión se tiene: patente, año de fabricación y capacidad (peso máximo en
toneladas que puede transportar).
Realizar un programa que lea y almacene la información de los viajes realizados por la empresa. De
cada viaje se lee: código de viaje, código del camión que lo realizó (1..100), distancia en kilómetros
recorrida, ciudad de destino, año en que se realizó el viaje y DNI del chofer. La lectura finaliza cuando
se lee el código de viaje -1.
Una vez leída y almacenada la información, se pide:
1. Informar la patente del camión que más kilómetros recorridos posee y la patente del camión que menos 
kilómetros recorridos posee.
2. Informar la cantidad de viajes que se han realizado en camiones con capacidad mayor a 30,5 toneladas 
y que posean una antigüedad mayor a 5 años al momento de realizar el viaje (año en que se realizó el viaje).
3. Informar los códigos de los viajes realizados por choferes cuyo DNI tenga sólo dígitos impares.
Nota: Los códigos de viaje no se repiten
}


program Pr7ej5;
const
   CORTE=-1;
   dimF=100;
type
    rango=1..dimF;
    viaje=record
       codViaje:integer;
       codCamion:integer;
       km:integer;
       destino:string;
       anio:integer;
       dni:integer;
    end;
    lista=^nodo;
    nodo=record
       dato:viaje;
       sig:lista;
    end;
    camion=record
       patente:string;
       anioFabricacion:integer;
       capacidad:real;
       viajes:lista;
    end;
    camiones=array[rango]of camion;
procedure inicializarViajes(var vCam:camiones);
 var
    i:integer;
 begin
    for i:=1 to dimF do 
       vCam[i].viajes:=nil;
 end;
 
procedure leerCamiones(var c:camion);//SE DISPONE
procedure cargarCamiones(var vCam:camiones);//SE DISPONE

procedure leerViaje(var v:viaje);
 begin
    writeln('Ingrese codigo de viaje ');readln(v.codViaje);
    if(v.codViaje<>CORTE)then begin
       writeln('Ingrese codigo de vaije: ');readln(v.codViaje);
       writeln('Ingrese codigo de camion: ');readln(v.codCamion);
       writeln('Ingrese distancia recorrida: ');readln(v.km);
       writeln('Ingrese anio del viaje:' );readln(v.anio);
       writeln('Ingrese dni del conductor: ');readln(v.dni);
    end;
 end;
procedure agregar(var l:lista;v:viaje);
 var
    nue:lista;
 begin
    new(nue);
    nue^.dato:=viaje;
    nue^.sig:=l;
    l:=nue;
 end;
procedure cargarViajes(var vCamiones:camiones);
 var
    v:viaje;
 begin
    leerViaje(v);
    while(v.codViaje<>CORTE)do begin
       agregar(vCamiones[v.codCamion].viajes,v);
       leerViaje(v);
    end;
 end;
procedure maximo (km:integer;pat:string;var max:integer;var patMin:string);
 begin
    if (km>max)then begin
       max:=km;
       patMax:=pat;
    end;
 end;
procedure minimo (km:integer;pat:string;var min:integer;var patMin:string);
 begin
    if (km<min)then begin
       min:=km;
       patMin:=pat;
   end;
 end;
 
function todosImpares(num:integer):boolean;
 var
   pares:integer;
 begin
    pares:=0;
    while((num<>0)and (pares=0))do begin
        if(num MOD 2=0)then
           pares:=pares+1;
        num:=num DIV 10;
    end;
    todosImpares:= (pares=0);
 end;
 
procedure recorrerLista(l:lista;var kmTotales,cantCond:integer;cap:real;anio:integer);
 begin
    while(l<>nil)do begin
       kmTotales:=kmTotales+l^.dato.km;
       if((cap>30.5)and((l^.dato.anio-anio)>5))then
          cantCond:=cantCond+1;
       if(todosImpares(l^.dato.dni))then
          writeln('Viaje con codigo ',l^.dato.codViaje,' fue realizado por chofer cuyo DNI tiene solo digitos impares.');
       l:=l^.sig;
    end;
 end;
 
procedure recorrerCamiones(vCamiones:camiones;var patMax,patMin:string;var cantCond:integer);
 var
   i,max,min,kmTotales:integer;
 begin
    max:=0;
    min:=32767;
    cantCond:=0;
    for i:=1 to dimF do begin
        kmTotales:=0;
        recorrerLista(vCamiones[i].viajes,kmTotales,cantCond,vCamiones[i].capacidad,vCamiones[i].anioFabricacion);
        maximo(kmTotales,vCamiones[i].patente,max,patMax);
        minimo(kmTotales,vCamiones[i].patente,min,patMin);
    end;
 end;
//programa principal
var
   vCamiones:camiones;
   patMax,patMin:string;
   cantCond:integer;
begin
   cargarCamiones(vCamiones);
   inicializarViajes(vCamiones);
   cargarViajes(vCamiones);
   recorrerCamiones(vCamiones,patMax,patMin,cantCond);
   writeln('Patente: ',patMax,' es la que mas kilometros recorridos posee. Patente: ',patMin,' es la que menos kilometros recorridos posee.');
   writeln('Son ',cantCond,' los viajes que se han realizado en camiones con capacidad mayor a 30,5 toneladas y que posean una antigüedad mayor a 5 años al momento de realizar el viaje .');
end.
