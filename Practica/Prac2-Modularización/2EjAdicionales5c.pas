program Adic5c;
const
  PI=3.14159;
  
procedure altoMenorque14 (alto:real;var menorUno4:integer);
 begin
   if (alto<1.40)then
      menorUno4:=menorUno4+1;   
 end;
 
procedure volumenMenorque800 (volumen:real;var menor800:integer);
 begin
   if (volumen<800)then
     menor800:=menor800+1;
 end;
 
procedure leerDatosRectangulos (var ancho,largo,alto:real);
 begin
   write('Ingrese ancho ');
   readln(ancho);
   write('Ingrese largo ');
   readln(largo);
   write('Ingrese alto ');
   readln(alto);
 end;
 
procedure leerDatosCilindros (var radio,alto:real);
 begin
  write('Ingrese radio ');
  readln(radio);
  write('Ingrese alto ');
  readln(alto);
 end;
 
procedure maximos (volumen:real;var max2,max1:real);
 begin
   if (volumen>max1)then
     begin
       max2:=max1;
       max1:=volumen;
     end
   else if(volumen>max2)then
     max2:=volumen;
 end;
 {programa principal}
var
  tanque:char;
  alto,ancho,largo,radio,volumenR,volumenC,totalR,totalC,promedioR,promedioC,max1,max2:real;
  tanquesR,tanquesC,menor800,menorUno4:integer;
begin
  max1:=-1;tanquesR:=0;tanquesC:=0;totalR:=0;totalC:=0;menor800:=0;menorUno4:=0;
  write('Ingrese tipo de tanque: R(rectangulos) o C(cilindricos) ');
  readln(tanque);
  while (tanque<>'z')do
     begin
       if ((tanque='r')or (tanque='R'))then
        begin
         volumenR:=0;
         tanquesR:=tanquesR+1;
         leerDatosRectangulos(ancho,largo,alto);
         volumenR:= ancho*alto*largo;
         totalR:=totalR+volumenR;
         altoMenorque14(alto,menorUno4);
         volumenMenorque800(volumenR,menor800);
         maximos(volumenR,max2,max1);
        end
       else 
        if ((tanque='c') or (tanque='C'))then
           begin
             volumenC:=0;
             tanquesC:=tanquesC+1;
             leerDatosCilindros(radio,alto);
             volumenC:= PI*(radio*radio)*alto;
             totalC:=totalC+volumenC;
             altoMenorque14(alto,menorUno4);
             volumenMenorque800(volumenC,menor800);
             maximos(volumenC,max2,max1);
           end;
       write('Ingrese tipo de tanque: R(rectangulos) o C(cilindricos)');
       readln(tanque);
     end;  
  promedioC:=totalC/tanquesC;
  promedioR:=totalR/tanquesR;
  writeln('El volumen de los dos mayores tanques vendidos es: ',max1:0:2,' y ',max2:0:2);
  writeln('El volumen promedio de los tanques cilindricos es de: ',promedioC:0:2);
  writeln('El volumen promedio de los tanques rectangulares es de: ',promedioR:0:2);
  writeln('Son ',menorUno4,' los tanques cuyo alto es menor a 1.40 metros');
  writeln('Son ',menor800,' los tanques cuyo volumen es menor a 800 metros cubitos')    
end.          
