{10. Una empresa de sistemas está desarrollando un software para organizar listas de espera de clientes. Su 
funcionamiento es muy sencillo: cuando un cliente ingresa al local, se registra su DNI y se le entrega un número 
(que es el siguiente al último número entregado). El cliente quedará esperando a ser llamado por su número, 
en cuyo caso sale de la lista de espera. Se pide:

 a.Definir una estructura de datos apropiada para representar la lista de espera de clientes.
 b.Implementar el módulo RecibirCliente, que recibe como parámetro el DNI del cliente y la lista de clientes en 
espera, asigna un número al cliente y retorna la lista de espera actualizada.
 c.Implementar el módulo AtenderCliente, que recibe como parámetro la lista de clientes en espera, y retorna el 
número y DNI del cliente a ser atendido y la lista actualizada. El cliente atendido debe eliminarse de la 
lista de espera.
 d.Implementar un programa que simule la atención de los clientes. En dicho programa, primero llegarán todos 
los clientes juntos, se les dará un número de espera a cada uno de ellos, y luego se los atenderá de a uno 
por vez. El ingreso de clientes se realiza hasta que se lee el DNI 0, que no debe procesarse.
}


program Pr6ej10;
 const
    CORTE=0;
//inciso A 
 type
    cliente=record
        DNI:integer;
        num:integer;
    end;
    listaEsp=^nodo;
    nodo=record
        dato:cliente;
        sig:listaEsp;
    end;
    
//inciso B
procedure leerDNI(var num:integer);
 begin
    writeln('Ingrese el DNI');
    readln(num);
 end;
procedure agregarAtras(var l,ult:listaEsp; cl:cliente);
 var
    nue:listaEsp;
 begin
    new(nue);
    nue^.dato:=cl;
    nue^.sig:=nil;
    if(l=nil) then l:=nue
    else ult^.sig:=nue;
    ult:=nue;
 end;
 
procedure recibirCliente(var l,ult:listaEsp; DNI:integer;var num:integer);
 var
    cl:cliente;
 begin
    num:=num+1;
    cl.DNI:= DNI;
    cl.num:=num;
    agregarAtras(l,ult,cl);
 end;
 
//inciso C
procedure atenderCliente(var l:listaEsp;var dniAtender,numAtender:integer);
 var
    aux:listaEsp;
 begin
    aux:=l;
    dniAtender:=aux^.dato.DNI;
    numAtender:=aux^.dato.num;
    l:=l^.sig;
    dispose(aux);
 end;
 
//inciso D seria todo 
procedure cargarClientes(var l:listaEsp);
 var
    ult:listaEsp;
    dni,num:integer;
 begin
    num:=0;
    leerDNI(dni);
    while (Dni<>CORTE)do begin
        recibirCliente(l,ult,dni,num);
        writeln('El numero del cliente con DNI ',dni,' es ',num);
        leerDNI(dni);
    end; 
    writeln('Termino la carga de clientes');
 end;
    
procedure atendiendoClientes(l:listaEsp);
 var
    ok:string;
    dni,num:integer;
 begin
    writeln('Ingrese SI para empezar a atender a los clientes');
    readln(ok);
    //if(ok='SI')then begin
    while((l<>nil)and ((ok='SI') or (ok= 'si')))do begin
        atenderCliente(l,dni,num);
        writeln('Numero del cliente a atender es ',num);
        writeln('Ingrese SI para seguir antendiendo');
        readln(ok); //no pongo l:=l^.sig xq ya esta en atenderCliente, que va eliminando el primero "l"
    end;
    writeln('Se atendieron todos los clientes');
    //end;
 end;
 
var
   l:listaEsp;
begin
   l:=nil;
   cargarClientes(l);
   writeln();
   atendiendoClientes(l);
end.
 
 
 
    
