program Pr3ej3b;
type
  escuela=record
    cue:integer;
    nombre:string;
    cantDoc:integer;
    cantAl:integer;
    localidad:string;
  end;

procedure leer(var e:escuela);   {parte A del ejercicio}
 begin
   with e do
     begin
       writeln('Ingrese CUE de la escuela ');
       readln(cue);
       writeln('Ingrese nombre de la escuela ');
       readln(nombre);
       writeln('Ingrese la cantidad de docentes de la escuela ');
       readln(cantDoc);
       writeln('Ingrese la cantidad de alumnos de la escuela ');
       readln(cantAl);
       writeln('Ingrese localidad de la escuela ');
       readln(localidad);
     end;
  end;

procedure alumnosPorDocente(docentes,alumnos:integer;var cociente:real);
 begin          {parte B del ejercicio}
   cociente:= alumnos/docentes;
   writeln('La relacion es: 1 docente cada ',cociente:2:2,' alumnos');
 end;
 
procedure minimos (num:real;nom:string;cue:integer; var min1,min2:real; var nomMin1,nomMin2:string; var cueMin1,cueMin2:integer);
 begin
   if (num<min1)then
     begin
       min2:=min1;
       min1:=num;
       nomMin2:=nomMin1;
       nomMin1:=nom;
       cueMin2:=cueMin1;
       cueMin1:=cue;
     end
   else
     if(num<min2) then
       begin
         min2:=num;
         nomMin2:=nom;
         cueMin2:=cue; 
       end;
 end;
 
function esLaPlata (nom:string):boolean;
 begin
   esLaPlata:= (nom= 'La Plata');
 end;
 
function superiorUNESCO(num:real):boolean;
 begin
   superiorUNESCO:= (num>23.435);
 end;
 
var
  esc:escuela;
  min1,min2,relacion:real;
  LaPlataSup,i,cueMin1,cueMin2:integer;
  nomMin1,nomMin2:string;
begin
  min1:=999;
  cueMin1:=0;
  nomMin1:=' ';
  LaPlataSup:=0;
  for i:= 1 to 3 do
    begin
      leer(esc);
      relacionUnesco:=0;
      alumnosPorDocente(esc.cantDoc,esc.cantAl,relacion);
      if((esLaPlata(esc.localidad)) and (superiorUNESCO(relacion)))then 
          LaPlataSup:=LaPlataSup + 1;    
      minimos(relacion,esc.nombre,esc.cue,min1,min2,nomMin1,nomMin2,cueMin1,cueMin2);
    end;
  writeln('Cantidad de escuelas de La Plata con una relacion de alumnos por docente superior a la sugerida por UNESCO: ',LaPlataSup);
  writeln('CUE: ',cueMin1,', nombre: ',nomMin1,' es la escuela con mejor relacion entre docentes y alumnos. La segunda es ',nomMin2,', CUE: ',cueMin2,'.');
end.
