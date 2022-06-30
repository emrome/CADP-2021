{Realizar un programa que lea información de centros de investigación de Universidades Nacionales. De cada centro se lee su nombre abreviado (ej. LIDI, LIFIA, LINTI), la universidad a la que pertenece, la cantidad de investigadores y la cantidad de becarios que poseen. La información se lee de forma consecutiva por universidad y la lectura finaliza al leer un centro con 0 investigadores, que no debe procesarse. Informar:
● Cantidad total de centros para cada universidad.
● Universidad con mayor cantidad de investigadores en sus centros.
● Los dos centros con menor cantidad de becarios.}

program Pr3ej7;
type
  centro=record
    nombre:string;
    uni:string;
    invest:integer;
    becarios:integer;
  end;
procedure leer(var c:centro);
 begin
   with c do begin
     write('Ingrese nombre del centro ');readln(nombre);
     writeln('Ingrese cantidad de investigadores ');readln(invest);
     if(invest<>0)then begin
       write('Ingrese cantidad de becarios ');readln(becarios); 
       writeln('Ingrese nombre de la Universidad ');readln(uni);
      end;
   end;
 end;
     
procedure minimos(num:integer;nombre:string;var min1,min2:integer;var nom1,nom2:string);
 begin
   if (num<min1)then begin
     min2:=min1;
     min1:=num;
     nom2:=nom1;
     nom1:=nombre
    end
   else if(num<min2)then begin
     min2:=num;
     nom2:=nombre;
    end;
 end;
 
procedure maximo(num:integer;nombre:string;var max:integer;var nom:string);
 begin
   if (num>max)then begin
     max:=num;
     nom:=nombre;
   end;
 end;
 
var
  cent:centro;
  cantBecarios,cantInvest,cantCentros,max,min1,min2:integer;
  auxUni,nomMax,nom1,nom2:string;
begin
  max:=0;
  min1:=9999;
  nomMax:=' ';
  nom1:=' ';
  leer(cent);
  while(cent.invest<>0)do 
    begin
     auxUni:=cent.uni;
     cantInvest:=0;
     cantBecarios:=0;
     cantCentros:=0;
     while ((cent.invest<>0)and(cent.uni=auxUni))do 
       begin
        cantCentros:=cantCentros+1;
        cantInvest:=cantInvest+cent.invest;
        cantBecarios:=cantBecarios+cent.becarios;
        minimos(cantBecarios,cent.nombre,min1,min2,nom1,nom2);
        leer(cent);
       end;
     maximo(cantInvest,auxUni,max,nomMax);
     writeln('La Universidad ',auxUni,' tiene ',cantCentros,' centros de investigacion');
    end;
  writeln('La universidad ',nomMax,' tiene la mayor cantidad de investigadores: ',max);
  writeln(nom1,' tiene la menor cantidad de becarios: ',min1,' y le sigue el centro ',nom2,'con ',min2);
end.
