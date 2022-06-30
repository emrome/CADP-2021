{Un cine posee la lista de películas que proyectará durante el mes de Febrero. De cada película se
tiene: código de película, título de la película, código de género (1: acción, 2: aventura, 3: drama, 4:
suspenso, 5: comedia, 6: bélica, 7: documental y 8: terror) y puntaje promedio otorgado por las
críticas. Dicha estructura no posee orden alguno.
Se pide:
a) Actualizar (en la lista que se dispone) el puntaje promedio otorgado por las críticas. Para ello se
debe leer desde teclado las críticas que han realizado críticos de cine, de cada crítica se lee: DNI
del crítico, apellido y nombre del crítico, código de película y el puntaje otorgado. La lectura
finaliza cuando se lee el código de película -1 y la información viene ordenada por código de
película.
b) Informar el código de género que más puntaje obtuvo entre todas las críticas.
c) Informar el apellido y nombre de aquellos críticos que posean la misma cantidad de dígitos pares
que impares en su DNI.
d) Realizar un módulo que elimine de la lista que se dispone una película cuyo código se recibe
como parámetro (el mismo puede no existir).
}


program Pr7ej9;
const
   CORTE=-1;
   DIMF=8;
type
    rango=1..DIMF;
    pelicula=record
        codigo:integer;
        titulo:string;
        genero:rango;
        promedio:real;
    end;
    critica=record
        codPeli:integer;
        dni:integer;
        nombre:string;
        apellido:string;
        puntaje:integer;
    end;
    listaP=^nodo1;
    nodo1=record
        dato:pelicula;
        sig:listaP;
    end;
    {listaC=^nodo2;
    nodo2=record
        dato:critica;
        sig:listaC;
    end;}
    gen=record
        cantP:integer;
        puntTot:real;
        prom:real;
    end;
    generos=array[rango]of gen;
procedure leerPelicula(var p:pelicula);//SE DISPONE
procedure agregarPeli(var l:listaP;p:pelicula);//SE DISPONE
procedure cargarPeliculas(var l:listaP);

procedure leerCritica(var c:critica);
 begin
    writeln('Ingrese codigo de pelicula ');readln(c.codPeli);
    if(c.codPeli<>CORTE)then begin
        writeln('Ingrese dni del critico ');readln(c.dni);
        writeln('Ingrese nombre del critico ');readln(c.nombre);
        writeln('Ingrese apellido del critico ');readln(c.apellido);
        writeln('Ingrese puntaje otorgado ');readln(c.puntaje);  
    end;
 end;
{procedure agregar(var l,ult:listaC;c:critica);
 var
    nue:listaC;
 begin
    new(nue);nue^.dato:=c;nue^.sig:=nil;
    if(l=nil)then l:=nue
    else ult^.sig:=nue;
    ult:=nue;
 end;
procedure cargarCriticas(var l:listaC);
 var
    ult:listaC;c:critica;
 begin
    leerCritica(c);
    while(c.codPeli<>CORTE)do begin
        agregar(l,ult,c);
        leerCritica(c);
    end;
 end;}
procedure inicializarGeneros(var g:generos);
 var
    i:integer;
 begin
    for i:=1 to DIMF do begin
        g[i].cantP:=0;
        g[i].puntTot:=0;
    end;
 end;
procedure descomponer(num:integer;var pares,impares:integer);
 begin
    while (num<>0)do begin
        if (num MOD 2=0)then pares:=pares+1
        else impares:=impares+1;
        num:=num DIV 10;
    end;
 end;     
function igualParImp(num:integer):boolean;
 var
    pares,impares:integer;
 begin
    pares:=0;impares:=0;
    descomponer(num,pares,impares);
    igualParImp:= (pares=impares);
 end;
procedure eliminarPelicula(var l:listaP;num:integer;var exito:boolean);
 var
    ant,act:listaP;
 begin
    act:=l;exito:=true;
    while((act<>nil)and(act^.dato.codigo<>num))do begin
        ant:=act;
        act:=act^.sig;
    end;
    if(act<>nil)then begin
        exito:=true;
        if(act=l)then l:=l^.sig
        else ant^.sig:=act^.sig;
        dispose(act);
    end;
 end;
procedure maximo(prom:real;cod:integer;var max:real;var codMax:integer);
 begin
    if(prom>max)then begin
       max:=prom;
       codMax:=cod;
    end;
 end;
procedure maxGeneros(vG:generos;var codMax:integer);
 var
    max:real;
    i:integer;
 begin
    max:=0;
    for i:= 1 to DIMF do 
        maximo(vG[i].prom,i,max,codMax);
 end;
procedure buscarPeli(l:listaP;var peli:listaP;num:integer);
 begin
    while((l<>nil)and (l^.dato.codigo<>num))do 
        l:=l^.sig;
    peli:=l;
 end;
procedure procesar(l:listaP;{lC:listaC};var vG:generos);
 var
    crit:critica
    i,auxCod,cantCrit:integer;
    auxPeli:listaP;
    prom,puntT:real;
 begin
    leerCritica(crit);
    while(crit.codPeli<>CORTE)do begin //recorro la lista de criticas
        auxCod:=crit.codPeli;//toma el codigo de la pelicula de las que esta leyendo criticas
        cantCrit:=0;//cuneta las cantidad de criticas
        puntT:=0;//suma los puntajes de las criticas
        while(((crit.codPeli<>CORTE)and(auxCod=crit.codPeli))do begin
            cantCrit:=cantCrit+1;
            puntT:=puntT+lC^.dato.puntaje;
            if(igualParImp(crit.dni))then
                writeln('El critico ',crit.nombre,'',crit.apellido,'posean la misma cantidad de dígitos pares que impares en su DNI.');
            
            //lC:=lC^.sig;
        end;
        prom:= puntT/cantCrit;//puntaje promedio de la pelicula auxCod
        buscarPeli(l,auxPeli,auxCod);//busca la pelicula con el codigo auxCod para saber el genero de la pelicula y actualizar su promedio
        vG[auxPeli^.dato.genero].cantP:=vG[auxPeli^.dato.genero].cantP+1;//suma la cantidad de peliculas de ese genero
        vG[auxPeli^.dato.genero].puntTot:=vG[auxPeli^.dato.genero].puntTot+ prom;//suma los puntajes promedio de las peliculas de ese genero
        auxPeli^.dato.promedio:=prom;//actualiza el promedio
    end;
    for i:= 1 to DIMF do
        vG[i].prom:=vG[i].puntTot/vG[i].cantP;//es el puntaje promedio para las peliculas de ese genero
 end;
//programa principal
var
    lPeliculas:listaP;
    lCriticas:listaC;
    vGen:generos;
    codMax,codEliminar:integer;
    exito:boolean;
begin
    lPeliculas:=nil;
    //lCriticas:=nil;
    cargarPeliculas(lPeliculas);
    //cargarCriticas(lCriticas);
    inicializarGeneros(vGen);
    procesar(lPeliculas,{lCriticas},vGen);
    maxGeneros(vGen,codMax);//busca el codigo del genero con mas puntaje
    writeln('El código de género que más puntaje obtuvo entre todas las críticas es: ',codMax);
    writeln('Ingrese codigo de pelicula a eliminar');readln(codEliminar);
    eliminarPelicula(lPeliculas,codEliminar,exito);
    if exito then writeln('Se elimino la pelicula con codigo ',codEliminar)
    else writeln('La pelicula con codigo ',codEliminar,' no se encontraba en la lista');
end;
