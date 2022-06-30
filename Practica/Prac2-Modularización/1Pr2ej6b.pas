program Pr2ej6b;
procedure numPar;
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
   writeln('El numero entero par mas alto fue: ',max);
  end;
begin
   numPar;
end.
