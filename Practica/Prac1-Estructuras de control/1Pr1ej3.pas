program Pr1ej3;
var
  n1,n2,n3:integer;
begin
  writeln('Ingrese 3 numeros enteros');
  readln(n1,n2,n3);
  if(n1>n2)and(n1>n3)then
    begin
      if(n2>n3)then
        writeln(n1,' ',n2,' ',n3)
      else
        writeln(n1,' ',n3,' ',n2);
    end
  else if(n2>n1)and(n2>n3)then
    begin
      if(n1>n3)then
        writeln(n2,' ',n1,' ',n3)
      else
        writeln(n2,' ',n3,' ',n1);
    end
  else if(n3>n2)and(n3>n2)then
    begin
      if(n2>n1)then
        writeln(n3,' ',n2,' ',n1)
      else
        writeln(n3,' ',n1,' ',n2)
    end;
end.
