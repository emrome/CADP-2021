{ Realizar un programa que lea números enteros desde teclado hasta que se ingrese el valor -1 (que no debe procesarse) e informe:
a. la cantidad de ocurrencias de cada dígito procesado.
b. el dígito más leído.
c. los dígitos que no tuvieron ocurrencias.
Por ejemplo, si la secuencia que se lee es: 63 34 99 94 96 -1, el programa deberá informar:
Número 3: 2 veces
Número 4: 2 veces
Número 6: 2 veces
Número 9: 4 veces
El dígito más leído fue el 9.
Los dígitos que no tuvieron ocurrencias son: 0, 1, 2, 5, 7, 8}

program Pr4ej7;
 type
    rango=0..9;
    digitos=array[rango]of integer;
 
 procedure inicializar(var dig:digitos);
  var
     i:integer;
  begin
     for i:=0 to 9 do
       dig[i]:=0;
  end;
  
 procedure descomponer(var d:digitos;num:integer);  {es un vector como contador}
  var
    dig:rango;
  begin
    while(num<>0)do begin
       dig:=num MOD 10;
       d[dig]:=d[dig]+1;
       num:= num DIV 10;
     end;
  end;

 function digitoMaximo(vec:digitos):rango;{e) elementoMaximo: retorna la posición del mayor elemento del vector}
 var
    i,posMax:rango;
    max:integer;
 begin
    max:=-1;
    for i:= 0 to 9 do
       if (vec[i]>max) then begin
          max:=vec[i];
          posMax:=i;
        end;
    digitoMaximo:=posMax;
 end; 

 procedure informarOcurrencias(dig:digitos);
  var
     i:rango;
  begin
     for i:=0 to 9 do
       if (dig[i]>0)then
         writeln('La cantidad de ocurrencias de ',i,' es igual a ',dig[i]);
  end;
  
 procedure sinOcurrencias(dig:digitos);
  var
     i:rango;
  begin
    for i:=0to 9 do
      if (dig[i]=0)then
        writeln('El digito ',i,' no tuvo ocurrencias');
  end;

{programa principal}  
var
   dig:digitos;
   num:integer;
begin                          //se puede hacer un proceso que lo procese
   inicializar(dig);           //procedure procesar (var v:digitos);
   readln(num);                //var
   while (num<>-1)do begin     // num:integer;
       descomponer(dig,num);   //begin
       readln(num);            // readln(num);                
   end;                        // while (num<>-1)do begin 
   informarOcurrencias(dig);   //    descomponer(dig,num); 
   sinOcurrencias(dig);        //    readln(num); 
   writeln('El digito mas leido fue ',digitoMaximo(dig));                    

end.
