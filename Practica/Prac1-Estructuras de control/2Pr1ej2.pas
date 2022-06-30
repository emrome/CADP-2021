Program Pr1ej2;
var
i,num,numMax:integer;
begin
  numMax:=-1;
  for i:=1 to 10 do
    begin
      writeln('Ingrese numero');
      readln(num);
      if(num>numMax)then
        numMax:=num;
    end;
  writeln('El mayor numero leido fue el ',numMax);
 end.
