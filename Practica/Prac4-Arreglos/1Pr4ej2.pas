program Vectores;
const
  cant_datos = 150;
type
    vdatos = array[1..cant_datos] of real;
    
procedure cargarVector(var v:vdatos;var dimL : integer); {debe leer números reales y almacenarlos en el vector que se pasa como
parámetro. Al finalizar, debe retornar el vector y su dimensión lógica. La lectura finaliza cuando se ingresa
el valor 0 (que no debe procesarse) o cuando el vector está completo}
 var
    num:real;
 begin
    readln(num);
    while ((num<>0)and(dimL<cant_datos))do 
      begin
        dimL:=dimL+1;
        v[dimL]:=num;
        readln(num);
      end;
 end;

procedure modificarVectorySumar(var v:vdatos; dimL:integer; n:real; var suma:real); {debe devolver el vector con todos sus elementos incrementados con el valor n y también debe devolver la suma de todos los elementos del vector.}
 var
    i:integer;
 begin
    for i:= 1 to dimL do
      begin
        v[i]:= v[i]+n;
        suma:=suma+v[i];
      end;
 end;
{ programa principal }
var
    datos : vdatos;
    dim : integer;
    num, sumaTotal : real;
begin
    dim := 0;
    sumaTotal := 0;
    cargarVector(datos,dim);
    writeln('Ingrese un valor a sumar');
    readln(num);
    modificarVectorySumar(datos,dim,num,sumaTotal);
    writeln('La suma de los valores es: ', sumaTotal:2:2);
    writeln('Se procesaron: ',dim, ' numeros');
end.

