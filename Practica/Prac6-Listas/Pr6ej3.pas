{ 3. Utilizando el programa del ejercicio 1, realizar los siguientes cambios:
a. Modificar el módulo armarNodo para que los elementos se guarden en la lista en el orden en que fueron ingresados (agregar atrás).
b. Modificar el módulo armarNodo para que los elementos se guarden en la lista en el orden en que fueron ingresados, 
manteniendo un puntero al último ingresado }

program Pr6ej3;
type
  lista = ^nodo;
  nodo = record
     num : integer;
     sig : lista;
  end; 
procedure agregarAtras(var pri:lista; v:integer);
 var
	aux,nuevo:lista;
 begin
	new(nuevo);
	nuevo^.num:=v;
	nuevo^.sig:=nil;
	if (pri=nil)then pri:=nuevo //si esta vacia
	else begin 
		aux:=pri;aux //toma el valor del primer nodo
		while(aux^.sig<>nil)do //mientras no esta en el ultimo nodo
				aux:=aux^.sig;
		aux^.sig:=nuevo;
	end;
 end;
 
procedure agregarAtrasConUlt(var l,ult:lista; v:integer); //b
 var
	nue:lista;
 begin
	new(nue);
	nue^.num:=v;
	nue^.sig:=nil;
	if(l=nil)then //si lista esta vacia
		l:=nue
	else //si no esta vacia
		ult^.sig:=nue; //hago el enlace con el nuevo nodo
	ult:=nue;  //actualizo el ultimo, si lista esta vacia el primer y ultimo nodo son el mismo
 end;


