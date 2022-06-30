program Pr4ej3;
const
    dimF=100 ;
type
    vector=array[1..dimF] of integer;
    
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
     
procedure imprimirVecPriPos(vec:vector;dimL:integer); {a) Realizar un módulo que imprima el vector desde la primera posición hasta la última}
 var
    i:integer; 
 begin
    for i:=1 to dimL do
      writeln('El valor de la posicion ',i,' es ',vec[i]);
 end;
 
procedure imprimirVecUltPos(vec:vector;dimL:integer);
 var
   i:integer;
 begin
   for i:=dimL downto 1 do
     writeln('El valor de la posicion ',i,' es ',vec[i]);
 end;

 procedure mitadVector(vec:vector;dimL:integer);{c)Realizar un módulo que imprima el vector desde la mitad (dimL DIV 2) hacia la primera posición, y desde la mitad más uno hacia la última posición.}
 var
  i:integer;
  mitad:integer;
 begin
       mitad:= dimL div 2;
       writeln('vector desde la mitad hacia la primera posicion');
       for i:=mitad downto 1 do
          writeln('El valor de la posicion ',i,' es ',vec[i]);
       writeln('Vector desde la mitad mas uno hacia la ultima posicion');
       for i:=(mitad+1) to dimL do
          writeln('El valor de la posicion ',i,' es ',vec[i]);
 end;
 
procedure desdeXaY(vec:vector;numX,numY:integer); {d)Realizar un módulo que reciba el vector, una posición X y otra posición Y, e imprima el vector desde la posición X hasta la Y. Asuma que tanto X como Y son menores o igual a la dimensión lógica. Y considere que, dependiendo de los valores de X e Y, podría ser necesario recorrer hacia adelante o hacia atrás}
 var
   i:integer;
 begin
   if (numX>numY) then
     for i:=numX downto numY do
        writeln('El valor de la posicion ',i,' es ',vec[i])
   else
     for i:=numX to numY do
        writeln('El valor de la posicion ',i,' es ',vec[i]);
 end;

var
  vdatos:vector;
  dimL,numX,numY:integer;
begin
    dimL:=0;
    cargarVector(vdatos,dimL);
    writeln('dimL=',dimL);
    imprimirVecPriPos(vdatos,dimL);
    writeln('Ahora los valores son desde la ultima posicion a la primera');
    imprimirVecUltPos(vdatos,dimL);
    mitadVector(vdatos,dimL);
    writeln('Ingrese numero x');
    readln(numX);
    writeln('Ingrese numero y');
    readln(numY);
    desdeXaY(vdatos,numX,numY);
end.
    
    

