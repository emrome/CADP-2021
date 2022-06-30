
procedure Procesar(var listaP:lista; var vDias:vectorDias);
var
    totalPrestamos,actISBN,cantISBN:integer;
    paresImpares:integer;
    p:prestamo;
    regLista:infoNodo;
begin
    leerPrestamo(p);
    totalPrestamos:=0;
    paresImpares:=0;
    while(p.ISBN<>-1)do begin
        actISBN:=p.ISBN;
        cantISBN:=0;
        while(p.ISBN<>-1 and actISBN=p.ISBN)do begin
            cantISBN:=cantISBN +1;
            totalPrestamos:=totalPrestamos +1;
            if((p.socio es par) and (nroISBN es impar))then//si es par e impar
                paresImpares:=paresImpares+1;
            vDia[p.dia]:=vDia[p.dia]+1;
            leerPrestamo(p);
        end;
        regLista.ISBN:=actISBN;
        regLista.cantidad:=cantISBN;
        agregarNodo(l,regLista);
    end;
    //Calcular minimo si queres, se puede hacer en el principal
end;