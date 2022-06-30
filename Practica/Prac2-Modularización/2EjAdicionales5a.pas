Program Adic5a;

procedure leerDatos(var codigo,inversiones:integer);
 begin
    write('Ingrese codigo de empresa ');
    read(codigo);
    write('Ingrese cantidad de inversiones ');
    readln(inversiones);
 end;

procedure maximos (monto:real;codigo:integer; var max:real;var cod:integer);
 begin
   if (monto>max)then
      begin
        max:=monto;
        cod:=codigo;
      end;
 end; 
 
procedure montoTotalEmpresa (inversiones:integer;var montoEmp,montoTotal:real);
 var
  i:integer;
  monto:real;
 begin
   write('Ingrese monto de cada inversion: ');
    for i:=1 to inversiones do
      begin
        readln(monto);
        montoEmp:=montoEmp+monto;
        montoTotal:=montoTotal+monto; 
      end;
 end;  
var
  codigo,cantInversiones,empMas50,maxEmp:integer;
  maxMonto,montoProm,montoTotal,montoEmp:real;

begin
  maxMonto:=0;
  montoTotal:=0;
  empMas50:=0;
  repeat
    montoEmp:=0;
    maxEmp:=0;
    leerDatos(codigo,cantInversiones);
    montoTotalEmpresa(cantInversiones,montoEmp,montoTotal);
    if (montoEmp>50000)then
       empMas50:=empMas50+1;  
    montoProm:=montoEmp/cantInversiones;  
    maximos(montoEmp,codigo,maxMonto,maxEmp);
    
    writeln('Empresa ',codigo,' Monto promedio ',montoProm:0:2);
  until(codigo=100);
  writeln('La empresa ',maxEmp,' es la que mayor dinero invertido posee($ ',maxMonto:0:2,')');
  writeln('Hay ',empMas50,' empresas con inversiones por mas de $50000');
end.
