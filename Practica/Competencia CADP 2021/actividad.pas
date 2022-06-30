program CADPGames;

uses // Se llama a las librerías necesarias para funcionar
    CADPDataLoader;
const
    FINALIZAR=0; // Constante que indica la condición de salida.
    TAM_ARR=5; // Dimensión física del arreglo
Type
    Vector_Leg= array [0..TAM_ARR] of integer; // Arreglo para la descomposición de digitos del legajo.


{
  * Inicio de los módulos reutilizables
  * Los siguientes módulos son utilizados más de una ocación dentro de varios módulos u opciones del programa.
}

// Función que devuelve el total de empleados en el archivo
function TotalEmpleados() : integer;
var
    cont : integer;
    dato : Tdatos;
    fin : boolean;
begin
    CADPVolverAlInicio('DatosGrupo'); // Vuelve al inicio para evitar contar 1 empleado
    cont := 0;
    repeat
        CADPleerDato(dato,fin); // Se leen todos los empleados hasta llegar al último
        cont := cont + 1;
    until(fin);
    TotalEmpleados:=cont; // Devuelve el total de empleados
end;

// Procedimiento que aumenta un contador en caso de que el salario sea menor a determinado valor.
procedure cantidadMenor (salario: real; dolares: real; var cantidadEmpleados: integer);
begin
    if (salario < dolares) then cantidadEmpleados:=cantidadEmpleados+1;
end;

// Procedimiento que descompone los legajos en un arreglo.
procedure descomponer (var ADigitos: vector_leg; legajo:integer; var dl: integer);
begin
    while ((dl < TAM_ARR) and (legajo <> 0)) do begin
        ADigitos [dl]:= legajo MOD 10;
        legajo:= legajo DIV 10;
        dl:=dl+1;
    end;
end;



{
  * Inicio de los módulos del menú
  * Los siguientes módulos son utilizados únicamente por el menú para poder mejoras la legibilidad del programa.
}

// Este módulo resuelve el segundo punto: Imprime la cantidad de empleados con un salario menor a 300.
procedure salarioMenor300;
var
    dato: TDatos;
    fin: boolean;
    contador: integer;
begin
    contador:=0;
    repeat
        CADPleerDato(dato,fin);
        cantidadMenor (dato.salario, 300, contador);
    until (fin);
    writeln('La cantidad de empleados cuyo salario menor a 300 dólares son: ',contador);
end;

// Este módulo resuelve el tercer punto: Imprime el salario promedio de entre todos los empleados.
PROCEDURE calcularSalarioPromedio;
var
    dato:Tdatos; salarioPromedio:real; fin:boolean; total:integer;
begin
    salarioPromedio:=0;
    repeat
        CADPleerDato(dato,fin);
        if (not fin) then
            salarioPromedio:=salarioPromedio+dato.salario //El if solo usa la variable promedio como contador para luego calcular el promedio con la cantidad total de empleados.
        else
        begin 
            total:=TotalEmpleados;
            salarioPromedio:=salarioPromedio+dato.salario;
            salarioPromedio:=salarioPromedio/total; //El else es la estructura que termina calculando el promedio.
        end; 
    until(fin);

    writeln('El salario promedio del total de empleados es de: ',salarioPromedio:1:2);

end;


// Este módulo resuelve el cuarto punto: Imprime la cantidad de veces que aparece el dígito 1 en el legajo del empleado con mayor salario.
procedure digito1EnMayorSalario;
var
    d: tdatos;
    fin: boolean;
    ADigito: Vector_Leg;
    i, legajo_max, salario_max, cant_1, dl: integer;
begin
    cant_1:= 0;
    legajo_max:= 0;
    salario_max:= -1;
    dl:=0;
    fin:= False;
    repeat;
        CADPleerDato(d,fin);
        if (d.salario> salario_max) then begin
            legajo_max:= d.legajo;
            salario_max:= d.salario;
        end;
    until (fin);
    descomponer (ADigito, legajo_max, dl);
    for i := 0 to (dl-1) do if (ADigito [i]=1) then cant_1:= cant_1 + 1;
    writeln('La cantidad de veces que se repite el dígito 1 en el legajo con mayor salario es de: ',cant_1);
end;

// Este módulo resuelve el quinto punto: Imprime el DNI de los dos empleados con menor salario.
procedure dniSalariosMinimos();
var
    dato : Tdatos;
    fin : boolean;
    min1,min2 : integer;
    dni_1,dni_2 : string;
begin
    min1 := 32767;
    dni_1 := '';
    repeat
      CADPleerDato(dato,fin); // Invoca el proceso de leer datos y carga la informacion en la variable "dato" local al procedimiento.

      if (dato.salario<min1)then begin  // Lee el salario recien ingresado y lo compara con el minimo.
         min2:=min1;
         min1:=dato.salario;
         dni_2:=dni_1;
         dni_1:=dato.dni;
       end
      else
        if (dato.salario<min2)then begin
          min2:=dato.salario;
          dni_2:=dato.dni;
        end;
    until(fin);
    writeln('DNI: ',dni_1,' tiene el menor salario: ',min1,' y le sigue DNI: ',dni_2,' con un salario de: ',min2); // Informa el DNI y salario de los dos empleados con menor salario.
end;

// Este módulo resuelve el sexto punto: Imprime la cantidad de empleados cuyos legajos contengan todos dígitos pare o impares.
Procedure todosParesOImpares;
var
    ADigito: Vector_leg;
    d:Tdatos;
    cant_leg, i, dig_par, dig_impar, dl: integer;
    fin: boolean;
begin
    fin:=false;
    cant_leg:=0;
    repeat
        CADPleerDato(d,fin);
        dl:=0;
        descomponer (ADigito, d.Legajo, dl);
        dig_par:= 0;
        dig_impar:= 0;
        for i:=0 to (dl-1) do
            if (ADigito [i] MOD 2 = 0) then dig_par:= dig_par + 1 else dig_impar:= dig_impar + 1;
        if ((dig_par = dl) or (dig_impar = dl)) then cant_leg:= cant_leg + 1;
    until (fin);
    writeln('La cantidad de empleados cuyos legajos contienen solo dígitos todos pares o todos impares es de: ',cant_leg);
end;


// Este módulo resuelve el séptimo punto: Imprime el porcentaje de empleados de más de 50 años y cobran menos de 600 dólares.
procedure salarioMenor600YMayor50Anios;
var
    contador: integer;
    dato: TDatos;
    fin: boolean;
begin
    contador:=0;
    repeat
        CADPleerDato(dato,fin);
        if (dato.edad>50) then cantidadMenor(dato.salario, 600, contador);
    until (fin);
    writeln('El porcentaje de empleados mayores de 50 años y que ganan menos de 600 dólares es de: ',((contador*100)/TotalEmpleados):1:2);
end;

// Este módulo resuelve el octavo punto: Imprime la cantidad de veces que aparece el dígito 0 entre todos los legajos 
procedure digito0EnLegajos;
var
    ADigito: Vector_leg;
    d: TDatos;
    cant_0, i, dl: integer;
    fin: boolean;
begin
    fin:= false;
    cant_0:= 0;
    repeat
        dl:=0;
        CADPleerDato(d,fin);
        descomponer (ADigito, d.Legajo, dl);
        for i:= 0 to (dl-1) do
            if (ADigito[i] = 0) then cant_0:= cant_0 + 1;
    until (fin);
    writeln('La cantidad total de dígitos 0 entre todos los legajos es de: ',cant_0);
end;

// Este módulo resuelve el noveno punto: Imprime la cantidad de veces en las que un empleado cobra más del doble del empleado anterior
PROCEDURE salarioDobleQueAnterior;
var
    dato:Tdatos; salarioAnt, cantMasDelDobleQueAnt:integer; fin:boolean; 
begin

    cantMasDelDobleQueAnt:=0;

    CADPleerDato(dato,fin);
    salarioAnt:=dato.salario;

    repeat
        CADPleerDato(dato,fin);
        if ((dato.salario/2)>salarioAnt) then
            cantMasDelDobleQueAnt:=cantMasDelDobleQueAnt+1;
    salarioAnt:=dato.salario;
    until(fin);

    writeln('La cantidad de veces en la que un empleado cobra mas del doble que el anterior es: ',cantMasDelDobleQueAnt);
 
end;



{ 
    * Procedure del menú, encargado de llamar al resto de procedimientos.
}
procedure menu(var num : integer);
begin // A causa de que Windows utiliza ANSI como codificación en su CMD, las tildes se imprimen incorrectamente en este sistema.
        writeln(' _______________________________________________________________________ ');
        writeln('|[] CADP Competición Grupo 4                                      |[]|!"|');
        writeln('|"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""|"|');
        writeln('|  Seleccione del menú la instrucción a iniciar:                      | |');
        writeln('|                                                                     | |');
        writeln('|  (1) Imprimir la cantidad total de empleados.                       | |');
        writeln('|  (2) Imprimir la cantidad de empleados cuyo salario es menor a      | |');
        writeln('|      300 dolares.                                                   | |');
        writeln('|  (3) Imprimir el salario promedio de los empleados.                 | |');
        writeln('|  (4) Imprimir la cantidad de veces que aparece el dígito 1 en el    | |');
        writeln('|      legajo del empleado con mayor salario.                         | |');
        writeln('|  (5) Imprimir el DNI de los dos empleados con menor salario.        | |');
        writeln('|  (6) Imprimir la cantidad de empleados cuyos legajos posee todos    | |');
        writeln('|      dígitos pares o impares.                                       | |');
        writeln('|  (7) Imprimir el porcentaje de empleados de más de 50 años y        | |');
        writeln('|      que cobran menos de 600 dólares.                               | |');
        writeln('|  (8) Imprimir la cantidad de veces que aparece el dígito 0 entre    | |');
        writeln('|      todos los legajos.                                             | |');
        writeln('|  (9) Imprimir la cantidad de veces en las que un empleado cobra     | |');
        writeln('|      más del doble del empleado anterior del listado.               | |');
        writeln('|                                                                     | |');
        writeln('|  [0] Cerrar el programa                                             | |');
        writeln('|                                                                     |_|');
        writeln('|_____________________________________________________________________|/|');
        writeln('Seleccionar instrucción: ');readln(num);
        { El siguiente case decide a cual procedimiento invocar en base a el número ingresado por el usuario }
        case (num) of
            1: writeln('Actualmente hay un total de ',TotalEmpleados,' empleados.'); // Esta línea imprime el total de empleados, volverla un módulo sería ineficiente
            2: salarioMenor300;
            3: calcularSalarioPromedio;
            4: digito1EnMayorSalario;
            5: dniSalariosMinimos;
            6: todosParesOImpares;
            7: salarioMenor600YMayor50Anios;
            8: digito0EnLegajos;
            9: salarioDobleQueAnterior;
            0: num:=0;
        end;
        if (num<>0) then begin
            writeln('Pulsa una tecla para continuar'); // Espera al usuario antes de continuar si este no cierra el programa.
            readln();
        end;
end;


{
    * Bucle del programa
}
var
    num : integer;
begin
    num:=-1;
    while (num<>FINALIZAR) do begin
        CADPVolverAlInicio('DatosGrupo');
        menu(num);
    end;
    CADPfinalizarLectura();
end.
