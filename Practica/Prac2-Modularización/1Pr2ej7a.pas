program alcanceYFuncionesA;
var
 suma, cant : integer;
 
 function calcularPromedio : real;
 var
   prom : real;
 begin
   if (cant <> 0) then
     prom := suma / cant
   else
     prom := -1;
   calcularPromedio:=prom;
 end;
 
begin { programa principal }
  readln(suma); 
  readln(cant); 
  if (calcularPromedio <> -1) then 
    writeln('El promedio es: ' , calcularPromedio:0:2)
  else
    writeln('Dividir por cero no parece ser una buena idea');
end.
