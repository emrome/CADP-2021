{La empresa Amazon Web Services (AWS) dispone de la información de sus 500 clientes monotributistas más grandes del país. De cada cliente conoce la fecha de firma del contrato con AWS, la categoría del monotributo (entre la A y la F), el código de la ciudad donde se encuentran las oficinales (entre 1 y 2400) y el monto mensual acordado en el contrato. La información se ingresa ordenada por fecha de firma de contrato (los más antiguos primero, los más recientes últimos).
Realizar un programa que lea y almacene la información de los clientes en una estructura de tipo vector. Una vez almacenados los datos, procesar dicha estructura para obtener:
* 
1) Cantidad de contratos por cada mes y cada año, y año en que se firmó la mayor cantidad de contratos
2) Cantidad de clientes para cada categoría de monotributo
3) Código de las 10 ciudades con mayor cantidad de clientes
4) Cantidad de clientes que superan mensualmente el monto promedio entre todos los clientes.}

program pr4ej5;
const
  dimF=500;
type
   letraCat= 'A'..'F';
   codCiu=1..2400;
   fecha=record
      dia:integer;
      mes:integer;
      anio:integer;
    end;
   cliente=record
     categoria:letraCat;
     ciudad:codCiu;
     monto:real;
     fec:fecha;
    end;
   ciudad=record
     cod:integer;
     cant:integer;
   end;
   
   clientes=array[1..dimF]of cliente;
   meses=array[1..12] of integer;
   categorias=array[letraCat]of integer;
   ciudades=array[1..500]of ciudad;
   
procedure leerFecha(var f:fecha);
 begin
     writeln('Ingrese dia de firma del contrato ');readln(f.dia);
     writeln('Ingrese mes de firma del contrato ');readln(f.mes);
     writeln('Ingrese anio de firma del contrato ');readln(f.anio);
 end;
 
procedure leerCliente(var cl:cliente);
 begin
    leerfecha(cl.fec);
    writeln('Ingrese categoria del monotributo ');readln(cl.categoria);
    writeln('Ingrese codigo de la ciudad donde se encuentran las oficinales ');readln(cl.ciudad);
    writeln('Ingrese monto mensual acordado en el contrato ');readln(cl.monto);
 end;
 
procedure cargarClientes(var cl:clientes);
 var
   i:integer;
 begin
    for i:=1 to dimF do
      leerCliente(cl[i]);
 end;
 
procedure inicializarMeses(var m:meses);
 var
   i:integer;
 begin
   for i:= 1 to 12 do
     m[i]:=0;
 end;
 
procedure inicializarCat(var cat:categorias);
var
   i:letraCat;
 begin
   for i:= 'A' to 'F' do
     cat[i]:=0;
 end;
procedure inicializaCiudades(var ciu:ciudades);
var
   i:integer;
 begin
   for i:= 1 to 500 do begin
       ciu[i].cod:=0;
       ciu[i].cant:=0;
     end;
 end;
 
procedure maxAnio(var anioMax,contMax:integer;anio,num:integer);
 begin
    if (num>=contMax)then
     begin
        anioMax:=anio;
        contMax:=num;
      end;
 end;
 
function cliMasMontProm(cl:clientes;promedio:real):integer;
 var
   i,contador:integer;
 begin
   contador:=0;
   for i:= 1 to dimF do
      if (cl[i].monto>promedio)then
        contador:=contador+1;
   cliMasMontProm:=contador;
 end;

procedure cargarCiudades (var ciud:ciudades; codigo:integer);
 begin
     ciud[codigo].cant:=ciud[codigo].cant+1;
     if (ciud[codigo].cod<>codigo)then
        ciud[codigo].cod:= codigo;
 end;

procedure ordenarVector(var ciud:ciudades;dimF:integer);
 var
   i,j:integer;                                 // i,p,j:integer
   exito:boolean;                               //
   aux:ciudad;                                  //
 begin                                          //begin
   i:=1;                                        //  for i:1 to dimF-1 do
   exito:=true;                                 //   begin  
   while((i<=dimF-1)and exito)do begin          //      p:=i;
     exito:=false;                              //      for j:=i+1 to dimF do  
     for j:=1 to dimF-1 do                      //         if (ciud[j].cant > ciud[p].cant) then
       if(ciud[j].cant < ciud[j+1].cant)then    //             p:=j; intercambia ciud[i].cant y ciud[p].cant
         begin                                  //      aux:= ciud[p];
            exito:=true;                        //      ciud[p]:=ciud[i];
            aux:=ciud[j];                       //      ciud[i]:= aux;
            ciud[j]:=ciud[j+1];                 //    end;
            ciud[j+1]:=aux;                     //end;
         end;
     i:=i+1;  
    end;
 end;
 
procedure imprimir10Ciud (ciud:ciudades);
 var
    i:integer;  
 begin
    writeln('Las 10 ciudades con mayor cantidad de clientes son: ');
    for i:=1 to 10 do
      writeln('La ciudad ',ciud[i].cod,' con ',ciud[i].cant,' clientes');
 end;
procedure recorrerClientes(var cl:clientes;var cat:categorias;var me:meses;var ciud:ciudades;var anioMax,contMax:integer;var promedio:real);
 var
   cantClientes,auxAnio,contratosAnio:integer;
   montoTotal:real;
 begin
    contMax:=0;
    cantClientes:=1;
    montoTotal:=0;
    inicializaCiudades(ciud);
    inicializarCat(cat);
    inicializarMeses(me);
    while(cantClientes<=dimF) do begin
       auxAnio:=cl[cantClientes].fec.anio;
       contratosAnio:=0;
       while(auxAnio=cl[cantClientes].fec.anio) do begin
            contratosAnio:=contratosAnio+1;
            me[cl[cantClientes].fec.mes]:=me[cl[cantClientes].fec.mes]+1;
            cat[cl[cantClientes].categoria]:=cat[cl[cantClientes].categoria]+1;
            cargarCiudades (ciud,cl[cantClientes].ciudad);
            montoTotal:=montoTotal+ cl[cantClientes].monto;
            cantClientes:=cantClientes+1;
         end;
       writeln('La cantidad de contratos del anio ',auxAnio,' es ',contratosAnio); //parte del 1
       maxAnio(anioMax,contMax,auxAnio,contratosAnio);//parte del 1
     end;
    promedio:= montoTotal/dimF;
 end;
procedure imprimirMeses(me:meses);
var
 i:integer;
begin
  for i:=1 to 12 do
    writeln('La cantidad de contratos del mes ',i,' es ',me[i]);
end;
procedure imprimirCategorias(cat:categorias);
var
 i:letraCat;
begin
  for i:='A' to 'F' do
    writeln('La cantidad de clients de la categoria ',i,' es ',cat[i]);
end;

//programa principal 
var
   clie:clientes;
   cate:categorias;
   ciud:ciudades;
   month:meses;
   anioMax,contMax:integer;
   promedio:real;
begin
   cargarClientes(clie);
   recorrerClientes(clie,cate,month,ciud,anioMax,contMax,promedio);
   imprimirMeses(month);{1}
   imprimirCategorias(cate);{2}
   ordenarVector(ciud,2400); {3}
   imprimir10Ciud(ciud);{3}
   writeln('El anio con mas contratos es ',anioMax,' con ',contMax,' contratos');
   writeln('La cantidad de clientes que superan mensualmente el monto promedio de $',promedio:2:2,' entre todos los clientes es ',cliMasMontProm(clie,promedio)); {4}
   
   
end.
