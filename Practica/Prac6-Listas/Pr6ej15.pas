{15. La cátedra de CADP está organizando la cursada para el año 2019. Para ello, dispone de una lista con todos 
los alumnos que cursaron EPA. De cada alumno se conoce su DNI, apellido, nombre y la nota obtenida. Escribir 
un programa que procese la información de alumnos disponible y los distribuya en turnos utilizando los 
siguientes criterios:
- Los alumnos que obtuvieron al menos 8 en EPA deberán ir a los turnos 1 ó 4.
- Los alumnos que obtuvieron entre 5 y 8 deberán ir a los turnos 2, 3 ó 5.
- Los alumnos que no alcanzaron la nota 5 no se les asignará turno en CADP.
Al finalizar, el programa debe imprimir en pantalla la lista de alumnos para cada turno.
Nota: La distribución de alumnos debe ser lo más equitativa posible.
}

program Pr6ej15;
 const
    dimf=5;
 type
    notas=1..10;
    
    alumno=record
      dni:integer;
      apellido:string;
      nombre:string;
      nota:notas;
    end;
    
    listaA=^nodo; //SE DISPONE
    nodo=record
      dato:alumno;
      sig:listaA;
    end;
    
    turnos=array[1..dimF]of listaA;
    
procedure leerAlumno(var al:alumno); //SE DISPONE
procedure agregarAlumno(var l:listaA;al:alumno);
 var
    nue:listaA;
 begin
    new(nue);
    nue^.dato:=al;
    nue^.sig:=l;
    l:=nue;
 end;
procedure cargarLista(var l:listaA);//SE DISPONE

procedure inicializarTurnos(var t:turnos);
 var
    i:integer;
 begin
    for i:= 1 to dimF do 
       t[i]:=nil;
 end;
 
procedure recorrerLista(l:listaA; var t:turnos);
 var
    auxAp,auxDes:integer;
 begin
    auxAp:=1;auxDes:=2;
    inicializarTurnos(t);
    while (l<>nil) do begin
        if(l^.dato.nota >=8)then begin
            agregarAlumno(t[auxAp],l^.dato);
            if(auxAp=1)then auxAp:=auxAp +3
            else auxAp:=auxAp-3;
        end
        else 
            if((l^.dato.nota<8)and (l^.dato.nota>=5))then begin
               agregarAlumno(t[auxDes],l^.dato);
               if (auxDes=2) then 
                  auxDes:=auxDes+1
               else
                  if (auxDes=3) then 
                     auxDes:=auxDes+2
                  else 
                     auxDes:=auxDes-3;//auxDes=5
            end;
        l:=l^.sig;
    end;
 end;

procedure imprimirLista(l:listaA);
 begin
    while(l<>nil)do begin
       writeln('DNI:',l^.dato.dni);
       writeln('Apellido:',l^.dato.apellido);
       writeln('Nombre:',l^.dato.nombre);
       l:=l^.sig;
    end;
 end;
 
procedure imprimirTurnos(t:turnos);
 var
    i:integer;
 begin
    for i:=1 to dimF do begin
       writeln('Lista turno ',i);
       imprimirLista(t[i]);
       writeln();
    end;
 end;
 
//programa principal
var
   l:listaA;
   vTurnos:turnos;
begin
   l:=nil;
   cargarLista(l);//SE DISPONE
   recorrerLista(l,vTurnos);
   imprimirTurnos(vTurnos);
end.
