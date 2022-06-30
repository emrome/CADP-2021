Program Pr1ej1;
var
  num1,num2: integer;
begin
  readln(num1);
  readln(num2);
  if(num1=num2)then
    writeln('Los numeros leidos son iguales')
  else
    begin
      if(num1>num2)then
        writeln('El ',num1,' es mayor que el ',num2)
      else
        writeln('El ',num2,' es mayor que el ',num1)
    end;
end.
