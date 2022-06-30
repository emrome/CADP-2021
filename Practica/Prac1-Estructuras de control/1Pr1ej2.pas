Program Pr1ej2;
var
  num1:real;
begin
  readln(num1);
  if(num1>=0)then
    writeln('|',num1:1:2,'| es ', num1:1:2)
  else
    writeln('|',num1:1:2,'| es ', num1*(-1):1:2);
end.
