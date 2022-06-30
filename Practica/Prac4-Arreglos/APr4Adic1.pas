{La compañía Canonical Llt. desea obtener estadísticas acerca del uso de Ubuntu Linux en La Plata. Para ello, 
debe realizar un programa que lea y almacene información sobre las computadoras con este sistema 
operativo (a lo sumo 10.000). De cada computadora se conoce código de computadora, la versión de Ubuntu 
que utilizan (18.04, 17.10, 17.04, etc.), la cantidad de paquetes instalados y la cantidad de cuentas de usuario 
que poseen. La información debe almacenarse ordenada por código de computadora de manera 
ascendente. La lectura finaliza al ingresar el código de computadora -1, que no debe procesarse. Una vez 
almacenados todos los datos, se pide:
a) Informar la cantidad de computadoras que utilizan las versiones 18.04 o 16.04.
b) Informar el promedio de cuentas de usuario por computadora.
c) Informar la versión de Ubuntu de la computadora con mayor cantidad de paquetes instalados.
d) Eliminar la información de las computadoras con código entre 0 y 500.}

program Pr4Adic1;
const
  dimF=10000;
type 
  compu=record
     cod:integer;
     version:string;
     paquetes:integer;
     cuentas:integer;
   end;
   
   linux=array[1..dimF]of compu;

procedure leerCompu(var c:compu);
 begin
    writeln('Ingrese codigo de la computadora');readln(c.cod);
    if(c.cod<>-1)then begin
        writeln('Ingrese version de la computadora ');readln(c.version);
        writeln('Ingrese cantidad de paquetes instalados ');readln(c.paquetes);
        writeln('Ingrese cantidad de cuentas de usuario que posee ');readln(c.cuentas);
     end;
 end;
 
procedure cargarCompus(var l:linux;var dimL:integer);
 var
   aux:compu;
 begin
   dimL:=0;
   leerCompu(aux);
   while((dimL<dimF)and(aux.cod<>-1))do begin
       dimL:=dimL+1;
       l[dimL]:=aux;
       leerCompu(aux);
    end;
 end;
procedure ordenarVector(var lin:linux;dimL:integer);
 var
   i,j,p:integer;
   aux:compu;
 begin
   for i:=1 to dimL-1 do begin
     p:=i;
     for j:=i+1 to dimL do 
        if lin[j].cod < lin[p].cod then
           p:=j;
     aux:=lin[p];
     lin[p]:= lin[i];
     lin[i]:= aux;
   end;
 end;
{procedure ordenarVector(var lin:linux;dimL:integer);
 var
   i,j:integer;
   exito:boolean;
   aux:compu;
 begin
   i:=1;
   exito:=true;
   while((i<=dimL-1)and exito)do begin
     exito:=false;
     for j:=1 to dimL-1 do 
       if(lin[j].cod > lin[j+1].cod)then
         begin
            exito:=true;
            aux:=lin[j];
            lin[j]:=lin[j+1];
            lin[j+1]:=aux;
         end;
     i:=i+1;  
    end;
 end;}

procedure maximo(var maxVersion:string;var maxPaquetes:integer;num:integer; version:string);
 begin
    if(num>maxPaquetes)then begin
       maxVersion:=version;
       maxPaquetes:=num;
    end;
 end;
procedure recorrerCompus(vec:linux;dimL:integer;var cantVersiones:integer;var promCuentas:real;var maxVersion:string; var maxPaquetes:integer);
 var
   i,cuentasTotales:integer;
 begin
   maxPaquetes:=0;
   cantVersiones:=0;
   cuentasTotales:=0;
   for i:=1 to dimL do begin
       if((vec[i].version='18.04')or(vec[i].version='16.04'))then
         cantVersiones:=cantVersiones+1;
       cuentasTotales:=cuentasTotales+vec[i].cuentas;
       maximo(maxVersion,maxPaquetes,vec[i].paquetes,vec[i].version);
    end;
   promCuentas:=cuentasTotales/dimL;
 end;
 
procedure eliminarCod(var c:linux; var dimL:integer);
 var
    i:integer;
 begin
   while((c[1].cod<=500)and(c[1].cod>=0))do begin
       for i:=1 to dimL-1 do
         c[i]:=c[i+1];
       dimL:=dimL-1;
    end;
 end;
     
procedure imprimirVector(compus:linux;dimL:integer);
 var
    i:integer;
 begin
     for i:=1 to dimL do begin 
       writeln(compus[i].cod,', ',compus[i].version,', ',compus[i].paquetes,', ',compus[i].cuentas);
       writeln('--------------------------------------------');
    end;
 end;
 
//programa principal
var
  promCuentas:real;
  compus:linux;
  dimL,cantVersiones,maxPaquetes:integer;
  maxVersion:string;
begin
   cargarCompus(compus,dimL);
   ordenarVector(compus,dimL);
   recorrerCompus(compus,dimL,cantVersiones,promCuentas,maxVersion,maxPaquetes);
   writeln('La cantidad de computadoras que utilizan las versiones 18.04 o 16.04 es ',cantVersiones);
   writeln('El promedio de cuentas de usuario por computadora es ',promCuentas:2:2);
   writeln('La version ',maxVersion,' de Ubuntu es la de computadora con mayor cantidad de paquetes instalados(',maxPaquetes,')');
   imprimirVector(compus,dimL);
   eliminarCod(compus,dimL);
   writeln('Vector sin versiones de 0 a 500');
   imprimirVector(compus,dimL);
end.
