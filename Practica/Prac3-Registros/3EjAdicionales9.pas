{Realizar un programa que lea información de los candidatos ganadores de las últimas elecciones a intendente de
la provincia de Buenos Aires. Para cada candidato se lee: localidad, apellido del candidato, cantidad de votos
obtenidos y cantidad de votantes de la localidad. La lectura finaliza al leer la localidad ‘Zárate’, que debe procesarse.
Informar:
● El intendente que obtuvo la mayor cantidad de votos en la elección.
● El intendente que obtuvo el mayor porcentaje de votos de la elección.}

program Adic9;
type
  candidato=record
    localidad:string;
    apellido:string;
    votos:integer;
    votantes:integer;
  end;
  
procedure leer(var c:candidato);
 begin
   with c do
     begin
       write('Ingrese localidad ');
       readln(localidad);
       write('Ingrese apellido '); 
       readln(apellido);
       write('Ingrese cantidad de votos ');
       readln(votos);
       write('ingrese cantidad de votantes ');
       readln(votantes);
     end;
 end;
   
procedure maximoVotos(num:integer;nombre:string;var max:integer;var nom:string);
 begin
   if (num>max)then begin
     max:=num;
     nom:=nombre;
   end;
 end;

procedure maximoPorcentaje(num:real;nombre:string;var max:real;var nom:string);
 begin
   if (num>max)then begin
     max:=num;
     nom:=nombre;
   end;
 end;

function porcentaje (num,num1:integer):real;
 begin
   porcentaje:= (num/num1*100)
 end;

var
  int:candidato;
  maxPorcentaje:real;
  maxVotos:integer;
  nomPorcentaje,nomVotos:string;
  auxPorcentaje:real;
begin
  maxPorcentaje:=0;
  maxVotos:=0;
  nomVotos:=' ';
  nomPorcentaje:=' ';
  repeat
    leer(int);
    maximoVotos(int.votos,int.apellido,maxVotos,nomVotos);
    auxPorcentaje:= porcentaje(int.votos,int.votantes);
    maximoPorcentaje(auxPorcentaje,int.apellido,maxPorcentaje,nomPorcentaje);
  until (int.localidad='Zarate');
  writeln('El intendente ',nomVotos,' obtuvo la mayor cantidad de votos ',maxVotos);
  writeln('El intendente ',nomPorcentaje,' obtuvo el mayor porcentaje de votos %',maxPorcentaje:2:2);
end.
