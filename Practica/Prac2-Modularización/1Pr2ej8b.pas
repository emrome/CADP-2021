program anidamientos;
 var
 letra : char;
 function analizarLetra : boolean;
   begin
     if (letra >= 'a') and (letra <= 'z') then
       analizarLetra := true
     else 
       analizarletra := false
   end; {fin de la funcion analizarLetra}
 
 procedure leer;
   begin
     readln(letra);
     if (analizarLetra) then
       writeln('Se trata de una minuscula')
     else begin
       if (letra >= 'A') and (letra <= 'Z') then 
         writeln('Se trata de una mayuscula')
       else
         writeln('No es una letra');
      end;
   end; {fin del procedure leer}
 
var
 ok : boolean; 
begin {programa principal}
 leer;
 ok := analizarLetra;
 if ok then
 writeln('Gracias, vuelva prontosss'); 
end.
