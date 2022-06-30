{El colectivo de fotógrafos ArgenPics desea conocer los gustos de sus seguidores en las redes sociales. Para ello, para cada una de las 200 fotos publicadas en su página de Facebook, cuenta con la siguiente información: título de la foto, el autor de la foto, cantidad de Me gusta, cantidad de clics y cantidad de comentarios de usuarios. Realizar un programa que lea y almacene esta información. Una vez finalizada la lectura, el programa debe procesar los datos e informar:
a) Título de la foto más vista (la que posee mayor cantidad de clics).
b) Cantidad total de Me gusta recibidas a las fotos cuyo autor es el fotógrafo “Art Vandelay”.
c) Cantidad de comentarios recibidos para cada una de las fotos publicadas en esa página.}

program Pr4ej11;
 const
    FOTOS=200;
 type
    foto=record
      titulo:string;
      autor:string;
      cantMg:integer;
      cantClics:integer;
      cantComents:integer;
    end;
    fotosPag=array[1..FOTOS]of foto;
    
procedure leerFoto(var f:foto);
 begin
    writeln('Ingrese titulo de la foto');readln(f.titulo);
    writeln('Ingrese autor de la foto');readln(f.autor);
    writeln('Ingrese cantidad de Me gusta de la foto');readln(f.cantMg);
    writeln('Ingrese cantidad de clics de la foto');readln(f.cantClics);
    writeln('Ingrese cantidad de comentarios de la foto');readln(f.cantComents);
 end;
 
procedure cargarFotos(var feed:fotosPag);
 var
    i:integer;
 begin
    for i:=1 to FOTOS do 
       leerFoto(feed[i]);
 end;
 
procedure maximo(num:integer;titulo:string;var max:integer;var tituloMax:string);
 begin
    if(num>max)then begin
       max:=num;
       tituloMax:=titulo;
     end;
 end;
 
procedure recorrerFotos(feed:fotosPag;var max,mgArt:integer;var tituloMax:string);
 var
   i:integer;
 begin
   max:=-1;
   mgArt:=0;
   for i:=1 to FOTOS do begin
      maximo(feed[i].cantClics,feed[i].titulo,max,tituloMax); //Inciso A
      writeln('Son ',feed[i].cantComents,' los comentarios de la foto numero ',i); //Inciso C
      if (feed[i].autor='Art Vandelay')then
         mgArt:=mgArt+ feed[i].cantMg;
     end;
 end;
{programa principal}
var
    feed:fotosPag;
    max,mgArt:integer;
    tituloMax:string;
begin
    cargarFotos(feed);
    recorrerFotos(feed,max,mgArt,tituloMax);
    writeln(tituloMax,' es el titulo de la foto más vista con ',max,' clics');
    writeln('Son ',mgArt,' los Me gusta totales recibidos a las fotos del autor Art Vandelay');  
end.  
