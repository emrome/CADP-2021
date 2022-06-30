program Adic2;
procedure leerPar (var x,y:integer);
begin
  write('Ingrese un par de numeros: ');
  read(x);
  read(y);
end;

function suma(x,y:integer):integer;
var
  aux,i:integer;
begin
  aux:=0;
  for i:= x to y do
    aux:=aux + i;
  suma:=aux;
end;

function producto(x,y:integer):integer;
var
  aux,i:integer;
begin   
  aux:=1;
  for i:= x to y do
    aux:=aux*i;
  producto:=aux;
end;
{programa principal}
var
  x,y,i:integer;
begin
  for i:= 1 to 10 do 
    begin
      leerPar(x,y);
      writeln('La suma es ', suma(x,y));
      writeln('El producto es ',producto(x,y));
    end;
end.
