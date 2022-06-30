{La Facultad de Informática desea procesar la información de los alumnos que finalizaron la carrera de
Analista Programador Universitario. Para ello se deberá leer la información de cada alumno, a saber:
número de alumno, apellido, nombres, dirección de correo electrónico, año de ingreso, año de egreso
y las notas obtenidas en cada una de las 24 materias que aprobó (los aplazos no se registran).

1. Realizar un módulo que lea y almacene la información de los alumnos hasta que se ingrese el
 alumno con número de alumno -1, el cual no debe procesarse. Las 24 notas correspondientes a
 cada alumno deben quedar ordenadas de forma descendente.
 
2. Una vez leída y almacenada la información del inciso 1, se solicita calcular e informar:
 a. El promedio de notas obtenido por cada alumno.
 b. La cantidad de alumnos ingresantes 2012 cuyo número de alumno está compuesto
 únicamente por dígitos impares.
 c. El apellido, nombres y dirección de correo electrónico de los dos alumnos que más rápido
 se recibieron (o sea, que tardaron menos años)
 
3. Realizar un módulo que, dado un número de alumno leído desde teclado, lo busque y elimine de
 la estructura generada en el inciso 1. El alumno puede no existir
}


program Pr7ej7;
const
    dimF=3;
    CORTE=-1;
type
    notas=0..10;
    materia=record
       nombre:string;
       nota:notas;
    end;
    materias=array[1..dimF]of materia;
    alumno=record
       nombre:string;
       apellido:string;
       num:integer;
       correo:string;
       ingreso:integer;
       egreso:integer;
       mat:materias;
    end;
    lista=^nodo;
    nodo=record
       dato:alumno;
       sig:lista;
    end;
procedure inicializarNotas(var vMat:materias);
 var
    i:integer;
 begin
    for i:=1 to dimF do
       vMat[i].nota:=0;
 end;
procedure leerMat(var m:materia);
 begin
    writeln('Ingrese nombre de la materia ');readln(m.nombre);
    writeln('Ingrese nota ');readln(m.nota);
 end;
procedure insertarNota(var vMat:materias;m:materia;var dimL:integer);
 var
    pos,i:integer;
 begin
    pos:=1;
    while (pos<=dimL)and (m.nota<vMat[pos].nota)do 
        pos:=pos+1;
    for i:= dimL downto pos do 
        vMat[i+1]:=vMat[i];
    vMat[pos]:=m;
    dimL:=dimL+1;
 end;
procedure cargarNotas(var vMat:materias);
 var
    cont:integer;
    m:materia;
 begin
    cont:=0;
    inicializarNotas(vMat);
    while(cont<dimF)do begin
        leerMat(m);
        insertarNota(vMat,m,cont);
    end;
 end;
procedure imprimirNotas(vMat:materias);
 var
    i:integer;
 begin
    for i:=1 to dimF do
       writeln('Materia: ',vMat[i].nombre,' Nota: ',vMat[i].nota);
 end;
{procedure cargarNotas(var vMat:materias);
 var
    i:integer;
 begin
    for i:=1 to dimF do begin
        writeln('Ingrese nombre de la materia ');readln(vMat[i].nombre);
        writeln('Ingrese nota ');readln(vMat[i].nota);
    end;
 end;
 
procedure ordenarNotas(var vMat:materias);
 var
    aux:materia;
    i,p,j:integer;
 begin
    for i:=1 to dimF-1 do begin
       p:=i;
       for j:= i+1 to dimF do 
          if(vMat[j].nota>vMat[p].nota)then
             p:=j;
       aux:=vMat[p];
       vMat[p]:=vMat[i];
       vMat[i]:=aux;
    end;
 end;}
 
procedure leerAlumno(var al:alumno);
 begin
    writeln('Ingrese numero de alumno');readln(al.num);
    if(al.num<>CORTE)then begin
        writeln('Ingrese nombres del alumno ');readln(al.apellido);
        writeln('Ingrese apellido del alumno ');readln(al.nombre);
        writeln('Ingrese correo del alumno');readln(al.correo);
        writeln('Ingrese anio de ingreso');readln(al.ingreso);
        writeln('Ingrese anio de egreso');readln(al.egreso);
        cargarNotas(al.mat);
    end;
 end;
 
procedure agregarAlumno(var l:lista;al:alumno);
 var
    nue,ant,act:lista;
 begin
    new(nue);nue^.dato:=al;
    ant:=l;act:=l;
    while((act<>nil)and (al.num>act^.dato.num))do begin
       ant:=act;
       act:=act^.sig;
    end;
    if(ant=act)then l:=nue
    else ant^.sig:=nue;
    nue^.sig:=act;
 end;
 
procedure cargarAlumnos(var l:lista);
 var
    al:alumno;
 begin
    leerAlumno(al);
    while(al.num<>CORTE)do begin
       agregarAlumno(l,al);
       leerAlumno(al);
    end;
 end;
 
function promedio(vMat:materias):real;
 var
    i,suma:integer;
 begin
    suma:=0;
    for i:=1 to dimF do 
       suma:=suma+vMat[i].nota;
    promedio:=suma/dimF;
 end;
 
function todosImpares(num:integer):boolean;
 var
   pares:integer;
 begin
    pares:=0;
    while((num<>0)and (pares=0))do begin
        if(num MOD 2=0)then
           pares:=pares+1;
        num:=num DIV 10;
    end;
    todosImpares:= (pares=0);
 end;
 
procedure minimos (num:integer;nom,ape,correo:string;var min1,min2:integer;var nom1,ape1,correo1,nom2,ape2,correo2:string);
 begin
   if (num<min1)then begin
    min2:=min1;
    min1:=num;
    nom2:=nom1;
    nom1:=nom;
    ape2:=ape1;
    ape1:=ape;
    correo2:=correo1;
    correo1:=correo;
   end
  else
   if (num<min2)then begin
     min2:=num;
     nom2:=nom;
     ape2:=ape;
     correo2:=correo;
   end;
 end;
 
procedure eliminarAlumno(var l:lista;var exito:boolean);
 var
    ant,act:lista;
    num:integer;
 begin
    writeln('Ingrese numero de alumno que quiera eliminar de la lista ');readln(num);
    act:=l;
    exito:=false;
    while((act<>nil)and(act^.dato.num<num))do begin
       ant:=act;
       act:=act^.sig;
    end;
    if((act<>nil)and(act^.dato.num=num))then begin
       exito:=true;
       if(act=l)then l:=l^.sig
       else ant^.sig:=act^.sig;
       dispose(act);
    end;
 end;
 
procedure recorrerLista(l:lista;var nom1,nom2,ape1,ape2,correo1,correo2:string;var cant2012Imp:integer);
 var
    aniosCarrera,min1,min2:integer;
    prom:real;
 begin
    min1:=100;nom1:='';ape1:='';correo1:='';cant2012Imp:=0;
    while(l<>nil) do begin
        writeln('El promedio de notas obtenidas del alumno ',l^.dato.apellido,' ',l^.dato.nombre,' fue ',promedio(l^.dato.mat):2:2);
        if((l^.dato.ingreso=2012)and (todosImpares(l^.dato.num)))then
           cant2012Imp:=cant2012Imp+1;
        aniosCarrera:=(l^.dato.egreso-l^.dato.ingreso);
        minimos(aniosCarrera,l^.dato.nombre,l^.dato.apellido,l^.dato.correo,min1,min2,nom1,ape1,correo1,nom2,ape2,correo2);
        //imprimirNotas(l^.dato.mat);
        l:=l^.sig;
    end;
 end;
{procedure imprimirLista(l:lista);
 begin
    writeln('LISTA DE ALUMNOS');
    while(l<>nil) do begin
       writeln('Alumno: ',l^.dato.nombre,' ',l^.dato.apellido);
       l:=l^.sig;
    end;
 end;}
//programa principal
var
   l:lista;
   exito:boolean;
   cant2012Imp:integer;
   ape1,nom1,correo1,ape2,nom2,correo2:string;
begin
   l:=nil;
   cargarAlumnos(l);
   recorrerLista(l,nom1,nom2,ape1,ape2,correo1,correo2,cant2012Imp);
   writeln('Son ',cant2012Imp,' los alumnos ingresantes 2012 cuyo numero de alumno esta compuesto unicamente por digitos impares.');
   writeln('Los dos alumnos que más rápido se recibieron son: ',ape1,' ',nom1,' correo: ',correo1,' y ',ape2,' ',nom2,' correo: ',correo2);
   {writeln();
   imprimirLista(l);
   writeln();}
   eliminarAlumno(l,exito);
   if exito then writeln('El alumno se elimino de la lista ')
   else writeln('El numero de alumno no se encontraba en la lista ');
   {writeln();
   imprimirLista(l);}
end.  
