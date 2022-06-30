program Adic11;
type
  porcentaje= 1..100;
  vuelo=record
    codigo:integer;
    salida:string;
    llegada:string;
    km:integer;
    ocupacion:porcentaje;
  end;
procedure leerVuelo(var av:vuelo);
 begin
   with av do begin
     write('Ingrese codigo del avion ');readln(codigo);
     if(codigo<>44) then 
       begin
         write('Ingrese pais de salida ');readln(salida);
         write('Ingrese pais de llegada ');readln(llegada);
         write('Ingrese cantidad de km recorridos ');readln(km);
         write('Ingrese ocupacion del avion %');readln(ocupacion);
       end;
    end;
 end;
 
procedure maximosYminimos (num,cod:integer;var max1,max2,min1,min2,codMax1,codMax2,codMin1,codMin2:integer); 
 begin
  if (num>max1)then begin
    max2:=max1;
    max1:=num;
    codMax2:=codMax1;
    codMax1:=cod;
   end
  else
   if (num>max2)then begin
     max2:=num;
     codMax2:=cod;
   end;
   
  if (num<min1)then begin
    min2:=min1;
    min1:=num;
    codMin2:=codMin1;
    codMin1:=cod;
   end
  else
   if (num<min2)then begin
     min2:=num;
     codMin2:=cod;
   end;
 end;
 
 procedure maximoPais(num,codigo:integer;var max,cod:integer);
 begin
   if (num>max)then begin
     max:=num;
     cod:=codigo;
   end;
 end;
function esAusZel (pais:string):boolean;
 begin
   esAusZel:= ((pais='Australia')or (pais='Nueva Zelanda'));
 end;
 
function menos60mas5K (km:integer;ocup:porcentaje):boolean;
 begin
   menos60mas5K:= ((km>5000)and(ocup<60));
 end;
 
var
  flight:vuelo;
  kmTotales,cantSalidas,cont5K,cont10K,max1,max2,min1,min2,codMax1,codMax2,codMin1,codMin2,maxPaises,codMaxPaises,auxCod:integer;
  auxPais:string;
begin
  maxPaises:=0;codMaxPaises:=0;max1:=0;min1:=32767;codMax1:=0;codMin1:=0;
  cont5K:=0;cont10K:=0;
  leerVuelo(flight);
  while(flight.codigo<>44)do 
    begin
      auxCod:=flight.codigo;
      kmTotales:=0;
      cantSalidas:=0;
      while ((auxCod=flight.codigo)and (flight.codigo<>44))do 
        begin
          auxPais:=flight.salida;
          cantSalidas:=cantSalidas+1;
          while ((auxCod=flight.codigo)and (flight.codigo<>44)and(auxPais=flight.salida))do
            begin
              kmTotales:=kmTotales+flight.km;
              if (menos60mas5K(flight.km,flight.ocupacion))then
                cont5K:=cont5K+1;
              if((flight.km<10000)and esAusZel(flight.llegada))then
                cont10K:=cont10k+1;
              leerVuelo(flight);
            end;
        end;
       maximoPais(cantSalidas,auxCod,maxPaises,codMaxPaises);
       maximosYminimos (kmTotales,auxCod,max1,max2,min1,min2,codMax1,codMax2,codMin1,codMin2);
    end; 
  writeln('Los dos aviones que mas kilometros recorrieron son ',codMax1,' con ',max1,'km y ',codMax2,' con ',max2,'km y los dos aviones que menos kilometros recorrieron son ',codMin1,' con ',min1,'km y ',codMin2,' con ',min2,'km');        
  writeln('El avion ',codMaxPaises,' que salio desde mas paises diferentes ',maxPaises);
  writeln('Son ',cont5k,' los vuelos de mas de 5.000 km que no alcanzaron el 60% de ocupacion del avion.');
  writeln('Son ',cont10K,' los vuelos de menos de 10.000 km que llegaron a Australia o a Nueva Zelanda.');  
end.
