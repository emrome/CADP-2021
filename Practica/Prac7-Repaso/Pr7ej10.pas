{Una compañía de venta de insumos agrícolas desea procesar la información de las empresas a las que
les provee sus productos. De cada empresa se conoce su código, nombre, si es estatal o privada,
nombre de la ciudad donde está radicada y los cultivos que realiza (a lo sumo 20). Para cada cultivo
de la empresa se registra: tipo de cultivo (trigo, maíz, soja, girasol, etc.), cantidad de hectáreas
dedicadas y la cantidad de meses que lleva el ciclo de cultivo.
a. Realizar un programa que lea la información de las empresas y sus cultivos. Dicha información
se ingresa hasta que llegue una empresa con código -1 (la cual no debe procesarse). Para cada
empresa se leen todos sus cultivos, hasta que se ingrese un cultivo con 0 hectáreas (que no
debe procesarse).
Una vez leída y almacenada la información, calcular e informar:
b. Nombres de las empresas radicadas en “San Miguel del Monte” que cultivan trigo y cuyo código
de empresa posee al menos dos ceros.
c. La cantidad de hectáreas dedicadas al cultivo de soja y qué porcentaje representa con respecto
al total de hectáreas.
d. La empresa que dedica más tiempo al cultivo de maíz
e. Realizar un módulo que incremente en un mes los tiempos de cultivos de girasol de menos de 5
hectáreas de todas las empresas que no son estatales.
}


program Pr7ej10;
const
    dimF=20;
    CORTEmp=-1;
    CORTECul=0; 
    COND='San Miguel de Monte';
type
    cultivo=record
        tipo:string;
        ha:integer;
        ciclo:integer;
    end;
    cultivos=array[1..dimF]of cultivo
    cultEmpresa=record
        info=cultivos;
        dimL=integer;
    end;
    empresa=record
        cod:integer;
        nombre:string;
        gestion:string;
        ciudad:string;
        eCultivos:cultEmpresa;
    end;
    lista=^nodo;
    nodo=record
        dato:empresa;
        sig:lista;
    end;
procedure leerCultivo(var c:cultivo);
 begin
    writeln('Ingrese cantidad de hectareas dedicadas ');readln(c.ha);
    if(c.ha<>CORTECul)then begin
        writeln('Ingrese tipo de cultivo ');readln(c.tipo);
        writeln('Ingrese cantidad de meses del ciclo de cultivo ');readln(c.ciclo);
    end;
 end;
procedure cargarCultivos(var c:cultEmpresa);
 var
    aux:cultivo;
 begin
    c.dimL:=0;
    leerCultivo(aux);
    while((aux.ha<>CORTECul)and(c.dimL<=dimF))do begin
        c.dimL:=c.dimL+1;
        c.info[c.dimL]:=aux;
        leerCultivo(aux);
    end;
 end;
procedure leerEmpresa(var emp:empresa);
 begin
    writeln('Ingrese codigo de empresa ');readln(emp.cod);
    if(emp.cod<>CORTEmp)then begin
        writeln('Ingrese nombre de empresa ');readln(emp.cod);
        writeln('Ingrese si es privada o estatal ');readln(emp.gestion);
        writeln('Ingrese ciudad donde radica ');readln(emp.ciudad);
        cargarCultivos(emp.eCultivos);
    end;
 end;
procedure agregar(var l:lista;emp:empresa);
 var
    nue:lista;
 begin
    new(nue);
    nue^.dato:=emp;
    nue^.sig:=l;
    l:=nue;
 end;
procedure cargarEmpresas(var l:lista);
 var
    emp:empresa;
 begin
    leerEmpresa(emp);
    while(emp.cod<>CORTEmp)do begin
        agregar(l,emp);
        leerEmpresa(emp);
    end;
 end;
function alMenosDos0(num:integer):boolean
 var
    cant0:integer;
 begin
    cant0:=0;
    while((num<>0)and(cant0<2))do begin
        if ((num MOD 10)=0) then cant0:=cant0+1;
        num:=num DIV 10;
    end;
    alMenosDos0:= cant0=2;
 end;
function cultivaTrigo(cult:cultEmpresa):boolean
 var
    pos:integer;
    si:boolean;
 begin
    si:=false;
    pos:=1;
    while((pos<=cult.dimL)and(not si))do 
        if(cult.info[pos].tipo='Trigo')then si:=true
        else pos:=pos+1;
    cultivaTrigo:=si;
 end;
procedure recorrerCultivos(cult:cultEmpresa;var haSoja,haTotales,mesesMaiz:integer;var siMaiz:boolean);
 var
    i:integer;
 begin
    siMaiz:=false;
    mesesMaiz:=0;
    for i:= 1 to cult.dimL do begin
        if(cult.info[i].tipo='Soja')then haSoja:=haSoja+cult.info[i].ha;
        else if (cult.info[i].tipo='Maiz')then begin
           siMaiz:=true;
           mesesMaiz:=cult.info[i].ciclo;
        end;
        haTotales:=haTotales+cult.info[i].ha;
    end;
 end;
procedure incrementoMes(var cul:cultEmpresa);
 var
    siGirasol:boolean;
    pos:integer;
 begin
    pos:=1;
    siGirasol:=false
    while((pos<=cul.dimL)and (not siGirasol))do begin
        if(cul.info[pos].tipo='Girasol')then begin
            siGirasol:=true;
            if(cul.info[pos].ha<5)then
                cul.info[pos].ciclo:=cul.info[pos].ciclo+1;
        end
        else pos:=pos+1;
    end;
 end;
procedure maximo(num:integer;nombre:string;var max:integer;var nomMax:string);
 begin
   if (num>max)then begin
     max:=num;
     nomMax:=nombre;
   end;
 end;
procedure procesar(l:lista;var nomMax:string;var haSoja:integer;var porcentaje:real);
 var
    haTotales,max,mesesMaiz:integer;
    siMaiz:boolean;
 begin
    haTotales:=0;max:=0;
    while(l<>nil)do begin
        if(l^.dato.ciudad=COND)and (alMenosDos0(l^.dato.cod)then 
           if(cultivoTrigo(l^.dato.eCultivos))then
               writeln('La empresa ',l^.dato.nombre,' radicada en “San Miguel del Monte” cultiva trigo y su código de empresa posee al menos dos ceros.');
        recorrerCultivos(l^.dato.eCultivos,haSoja,haTotales,mesesMaiz,siMaiz);
        if(siMaiz)then maximo(mesesMaiz,l^.dato.nombre,max,nomMax);
        if(l^.dato.gestion='privada')then incrementoMes(l^.dato.eCultivos);
        l:=l^.sig;
    end;
    porcentaje:=haSoja*100/haTotales;
 end;
//programa principal
var
    l:lista;
    haSoja:integer;
    porcentajeSoja:real;
    nomMax:string;
begin
    l:=nil;
    cargarEmpresas(l);
    procesar(l,nomMax,haSoja,porcentajSoja);
    writeln('Las hectareas dedicadas al cultivo de soja son ',haSoja,' y representan el %',porcentajeSoja:2:2);
    writeln('La empresa que decica mas tiempo al cultivo de maiz es ',nomMax);
end;
