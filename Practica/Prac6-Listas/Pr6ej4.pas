{4. Utilizando el programa del ejercicio 1, realizar los siguientes módulos:
a. Máximo: recibe la lista como parámetro y retorna el elemento de valor máximo.
b. Mínimo: recibe la lista como parámetro y retorna el elemento de valor mínimo.
c. Múltiplos: recibe como parámetros la lista L y un valor entero A, y retorna la cantidad de elementos de la 
lista que son múltiplos de A 
}

program Pr6ej4;
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

function maximo (l:lista):integer;
 var
	max:integer;
 begin
	max:=0;
	while(l<>nil)do begin
		if(l^.num>max)then
		  max:=l^.num;
		l:=l^.sig;
	end;
	maximo:=max;
 end;
 
function minimo (l:lista):integer;
 var
	min:integer;
 begin
	min:=999;
	while(l<>nil)do begin
		if(l^.num<min)then
		  min:=l^.num;
		l:=l^.sig;
	end;
	minimo:=min;
 end;
function multiplosDeA(l:lista;A:integer):integer;
 var
	contMulti:integer;
 begin
	contMulti:=0;
	while(l<>nil)do begin
		if(l^.num MOD A= 0)then
		  contMulti:=contMulti+1;
		l:=l^.sig;
	end;
	multiplosDeA:=contMulti;
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
	valor,A: integer;
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
    writeln('El valor maximo es: ',maximo(pri),' y el minimo es: ',minimo(pri));
    writeln('Ingrese un numero para buscar cuantos multiplos hay');
	read(A);
	writeln('Hay ',multiplosDeA(pri,A),' multiplos de ',A);
end.
