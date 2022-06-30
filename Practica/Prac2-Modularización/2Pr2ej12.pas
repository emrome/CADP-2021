program Pr2ej12;

function rendimiento(cantHa,tipo:integer;precio:real):real;
begin
  case tipo of
    1: rendimiento:=cantHa*6*precio;
    2: rendimiento:= cantHa *(2.6)*precio;
    3: rendimiento:= cantHa* (1.4)*precio;
    else 
     writeln('No existe esa zona');
  end;
end;

procedure leerDatos(var cantHa,tipo:integer;var localidad:string);
  begin
    write('Ingrese localidad: ');
    readln(localidad);  
    write('Ingrese cantidad de Ha sembradas: ');
    readln(cantHa);
    write('Ingrese tipo de zona: ');
    readln(tipo);
  end;          
  
procedure MaximosMinimos (localidad:string; rendimiento:real;var max,min:real; var campMin,campMax:string);
  begin
    if(rendimiento<min)then 
      begin
       min:= rendimiento;
       campMin:=localidad;
     end;                  {calcula minimos}    
    if(rendimiento>max)then 
      begin
       max:=rendimiento;
       campMax:=localidad;
     end;                  {calcula maximos}
  end;

var
  localidad,campMin,campMax:string;
  cantHa,tipo,cantCampos,camp3F:integer;
  aux,rendimientoTotal,max,min:real;
begin
  cantCampos:=0;
  camp3F:=0;
  rendimientoTotal:=0;
  max:=0;
  min:=1000000;
  campMax:=' ';
  campMin:=' ';
  repeat
    leerDatos(cantHa,tipo,localidad);
    cantCampos:=cantCampos+1;
    aux:= rendimiento(cantHa,tipo,320);
    writeln('Esta campo gana $ ',aux:2:2);
    if((localidad= 'Tres de Febrero')and (aux>10000))then
      camp3F:=camp3F +1;
    MaximosMinimos(localidad,aux,max,min,campMin,campMax);
    rendimientoTotal:=rendimientoTotal + aux;
  until((localidad='Saladillo')and(cantHa=900));
  writeln('La cantidad de campos de la localidad Tres de Febrero con rendimiento estimado superior a U$S 10.000 es: ',camp3F);
  writeln('La localidad del campo con mayor rendimiento económico esperado es: ',campMax);
  writeln('La localidad del campo con menor rendimiento económico esperado es: ',campMin);
  writeln('El rendimiento económico promedio es $ ',(rendimientoTotal/cantCampos):2:2);
end.
