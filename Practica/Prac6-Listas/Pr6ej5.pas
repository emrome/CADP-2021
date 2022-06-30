{5. Realizar un programa que lea y almacene la información de productos de un supermercado. De cada 
producto se lee: código, descripción, stock actual, stock mínimo y precio. La lectura finaliza cuando se ingresa 
el código -1, que no debe procesarse. Una vez leída y almacenada toda la información, calcular e informar:
a. Porcentaje de productos con stock actual por debajo de su stock mínimo.
b. Descripción de aquellos productos con código compuesto por al menos tres dígitos pares.
c. Código de los dos productos más económicos. 
}

program Pr6ej5;
 const
	fin=-1;
 type
	producto=record
		cod:integer;
		descripcion:string;
		stockAc:integer;
		stockMin:integer;
		precio:real;
	end;
	listaP=^nodo;
	nodo=record
		dato:producto;
		sig:listaP;
	end;

procedure leerProducto(var p:producto);
 begin
	writeln('Ingrese el codigo del producto: ');readln(p.cod);
	if(p.cod <> fin)then begin
		write('Ingrese la descripcion del producto: ');readln(p.descripcion);
		write('Ingrese el stock Actual del producto: ');readln(p.stockAc);
		write('Ingrese el stock Minimo del producto: ');readln(p.stockMin);
		write('Ingrese el precio del producto: ');readln(p.precio);
	end;
 end;

procedure agregarNodo(var l:listaP;p:producto);
 var
	nue:listaP;
 begin
	new(nue);
	nue^.dato:=p;
	nue^.sig:=l;
	l:=nue;
 end;

procedure cargarLista(var l:listaP);
 var
	prod:producto;
 begin
	leerProducto(prod);
	while (prod.cod<>fin)do begin
		agregarNodo(l,prod);
		leerProducto(prod);
	end;
 end;


//modulos inciso a
function esMenor (num1,num2:integer):boolean;
 begin
	esMenor:= num1<num2;
 end;

//modulos inciso b
procedure descomponer(num:integer;var digPares:integer);
 {var
	dig:integer;}
 begin
	digPares:=0;
	while (num<>0) do begin
		//dig:=num MOD 10;
		if (num MOD 2=0)then
			digPares:=digPares+1;
		num:= num DIV 10;
	end;
 end;
 
function esMayorIgual(num1,num2:integer):boolean;
 begin
	esMayorIgual:= num1>=num2;
 end;
 
procedure descripciones (codigo:integer; descrip:string);
 var
	digPares:integer;
 begin
	descomponer(codigo,digPares);
	if (esMayorIgual(digPares,3))then //inciso B
		writeln('El producto con descripcion ',descrip,' tiene un codigo con al menos 3 digitos pares.');
 end;
 
//modulo inciso c
procedure minimos(precio:real;codigo:integer;var min1,min2:real; var cod1,cod2:integer);
 begin
	if (precio<min1)then begin
		min2:=min1;
		min1:=precio;
		cod2:=cod1;
		cod1:=codigo;
   end
	else if (precio<min2)then begin
		min2:=precio;
		cod2:=codigo;
		end;
 end;

procedure recorrerLista( l:listaP; var porcentajeStock,min1,min2:real; var cod1,cod2:integer);
 var
	prodTotales,contStockMenor:integer;
 begin
	prodTotales:=0;contStockMenor:=0;
	min1:=9999;
	cod1:=0;
	while(l<>nil)do begin
		prodTotales:=prodTotales+1;
		if(esMenor(l^.dato.stockAc,l^.dato.stockMin))then 
			contStockMenor:=contStockMenor+1;
			
		descripciones(l^.dato.cod,l^.dato.descripcion);//inciso B

		minimos(l^.dato.precio,l^.dato.cod,min1,min2,cod1,cod2); //inciso C
		l:=l^.sig;
	end;
	porcentajeStock:= contStockMenor/prodTotales*100; //inciso A
 end;
 
//programa principal
var
	list:listaP;
	min1,min2,porcentaje:real;
	cod1,cod2:integer;
 begin
	list:=nil;
	cargarLista(list);
	recorrerLista(list,porcentaje,min1,min2,cod1,cod2);
	writeln('El porcentaje de productos con stock actual por debajo de su stock minimo es %',porcentaje:2:2);
	writeln('El producto con codigo ',cod1, ' con precio $',min1:2:2,' es el mas economico y le sigue el producto ',cod2,' con un precio de $',min2:2:2);
 end.
