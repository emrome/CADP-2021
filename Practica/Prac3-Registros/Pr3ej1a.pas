{Completar el programa principal para que lea información de alumnos (código, nombre, promedio) e informe
la cantidad de alumnos leídos. La lectura finaliza cuando ingresa un alumno con código 0, que no debe
procesarse. Nota: utilizar el módulo leer.}
program Pr3ej1a;
type
  str20 = string[20];
  alumno = record
    codigo : integer;
    nombre : str20;
    promedio : real;
  end;
procedure leer(var alu : alumno);
 begin
   writeln('Ingrese el codigo del alumno');
   readln(alu.codigo);
   if (alu.codigo <> 0) then
    begin
     writeln('Ingrese el nombre del alumno'); 
     read(alu.nombre);
     writeln('Ingrese el promedio del alumno'); 
     readln(alu.promedio);
   end;
  end;
var
  a:alumno;
  cant:integer;
begin
  cant:=0;
  leer(a);
  while (a.codigo<>0)do
    begin
      cant:=cant+1;
      leer(a);
    end;
  writeln('La cantidad de alumnos leidos fue ',cant);
end.
