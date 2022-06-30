{Dado el siguiente código que lee información de personas hasta que se ingresa la persona con dni 0 y luego 
imprime dicha información en el orden inverso al que fue leída, identificar los 9 errores
}

program Pr6ej2;
 type
    lista = ^nodo;
    persona = record
       dni: integer;
       nombre: string;
       apellido: string;
    end;
    nodo = record
       dato: persona;
       sig: lista;
    end;
procedure leerPersona(p: persona);// 1er DEBERIA SER POR REFERENCIA var p:persona
 begin
    read(p.dni);
    if (p.dni <> 0)then begin
       read(p.nombre);
       read(p.apellido);
    end;
 end;
{Agrega un nodo a la lista}
procedure agregarAdelante(l:lista;p:persona);// 2do l DEBERIA SER POR REFERENCIA(agrega adelante,siempre cambia l)var l:lista
 var
    aux: lista;
 begin 
    aux^.dato:= p;//3ro falta hacer NEW(AUX)
    aux^.sig:= l;
    l:= aux;
 end;
{Carga la lista hasta que llega el dni 0}
procedure generarLista(var l:lista);
 var
    p:nodo; //4to TIENE QUE SER DE TIPO PERSONA
 begin
    leerPersona(p);
    while (p.dni <> 0) do begin//5to NO VUELVE A LEER PERSONA, BUCLE INFINITO
        agregarAdelante(l,p);
    end;
end;

procedure imprimirInformacion(var l:lista);//6to TIENE QUE SER POR VALOR, NO SE DEBE MODIFICAR l:lista
 begin
    while (l <> nil) do begin// 7to l^.nombre tiene que ser l^.dato.nombre
       writeln('DNI: ', l^.dato.dni, 'Nombre:',l^.nombre, 'Apellido:', l^.apellido);// 8vo l^.apellido tiene que ser l^.dato.apellido
       l:= l^.sig;
    end;
 end;

//Programa principal
var
   l:lista;
begin
   generarLista(l);//9no NO INICIALIZA EN NIL l:=nil
   imprimirInformacion(l);
end.
