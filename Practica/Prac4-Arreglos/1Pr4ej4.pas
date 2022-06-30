
{a)posicion: dado un número X y el vector de números, retorna la posición del número X en dicho vector,
o el valor -1 en caso de no encontrarse.}
function posicion (vec:vector;numX,dimL:integer):integer;
 var
   pos:integer;
   seguir:boolean; 
 begin
    pos:=1;
    seguir:=true;
    while ((seguir)and (pos<dimL))do
      begin
        if(vec[pos]=numX)then 
           seguir:=false
        else
          pos:=pos+1;
      end;
    if (not seguir)then 
      posicion:=pos
    else
      posicion:=-1;
 end;
 
 {b) intercambio: recibe dos valores x e y (entre 1 y 100) y el vector de números, y retorna el mismo vector
donde se intercambiaron los valores de las posiciones x e y.}
procedure intercambio(var vec:vector;posX,posY:integer);
var
  aux:integer;
begin
  aux:=vec[posX];
  vec[posX]:=vec[posY];
  vec[posY]:=aux;
end;

{c) sumaVector: retorna la suma de todos los elementos del vector.}
function sumaVector(vec:vector):integer;
 var
   i,suma:integer;
 begin
   suma:=0;
   for i:=1 to 100
     suma:=suma+ vec[1];
   sumaVector:=suma;
 end;
          
{d) promedio: devuelve el valor promedio de los elementos del vector.}
function promedio (vec:vector):real;
 var
   i,suma:integer;
 begin
   suma:=0;
   for i:= 1 to 100 
       suma:=suma+vec[i]; // se puede usa function suma:= sumaVector(vec);
   promedio:= suma/100;
 end;

{e) elementoMaximo: retorna la posición del mayor elemento del vector}
function elementoMaximo(vec:vector):integer;
 var
    i,posMax,max:integer;
 begin
    max:=-999;
    for i:= 1 to 100 do
       if (vec[i]>max) then begin
          max:=vec[i];
          posMax:=i;
        end;
    elementoMaximo:=posMax;
 end;   
           
{f) elementoMinimo: retorna la posicion del menor elemento del vector} 
function elementoMinimo(vec:vector):integer;
 var
   i,posMin,min:integer;
 begin
     min:=32767;
     for i:=1 to 100
         if(vec[i]<min)then begin
            min:=vec[i];
            posMin:=i;
         end;
     elementoMinimo:=posMin;
 end;
  
