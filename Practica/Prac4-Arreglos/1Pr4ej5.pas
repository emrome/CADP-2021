{5. Utilizando los módulos implementados en el ejercicio 4, realizar un programa que lea números enteros desde teclado (a lo sumo 100) y los almacene en un vector. La carga finaliza al leer el número 0. Al finalizar la carga, se debe intercambiar la posición del mayor elemento por la del menor elemento, e informe la operación realizada de la siguiente manera: “El elemento máximo ... que se encontraba en la posición ... fue intercambiado con el elemento mínimo ... que se encontraba en la posición ...”.}
program Pr4ej5;
const
   dimF=100;
type
    vector=array[1..dimF]of integer;
    
procedure cargarVector(var v:vector;var dimL : integer);
 var
    num:integer;
 begin
    readln(num);
    while ((num<>0)and(dimL<dimF))do 
      begin
        dimL:=dimL+1;
        v[dimL]:=num;
        readln(num);
      end;
 end;

procedure intercambio(var vec:vector;posX,posY:integer);
var
  aux:integer;
begin
  aux:=vec[posX];
  vec[posX]:=vec[posY];
  vec[posY]:=aux;
end;


function elementoMaximo(vec:vector;dimL:integer):integer;{e) elementoMaximo: retorna la posición del mayor elemento del vector}
 var
    i,posMax,max:integer;
 begin
    max:=-999;
    for i:= 1 to dimL do
       if (vec[i]>max) then begin
          max:=vec[i];
          posMax:=i;
        end;
    elementoMaximo:=posMax;
 end;           

function elementoMinimo(vec:vector;dimL:integer):integer;{f) elementoMinimo: retorna la posicion del menor elemento del vector} 
 var
   i,posMin,min:integer;
 begin
     min:=32767;
     for i:=1 to dimL do
         if(vec[i]<min)then begin
            min:=vec[i];
            posMin:=i;
         end;
     elementoMinimo:=posMin;
 end;

var
  vec:vector;
  posMax,posMin,dimL:integer;
begin
  cargarVector(vec,dimL);
  posMax:= elementoMaximo(vec,dimL);
  posMin:= elementoMinimo(vec,dimL);
  intercambio(vec,posMax,posMin);
  writeln('El elemento maximo ',vec[posMin],' que se encontraba en la posicion ',posMax,' fue intercambiado con el elemento minimo ',vec[posMax],' que se encontraba en la posicion ',posMin);
end.
