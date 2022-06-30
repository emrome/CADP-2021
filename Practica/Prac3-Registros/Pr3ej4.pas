{4. Una compañía de telefonía celular debe realizar la facturación mensual de sus 9300 clientes con planes de consumo ilimitados (clientes que pagan por lo que consumen). Para cada cliente se conoce su código de cliente y cantidad de líneas a su nombre. De cada línea se tiene el número de teléfono, la cantidad de minutos consumidos y la cantidad de MB consumidos en el mes. Se pide implementar un programa que lea los datos de los clientes de la compañía e informe el monto total a facturar para cada uno. Para ello, se requiere:
a. Realizar un módulo que lea la información de una línea de teléfono.
b. Realizar un módulo que reciba los datos de un cliente, lea la información de todas sus líneas (utilizando el
módulo desarrollado en el inciso a. ) y retorne la cantidad total de minutos y la cantidad total de MB a facturar del cliente.
Nota: para realizar los cálculos tener en cuenta que cada minuto cuesta $3,40 y cada MB consumido cuesta $1,35.}

program Pr3ej4;
type
  line=record
    numero:integer;
    minutos:integer;
    MB:integer;
  end;
  cliente=record
    codigo:integer;
    cantLineas:integer;
    lineas:line;
  end;
  
procedure leerLinea(var l:line);
 begin
  with l do
    begin
      writeln('Ingrese su numero ');read(numero);
      writeln('Ingrese minutos consumidos ');read(minutos);
      writeln('Ingrese MB consumidos ');read(MB);
    end;
 end;
     
procedure leerCliente(var c:cliente);
 begin
   with c do
     begin
       read(codigo); 
       read(cantLineas);
     end;
 end;

procedure mbYminTotales(l:line;cantLineas:integer;var MBtotales,minTotales:integer);
 var
  i:integer;
 begin
   for i:=1 to cantLineas do
     begin
       leerLinea(l);
       MBtotales:=MBtotales + l.mb;
       minTotales:= minTotales + l.minutos;
     end;
 end;
 
function montoTotal(mb,min:integer):real;
 begin
   montoTotal:= ((1.35*mb)+ (min*3.40));
 end;
 
var
 i,MBtotales,minTotales:integer;
 cl:cliente;
begin
  for i:=1 to 3 do
    begin
      MBtotales:=0;
      minTotales:=0;
      write('Ingrese su codigo y cantidad de lineas a su nombre ');
      leerCliente(cl);
      mbYminTotales(cl.lineas,cl.cantLineas,MBtotales,minTotales);
      writeln('Monto total a facturar: $',montoTotal(MBtotales,minTotales):2:2);
    end;
end.   
