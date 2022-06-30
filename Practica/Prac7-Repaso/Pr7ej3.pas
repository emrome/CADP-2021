{Una remisería dispone de información acerca de los viajes realizados durante el mes de mayo de
2020. De cada viaje se conoce: número de viaje, código de auto, dirección de origen, dirección de
destino y kilómetros recorridos durante el viaje. Esta información se encuentra ordenada por código
de auto y para un mismo código de auto pueden existir 1 o más viajes. Se pide:
a. Informar los dos códigos de auto que más kilómetros recorrieron.
b. Generar una lista nueva con los viajes de más de 5 kilómetros recorridos, ordenada por número
de viaje.
}


program Pr7ej3;
 type
    viaje=record
       numViaje:integer;
       codAuto:integer;
       origen:string;
       destino:string;
       km:integer; 
    end;
    lista=^nodo;
    nodo=record
       dato:viaje;
       sig:lista;
    end;
    
procedure leerViaje(var v:viaje);//SE DISPONE
procedure insertar(var l:lista;v:viaje);//SE DISPONE
procedure cargarLista(var l:lista);//SE DISPONE

procedure maximos(cod,num:integer;var max1,max2,cod1,cod2:integer);
 begin
    if (num>max1)then begin
       max2:=max1;
       max1:=num;
       cod2:=cod1;
       cod1:=cod;
    end
    else if (num>max2)then begin
       max2:=num;
       cod2:=cod;
    end;
 end;
procedure agregarViaje(var l:lista;v:viaje);
 var
    nue,ant,act:lista;
 begin
    new(nue);
    nue^.dato:=v;
    ant:=l;
    act:=l;
    while((l<>nil)and(act^.dato.numViaje<v.numViaje))do begin
       ant:=act;
       act:=act^.sig;
    end;
    if(act<>nil)then begin
       if(act=l)then l:=nue
       else
         ant^.sig:=nue; 
       nue^.sig:=act;
    end;
 end;
 
procedure recorrerLista(l:lista;var cod1,cod2:integer;var lista2:lista);
 var
    max1,max2:integer;
    auxAuto,kmTotales:integer;
 begin
    max1:=0;
    cod1:=0;
    while(l<>nil) do begin
        auxAuto:=l^.dato.codAuto;
        kmTotales:=0;
        while((l<>nil)and(auxAuto=l^.dato.codAuto))do begin
            kmTotales:=kmTotales+l^.dato.km;
            if(l^.dato.km>5)then 
               agregarViaje(lista2,l^.dato);
            l:=l^.sig;
        end;
        maximos(auxAuto,kmTotales,max1,max2,cod1,cod2);
    end;  
 end;
//programa principal
var
   l,lista2:lista;
   cod1,cod2:integer;
begin
   l:=nil;
   lista2:=nil;
   cargarLista(l);//SE DISPONE
   recorrerLista(l,cod1,cod2,lista2);
   writeln('El auto con codigo ',cod1,' fue el que mas km recorrio, y le sigue el auto con codigo ',cod2,'.');
end.
