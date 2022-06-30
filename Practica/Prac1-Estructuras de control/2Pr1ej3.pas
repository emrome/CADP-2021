Program Pr1ej3;
var
  nom:string;
  nota:real;
  aprob,nota7:integer;
begin
  nota7:=0;
  aprob:=0;
  repeat
    writeln('Ingrese nombre: ');
    readln(nom);
    writeln('Ingrese nota: ');
    readln(nota);
    if(nota>=8)then
      aprob:=aprob+1;
    if(nota=7)then
      nota7:=nota7+1;
  until(nom = 'Zidane Zinadine');
  writeln('La cantidad de estudiantes aprobados es ',aprob,'.');
  writeln('La cantidad de estudiantes con nota igual a 7 es ',nota7,'.');
end.
