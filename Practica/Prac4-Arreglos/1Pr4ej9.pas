{Modificar la solución del punto anterior considerando que el programa lea y almacene la información de a
lo sumo 400 alumnos. La lectura finaliza cuando se ingresa el DNI -1 (que no debe procesarse).}

program Pr4ej8;
const
    dimF=400;
type
    ingresante=record
       nroIns:integer;
       DNI:integer;
       apellido:string[20];
       nombre:string[20];
       anio:integer;
     end;
     ingresantes=array [1..dimF]of ingresante;
 
procedure leerIngresante(var ing:ingresante);
 begin
      writeln('Ingrese nro de inscripcion ');readln(ing.nroIns);
      writeln('Ingrese nro de DNI ');readln(ing.DNI);
      if (ing.DNI<>-1)then begin
          writeln('Ingrese apellido ');readln(ing.apellido);
          writeln('Ingrese nombre ');readln(ing.nombre);
          writeln('Ingrese anio de nacimiento ');readln(ing.anio);
       end;
 end;

procedure cargarVector(var ing:ingresantes;var dimL:integer);
 begin
    leerIngresante(ing[dimL]);
    while ((dimL<dimF)and(ing[dimL].DNI<>-1))do begin
       dimL:=dimL+1;
       leerIngresante(ing[dimL]);
     end;
    dimL:=dimL-1;
 end;

function esTodoPar(num:integer):boolean;
 var
    digito,pares,cantDig:integer; //impares y cantDig se va
 begin
    pares:=0;//impares:=0
    cantDig:=0;
    while(num<>0)do begin
        digito:=num MOD 10;
        cantDig:=cantDig+1;//se puede sacar
        num:=num DIV 10;
        if ((digito MOD 2)=0)then //digito mod 2=1
            pares:=pares+1;//impares:=impares+1
     end;
    //writeln('La cantidad de pares es ',pares,' y digitos= ',cantDig);
    esTodoPar:=(pares=cantDig);//esTodoPar:=(impares=0)
 end;
procedure maximos(num:integer;nom,ape:string;var max1,max2:integer;var nom1,nom2,ape1,ape2:string);
 begin
    if(num>max1)then begin
       max2:=max1;
       max1:=num;
       nom2:=nom1;
       nom1:=nom;
       ape2:=ape1;
       ape1:=ape;
      end
     else if (num>max2)then begin
       max2:=num;
       nom2:=nom;
       ape2:=ape;
     end;
 end;
 
procedure recorrerVector(ing:ingresantes;dimL:integer;var max1,max2:integer;var nom1,nom2,ape1,ape2:string;var porcentaje:real);
 var
   i,edad,dniPares:integer;
 begin
    max1:=0;
    nom1:='';
    dniPares:=0;
    for i:=1 to dimL do
      begin
         edad:= 2021- ing[i].anio;
         if (esTodoPar(ing[i].DNI))then begin
            dniPares:=dniPares+1;
          end;
         maximos(edad,ing[i].nombre,ing[i].apellido,max1,max2,nom1,nom2,ape1,ape2);
      end;
    porcentaje:= dniPares*100/dimL;
 end;
{programa principal}
var
   ing:ingresantes;
   porcPares:real;
   max1,max2,dimL:integer;
   nom1,nom2,ape1,ape2:string;
begin
    dimL:=1;
    cargarVector(ing,dimL);
    recorrerVector(ing,dimL,max1,max2,nom1,nom2,ape1,ape2,porcPares);
    writeln('El porcentaje de alumnos con DNI compuesto solo por digitos pares es %',porcPares:2:2);
    writeln('El ingresante ',nom1,' ',ape1,' es el de mayor edad con ',max1,' anios y le sigue ',nom2,' ',ape2,' con ',max2,' anios');
end. 
