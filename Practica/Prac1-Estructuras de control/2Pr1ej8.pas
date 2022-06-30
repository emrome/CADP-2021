Program Pr1ej8;
var
  monto,montoMes:real;
  i,ventasdia:integer;
begin
  montoMes:=0;
  for i:= 1 to 3 do
    begin
      ventasdia:=0;
      write('Ingrese monto: ');
      readln(monto);
      while(monto>0)do
        begin
          montoMes:=montoMes + monto;
          ventasdia:=ventasdia+1;
          write('Ingrese monto: ');
          readln(monto);
        end;
      writeln('Ventas totales del dia ', i,': ',ventasdia);
    end;
   writeln('El monto acumulado en el mes es de: ',montoMes:0:2);
end.
       
