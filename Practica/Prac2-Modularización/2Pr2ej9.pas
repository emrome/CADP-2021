{Realizar un programa modularizado que lea información de alumnos de una facultad. Para cada alumno se
lee: nro de inscripción, apellido y nombre. La lectura finaliza cuando se ingresa el alumno con nro de inscripción
1200, que debe procesarse. Se pide calcular e informar:
● Apellido de los dos alumnos con nro de inscripción más chico.
● Nombre de los dos alumnos con nro de inscripción más grande.
● Porcentaje de alumnos con nro de inscripción par.}

program Pr2ej9;
procedure leerDatos(var num:integer;var apellido,nombre:string);
  begin
    write('Ingrese numero de inscripcion: ');
    readln(num);  
    write('Ingrese su apellido: ');
    readln(apellido);
    write('Ingrese su nombre: ');
    readln(nombre);
  end;                {lee los datos del alumno}
  
procedure MaximosMinimos (numero:integer;apellido,nombre:string; var max1,max2,min1,min2:integer;var nom1,nom2,ape1,ape2:string);
  begin
    if(numero<min1)then 
      begin
       min2:=min1;
       min1:=numero;
       ape2:=ape1;
       ape1:=apellido;
     end
    else
      if(numero<min2)then 
        begin
          min2:=numero;
          ape2:=apellido;
        end;                   {calcula minimos}
        
    if(numero>max1)then 
      begin
       max2:=max1;
       max1:=numero;
       nom2:=nom1;
       nom1:=nombre;
     end
    else
      if(numero>max2)then 
        begin
          max2:=numero;
          nom2:=nombre;
        end;                   {calcula maximos}
  end;

procedure numeroPar (numero:integer; var nroPar:integer);  {lee si es par}
  begin
    if (numero MOD 2= 0)then
      nroPar:=nroPar+1;
  end;
{programa principal}
var
  numero,cantPares,alumnosTotales,max1,max2,min1,min2:integer;
  apellido,nombre,nom1,nom2,ape1,ape2:string; 
begin
  cantPares:=0;
  alumnosTotales:=0;
  max1:=0;
  min1:=32767;
  nom1:= ' ';
  ape1:=' ';
  repeat
    leerDatos(numero,apellido,nombre);
    alumnosTotales:=alumnosTotales+1;
    MaximosMinimos(numero,apellido,nombre,max1,max2,min1,min2,nom1,nom2,ape1,ape2);
    numeroPar(numero,cantPares);
  until(numero=1200);
  writeln(ape1,' es el apellido del alumno con el numero de inscripcion mas chico, y le sigue ',ape2);
  writeln(nom1,' es el nombre del alumno con el numero de inscripcion mas grande, y le sigue ',nom2);
  writeln('Hay un %',((cantPares/alumnosTotales)*100):2:2,' de alumnos con numero de inscrpcion par');
end.
