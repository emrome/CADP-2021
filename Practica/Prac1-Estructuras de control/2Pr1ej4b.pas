Program Pr1ej4b;
var
  num,numMin1,numMin2:integer;
begin
  numMin1:=999;
  write('Ingrese numero: ');
  readln(num);
  while(num<>0)do
    begin
      if(num<numMin1)then  
        begin
          numMin2:=numMin1;
          numMin1:=num;
        end;
      if(num<numMin2)and (num>numMin1)then
        numMin2:=num;
      write('Ingrese numero: ');
      readln(num);
    end;
  writeln('El numero minimo 1 es: ',numMin1,' y el minimo 2 es: ',numMin2,'.');
end.
