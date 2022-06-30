Program Pr1ej4a;
var
  num,numMin1,numMin2:integer;
begin
  numMin1:=999;
  repeat
    write('Ingrese numero: ');
    readln(num);
    if(num<numMin1)then
      begin
        numMin2:=numMin1;
        numMin1:=num;
      end;
    if(num<numMin2)and (num>numMin1)then
        numMin2:=num;
  until(num=0);
  writeln('El numero minimo 1 es: ',numMin1,' y el minimo 2 es: ',numMin2,'.');
end.
