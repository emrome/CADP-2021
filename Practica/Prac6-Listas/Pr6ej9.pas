{Utilizando el programa del ejercicio 1, realizar los siguientes módulos:
a. EstáOrdenada: recibe la lista como parámetro y retorna true si la misma se encuentra ordenada, o false en caso contrario.
b. Eliminar: recibe como parámetros la lista y un valor entero, y elimina dicho valor de la lista (si existe). Nota: la lista podría no estar ordenada.
c. Sublista: recibe como parámetros la lista L y dos valores enteros A y B, y retorna una nueva lista con todos los elementos de la lista L mayores que A y menores que B.
d. Modifique el módulo Sublista del inciso anterior, suponiendo que la lista L se encuentra ordenada de manera ascendente.
e. Modifique el módulo Sublista del inciso anterior, suponiendo que la lista L se encuentra ordenada de manera descendente  
}


program Pr6ej9;
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
//inciso A
function estaOrdenada(l:lista):boolean;
 var
    ant,act:lista;
    exito:boolean;
 begin
    exito:=false;
	ant:=l;
	act:=l^.sig;
	if ((ant^.num>=act^.num)and(act^.num>=act^.sig^.num))then //verifica cual seria el orden, si es ascendente hace lo del if
	   while((act<>nil) and (not exito))do begin
          if(ant^.num>act^.num) then  
            exito:=true
          else begin      
            ant:=act;
	        act:=act^.sig;
	      end;
	    end
   
    else if ((ant^.num<=act^.num)and(act^.num<=act^.sig^.num))then   //si es descendente hace lo del else
        while((act<>nil) and (not exito))do begin
            if(ant^.num<act^.num) then  
               exito:=true
            else begin      
               ant:=act;
               act:=act^.sig;
	        end;
        end;         
	estaOrdenada:= exito ;
 end;

//inciso B
procedure eliminarElemento(var l:lista; valor:integer);//puede no estar ordenada
 var
     ant,act:lista;
 begin
    act:=l;
    while((act<>nil)and(act^.num<>valor))do 
       begin
         ant:=act;
         act:=act^.sig;
      end;
    if(act<>nil)then //significa que salio por encontro el dato
      begin
         if(act=l) then l:=l^.sig //el dato a borrar es el primero
         else ant^.sig:= act^.sig; //hago el enlace del anterior nodo con el siguiente nodo del DATO A ELIMINAR
         dispose(act);
         writeln('El valor se elimino de la lista');
       end
    else writeln('El valor no se encontraba en la lista');
 end;

//inciso C
procedure sublista(l:lista; valorA,valorB:integer;var lista2:lista);
 var
     aux:lista;
 begin
    while(l<>nil) do begin
        if((l^.num>valorA)and(l^.num<valorB))then
          armarNodo(lista2,l^.num);
        l:=l^.sig;
    end;
 end;
//inciso D lista esta ordenada ascendente
procedure sublistaAsc(l:lista; valorA,valorB:integer;var lista2:lista);
 var
     aux:lista;  //numeros en la lista A<x<B
 begin
    while((l<>nil) and (l^.num<valorB))do begin//si ya es mayor al valor B significa que no hay mas numeros que cumplan la condicion
        if(l^.num>valorA)then
          armarNodo(lista2,l^.num);
        l:=l^.sig;
    end;
 end;

//inciso E lista esta ordenada descendente
procedure sublistaDes(l:lista; valorA,valorB:integer;var lista2:lista);
 var
     aux:lista;   //numeros en la lista B>x>A
 begin
    while((l<>nil)and (l^.num>valorA))do begin//si ya es menor al valor A significa que no hay mas numeros que cumplan la condicion
        if(l^.num<valorB)then
          armarNodo(lista2,l^.num);
        l:=l^.sig;
    end;
 end;
procedure otraFormaE(l:lista; valorA,valorB:integer; var lista2:lista);//NO PREGUNTA EN CADA VALOR
 var
    aux:lista;
 begin
    while((l<>nil)and(l^.num>=valorB))do //RECORRE HASTA QUE EL VALOR DE LA LISTA SEA MENOR A B
      l:=l.sig;
    while((l<>nil)and(l^.num>valorA))do begin //desde el valor que es menor a B hasta que el valor sea menor a A, inserta elementos en la nueva lista
        armarNodo(lista2,l^.num);
    end;
