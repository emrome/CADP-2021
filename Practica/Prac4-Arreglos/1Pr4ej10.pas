{Realizar un programa que lea y almacene el salario de los empleados de una empresa de turismo (a lo sumo 300 empleados). La carga finaliza cuando se lea el salario 0 (que no debe procesarse) o cuando se completa el vector. Una vez finalizada la carga de datos se pide:
a) Realizar un módulo que incremente el salario de cada empleado en un 15%. Para ello, implementar un módulo que reciba como parámetro un valor real X, el vector de valores reales y su dimensión lógica y retorne el mismo vector en el cual cada elemento fue multiplicado por el valor X.
b) Realizar un módulo que muestre en pantalla el sueldo promedio de los empleados de la empresa.}

program pr4ej10;
const
  dimF=300;
type
   salarios=array[1..dimF]of real;

procedure cargarSalarios(var sal:salarios;var dimL:integer);
 var
    salario:real;
 begin
    dimL:=0;
    writeln('Ingrese el salario');
    readln(salario);
    while ((dimL<dimF)and (salario<>0))do begin
       dimL:=dimL+1;
       sal[dimL]:=salario;
       writeln('Ingrese el salario');
       readln(salario);
     end;
 end;

procedure Aumentito(valorX:real;var sal:salarios;dimL:integer); {Inciso A}
 var
    i:integer;
 begin
    valorX:=valorX/100;
    for i:=1 to dimL do begin
       sal[i]:= sal[i]+(sal[i]*valorX);
       writeln('El nuevo sueldo del empleado ',i,' es: $',sal[i]:2:2);
     end;
 end;

procedure promedio(sal:salarios;dimL:integer);{Inciso B}
 var
    i:integer;
    salarioTotal:real;
 begin
    salarioTotal:=0;
    for i:=1 to dimL do 
        salarioTotal:=salarioTotal+sal[i];
    writeln(' El salario promedio de los empleados de la empresa es ',(salarioTotal/dimL):2:2);
 end;
 
{programa principal}
var
   sal:salarios;
   dimL:integer;
   valorX:real;
begin
   cargarSalarios(sal,dimL);
   writeln('Ingrese cuanto % quiere aumentar el salario: ');
   readln(valorX);
   Aumentito(valorX,sal,dimL);
   promedio(sal,dimL);
end.
