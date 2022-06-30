{Realice un programa que resuelva los siguientes incisos:
a. Lea nombres de alumnos y los almacene en un vector de a lo sumo 500 elementos. La lectura finaliza cuando se lee el nombre ‘ZZZ’, que no debe procesarse.
b. Lea un nombre y elimine la primera ocurrencia de dicho nombre en el vector.
c. Lea un nombre y lo inserte en la posición 4 del vector.
d. Lea un nombre y lo agregue al vector.
Nota: Realizar todas las validaciones necesarias.}

program Pr4ej2;
const
   dimF=500;
type
   alumnos=array[1..dimF]of string;

procedure cargarNombres(var al:alumnos;var dimL:integer);{Inciso A}
 var
    nom:string;
 begin
   writeln('Ingrese nombre ');
   readln(nom);
   dimL:=0;
   while ((dimL<dimF)and(nom<>'ZZZ'))do begin
     dimL:=dimL+1;
     al[dimL]:=nom;
     writeln('Ingrese nombre ');
     readln(nom);
   end;
 end;
 
procedure eliminarNom(var al:alumnos;var dimL:integer;nombre:string;var pude:boolean);{Inciso B}
 var
   pos:integer;
   i:integer;
 begin
   pude:=false;
   pos:=1;
   while(nombre<>al[pos])do 
      begin
       pos:=pos+1;
      end;
   if(nombre=al[pos])then 
     begin
       for i:=pos to (dimL-1)do
         al[pos]:=al[pos+1];
       pude:=true;
       dimL:=dimL-1;
     end;
end;

procedure insertarNom(var al:alumnos;var dimL:integer;pos:integer;nombre:string;var pude:boolean);{Inciso C} 
//podria poner de variables nombre y posiscion 
 var
   i:integer;
 begin
   if ((dimL+1<=dimF)and ((pos>=1) and (pos<=dimL)))then begin
     for i:= dimL downto pos do 
       al[i+1]:=al[i];
     pude:=true;
     al[pos]:=nombre;
     dimL:=dimL+1;
    end;
 end;

procedure agregarNom(var al:alumnos;var dimL:integer;var pude:boolean;nombre:string);
begin
  pude:=false;
  if(dimL+1<=dimF)then 
    begin
     dimL:=dimL+1;
     al[dimL]:=nombre;
     pude:=true;
    end;
end;
procedure recorreAlumnos (var al:alumnos;var dimL:integer);
  var
    nombre:string;
    pude:boolean;
  begin
    writeln('Ingrese nombre a eliminar');readln(nombre);
    eliminarNom(al,dimL,nombre,pude);
    writeln('ingrese nombre a insertar');readln(nombre);
    insertarNom(al,dimL,4,nombre,pude);
    writeln('Ingrese nombre a agregar');readln(nombre);
    agregarNom(al,dimL,pude,nombre);
  end;
{programa principal}
var
  vecAlumnos:alumnos;
  dimL,i:integer;
begin
   cargarNombres(vecAlumnos,dimL);
   recorreAlumnos(vecAlumnos,dimL);
   for i:= 1 to dimL do 
     writeln('Pos ',i,' nombre: ',vecAlumnos[i]);
end.
