Program Adic3;
const
  PI=3.14159;
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
              write('Ingrese ancho ');
              readln(ancho);
              write('Ingrese largo ');
              readln(largo);
              write('Ingrese alto ');
              readln(alto);
              volumenR:= ancho*alto*largo;
              totalR:=totalR+volumenR;
              
              if (alto<1.40)then
                  menorUno4:=menorUno4+1;   
                             
              if (volumenR<800)then
                  menor800:=menor800+1;
                  
              if (volumenR>max1)then
                 begin
                   max2:=max1;
                   max1:=volumenR;
                 end
              else if((volumenR>max2)and (volumenR<max1))then
                  max2:=volumenR;
          end {tanque rectangular}
          
      else 
        if ((tanque='c') or (tanque='C'))then
           begin
             volumenC:=0;
             tanquesC:=tanquesC+1;
             write('Ingrese radio ');
             readln(radio);
             write('Ingrese alto ');
             readln(alto);
             volumenC:= PI*(radio*radio)*alto;
             totalC:=totalC+volumenC;
             
             if (alto<1.40)then
                menorUno4:=menorUno4+1;
             
             if (volumenC<800)then
                menor800:=menor800+1;
                
             if (volumenC>max1)then
               begin
                 max2:=max1;
                 max1:=volumenC;
               end
              else 
                if((volumenC>max2)and (volumenC<max1))then
                   max2:=volumenC;
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
