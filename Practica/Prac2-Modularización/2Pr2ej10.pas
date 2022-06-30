{Realizar un programa modularizado que lea una secuencia de caracteres y verifique si cumple con el patrón
A$B#, donde:
- A es una secuencia de sólo letras vocales
- B es una secuencia de sólo caracteres alfabéticos sin letras vocales
- los caracteres $ y # seguro existen
Nota: en caso de no cumplir, informar que parte del patrón no se cumplió.}

program Pr2ej10;
function esVocal(c:char):boolean;
  begin
    esVocal:=((c='a')or(c='e')or(c='i')or(c='o')or(c='u')or(c='A')or(c='E')or(c='I')or(c='O')or(c='U')); 
  end;                           {verifica si es vocal}
procedure cumpleA (var cumple:boolean);
 var
  letra:char;
 begin 
   write('Ingrese la secuencia A: ');
   read(letra);
   while (letra <> '$')and (cumple) do
     begin
       if (not esVocal(letra)) then 
         cumple:=false
       else
         read(letra);
     end;
 end;                          {verifica si cumple con requisitos de A}
 
function esLetra (letra:char):boolean;
 begin
   esLetra:= ((letra>='a')and (letra<='z')) or ((letra>='A')and (letra<='Z'))
 end;  
procedure cumpleB (var cumple:boolean);
 var
  letra:char;
 begin
   write('Ingrese la secuencia B: ');
   read(letra);
   while (letra <>'#')and (cumple) do
     begin
       if ((not (esLetra(letra))) and (esVocal(letra))) then
         cumple:=false
       else
         read(letra);
     end;
 end;  {verifica si cumple la secuencia B}

var
  cumple:boolean;
begin
  cumple:=true;
  cumpleA (cumple);
  if (cumple) then
    begin
      cumpleB(cumple);
      if (cumple)then
        writeln('Cumple con la secuencia')
      else
        writeln('No cumple con B');
    end
  else
    writeln('No cumple con A');
end.
