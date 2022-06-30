Program Adi2;
var
 condicion:char;
 i,legajo,nota,evCon0,evCon10,maxCero1,maxCero2,maxDiez1,maxDiez2,ingresantesTotales,recursantesTotales,ingParcial,recParcial,aprobadas,alTodasAprob,AlumnosCero,promMayorSeis5,alCero1,alCero2,alDiez1,alDiez2,presente,notaTotal:integer;
 notaPromedio:real;
begin
  maxCero1:=-1;maxDiez1:=-1;alCero1:=-1; alDiez1:=-1; 
  ingresantesTotales:=0;recursantesTotales:=0;ingParcial:=0;recParcial:=0;alTodasAprob:=0;promMayorSeis5:=0;AlumnosCero:=0;
  
  write('Ingrese legajo: ');
  readln(legajo);

  while(legajo<>-1)do
     begin
       aprobadas:=0;evCon0:=0;evCon10:=0;presente:=0;notaTotal:=0;
       write('Ingrese condicion: '); {Preguntar porque no me lee la condicion}
       readln(condicion);
       
       for i:=1 to 5 do begin //para subir las notas
		  write('Ingrese nota de la autoevaluaciones ',i,' : ');
		  readln(nota); 
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
         
       if (evCon0 >= 1) then {despues de tomar todas las notas evalua lo siguiente}
          AlumnosCero:=AlumnosCero+1;
          
       if (aprobadas=5)then
          alTodasAprob:=alTodasAprob+1;
          
       notaPromedio:=notaTotal/5;
       
       if (notaPromedio>6.5)then
          promMayorSeis5:=promMayorSeis5+1;
          
       if(evCon0>maxCero1)then {cálculo de evalucaiones con 0}
          begin
            maxCero2:=maxCero1;
            maxCero1:=evCon0;
            alCero2:=alCero1;
            alCero1:=legajo;
          end
       else  
          if ((evCon0>maxCero2)and(evCon0<maxCero1))then
            begin
               maxCero2:=evCon0;
               alCero2:=legajo;
            end;
       if (evCon10>maxDiez1)then   {cálculo evaluaciones con 10}
           begin
              maxDiez2:=maxDiez1;
              maxDiez1:=evCon10;
              alDiez2:=alDiez1;
              alDiez1:=legajo;
           end
         else
           if ((evCon10>maxDiez2)and(evCon10<=maxDiez1))then
              begin
                 maxDiez2:=evCon10;
                 alDiez2:=legajo;
              end;
       if ((condicion='i')or(condicion='I'))then begin
          ingresantesTotales:=ingresantesTotales+1;
          if (presente>3)then
             ingParcial:=ingParcial+1
         end
       else
         if ((condicion='r')or(condicion='R'))then begin
           recursantesTotales:=recursantesTotales+1;
           if (presente>3)then
              recParcial:=recParcial+1;  
          end;
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
