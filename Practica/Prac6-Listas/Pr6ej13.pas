{. El Portal de Revistas de la UNLP está estudiando el uso de sus sistemas de edición electrónica por parte de 
los usuarios. Para ello, se dispone de información sobre los 3600 usuarios que utilizan el portal. De cada usuario 
se conoce su email, su rol (1: Editor; 2. Autor; 3. Revisor; 4. Lector), revista en la que participa y cantidad de 
días desde el último acceso.
a. Imprimir el nombre de usuario y la cantidad de días desde el último acceso de todos los usuarios de la revista 
Económica. El listado debe ordenarse a partir de la cantidad de días desde el último acceso (orden ascendente).
b. Informar la cantidad de usuarios por cada rol para todas las revistas del portal.
c. Informar los emails de los dos usuarios que hace más tiempo que no ingresan al portal
}


program Pr6ej13;
const
   dimF=3600;
 type
    rangoRol=1..4;
    usuario=record
       nombre:string;
       email:string;
       rol:rangoRol;
       revista:string;
       ultAcceso:integer;
    end;
   
    roles=array[rangoRol]of integer;
    usuarios=array[1..dimF]of usuario;
    listaE=^nodo;
    nodo=record
      dato:usuario;
      sig:listaE;
    end;

procedure leerUsuario(var u:usuario);//SE DISPONE lo hice para verificar
 begin
    writeln('Ingrese nombre de usuario: ');readln(u.nombre);
    writeln('Ingrese email: ');readln(u.email);
    writeln('Ingrese rol: "1: Editor; 2. Autor; 3. Revisor; 4. Lector" ');readln(u.rol);
    writeln('Ingrese nombre de revista: ');readln(u.revista);
    writeln('Ingrese cant de dias desde ultimo acceso');readln(u.ultAcceso);
 end;
procedure cargarUsuarios(var vUsuarios:usuarios);//SE DISPONE lo hice para verificar
 var
    i:integer;
    u:usuario;
 begin
    for i:=1 to dimF do begin
      leerUsuario(u);
      vUsuarios[i]:=u;
    end;
 end;
procedure inicializarRoles(var r:roles);
 var
    i:rangoRol;
 begin
    for i:= 1 to 4 do
       r[i]:=0;
 end;
 
procedure imprimirRoles(r:roles);
 var
    i:rangoRol;
 begin
   for i:= 1 to 4 do 
      writeln('Hay ',r[i],' usuarios del rol ',i);
 end;

procedure maximos(num:integer;nombre:string; var max1,max2:integer;var nom1,nom2:string);
begin
  if (num>max1)then begin
    max2:=max1;
    max1:=num;
    nom2:=nom1;
    nom1:=nombre; //seria el email
   end
  else
   if (num>max2)then begin
     max2:=num;
     nom2:=nombre;
   end;
 end;
 
procedure insertarNodo(var l:listaE;u:usuario);
 var
    nue,ant,act:listaE;
 begin
    new(nue); nue^.dato:=u;
    ant:=l;act:=l;
    while((act<>nil)and (u.ultAcceso>nue^.dato.ultAcceso))do begin
      ant:=act;
      act:=act^.sig;
    end;
    if(ant=act)then l:=nue
    else ant^.sig:=nue;
    nue^.sig:=act;
 end;
 
procedure imprimirListado(l:listaE);
 begin
    writeln('Listado de usuarios de la revista Economica:');
    while(l<>nil) do begin
       writeln('nombre de usuario: ',l^.dato.nombre,' --ultimo acceso: ',l^.dato.ultAcceso,' dias.');
       l:=l^.sig;
    end;
 end;
 
procedure recorrerUsuarios(vU:usuarios;var l:listaE; var vRoles:roles;var email1,email2:string;var max1,max2:integer);
 var
    i:integer;
 begin
    email1:='';
    max1:=0;
    inicializarRoles(vRoles);
    for i:= 1 to dimF do begin
       if(vU[i].revista='Economica')then
         insertarNodo(l,vU[i]);
       vRoles[vU[i].rol]:=vRoles[vU[i].rol]+1 ;//suma 1 en el rol del usuario que se esta leyendo
       maximos(vU[i].ultAcceso,vU[i].email,max1,max2,email1,email2);
    end;
 end;
 
//programa principal
var
  l:listaE;
  vRoles:roles;
  vUsuarios:usuarios;
  email1,email2:string;
  max1,max2:integer;
begin
  l:=nil;
  cargarUsuarios(vUsuarios);//SE DISPONE
  recorrerUsuarios(vUsuarios,l,vRoles,email1,email2,max1,max2);
  imprimirListado(l);//inciso A
  imprimirRoles(vRoles);//inciso B
  writeln('Emails de los dos usuarios que hace mas tiempo no ingresa al portal: '); //inciso C
  writeln('Email: ',email1,' --Ultimo acceso: ',max1);
  writeln('Email: ',email2,' --Ultimo acceso: ',max2);
end.
  
    
