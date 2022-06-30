Program Pr1ej7;
var
  i:integer;
  nombre,nombrePrimero,nombreSeg,nombreAnte,nombreUltimo:string;
  tiempo,tiempoMax1,tiempoMax2,tiempoMin1,tiempoMin2:real;
begin
  nombrePrimero:=' ';
  nombreUltimo:=' ';
  tiempoMin1:=999;
  tiempoMax1:=0;
  for i:=1 to 100 do
    begin  
    write('nombre del piloto: ');
    readln(nombre);
    write('tiempo del piloto: ');
    readln(tiempo);
    if(tiempo>tiempoMax1)then
      begin
        tiempoMax2:=tiempoMax1;
        tiempoMax1:=tiempo;
        nombreAnte:=nombreUltimo;
        nombreUltimo:=nombre;
      end
    else
      if(tiempo>tiempoMax2)then
        begin
          tiempoMax2:=tiempo;
          nombreAnte:=nombre;
        end;
    if(tiempo<tiempoMin1)then
      begin
        tiempoMin2:=tiempoMin1;
        tiempoMin1:=tiempo;
        nombreSeg:=nombrePrimero;
        nombrePrimero:=nombre;
      end
    else
      if(tiempo<tiempoMin2)then
        begin
          tiempoMin2:=tiempo;
          nombreSeg:=nombre;
        end;
    end;
  writeln('El primer puesto fue: ',nombrePrimero,' y el segundo puesto fue: ',nombreSeg);
  writeln('El anteultimo puesto fue: ',nombreAnte,' y el ultimo puesto fue: ',nombreUltimo);
end.
