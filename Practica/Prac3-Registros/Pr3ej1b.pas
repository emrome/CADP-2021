{Completar el programa principal para que lea información de alumnos (código, nombre, promedio) e informe
la cantidad de alumnos leídos. La lectura finaliza cuando ingresa un alumno con código 0, que no debe
procesarse. Nota: utilizar el módulo leer.
b. Modificar al programa anterior para que, al finalizar la lectura de todos los alumnos, se informe también el
nombre del alumno con mejor promedio.}
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
   writeln('Ingrese el codigo del alumno ');
   read(alu.codigo);
   if (alu.codigo <> 0) then
    begin
     writeln('Ingrese el nombre del alumno '); 
     read(alu.nombre);
     writeln('Ingrese el promedio del alumno '); 
     readln(alu.promedio);
   end;
 end;
 
procedure maximos (num:real;nombre:str20;var max:real;var nomMax:str20);
 begin
   if (num>max)then
    begin
      max:=num;
      nomMax:=nombre;
    end;
 end;

var
  a:alumno;
  cant:integer;
  max:real;
  nomMax:str20;
begin
  max:=-1;
  nomMax:=' ';
  cant:=0;
  leer(a);
  while (a.codigo<>0)do
    begin
      cant:=cant+1;
      maximos(a.promedio,a.nombre,max,nomMax);
      leer(a);
    end;
  writeln('La cantidad de alumnos leidos fue ',cant);
  writeln('El alumno ',nomMax, 'es el de mejor promedio');
end.
