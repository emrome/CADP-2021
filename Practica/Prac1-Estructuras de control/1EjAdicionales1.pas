Program Adic1;
var
  i,codigo,cantInversiones,empMas50,maxEmp:integer;
  maxMonto,monto,montoProm,montoTotal,montoEmp:real;
 
begin
  maxMonto:=0;
  montoTotal:=0;
  empMas50:=0;
  repeat
    montoEmp:=0;
    write('Ingrese codigo de empresa ');
    read(codigo);
    write('Ingrese cantidad de inversiones ');
    readln(cantInversiones);
    write('Ingrese monto de cada inversion ');
    for i:=1 to cantInversiones do
      begin
        read(monto);
        montoEmp:=montoEmp+monto;
        montoTotal:=montoTotal+monto;
        
      end;
    if (montoEmp>50000)then
       empMas50:=empMas50+1;  
    montoProm:=montoEmp/cantInversiones;  
    if (montoEmp>maxMonto)then
      begin
        maxMonto:=montoEmp;
        maxEmp:=codigo;
      end;

    writeln('Empresa ',codigo,' Monto promedio ',montoProm:0:2);
  until(codigo=100);
  writeln('La empresa ',maxEmp,' es la que mayor dinero invertido posee($ ',maxMonto:0:2,')');
  writeln('Hay ',empMas50,' empresas con inversiones por mas de $50000');
end.
