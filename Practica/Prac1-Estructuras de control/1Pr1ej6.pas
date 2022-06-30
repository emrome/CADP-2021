Program Pr1ej6;
var
  legajo,alumnos,promedioSup,destacados:integer;
  promedio,porcentaje:real;
begin
  alumnos:=0;
  promedioSup:= 0;
  destacados:=0;
  writeln('Ingrese su numero de legajo y promedio');
  readln(legajo,promedio);
  while(legajo<>-1)do
    begin
      alumnos:=alumnos+1;
      if(promedio>6.5)then
        promedioSup:= promedioSup+1;
      if(promedio>8.5)and(legajo<2500)then
        destacados:=destacados+1;
      writeln('Ingrese su legajo y promedio');
      readln(legajo,promedio);
    end;
  porcentaje:= (destacados*100)/alumnos;
  writeln('La cantidad de alumnos leidos es ',alumnos);
  writeln('La cantidad de alumnos con promedio mayor a 6.5 es ',promedioSup);
  writeln('El porcentaje de alumnos destacados es % ', porcentaje:1:2)
end.
