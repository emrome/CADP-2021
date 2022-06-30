Program Pr1ej9;
var
  op:char;
  num,acumulador:integer;
begin
  writeln('Ingrese el caracter + o -');
  readln(op);
  acumulador:=0;
  if(op<>'+')and(op<>'-')then
    writeln('Error')
  else
    begin
      writeln('Ingrese un numero entero');
      readln(num);
      if(op='+')then
        begin
          while(num<>0)do
            begin
              acumulador:=acumulador+num;
              writeln('Ingrese un numero entero');
              readln(num);
            end;
        end
      else
        begin
          acumulador:=num+num;
          while(num<>0)do
            begin
              acumulador:= acumulador-num;
              writeln('Ingrese un numero entero');
              readln(num);
            end;
        end;   
      writeln(acumulador);
    end;
end.
