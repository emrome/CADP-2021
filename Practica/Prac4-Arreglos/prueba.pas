program Pr4ej4;
const
   dimF=6;
type
   alumno=record
     nro:integer;
     apellido:string;
     nombre:string;
     asistencias:integer;
   end;
   alumnos=array[1..dimF] of alumno;
//procedure leerAlumno(var al:alumno)//SE DISPONE
procedure cargarAlumnos(var al:alumnos;var dimL:integer); //SE DISPONE
 var
   alum:alumno;
 begin
   dimL:=0;
   writeln('Ingrese nro ');readln(alum.nro);
   writeln('Ingrese nombre');readln(alum.nombre);
   writeln('Ingrese apellido');readln(alum.apellido);
   writeln('Ingrese asistencias');readln(alum.asistencias);
   while ((dimL<dimF)and (alum.nro<>0))do begin
     dimL:=dimL+1;
     al[dimL]:=alum;
     writeln('Ingrese nro ');readln(alum.nro);
     writeln('Ingrese nombre');readln(alum.nombre);
     writeln('Ingrese apellido');readln(alum.apellido);
     writeln('Ingrese asistencias');readln(alum.asistencias);
    end;
 end;
{Inciso a}
function posicion(al:alumnos;dimL:integer;num:integer):integer; //function posicion(al:alumnos;dimL:integer;num:integer):integer;
 var                                                          
   pos:integer;
 begin                                                          
   pos:=1;
   while ((pos<=dimL)and(al[pos].nro<num))do begin
      pos:=pos+1
    end;
   if ((pos<=dimL) and (al[pos].nro=num))then posicion:=pos;
 end;

 
{Inciso b}
procedure insertarAlumno(var al:alumnos;var dimL:integer;nuevoAl:alumno;pos:integer;var exito:boolean);
 var
   i:integer;
 begin
   exito:=false;
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
function posElem(al:alumnos;dimL:integer;num:integer):integer;
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
 end;
 
procedure eliminarElem(var al:alumnos;var dimL:integer;elem:integer;var exito:boolean);
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
 end;
 
{inciso e}
function pos0Asist(al:alumnos;dimL:integer;num:integer):integer;
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
 end;

procedure eliminar0asist(var al:alumnos;var dimL:integer;var exito:boolean;asistencia:integer);
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
 end;
 
procedure leerAL(var nuevoAlumno:alumno);
 begin
  writeln('Ingrese nro ');readln(nuevoAlumno.nro);
  writeln('Ingrese nombre');readln(nuevoAlumno.nombre);
  writeln('Ingrese apellido');readln(nuevoAlumno.apellido);
  writeln('Ingrese asistencias');readln(nuevoAlumno.asistencias);
 end;

{programa principal}
var
  al:alumnos;
  dimL:integer;
  exito:boolean;
  posAlumno,nroAlumno:integer; {variables a}
  
  nuevoAlumno:alumno;posAlNuevo:integer;{variables b}
  
  posEliminar:integer;{variables c}
  nroAlumEliminar:integer;{variables d}
begin
  cargarAlumnos(al,dimL);
  
  writeln('Ingrese nro de alumno que quiera saber posicion ');readln(nroAlumno);
  posAlumno:=posicion(al,diml,nroAlumno);
  writeln('La posicion del alumno ', nroAlumno,' es ',posAlumno); 
  
  writeln('Ingrese posicion donde quiera insertar alumno');readln(posAlNuevo);
  leerAL(nuevoAlumno);
  insertarAlumno(al,dimL,nuevoAlumno,posAlNuevo,exito);
  
  writeln('Ingrese posicion a eliminar');readln(posEliminar);
  eliminarPos(al,dimL,posEliminar,exito);

  writeln('Ingrese nro de alumno a eliminar');readln(nroAlumEliminar);
  eliminarElem(al,dimL,nroAlumEliminar,exito);

  eliminar0asist(al,dimL,exito,0);
end.
