Program Pr0ej6;
var
  dolares,valor_dolar,comisionBank,transaccion,valor_final:real;
begin
  writeln('Ingrese el monto en $USD');
  readln(dolares);
  writeln('Ingrese el valor del dolar al dia de la fecha');
  readln(valor_dolar);
  writeln('Ingrese porcentaje de comision del banco');
  readln(comisionBank);
  transaccion:= dolares*valor_dolar;
  valor_final:= transaccion + ((transaccion * comisionBank)/100);
  writeln('La transaccion sera de ',valor_final:1:2,' pesos argentinos');
end.
