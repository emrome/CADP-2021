program Pr2ej6;
function numPar:integer;
 var
  num,max:integer;
 begin
   max:=-1;
   readln(num);
   while(num>=0)do
      begin
        if ((num>=max) and (num MOD 2=0))then
           max:=num; 
        readln(num);
       end;
    numPar:=max;
  end;
begin
  writeln('El numero entero par mas alto fue: ',numPar);
end.
