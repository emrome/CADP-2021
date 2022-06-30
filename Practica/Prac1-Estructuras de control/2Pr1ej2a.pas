Program Pr1ej2a;
var
  i,num,numMax,pos,posMax:integer;
begin
  numMax:=-1;
  pos:=0;
  for i:=1 to 10 do
    begin
      write('Ingrese numero ');
      readln(num);
      pos:=pos+1;
      if(num>numMax)then
        begin
          numMax:=num;
          posMax:=pos;
        end;
    end;
   writeln('El numero mayor leido fue el ',numMax,', en la posicion ',posMax,'.');
end.
