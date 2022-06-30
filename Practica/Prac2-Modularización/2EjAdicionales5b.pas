program Adic5b;
procedure lecturaNotas (nota:integer;var evCon0,aprobadas,presente,evCon10,notaTotal:integer);                  {lee las notas}
 begin //para subir las notas
     if (nota=-1)then
       nota:=0
     else 
       if (nota=0) then
         evCon0:=evCon0+1
       else 
         if(nota>=4)then
           begin
             aprobadas:=aprobadas+1;
             presente:=presente+1;
             if (nota=10)then
             evCon10:=evCon10+1;
           end;
     notaTotal:=notaTotal+nota;
 end;
procedure MaximosCero (evCon0,legajo:integer;var maxCero2,maxCero1,alCero2,alCero1:integer);
 begin
  if(evCon0>maxCero1)then {cálculo de alumnos con mas evaluaciones con 0}
    begin
      maxCero2:=maxCero1;
      maxCero1:=evCon0;
      alCero2:=alCero1;
      alCero1:=legajo;
    end
  else  
    if (evCon0>maxCero2)then
      begin
        maxCero2:=evCon0;
        alCero2:=legajo;
      end;
 end;
procedure MaximosDiez (evCon10,legajo:integer; var maxDiez1,maxDiez2,alDiez1,alDiez2:integer);
 begin                                           {calculo alumnos con mas evalucaiones 10}
   if (evCon10>maxDiez1)then  
     begin
       maxDiez2:=maxDiez1;
       maxDiez1:=evCon10;
       alDiez2:=alDiez1;
       alDiez1:=legajo;
     end
   else
     if (evCon10>maxDiez2)then
       begin
         maxDiez2:=evCon10;
         alDiez2:=legajo;
       end;
 end;

procedure Ingresantes(presente:integer; var totales,parcial:integer);
 begin
  totales:=totales+1;
  if (presente>3)then
    parcial:=parcial+1;
 end;  
procedure Recursantes (presente:integer; var totales,parcial:integer);
 begin
  totales:=totales+1;
  if (presente>3)then
    parcial:=parcial+1;
 end;  

 {programa principal}
var
 condicion:char;
 i,legajo,nota,evCon0,evCon10,maxCero1,maxCero2,maxDiez1,maxDiez2,ingresantesTotales,recursantesTotales,ingParcial,recParcial,aprobadas,alTodasAprob,AlumnosCero,promMayorSeis5,alCero1,alCero2,alDiez1,alDiez2,presente,notaTotal:integer;
 notaPromedio:real;
begin
  MaxCero1:=-1;MaxDiez1:=-1;alCero1:=-1; alDiez1:=-1; 
  ingresantesTotales:=0;recursantesTotales:=0;ingParcial:=0;recParcial:=0;alTodasAprob:=0;promMayorSeis5:=0;AlumnosCero:=0;
  
  write('Ingrese legajo: ');
  readln(legajo);
  
  while(legajo<>-1)do
     begin
       aprobadas:=0;evCon0:=0;evCon10:=0;presente:=0;notaTotal:=0;
       write('Ingrese condicion: ');
       readln(condicion);
       for i:=1 to 5 do 
         begin
          write('Ingrese nota de la autoevaluaciones ',i,' : ');
          readln(nota); 
          lecturaNotas(nota,evCon0,aprobadas,presente,evCon10,notaTotal);
         end;
         
       if (evCon0 >= 1) then {despues de tomar todas las notas evalua lo siguiente}
          AlumnosCero:=AlumnosCero+1;
          
       if (aprobadas=5)then
          alTodasAprob:=alTodasAprob+1;
          
       notaPromedio:=notaTotal/5;
       
       if (notaPromedio>6.5)then
          promMayorSeis5:=promMayorSeis5+1;
          
       MaximosCero(evCon0,legajo,MaxCero2,MaxCero1,alCero2,alCero1); {actualiza alumnos con evaluaciones en 0}
      
       MaximosDiez(evCon10,legajo,maxDiez1,maxDiez2,alDiez1,alDiez2); {actualiza alumnos con evaluaciones con 10}
       
       if ((condicion='i')or(condicion='I'))then 
         Ingresantes (presente,ingresantesTotales,ingParcial)
       else
         if ((condicion='r')or(condicion='R'))then 
           Recursantes(presente,recursantesTotales, recParcial);

       write('Ingrese legajo: ');
       readln(legajo);
     end; 

   writeln('Son ', ingParcial,' los alumnos ingresantes en condiciones de rendir el parcial y el promedio es de % ',((ingParcial*100)/ingresantesTotales):0:1);
   writeln('Son ', recParcial,' los alumnos recursantes en condiciones de rendir el parcial y el promedio es de % ',((recParcial*100)/recursantesTotales):0:1);   
   writeln('Son ',alTodasAprob,' los alumnos con todas las autoevaluaciones aprobadas');
   writeln('Son ',promMayorSeis5,' los alumnos cuya nota promedio fue mayor a 6.5');
   writeln('Son ',AlumnosCero,' los alumnos con al menos una evaluacion con 0 puntos');
   writeln('El alumno ',alDiez1,' tuvo la mayor cantidad de autoevaluacion con diez puntos, y el segundo alumno con mayor cantidad de diez fue ',alDiez2);
   writeln('El alumno ',alCero1,' tuvo la mayor cantidad de autoevaluacion con cero puntos, y el segundo alumno con mayor cantidad de cero fue ',alCero2);
end.
