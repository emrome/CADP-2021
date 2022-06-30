{Realizar un programa modularizado que lea una secuencia de caracteres y verifique si cumple con el patrón
A%B*, donde:
- A es una secuencia de caracteres en la que no existe el carácter ‘$’.
- B es una secuencia con la misma cantidad de caracteres que aparecen en A y en la que aparece a lo sumo
3 veces el carácter ‘@’.
- Los caracteres % y * seguro existen
Nota: en caso de no cumplir, informar que parte del patrón no se cumplió.}

program Pr2ej11;
function noEsPesos(c:char):boolean;
  begin
    noEsPesos:= (not(c='$'))
  end;                           {verifica si es vocal}
procedure cumpleA (var cumple:boolean; var long:integer);
 var
  c:char;
 begin 
   write('Ingrese la secuencia A: ');
   readln(c);
   while (c <> '%')and (cumple) do
     begin
       if (not (noEsPesos(c))) then 
         cumple:=false
       else
         readln(c);
         long:= long+1;
     end;
   writeln('La longitud es: ',long);
 end;                          {verifica si cumple con requisitos de A}

procedure cumpleB (var cumple:boolean;long:integer);
 var
  car:char;
  longB,arroba:integer;
 begin
   write('Ingrese la secuencia B: ');
   readln(car);
   longB:=0;
   arroba:=0;
   while (car <>'*') do
     begin
       if(car='@')then
         arroba:=arroba+1;
       readln(car);
       longB:=longB+1;
     end;
   writeln('Hay ',arroba,' arrobas');
   writeln('la longitud de B es ',longB);
   
   cumple:=((arroba>=3)and(longB=long));
   writeln('cumple es: ',cumple);
 end;  {verifica si cumple la secuencia B}

var
  cumple:boolean;
  long:integer;
begin
  long:=0;
  cumple:=true;
  cumpleA (cumple,long);
  if (cumple) then
    begin
      cumpleB(cumple,long);
      if (cumple)then
        writeln('Cumple con la secuencia')
      else
        writeln('No cumple con B');
    end
  else
    writeln('No cumple con A');
end.
