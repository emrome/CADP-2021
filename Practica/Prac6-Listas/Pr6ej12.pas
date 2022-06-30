{Una empresa desarrolladora de juegos para teléfonos celulares con Android dispone de información de 
todos los dispositivos que poseen sus juegos instalados. De cada dispositivo se conoce la versión de Android 
instalada, el tamaño de la pantalla (en pulgadas) y la cantidad de memoria RAM que posee (medida en GB). La 
información disponible se encuentra ordenada por versión de Android. Realizar un programa que procese la 
información disponible de todos los dispositivos e informe:
a. La cantidad de dispositivos para cada versión de Android.
b. La cantidad de dispositivos con más de 3 GB de memoria y pantallas de a lo sumo a 5 pulgadas.
c. El tamaño promedio de las pantallas de todos los dispositivos.
}


program Pr6ej12;
 type
    celular=record
        version:real;//seria real pero para que funcione string
        tam:integer;
        RAM:integer;
    end;
    listaC=^nodo;
    nodo=record
        dato:celular;
        sig:listaC;
    end;
    
procedure leerCelular(var c:celular);  //se dispone

procedure insertarOrdenado(var l:listaC; c:celular); //se dispone

procedure cargarCelulares(var l:listaC);//se dispone

function cumpleCondiciones(valor1,valor2,cond1,cond2:integer):boolean;
 begin
    cumpleCondiciones:= ((valor1>cond1)and(valor2>= cond2));
 end;
 
procedure recorrerLista(l:listaC; var cantCondiciones:integer;var promPantallas:real);
 var
    auxVersion:real;
    cantTotal,tamTotal,cantVersion:integer;
 begin
    cantTotal:=0;
    tamTotal:=0;
    while(l<>nil) do begin
       auxVersion:=l^.dato.version;
       cantVersion:=0;
       while((l<>nil)and(l^.dato.version=auxVersion))do begin
          cantVersion:=cantVersion+1;
          cantTotal:=cantTotal+1;
          tamTotal:= tamTotal + l^.dato.tam;
          if (cumpleCondiciones(l^.dato.RAM,l^.dato.tam,3,5))then
             cantCondiciones:=cantCondiciones+1;
          l:=l^.sig;
       end;
    writeln('Son ',cantVersion,' los dispositivos con version ',auxVersion);
    end;
    promPantallas:= tamTotal/cantTotal;
 end;

//programa principal
var
   l:listaC;
   tamProm:real;
   cantCondiciones:integer;
begin
   l:=nil;
   cantCondiciones:=0;
   cargarCelulares(l);//SE DISPONE
   recorrerLista(l,cantCondiciones,tamProm);
   writeln('Son ',cantCondiciones,' los dispositivos con mas de 3 GB de memoria y pantallas de a lo sumo a 5 pulgadas.');
   writeln('El tamano promedio de las pantallas de todos los dispositivos es ',tamProm:2:2,' pulgadas');
end.
