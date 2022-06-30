{Una empresa de transporte de caudales desea optimizar el servicio que brinda a sus clientes. Para ello, cuenta con información sobre todos los viajes realizados durante el mes de marzo. De cada viaje se cuenta con la siguiente información: día del mes (de 1 a 31), monto de dinero transportado y distancia recorrida por el camión (medida en kilómetros).
a) Realizar un programa que lea y almacene la información de los viajes (a lo sumo 200). La lectura finaliza cuando se ingresa una distancia recorrida igual a 0 km, que no debe procesarse.
b) Realizar un módulo que reciba el vector generado en a) e informe:
- El monto promedio transportado de los viajes realizados
- La distancia recorrida y el día del mes en que se realizó el viaje que transportó menos dinero.
- La cantidad de viajes realizados cada día del mes.
c) Realizar un módulo que reciba el vector generado en a) y elimine todos los viajes cuya distancia recorrida sea igual a 100 km.
Nota: para realizar el inciso b, el vector debe recorrerse una única vez.}

program Pr4ej3;
const
  dimF=5;
type
   rango=1..31;
   viaje=record
      dia:rango;
      monto:real;
      km:integer;
   end;
   viajes=array[1..dimF]of viaje;
   mes=array[rango]of integer;

procedure leerViaje(var v:viaje);
 begin
   writeln('Ingrese distancia recorrida: ');readln(v.km);
   if(v.km<>0)then begin
      writeln('Ingrese monto transportado: ');readln(v.monto);
      writeln('Ingrese dia del viaje: ');readln(v.dia);
     end;
 end;
 
procedure cargarViajes(var via:viajes;var dimL:integer); {Inciso A}
 var
   v:viaje;
 begin
   dimL:=0;
   leerViaje(v);
   while((dimL<dimF)and(v.km<>0))do begin
      dimL:=dimL+1;
      via[dimL]:=v;
      leerViaje(v);
    end; 
 end;

function promedio(monto:real;cant:integer):real;
 begin
   promedio:=monto/cant;
 end;
 
procedure minViaje(via:viaje;var viajeMin:viaje);
 begin
   if(via.monto<viajeMin.monto)then  viajeMin:=via;
 end;
 
procedure inicializar(var m:mes);
 var
    i:integer;
 begin
    for i:=1 to 31 do
      m[i]:=0;
 end;
 
procedure imprimirDias(m:mes);
 var
    i:integer;
 begin
    for i:= 1 to 31 do 
      writeln('Cantidad de viajes del dia ',i,' es: ',m[i]);
 end;
 
procedure recorrerViajes(via:viajes;dimL:integer); {Inciso B}
 var
   vPorDia:mes;
   viajeMin:viaje;
   montoTotal:real;
   i:integer;
 begin
   viajeMin.monto:=32676;
   montoTotal:=0;
   inicializar(vPorDia);
   for i:=1 to dimL do begin
       montoTotal:=montoTotal+ via[i].monto;
       minViaje(via[i],viajeMin);
       vPorDia[via[i].dia]:=vPorDia[via[i].dia]+1;
     end;
   writeln('El monto promedio transportado de los viajes realizados es $',promedio(montoTotal,dimL):2:2);
   writeln('El menor monto transportado fue $',viajeMin.monto:2:2,' el dia ',viajeMin.dia,' a una distancia de ',viajeMin.km,'km');
   imprimirDias(vPorDia);
 end;

function buscarPosElem(via:viajes;dimL:integer; elem:integer):integer; {busca la posicion del viaje con 100km}
 var
    pos:integer;exito:boolean;
 begin
    pos:=1;
    exito:=false;
    while ((pos<=dimL) and (not exito))do begin
        if(elem=via[pos].km)then
          exito:=true
        else
          pos:=pos+1;
      end;
    if(exito=false)then pos:=0;
    buscarPosElem:=pos;
 end;
 
procedure borrarElemento(var via:viajes;var dimL:integer;pos:integer); {borra el viaje con 100km}
 var
   i:integer;
 begin
   if ((pos>=1)and(pos<=dimL))then begin
      for i:=pos to dimL-1 do 
        via[i]:=via[i+1];
      dimL:=dimL-1;
    end;
 end;
 
procedure borrar100km(var via:viajes;var dimL:integer;elem:integer; var exito:boolean); {Inciso C}
 var    
   pos:integer;
 begin 
    exito:=false;
    pos:=buscarPosElem(via,dimL,elem);
    while(pos<>0)do begin {pos es 0 cuando no hay mas viajes con 100km}
        borrarElemento(via,dimL,pos); {borra el viaje}
        exito:=true;
        pos:=buscarPosElem(via,dimL,elem);{vuelve a buscar si hay mas viajes con 100km}
      end;
 end;
{programa principal}
var
  via:viajes;
  dimL:integer;
  i:integer;
  exito:boolean;
begin
   cargarViajes(via,dimL); {a}
   recorrerViajes(via,dimL);{b}
   borrar100km(via,dimL,100,exito);{c}
   if(exito) then writeln('Se borraron todos los viajes con 100km recorridos')
   else writeln ('No habia viajes con 100km');
   for i:=1 to dimL do begin {imprime vector, era para verificar si elimino los viajes}
      writeln(via[i].km);
      writeln(via[i].monto:2:2);
      writeln(via[i].dia);
    end;
end.
