{La oficina de becas y subsidios desea optimizar los distintos tipos de ayuda financiera que se brinda a 
alumnos de la UNLP. Para ello, esta oficina cuenta con un registro detallado de todos los viajes realizados por 
una muestra de 1300 alumnos durante el mes de marzo. De cada viaje se conoce el código de alumno (entre 1 
y 1300), día del mes, Facultad a la que pertenece y medio de transporte (1. colectivo urbano; 2. colectivo 
interurbano; 3. tren universitario; 4. tren Roca; 5. bicicleta). Tener en cuenta que un alumno puede utilizar más 
de un medio de transporte en un mismo día.
Además, esta oficina cuenta con una tabla con información sobre el precio de cada tipo de viaje.
Realizar un programa que lea la información de los viajes de los alumnos y los almacene en una estructura de 
datos apropiada. La lectura finaliza al ingresarse el código de alumno -1, que no debe procesarse.
Una vez finalizada la lectura, informar:
a. La cantidad de alumnos que realizan más de 6 viajes por día
b. La cantidad de alumnos que gastan en transporte más de $80 por día
c. Los dos medios de transporte más utilizados.
d. La cantidad de alumnos que combinan bicicleta con algún otro medio de transporte
}


program Pr6ej14;
 const
    dimF=5;
 type
    subrangoAl=1..dimF;
    subrangoTransp=1..5;
    dias=1..31;
 
    viaje=record
       al:integer;
       dia:dias;
       facu:string;
       transp:subrangoTransp;
    end;
    
    listaV=^nodo;
    nodo= record
       dato:viaje;
       sig:listaV;
    end;
    infoTabla=record
       medio:string;
       valor:real;
    end;
    
    tabla=array[subrangoTransp]of infotabla;//se dispone
    transportes=array[subrangoTransp]of integer;//contador de viajes de cada transporte
    alumnos=array[subrangoAl]of listaV;
    
//MODULOS
procedure leerTabla(i:infoTabla);//se dispone
procedure cargarTabla(var t:tabla);//se dispone

procedure leerViaje(var v:viaje);
 begin
    writeln('Ingrese codigo de alumno');readln(v.al);
    if(v.al<>-1)then begin
       writeln('Ingrese dia de viaje');readln(v.dia);
       writeln('Ingrese Facultad');readln(v.facu);
       writeln('Ingrese medio de transporte utilizado');readln(v.transp);
    end;
 end;
 
procedure insertarNodo(var l:listaV;v:viaje); //recibe el viaje, lo ordena por dia
 var
    nue,ant,act:listaV;
 begin
    new(nue); nue^.dato:=v;
    ant:=l;
    act:=l;
    while((act<>nil)and (v.dia>act^.dato.dia))do begin
       ant:=act;
       act:=act^.sig;
    end;
    if(ant=act)then l:=nue
    else ant^.sig:=nue;
    nue^.sig:=act;
 end;

procedure cargarAlumnos(var vAlumnos:alumnos); //para cada alumnos contiene un lista de viajes ordenada por dia
 var
    i:integer;
    v:viaje;
 begin
    for i:=1to dimF do//inicializa las listas
       vAlumnos[i]:=nil;
    leerViaje(v);
    while(v.al<>-1) do begin
       insertarNodo(vAlumnos[v.al],v);
       leerViaje(v);
    end;
 end;
 
//incisos A y B
function gastoPorViaje(num:integer;t:tabla):real;
 begin
    gastoPorViaje:= t[num].valor;
 end; 
 
procedure recorrerLista(l:listaV;t:tabla;transpAComparar,gastoAComparar,viajesComparar:integer;var cantMas6Viajes,cantMas80pe,cantBiciYMas:integer;var vTransp:transportes);
 var
    auxDia,cantDias,si6,siMas80,viajesConBici,viajesTotales,viajesPorDia:integer;
    gastoPorDia:real;
 begin
    cantDias:=0;si6:=0;
    viajesConBici:=0;
    viajesTotales:=0;
    viajesConBici:=0;//cuenta la cant de viajes que hace en bicicleta
    while(l<>nil)do begin
       auxDia:=l^.dato.dia;//toma el valor del dia del mes que hizo los viajes
       cantDias:=cantDias+1;//contador del total de dias que hizo viajes
       viajesPorDia:=0;
       gastoPorDia:=0;
       siMas80:=0;//cuenta la cantidad de dias que el alumno supera los $80;
       while((l<>nil)and (auxDia=l^.dato.dia))do begin
           viajesPorDia:=viajesPorDia+1;
           viajesTotales:=viajesTotales+1;//lo uso para las bicicletas
           vTransp[l^.dato.transp]:=vTransp[l^.dato.transp]+1;
           gastoPorDia:= gastoPorDia+ gastoPorViaje(l^.dato.transp,t);
           if(l^.dato.transp=transpAComparar)then  //si el transp es el que quiero ver que usa, suma en la variables que cuenta cuantas veces lo usa 
              viajesConBici:=viajesConBici+1;
           l:=l^.sig;
       end;
       if (viajesPorDia>viajesComparar)then //compara los viajes del dia, con el valor que quiera ver si supera, en este caso 6
          si6:=si6+1;
       if(gastoPorDia>gastoAComparar)then//compara el gasto del dia con el gasto que quiera ver si supera, en este caso $80
          siMas80:=siMas80+1;
    end;
    if(si6=cantDias)then cantMas6Viajes:=cantMas6Viajes+1;// compara cuantas veces hizo mas de 6 viajes con la cant de dias que realizo viajes, si es igual hizo mas de 6 viajes por dia INCISO A
    if(siMas80=cantDias)then cantMas80pe:=cantMas80pe+1;//compara cuantas veces gasto mas de $80 con la cant de dias que realizo viajes, si es igual, gasto mas de $80 por dia INCISO B
    if((viajesConBici>=1)and(viajesConBici<viajesTotales))then
       cantBiciYMas:=cantBiciYMas+1;//compara la cant de viajes en bici, con la cantidad TOTAL de viajes, si es hay mas de 1 y menos que los totales, combino dos medios de transporte
 end;
 
//inciso C
procedure inicializarTransp(var t:transportes);
 var
    i:subrangoTransp;
 begin
    for i:= 1 to 5 do 
       t[i]:=0;
 end;
 
procedure maximos(cant,numDe:integer; var max1,max2,numMax1,numMax2:integer);
 begin
    if (cant>max1)then begin
       max2:=max1;
       max1:=cant;
       numMax2:=numMax1;
       numMax1:=numDe;
   end
  else
    if (cant>max2)then begin
       max2:=cant;
       numMax2:=numDe;
    end;
 end;
procedure maximosTransportes(t:transportes;var max1,max2,numMax1,numMax2:integer);
 var
    i:subrangoTransp;
 begin
    max1:=0;
    numMax1:=0;
    for i:= 1 to 5 do 
       maximos(t[i],i,max1,max2,numMax1,numMax2);
 end;

//recorrer el vector de alumnos procesando los datos pedidos
procedure recorrerAlumnos(al:alumnos;t:tabla;transpAComparar,gastoAComparar,viajesComparar:integer;var cantMas6Viajes,cantMas80pe,cantBiciYMas:integer;var vTransp:transportes;var max1,max2,numTranspMax1,numTranspMax2:integer);
 var
    i:subrangoAl;
 begin
    inicializarTransp(vTransp);
    cantMas6Viajes:=0;
    cantMas80pe:=0;
    cantBiciYMas:=0;
    for i:= 1 to dimF do
       recorrerLista(al[i],t,transpAComparar,gastoAComparar,viajesComparar,cantMas6Viajes,cantMas80pe,cantBiciYMas,vTransp);
    maximosTransportes(vTransp,max1,max2,numTranspMax1,numTranspMax2);
 end;
//informa todos los incisos
procedure informar(cantMas6Viajes,cantMas80pe,cantBiciYMas,numTranspMax1,numTrasnpMax2:integer);
 begin
   writeln('Son ', cantMas6Viajes,' los alumnos que realizan mas de 6 viajes por dia.');
   writeln('Son ', cantMas80pe,' los alumnos que gastan en transporte más de $80 por dia.');
   writeln('El medio de transporte más utilizado es ', numTranspMax1,' y le sigue el ',numTrasnpMax2);
   writeln('Son ',cantBiciYMas,' los alumnos que combinan bicicleta con algun otro medio de transporte.');
 end;
 
//programa principal    
var
   vAlumnos:alumnos;
   t:tabla;
   vTransporte:transportes;
   cantMas6Viajes,cantMas80pe,cantBiciYMas,max1,max2,numTranspMax1,numTranspMax2:integer;
begin
   cargarTabla(t);//se dispone
   cargarAlumnos(vAlumnos);
   recorrerAlumnos(vAlumnos,t,5,80,6,cantMas6Viajes,cantMas80pe,cantBiciYMas,vTransporte,max1,max2,numTranspMax1,numTranspMax2);
   informar(cantMas6Viajes,cantMas80pe,cantBiciYMas,numTranspMax1,numTranspMax2)
 end.
