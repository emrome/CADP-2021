{a. Realizar un módulo que reciba como parámetro un número entero y retorne la cantidad de dígitos que
posee y la suma de los mismos.
b. Utilizando el módulo anterior, realizar un programa que lea una secuencia de números e imprima la
cantidad total de dígitos leídos. La lectura finaliza al leer un número cuyos dígitos suman exactamente 10, el
cual debe procesarse.}
program Pr2ej7;
procedure descomponer(num:integer;var digitos,suma:integer);
var
  dig:integer;
begin
  digitos:=0;
  suma:=0;
  while (num<>0) do
    begin   
      dig:=num MOD 10;
      digitos:=digitos + 1;
      suma:=suma + dig;
      num:= num DIV 10;
    end;
end;  {modulo ejercicio a}

var
  numero,digitos,suma,digitosTotales:integer;
  {programa principal parte B del ejercicio}
begin
  digitosTotales:=0;
  repeat
    write('Ingrese numero ');
    readln(numero);
    descomponer(numero,digitos,suma);
    digitosTotales:=digitosTotales + digitos;
  until(suma=10);
  writeln('La cantida de digitos totales leidos fue: ',digitosTotales);
end.
    

