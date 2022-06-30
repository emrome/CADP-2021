{a. Dado un vector de enteros de a lo sumo 500 valores, realice un módulo que reciba dicho vector y un 
valor n y retorne si n se encuentra en el vector o no. 
b. Modifique el módulo del inciso a. considerando ahora que el vector se encuentra ordenado de manera 
ascendente.}
program Pr4ej1;
const
   dimF=500;
type
   vector=array[1..dimF]of integer;

function estaN(vec:vector;n,dimL:integer):boolean; {Inciso A}
var
   pos:integer;
   si:boolean;
begin
   si:=false;
   pos:=1;
   while((pos<=dimL)and(not si)do 
     begin
       if (vec[pos]=n)then si:=true
       else pos:=pos+1;
     end;
   estaN:= si;
 end;
 
function busqueda(vec:vector;diml,valor:integer):boolean; {Inciso B}
var
  pos:integer;
begin
  pos:=1;
  while ((pos<=dimL)and(vec[pos]<valor))do
    begin
      pos:=pos+1;
    end;
  busqueda:=((pos<=dimL)and (vec[pos]=valor));
end;

function busquedaBinaria(vec:vector;valor,dimL:integer):boolean;
 var
   pri,ult,medio:integer;
   esta:boolean;
 begin
   pri:=1;ult:=dimL;
   medio:= (pri+ult)DIV 2;
   while ((pri<=ult)and(valor<>vec[medio]))then
    begin
       if(valor<vec[medio])then
         ult:=medio-1
       else
         pri:=medio+1;
       medio:=(pri+ult)DIV 2;
    end;
   if((pri<=ult)and(valor=vec[medio]))then
     busquedaBinaria:=true;
 end;
