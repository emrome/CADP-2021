{ La tienda de libros Amazon Books está analizando información de algunas editoriales. Para ello,
Amazon cuenta con una tabla con las 35 áreas temáticas utilizadas para clasificar los libros (Arte y Cultura,
Historia, Literatura, etc.).
De cada libro se conoce su título, nombre de la editorial, cantidad de páginas, año de edición, cantidad de
veces que fue vendido y código del área temática (1..35).
Realizar un programa que:
A) Invoque a un módulo que lea la información de los libros hasta ingresar el título “Relato de un
náufrago” (que debe procesarse) y devuelva en una estructura de datos adecuada para la
editorial “Planeta Libros”, con la siguiente información:
- Nombre de la editorial
- Año de edición del libro más antiguo
- Cantidad de libros editados
- Cantidad total de ventas entre todos los libros
- Detalle con título, nombre del área temática y cantidad de páginas de todos los libros con
más de 250 ventas.
B) Invoque a un módulo que reciba la estructura generada en A) e imprima el nombre de la editorial
y el título de cada libro con más de 250 ventas.
}


program Pr7ej13;
const
    CORTE='Relato de un naufrago';
    COND='Planeta Libros';
type
    rango=1..35;
    area=record
       tematica:string;
       cod:rango;
    end;
    tabla=array[rango]of area;
    libro=record
        titulo:string;
        editorial:string;
        paginas:integer;
        anioEdicion:integer;
        ventas:integer;
        areaTem:rango;
    end;
    masDe250=record
        titulo:string;
        areaT:string;
        paginas:integer;
    end;
    lista=^nodo;
    nodo=record
        dato:masDe250;
        sig:lista;
    end;
    edReq=record
        nombre:string;
        masAntiguo:integer;
        cantLibros:integer;
        cantVentas:integer;
        listaLibros:lista;
    end;
    
procedure leerArea(var a:area);//SE DISPONE
 begin
     writeln('Ingrese tematica');readln(a.tematica);
     writeln('Ingrese codigo');readln(a.cod);
 end;
procedure cargarTabla(var t:tabla);//SE DISPONE
 var
   i:integer;
 begin
    for i:=1 to 4 do begin
       leerArea(t[i]);
    end;
 end;
procedure leerLibro(var l:libro);
 begin
    writeln('Ingrese titulo');readln(l.titulo);
    writeln('Ingrese editorial');readln(l.editorial);
    writeln('Ingrese paginas');readln(l.paginas);
    writeln('Ingrese anio edicion');readln(l.anioEdicion);
    writeln('Ingrese ventas');readln(l.ventas);
    writeln('Ingrese temtica');readln(l.areaTem);
 end;
procedure agregar(var l:lista;titulo,area:string;cantPag:integer);
 var
    nue:lista;
 begin
    new(nue);
    nue^.dato.titulo:=titulo;
    nue^.dato.areaT:=area;
    nue^.dato.paginas:=cantPag;
    nue^.sig:=l;
    l:=nue;
 end;
procedure minimo(num:integer;var min:integer);// para Año de edición del libro más antiguo
 begin
    if(num<min)then min:=num;
end;

procedure procesar(var Editorial:edReq;t:tabla);
 var
    min:integer;
    lib:libro;
 begin
    min:=9999;
    Editorial.nombre:=COND;
    Editorial.cantLibros:=0;
    Editorial.cantVentas:=0;
    repeat 
        leerLibro(lib);
        if(lib.editorial=COND)then begin
            Editorial.cantLibros:=Editorial.cantLibros+1;
            Editorial.cantVentas:=Editorial.cantVentas+lib.ventas;
            minimo(lib.anioEdicion,min);
            if(lib.ventas>250)then 
                agregar(Editorial.listaLibros,lib.titulo,t[lib.areaTem].tematica,lib.paginas);
        end;
    until(lib.titulo=CORTE);     
    Editorial.masAntiguo:=min;
 end;
procedure imprimirLibros(ed:edReq);
 var
    aux:lista;
 begin
    aux:=ed.listaLibros;
    writeln('Editorial: ',ed.nombre);
    while(aux<>nil)do begin
       writeln('Titulo: ',aux^.dato.titulo);
       aux:=aux^.sig;
    end;
 end;
//programa principal
var
    Editorial:edReq;
    t:tabla;
begin
    Editorial.listaLibros:=nil;
    cargarTabla(t);
    procesar(Editorial,t);
    imprimirLibros(Editorial);

end.
