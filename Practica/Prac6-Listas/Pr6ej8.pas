{8. Utilizando el programa del ejercicio 1, modificar el módulo armarNodo para que los elementos de la lista 
queden ordenados de manera ascendente (insertar ordenado).
}

program Pr6ej8;

type
  lista = ^nodo;
  nodo = record
     num : integer;
     sig : lista;
  end; 
procedure armarNodo(var L: lista; v: integer);
 var
	ant,act,nue : lista;
 begin
	new(nue);
	nue^.num := v;
	ant:=L;
	act:=L;
	while((act<>nil)and (v > act^.num))do
	  begin
		ant:=act;
		act:=act^.sig;
	  end;
	if(ant=act)then L:=nue
	else ant^.sig:=nue;
	nue^.sig:=act;
 end;

procedure imprimirLista(l:lista);
 begin
	while (l<>nil) do
	  begin
		writeln(l^.num);
		l:=l^.sig;
	  end;
  end;

var
	pri : lista;
	valor : integer;
begin
	pri := nil; //SIEMPRE -- IMPORTANTE
	writeln('Ingrese un numero'); 
	read(valor);
	while (valor <> 0) do begin
		armarNodo(pri, valor);
		writeln('Ingrese un numero');
		read(valor);
	end;
    imprimirLista(pri); //imprimir lista 
end.



