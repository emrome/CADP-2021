{Una maternidad dispone información sobre sus pacientes. De cada una se conoce: nombre, apellido y peso registrado el primer día de cada semana de embarazo (a lo sumo 42). La maternidad necesita un programa que analice esta información, determine e informe:
a. Para cada embarazada, la semana con mayor aumento de peso.
b. El aumento de peso total de cada embarazada durante el embarazo.
}


program Pr7ej4;
const
    dimF=42;
type
    pesoSemanas=array[1..dimF]of real;
    paciente=record
       nombre:string;
       apellido:string;
       semanas:pesoSemanas;
       cantSemanas:integer;
    end;
    lista=^nodo;
    nodo=record
       dato:paciente;
       sig:lista;
    end;
procedure cargarSemanas(var pS:pesoSemanas;var dl:integer);//SE DISPONE
procedure leerPaciente(var p:paciente);//SE DISPONE
procedure cargarLista(l:lista);//SE DISPONE

procedure maximo(num:integer;peso:real;var max:real;var numSem:integer);
 begin
   if (peso>max)then begin
     max:=peso;
     numSem:=num;
   end;
 end;
procedure semPesoMax(vSem:pesoSemanas;cantSem:integer;var maxSem:integer);
 var
    i:integer;
    maxPeso:real;
 begin
    maxPeso:=0;
    for i:=2 to cantSem do
       maximo(i,vSem[i],maxPeso,maxSem);
    maxSem:=maxSem-1;//es la semana anterior a la que se mide el peso
 end;
procedure recorrerLista(l:lista);
 var
    aumentoPeso:real;
    maxSem:integer;
 begin
    while(l<>nil)do begin
       maxSem:=0;
       semPesoMax(l^.dato.semanas,l^.dato.cantSemanas,maxSem);
       aumentoPeso:=l^.dato.semanas[l^.dato.cantSemanas]-l^.dato.semanas[1];
       writeln('Paciente: ',l^.dato.apellido,' ',l^.dato.nombre);
       writeln('Semana con mas aumento de peso: ',maxSem);
       writeln('Aumento de peso total: ', aumentoPeso:2:2);
       l:=l^.sig;
    end;
 end;
//programa principal
var
   l:lista;
begin
   l:=nil;
   cargarLista(l);//SE DISPONE
   recorrerLista(l);
end;
