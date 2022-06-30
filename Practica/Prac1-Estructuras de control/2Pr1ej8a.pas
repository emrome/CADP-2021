Program Pr1ej8a;
var
  monto,montoMes:real;
  i,ventasdia,maxVentas,diaMayorVen:integer;
begin
  montoMes:=0;
  maxVentas:=0;
  for i:= 1 to 31 do
    begin
      write('Ingrese monto: ');
      readln(monto);
      ventasdia:=0;  {reinicia el contador de ventas por dia}
      while(monto>0)do
        begin
          montoMes:=montoMes + monto;
          ventasdia:=ventasdia+1;
          write('Ingrese monto: ');
          readln(monto);
        end;
       writeln('Ventas totales del dia ', i,': ',ventasdia);
      if (ventasdia>maxVentas)then 
        begin
          diaMayorVen:= i;
          maxVentas:=ventasdia; {cambia el valor del maximo de ventas}
        end;
    end;
   writeln('El monto acumulado en el mes es de: ',montoMes:0:2);
   writeln('El dia con mayor ventas fue el ',diaMayorVen); 
end.
