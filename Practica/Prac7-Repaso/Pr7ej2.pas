{Implementar un programa que lea y almacene información de clientes de una empresa aseguradora
automotriz. De cada cliente se lee: código de cliente, DNI, apellido, nombre, código de póliza
contratada (1..6) y monto básico que abona mensualmente. La lectura finaliza cuando llega el cliente
con código 1122, el cual debe procesarse.
La empresa dispone de una tabla donde guarda un valor que representa un monto adicional que el
cliente debe abonar en la liquidación mensual de su seguro, de acuerdo al código de póliza que tiene
contratada.
Una vez finalizada la lectura de todos los clientes, se pide:
a. Informar para cada cliente DNI, apellido, nombre y el monto completo que paga mensualmente
por su seguro automotriz (monto básico + monto adicional).
b. Informar apellido y nombre de aquellos clientes cuyo DNI contiene al menos dos dígitos 9.
c. Realizar un módulo que reciba un código de cliente, lo busque (seguro existe) y lo elimine de la
estructura.
}


program Pr7ej2;
const
   CORTE=1122;
   NUM=9;
 type
    rango=1..6;
    tabla=array[rango]of real;
    cliente=record
      cod:integer;
      dni:integer;
      apellido:string;
      nombre:string;
      poliza:rango;
      monto:real;
    end;
    lista=^nodo;
    nodo=record
       dato:cliente;
       sig:lista;
    end;
 
procedure cargarTabla(var t:tabla); //se dispone
procedure leerCliente(var cl:cliente);
 begin
    writeln('Ingrese codigo de cliente ');readln(cl.cod); 
    writeln('Ingrese DNI ');readln(cl.dni);
    writeln('Ingrese apellido ');readln(cl.apellido);
    writeln('Ingrese nombre ');readln(cl.nombre);
    writeln('Ingrese codigo de poliza ');readln(cl.poliza);
    writeln('Ingrese monto mensual ');readln(cl.monto);
 end;

procedure agregar(var l:lista;cl:cliente);
 var
   nue:lista;
 begin
   new(nue);
   nue^.dato:=cl;
   nue^.sig:=l;
   l:=nue;
 end;
 
procedure cargarLista(var l:lista);
 var
    cl:cliente;
 begin
    repeat 
       leerCliente(cl);
       agregar(l,cl);
    until(cl.cod=CORTE)
 end;
 
function alMenosDosX(num:integer):boolean;
 var
    dig,cantN:integer;
 begin
    cantN:=0;
    while(num<>0)do begin
        dig:= num Mod 10;
        if(dig=NUM)then
           cantN:=cantN+1;
        num:=num DIV 10;
    end;
    alMenosDosX:=cantN>=2;
 end;
procedure elimimarCliente(var l:lista;cod:integer);
 var
    ant,act:lista;
 begin
    act:=l;
    ant:=l;
    while(act^.dato.cod<>cod)do begin
       ant:=act;
       act:=act^.sig;
    end;
    if(act=l)then l:=l^.sig
    else ant^.sig:=act^.sig;
    dispose(act);
 end;
procedure imprimir(dni:integer;nom,ape:string;monto:real);
 begin
    writeln('DNI: ',dni); 
    writeln('APELLIDO: ',ape); 
    writeln('NOMBRE: ',nom); 
    writeln('MONTO TOTAL: ',monto); 
    writeln();
 end;
procedure recorrerLista(l:lista;t:tabla);
 var
    montoTotal:real;
 begin
    while(l<>nil)do begin
       montoTotal:= l^.dato.monto+ t[l^.dato.poliza];
       imprimir(l^.dato.dni,l^.dato.nombre,l^.dato.apellido,montoTotal);
       if(alMenosDosX(l^.dato.dni))then writeln('Este cliente posee DNI con al menos dos digitos ',NUM);
       l:=l^.sig;
    end;
 end;

var
  l:lista;
  t:tabla;
  codEliminar:integer;
begin
   l:=nil;
   cargarTabla(t);//SE DISPONE
   cargarLista(l);
   recorrerLista(l,t);
   writeln('Ingres codigo de cliente a eliminar ');
   readln(codEliminar);
   elimimarCliente(l,codEliminar);
end.
