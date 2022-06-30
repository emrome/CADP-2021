{dos maximo y dos minimos}
procedure maximosYminimos (num:integer;nom:string;var max1,max2,min1,min2:integer;var nomMax1,nomMax2,nomMin1,nomMin2:string);
 begin
  if (num>max1)then begin
    max2:=max1;
    max1:=num;
    nomMax2:=nomMax1;
    nomMax1:=nom;
   end
  else
   if (num>max2)then begin
     max2:=num;
     nomMax2:=nom;
   end;
   
  if (num<min1)then begin
    min2:=min1;
    min1:=num;
    nomMin2:=nomMin1;
    nomMin1:=nom;
   end
  else
   if (num<min2)then begin
     min2:=num;
     nomMin2:=nom;
   end;
 end;

{solo maximos}
procedure maximos(num:integer;nombre:string; var max1,max2:integer;var nom1,nom2:string);
begin
  if (num>max1)then begin
    max2:=max1;
    max1:=num;
    nom2:=nom1;
    nom1:=nombre;
   end
  else
   if (num>max2)then begin
     max2:=num;
     nom2:=nombre;
   end;
 end;
{solo minimos}   
procedure minimos (num:integer;nombre:string;var min1,min2:integer;var nom1,nom2:string);
 begin
   if (num<min1)then begin
    min2:=min1;
    min1:=num;
    nom2:=nom1;
    nom1:=nombre;
   end
  else
   if (num<min2)then begin
     min2:=num;
     nom2:=nombre;
   end;
 end;
{un maximo}
procedure maximo(num:integer;nombre:string;var max:integer;var nom:string);
 begin
   if (num>max)then begin
     max:=num;
     nom:=nombre;
   end;
 end;
 {un minimo}
procedure minimo (num:integer;nombre:string;var min:integer;var nom:string);
 begin
   if (num<min)then begin
     min:=num;
     nom:=nombre;
   end;
 end;
