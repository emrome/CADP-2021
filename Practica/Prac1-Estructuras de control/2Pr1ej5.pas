Program Pr1ej5;
var
  num,numMin,numMax,sumaT:integer;
begin
  numMin:=999;
  numMax:=-1;
  sumaT:=0;
  repeat
    write('Ingrese numero entero: ');
    readln(num);
    if(num>numMax)then
      numMax:=num;
    if(num<numMin)then
      numMin:=num;
    sumaT:=sumaT+num;
  until(num=100);
  writeln('Numero maximo: ',numMax);
  writeln('Numero minimo: ',numMin);
  writeln('La suma total de los numeros es: ',sumaT);
end.
