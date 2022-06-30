program Pr6ej1;
type
  lista = ^nodo;
  nodo = record
     num : integer;
     sig : lista;
  end; 
procedure armarNodo(var L: lista; v: integer);
 var
	aux : lista;
 begin
	new(aux);
	aux^.num := v;
	aux^.sig := L;
	L := aux;
 end;

procedure imprimirLista(l:lista);
 begin
	while (l<>nil) do
	  begin
		writeln(l^.num);
		l:=l^.sig;
	  end;
  end;
procedure modificarLista( var l:lista; valor:integer);
 var
	aux:lista;
 begin
	aux:=l;
	while (aux<>nil)do
	 begin
		 aux^.num:= aux^.num + valor;
		 aux:=aux^.sig;
	 end;
 end; 

var
	pri : lista;
	valor : integer;
begin
	pri := nil; {SIEMPRE -- IMPORTANTE}
	writeln('Ingrese un numero'); 
	read(valor);
	while (valor <> 0) do begin
		armarNodo(pri, valor);
		writeln('Ingrese un numero');
		read(valor);
	end;
    imprimirLista(pri);{ imprimir lista }
    writeln('Ingrese un valor para eliminar cada dato de la lista');
	read(valor);
	eliminarElemRepe(pri,valor);
	imprimirLista(pri);
end.
