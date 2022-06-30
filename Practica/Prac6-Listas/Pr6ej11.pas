{11. La Facultad de Informática debe seleccionar los 10 egresados con mejor promedio a los que la UNLP les 
entregará el premio Joaquín V. González. De cada egresado se conoce su número de alumno, apellido y el 
promedio obtenido durante toda su carrera.
Implementar un programa que:
a. Lea la información de todos los egresados, hasta ingresar el código 0, el cual no debe procesarse. 
b. Una vez ingresada la información de los egresados, informe el apellido y número de alumno de los egresados 
que recibirán el premio. La información debe imprimirse ordenada según el promedio del egresado (de mayor a menor)
}


program Pr6ej11;
const
   CORTE=0;
   dimF=10; 
 type
    str=string[50];
    egresado=record
        numero:integer;
        apellido:str;
        prom:real;
    end;
    
   // mejoresProm=array[1..dimF]of egresado;
    
    listaE=^nodo;
    nodo=record
        dato:egresado;
        sig:listaE;
    end;
    
//para inciso A    
procedure leerEgresado(var al:egresado);
 begin
    writeln('Ingrese numero de alumno');readln(al.numero);
    if(al.numero<>CORTE)then begin
       writeln('Ingrese apellido del alumno egresado');readln(al.apellido);
       writeln('Ingrese promedio del egresado');readln(al.prom);
    end;
 end;
 
procedure insertarOrdenado(var l:listaE; al:egresado);
 var
   ant,act,nue:listaE;
 begin
    new(nue);
    nue^.dato:=al;
    ant:=l;
    act:=l;
    while((act<>nil)and (act^.dato.prom>al.prom))do begin
        ant:=act;
        act:=act^.sig;
    end; 
    if(ant=act)then
       l:=nue
    else
       ant^.sig:=nue;
    nue^.sig:=act;
 end;
 
procedure cargarEgresados(var l:listaE);
 var
    eg:egresado;
 begin
    leerEgresado(eg);
    while(eg.numero<>corte)do begin
       insertarOrdenado(l,eg);
       leerEgresado(eg);
    end;
 end;

{procedure cargarMejores(l:listaE;var vEgresados:mejoresProm);
 var
    i:integer;
 begin
    for i:=1 to dimF do begin
       vEgresados[i]:=l^.dato;
       l:=l^.sig;
    end;
 end;}
 
procedure imprimirMejores(l:listaE);//vEgresados:mejoresProm);
 var
    i:integer;
 begin
    writeln('Los egresados con mejor promedio son: ');
    for i:= 1 to 10 do begin
       writeln('El egresado ',l^.dato.apellido{vEgresados[i].apellido},' con numero ',l^.dato.numero{vEgresados[i].numero},' y promedio ',l^.dato.prom);{vEgresados[i].prom:2:2,'.');}
       l:=l^.sig;
    end;
 end;
 
//programa principal
 
var
   l:listaE;
   //mejores: mejoresProm;
begin
    l:=nil;
    cargarEgresados(l); //Inciso A
    //cargarMejores(l,mejores); 
    imprimirMejores(L);//mejores); //Inciso B
end.
