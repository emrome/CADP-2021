{
Realizar un programa modularizado que lea secuencia de números enteros. La lectura finaliza cuando llega
el número 123456, el cual no debe procesarse. Informar en pantalla para cada número la suma de sus dígitos
pares y la cantidad de dígitos impares que posee.
}
program Pr2ej10;
procedure descomponer (numero:integer; var sumaPares,digImpares:integer);
var
  dig:integer;
begin
  sumaPares:=0; 
  digImpares:=0;
  while (numero<>0) do
    begin   
      dig:=numero MOD 10;
      if (dig MOD 2 =0)then
        sumaPares:=sumaPares + dig
      else
        digImpares:=digImpares+1;
      numero:= numero DIV 10;
    end;
end;
{programa pricipal}
var
  num,sumaPares,Impares:integer;
begin
  write('Ingrese numero entero ');
  readln (num);
  while (num <>123456)do
    begin
      descomponer(num,sumaPares,Impares);
      writeln('La suma de los digitos pares fue: ',sumaPares,' y la cantidad de digitos impares es: ',Impares);
      write('Ingrese numero entero ');
      readln(num)
    end;
end.
