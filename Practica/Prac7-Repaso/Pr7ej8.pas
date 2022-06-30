{ Una entidad bancaria de la ciudad de La Plata solicita realizar un programa destinado a la
administración de transferencias de dinero entre cuentas bancarias, efectuadas entre los meses de
Enero y Noviembre del año 2018.
 El banco dispone de una lista de transferencias realizadas entre Enero y Noviembre del 2018. De cada
transferencia se conoce: número de cuenta origen, DNI de titular de cuenta origen, número de cuenta
destino, DNI de titular de cuenta destino, fecha, hora, monto y el código del motivo de la
transferencia (1: alquiler, 2: expensas, 3: facturas, 4: préstamo, 5: seguro, 6: honorarios y 7: varios).
Esta estructura no posee orden alguno.
Se pide:
a) Generar una nueva estructura que contenga sólo las transferencias a terceros (son aquellas en las
 que las cuentas origen y destino no pertenecen al mismo titular). Esta nueva estructura debe
 estar ordenada por número de cuenta origen.
Una vez generada la estructura del inciso a), utilizar dicha estructura para:
b) Calcular e informar para cada cuenta de origen el monto total transferido a terceros.
c) Calcular e informar cuál es el código de motivo que más transferencias a terceros tuvo.
d) Calcular e informar la cantidad de transferencias a terceros realizadas en el mes de Junio en las
cuales el número de cuenta destino posea menos dígitos pares que impares.
}


program Pr7ej8;
type
    rango=1..7;
    meses=1..11;
    dias=1..31;
    subrangoHs=1..24;
    minsYsegs=1..60;
    motivos=array[rango]of integer;
    fecha=record
       dia:dias;
       mes:meses;
    end;
    horas=record
       hs:subrangoHs;
       min:minsYsegs;
       seg:minsYsegs;
    end;
    transferencia=record
       numOrigen:integer;
       dniOrigen:integer;
       numDestino:integer;
       dniDestino:integer;
       fec:fecha;
       hora:horas;
       monto:real;
       motivo:rango;
    end;
    lista=^nodo;
    nodo=record
       dato:transferencia;
       sig:lista;
    end;
    
procedure leerHora(var h:horas);//SE DISPONE
procedure leerFecha(var f:fecha);//SE DISPONE
procedure leerTransferencia(var t:transferencia);//SE DISPONE
procedure agregarTransferencia(var l:lista;t:transferencia);//SE DISPONE
procedure cargarLista(var l:lista);//SE DISPONE

procedure inicializarMotivos(var m:motivos);
 var
    i:integer;
 begin
    for i:= 1 to 7 do 
        m[i]:=0;
 end;

procedure insertarTransferencia(var l:lista;t:transferencia);
 var
    nue,ant,act:lista;
 begin
    new(nue);nue^.dato:=t;
    ant:=l;act:=l;
    while((act<>nil)and(act^.dato.numOrigen<t.numOrigen))do begin
       ant:=act;
       act:=act^.sig;
    end;
    if(act=ant)then l:=nue
    else ant^.sig:=nue;
    nue^.sig:=act;
 end;

procedure recorrerLista(l:lista;var l2:lista);
 begin
    while(l<>nil)do begin
        if(l^.dato.dniOrigen<>l^.dato.dniDestino)then
            insertarTransferencia(l2,l^.dato);
        l:=l^.sig;
    end;
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
function masImpares(num:integer):boolean;
 var
    pares,impares:integer;
 begin
    pares:=0;impares:=0;
    descomponer(num,pares,impares);
    masImpares:= pares<impares;
 end;

procedure recorrerTerceros(l2:lista;var cantJunioImp:integer;var vMot:motivos);
 var
    auxCuenta:integer;
    montoTotal:real;
 begin
    cantJunioImp:=0;
    while(l<>nil)do begin
        auxCuenta:=l^.dato.numOrigen;
        montoTotal:=0;
        while((l<>nil)and(auxCuenta=l^.dato.numOrigen))do begin
           montoTotal:=montoTotal+l^.dato.monto;
           vMot[l^.dato.motivo]:=vMot[l^.dato.motivo]+1;
           if((l^.dato.fec.mes=6)and(masImpares(l^.dato.numDestino)))then
               cantJunioImp:=cantJunioImp+1;
            l:=l^.sig;
        end;   
        writeln('Monto total de la cuenta de origen ',auxCuenta,' es: $',montoTotal:2:2);
    end;
 end;

procedure maximo(num,cod:integer;var max,codMax:integer);
 begin
   if (num>max)then begin
     max:=num;
     codMax:=cod;
   end;
 end;
procedure maxMotivo(vMot:motivos;var codMax:integer);
 var
    i,max:integer;
 begin
    max:=0;
    for i:= 1 to 7 do 
        maximo(vMot[i],i,max,codMax);
 end;
//programa principal
var
   l,l2:lista;
   codMax,cantJunioImp:integer;
   vMot:motivos;
begin
   l:=nil;l2:=nil;
   inicializarMotivos(vMot);
   cargarLista(l);
   recorrerLista(l,l2);
   recorrerTerceros(l2,cantJunioImp,vMot);
   maxMotivo(vMot,codMax);
   writeln('Codigo delmotivo con mas transferencias ',codMax);
   writeln('Son ',cantJunioImp,' las transferencias a terceros realizadas en el mes de Junio con número de cuenta destino con menos dígitos pares que impares.');
end.
