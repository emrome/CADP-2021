Program Pr1ej5;
var 
  numX,numero,n_ingresados:real;
begin
  readln(numX);
  readln(numero);
  n_ingresados:= 1;
  while(numero<>numX*2)and(n_ingresados<10)do
    begin
      writeln('Ingrese otro numero');
      readln(numero);
      n_ingresados:= n_ingresados+1;
    end;
  if (numero=numX*2)then
    writeln('Se encontro el doble del numero')
  else
    writeln('No se ha ingresado el doble de ',numX:1:2);
end.
