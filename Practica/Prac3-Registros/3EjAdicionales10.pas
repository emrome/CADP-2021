{Un centro de investigación de la UNLP está organizando la información de las 320 especies de plantas con las
que trabajan. Para cada especie se ingresa su nombre científico, tiempo promedio de vida (en meses), tipo de
planta (por ej. árbol, conífera, arbusto, helecho, musgo, etc.), clima (templado, continental, subtropical, desértico,
etc.) y países en el mundo donde se las encuentra. La información de las plantas se ingresa ordenada por tipo de
planta y, para cada planta, la lectura de países donde se las encuentra finaliza al ingresar el país 'zzz'. Al finalizar la
lectura, informar:
● El tipo de planta con menor cantidad de plantas.
● El tiempo promedio de vida de las plantas de cada tipo.
● El nombre científico de las dos plantas más longevas.
● Los nombres de las plantas nativas de Argentina que se encuentran en regiones con clima subtropical.
● El nombre de la planta que se encuentra en más países.}

program Adic10;
type
  planta=record
    nombre:string;
    vida:integer;
    tipo:string;
    clima:string;
    paises:string;
    cant:integer;
  end;
  
procedure leerPlanta (var p:planta);
 begin
   with p do begin
     cant:=0;
     writeln('Ingrese nombre de la planta ');readln(nombre);
     writeln('Ingrese tiempo de vida ');readln(vida);
     writeln('Ingrese tipo de planta ');readln(tipo);
     writeln('Ingrese clima ');readln(clima);
     writeln('Ingrese un pais donde se encuentra ');readln(paises);
     while (paises<>'zzz')do begin
       cant:=cant+1;
       if((paises='Argentina')and (clima='subtropical'))then
         writeln('La planta ',nombre,' es nativa de Argentina y se encuentra en regiones con clima subtropical.');
         writeln('Ingrese un pais donde se encuentra ');readln(paises);
         
      end;
    end;
 end;
 
procedure minimo (num:integer;nombre:string;var min:integer;var nom:string);
 begin
   if (num<min)then begin
     min:=num;
     nom:=nombre;
   end;
 end;
procedure maximo(num:integer;nombre:string;var max:integer;var nom:string);
 begin
   if (num>max)then begin
     max:=num;
     nom:=nombre;
   end;
 end;
procedure maximos(num:integer;nombre:string; var max1,max2:integer;var nom1,nom2:string);
begin
  if (num>max1)then begin
    max2:=max1;
    max1:=num;
    nom2:=nom1;
    nom1:=nombre;
   end
  else
   if (num>max2)then begin
     max2:=num;
     nom2:=nombre;
   end;
 end;
 
function promedio(cant,num:integer):real;
 begin
   promedio:= num/cant;
 end;
 
var
  plant:planta;
  maxVida1,maxVida2,maxPaises,minTipo,vidaTotal,cantTipo,totalPlantas:integer;
  nomVida1,nomVida2,nomPaises,nomTipo,auxTipo:string;
begin
  maxVida1:=0;
  nomVida1:=' ';
  maxPaises:=0;
  nomPaises:=' ';
  minTipo:=0;
  nomTipo:=' ';
  totalPlantas:=0;
  leerPlanta(plant);
  repeat
      auxTipo:=plant.tipo;
      cantTipo:=0;
      vidaTotal:=0;
      while((auxTipo=plant.tipo)and(totalPlantas<3))do
        begin
          totalPlantas:=totalPlantas+1;
          cantTipo:=cantTipo+1;
          vidaTotal:=vidaTotal+plant.vida;
          maximo(plant.cant,plant.nombre,maxPaises,nomPaises); {maximo cantidad de paises}
          maximos(plant.vida,plant.nombre,maxVida1,maxVida2,nomVida1,nomVida2); {dos plantas mas longevas}
          leerPlanta(plant);
        end;
      writeln(totalPlantas);
      minimo(cantTipo,auxTipo,minTipo,nomTipo);{tipo de planta con menor cantidad plantas}
      writeln('El tiempo promedio de las plantas del tipo ',auxTipo,' es ',promedio(cantTipo,vidaTotal):2:2);
  until(totalPlantas=3);
  writeln('El nombre de la planta que se encuentra en más países es ',nomPaises);
  writeln(nomVida1,'es la planta mas longeva, y le sigue ',nomVida2);
  writeln('El tipo ',nomTipo,' tiene la menor cantidad de plantas.');
end.
