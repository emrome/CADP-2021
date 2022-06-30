program pr3ej2otraopcion;
type
  dias= 1..31;
  meses= 1..12;
  fecha=record   {parte A del ejercicio 2}
    dia:dias;
    mes:meses;
    ano:integer;
  end;

procedure leer (var n:fecha); {parte B del ejercicio}
 begin
   with n do 
     begin
       writeln('Ingrese año del casamiento ');
       read(ano);
       if (ano=2019)then 
         begin
          writeln('Ingrese mes del casamiento ');
          read(mes);
          writeln('Ingrese dia del casamiento ');
          read(dia);
         end; {fin del if}
     end; {fin del with}
 end; {fin del proceso}
 
function esVerano (m:meses):boolean;  {analiza se se hizo en enero=1,febrero=2 o marzo=3}
 begin
   esVerano:= (m <=3);
 end;

function primeros10 (d:dias):boolean; {analiza si fue en los primeros 10 dias}
 begin
   primeros10:= (d<=10);
 end;
 
var
  fechaCasorio:fecha;
  cantVerano,cantEn,cantFeb,cantMar,cantAb,cantMay,cantJun,cantJul,cantAg,cantSep,cantOct,cantNov,cantDic:integer;
begin
 cantVerano:=0;
 cantEn:=0;cantFeb:=0;cantMar:=0;cantAb:=0;cantMay:=0;cantJun:=0;cantJul:=0;cantAg:=0;cantSep:=0;cantOct:=0;cantNov:=0;cantDic:=0;
  leer(fechaCasorio);
  while (fechaCasorio.ano=2019)do 
   begin
     if (esVerano(fechaCasorio.mes))then
       cantVerano:=cantVerano+1;
     if (primeros10(fechaCasorio.dia))then 
        case fechaCasorio.mes of
         1: cantEn:=cantEn+1;
         2: cantFeb:=cantFeb+1;
         3: cantMar:=cantMar+1;
         4: cantAb:=cantAb+1;
         5: cantMay:=cantMay+1;
         6: cantJun:=cantJun+1;
         7: cantJul:=cantJul+1;
         8: cantAg:=cantAg+1;
         9: cantSep:=cantSep+1;
         10: cantOct:=cantOct+1;
         11: cantNov:=cantNov+1;
         12: cantDic:=cantDic+1;
        end;
      leer(fechaCasorio);
   end;
  writeln('Fueron ',cantVerano,' los casamientos realizados en los meses de verano.');
  writeln('Los casaminetos realizados en los primeros 10 dias de cada mes son: Enero: ',cantEn,', Febrero: ',cantFeb,', Marzo: ',cantMar,', Abril: ',cantAb,', Mayo: ',cantMay,',  Junio: ',cantJun,', Julio: ',cantJul,', Agosto: ',cantAg,', Septiembre: ',cantSep,', Octubre: ',cantOct,', Noviembre: ',cantNov,', Diciembre: ',cantDic);
end.
  
