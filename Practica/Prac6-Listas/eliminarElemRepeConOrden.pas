procedure eliminarElemUnico(var l:lista; var exito:boolean; valor:integer);
 var
   act,ant:lista;
 begin
   exito:=false;
   act:=l;
   while ((act<>nil)and (act^.num<>valor))do begin
      ant:=act;
	  act:=act^.sig;
	end;
	if(act<>nil) then begin
	    exito:=true;
	    if(act=l)then
	       l:=l^.sig
	    else
	       ant^.sig:=act^.sig //hago el enlace
	    dispose(act);
	end;
	
procedure eliminarElemRepeSinOrden(var l:lista; valor:integer);
var
	ant,act:lista;
 begin
	act:=l;
	while (act<>nil)do begin//recorre hasta encontrar la PRIMER OCURRENCIA
	  if(act^.num<>valor)then begin
		 ant:=act;
		 act:=act^.sig;
	  end
      else begin
		  if(act=l)then 
		     l:=l^.sig
		  else
		     ant^.sig:=act^.sig; //conecto el anterior y el sig del que elimino
	      dispose(act);
	      act:=ant^.sig;//sigo desde el siguiente del que elimine
    end;
 end; 

procedure eliminarElemRepeConOrden(var l:lista; valor:integer);
 var
	ant,act:lista;
 begin
	act:=l;
	while ((act<>nil)and (act^.num<valor))do begin//recorre hasta encontrar la PRIMER OCURRENCIA
		 ant:=act;
		 act:=act^.sig;
	end;
    while((act<>nil)and(act^.num=valor))do begin
		if(act=l)then 
		  l:=l^.sig
		ant^.sig:=act^.sig; //conecto el anterior y el sig del que elimino
	    dispose(act);
	    act:=ant^.sig;//sigo desde el siguiente del que elimine
    end;
 end; 


