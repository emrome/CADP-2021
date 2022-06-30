Program Pr1ej4;
var
  i,num,numMin1,numMin2:integer;
begin
  numMin1:=999;
  for i:= 1 to 1000 do
   begin
    write('Ingrese numero: ');
    readln(num);
    if(num<numMin1)then
      begin
        numMin2:=numMin1;
        numMin1:=num;
      end;
    if(num<numMin2)and(num>numMin1)then
        numMin2:=num;
   end;
  writeln('El numero minimo 1 es: ',numMin1,' y el minimo 2 es: ',numMin2,'.');
end.
