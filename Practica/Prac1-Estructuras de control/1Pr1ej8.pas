Program Pr1ej8;
var
  car1,car2,car3:char;
  v1,v2,v3:boolean;
begin
  writeln('Ingrese un caracter');
  readln(car1);
  writeln('Ingrese otro caracter');
  readln(car2);
  writeln('Ingrese otro caracter');
  readln(car3);
  v1:=(car1='a')or(car1='e')or(car1='i')or(car1='o')or(car1='u');
  v2:=(car2='a')or(car2='e')or(car2='i')or(car2='o')or(car2='u');
  v3:=(car3='a')or(car3='e')or(car3='i')or(car3='o')or(car3='u');
  if(v1 and v2 and v3)then
    writeln('Los tres caracteres son vocales')
  else
    writeln('Al menos uno de los caracteres no era vocal');
end.
