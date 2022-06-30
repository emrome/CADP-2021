{Una cátedra dispone de información de sus alumnos (a lo sumo 1000). De cada alumno se conoce nro de alumno, apellido y nombre y cantidad de asistencias a clase. Dicha información se encuentra ordenada por nro de alumno de manera ascendente. Se pide:
a. Un módulo que retorne la posición del alumno con un nro de alumno recibido por parámetro. El alumno seguro existe.
b. Un módulo que reciba un alumno y lo inserte en el vector.
c. Un módulo que reciba la posición de un alumno dentro del vector y lo elimine. 
d. Un módulo que reciba un nro de alumno y elimine dicho alumno del vector
e. Un módulo que elimine del vector todos los alumnos con cantidad de asistencias en 0.
Nota: Realizar el programa principal que invoque los módulos desarrollados en los incisos previos con 
datos leídos de teclado}

program Pr4ej4;
const
   dimF=1000;
type
   alumno=record
     nro:integer;
     apellido:string;
     nombre:string;
     asistencias:integer;
   end;
   alumnos=array[1..dimF] of alumno;//SE DISPONE

procedure leerAlumno(var al:alumno);//SE DISPONE
procedure cargarAlumnos(var al:alumnos;var dimL:integer); //SE DISPONE
 
 
{Inciso a}
{function posicion(al:alumnos;dimL:integer;num:integer):integer;
 var                                                     
   pri,ult,medio:integer;                                 
 begin                                                     
   pri:=1;ult:=dimL;medio:=(pri+ult) DIV 2;                 
   while((pri<=ult)and(al[medio].nro<>num))do begin          
      if (al[medio].nro < num)then ult:=medio-1           
      else pri:=medio+1;                                      
      medio:= (pri+ult) DIV 2;                                  
    end;           
   if(al[medio].nro=num) then posicion:=medio; 
  end;                                             
   //no se si puedo sacar pri y ult}
   
function posicion(al:alumnos;dimL:integer;num:integer):integer; //function posicion(al:alumnos;dimL:integer;num:integer):integer;
 var                                                          
   pos:integer;
 begin                                                          
   pos:=1;
   while ((pos<=dimL)and (al[pos].nro<num))do 
      pos:=pos+1;
   if ((pos<=dimL) and (al[pos].nro=num))then posicion:=pos;
   {else
      posicion:=0;}
 end;

 
{Inciso b}
procedure insertarAlumno(var al:alumnos;var dimL:integer;nuevoAl:alumno;var exito:boolean);
 var
   i,pos:integer;
 begin
   exito:=false;
   pos:=posicion(al,dimL,nuevoAl.nro);
   if((dimL+1<=dimF)and((pos>=1)and (pos<=dimL)))then
     begin
       for i:= dimL downto pos do
          al[i+1]:=al[i];
       al[pos]:=nuevoAl;
       dimL:=dimL+1;
       exito:=true;
     end;
 end;
 
 {Inciso c}
procedure eliminarPos(var al:alumnos;var dimL:integer;pos:integer;var exito:boolean);
 var
   i:integer;
 begin
   exito:=false;
   if((pos>=1)and (pos<=dimL))then
     begin
       for i:= pos to dimL-1 do
         al[i]:=al[i+1];
       dimL:=dimL-1;
       exito:=true;
     end;
 end;

{modulos para incisos  d }
{function posElem(al:alumnos;dimL:integer;num:integer):integer;
 var
   pos:integer;
   exito:boolean;
 begin
   pos:=1;exito:=false;
   while ((pos<=dimL)and(not exito))do
     begin
       if (al[pos].nro=num)then exito:=true
       else pos:=pos+1;
     end;
   if(not exito)then pos:=0;
   posElem:=pos;
 end;}
 
{procedure eliminarElem(var al:alumnos;var dimL:integer;elem:integer;var exito:boolean);
 var
   i,pos:integer;
 begin
   pos:=posElem(al,dimL,elem);
   if (pos<>0)then
     begin
       exito:=true;
       for i:=pos to dimL-1 do
         al[i]:=al[i+1];
       dimL:=-1;
     end;
 end;}
 procedure eliminarElem(var al:alumnos;var dimL:integer;elem:integer;var exito:boolean);
 begin
   eliminarPos(al,dimL,posicion(al,dimL,elem),exito);
 end;
 
{inciso e}
{function pos0Asist(al:alumnos;dimL:integer;num:integer):integer;
 var
   pos:integer;
   exito:boolean;
 begin
   pos:=1;exito:=false;
   while ((pos<=dimL)and(not exito))do
     begin
       if (al[pos].asistencias=num)then exito:=true
       else pos:=pos+1;
     end;
   if(not exito)then pos:=0;
   pos0Asist:=pos;
 end;}

{procedure eliminar0asist(var al:alumnos;var dimL:integer;var exito:boolean;asistencia:integer);
 var
   pos:integer;
 begin
   pos:=pos0Asist(al,dimL,asistencia);
   while (pos<>0)do 
     begin
        eliminarPos(al,dimL,pos,exito);
        exito:=true;
        pos:=pos0Asist(al,dimL,asistencia); 
    end;
 end;}
procedure eliminar0asist(var al:alumnos;var dimL:integer;num:integer;var exito:boolean);
 var 
    i:integer;
 begin
    i:=1;
    while (i<dimL) do begin
        if(al[i].asistencias=0)then
          eliminarPos(al,dimL,i,exito);
        i:=i+1;
     end;
 end; 
procedure leerAL(var nuevoAlumno:alumno);
begin
  writeln('Ingrese nro ');readln(nuevoAlumno.nro);
  writeln('Ingrese nombre');readln(nuevoAlumno.nombre);
  writeln('Ingrese apellido');readln(nuevoAlumno.apellido);
  writeln('Ingrese asistencias');readln(nuevoAlumno.asistencias);
end;

PROCEDURE imprimirAl(al:alumnos;dimL:integer);
 var
   i:integer;
 begin
   for i:= 1 to dimL do  //PARA PROBAR
     writeln('posicion',i, 'nro ',al[i].nro,'nombre ',al[i].nombre,'apellido ',al[i].apellido,'asis ',al[i].asistencias);
 end;
{programa principal}
var
  al:alumnos;//SE DISPONE
  dimL:integer;//SE DISPONE
  exito:boolean;
  posAlumno,nroAlumno:integer; {variables a}
  
  nuevoAlumno:alumno;{variables b}
  
  posEliminar:integer;{variables c}
  nroAlumEliminar:integer;{variables d}
begin

  writeln('Ingrese nro de alumno que quiera saber posicion ');readln(nroAlumno);
  posAlumno:=posicion(al,diml,nroAlumno);
  writeln('La posicion del alumno ', nroAlumno,' es ',posAlumno); //
  
  leerAL(nuevoAlumno);
  insertarAlumno(al,dimL,nuevoAlumno,exito);
  

  
  writeln('Ingrese posicion a eliminar');readln(posEliminar);
  eliminarPos(al,dimL,posEliminar,exito);

  
  writeln('Ingrese nro de alumno a eliminar');readln(nroAlumEliminar);
  eliminarElem(al,dimL,nroAlumEliminar,exito);

  
  eliminar0asist(al,dimL,0,exito);
  
  writeln('Vector final');
  imprimirAl(al,dimL);
end.
