{Dado que en la solución anterior se recorre dos veces el vector (una para calcular el elemento máximo y
otra para el mínimo), implementar un único módulo que recorra una única vez el vector y devuelva ambas
posiciones}

procedure recorrerVector(vec:vector;dimL:integer; var posMax,posMin:integer);
 var
   i,min,max:integer;
 begin
     min:=32767;
     max:=-9999;
     for i:=1 to dimL do begin
       if(vec[i]<min)then begin
            min:=vec[i];
            posMin:=i;
         end;
       if (vec[i]>max) then begin
          max:=vec[i];
          posMax:=i;
         end;
      end;
 end;

