procedure dniSalarioMinimo();
var
    dato:Tdatos;
    fin:boolean;
    min1,min2: integer;
    dni_1,dni_2:string;
begin
    min1 := 32767;
    dni_1:='';
    repeat
      CADPleerDato(dato,fin); {Invoca el proceso de leer datos y carga la informacion en la variable "dato" local al procedimiento}

      if (dato.salario<min1)then begin  {lee el salario recien ingresado y lo compara con el minimo}
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
    writeln('DNI: ',dni_1,' tiene el menor salario: ',min1,' y le sigue DNI: ',dni_2,' con un salario de: ',min2); {Informa el DNI y salario de los dos empleados con menor salario}
end;

begin
		CADPVolverAlInicio('DatosGrupo'); { <<--- comienza la lectura de datos desde el principio, y nos asegura que se procesarán todos los datos. El parámetro indica el nombre del archivo a procesar }
		dniSalarioMinimo; {Se invoca al proceso de carga de datos y compara los salarios}
		
		CADPfinalizarLectura();            { <<---- una vez que se procesó todo el archivo, hay que cerrarlo correctamente }

end.
