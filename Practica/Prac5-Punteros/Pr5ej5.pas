Program Alocacion_Dinamica;
Type
	TEmpleado = record
	 sucursal: char;
	 apellido: string[25];
	 correoElectronico: string[40];
	 sueldo: real;
end;
	Str50 = string[50];
Var
	alguien: TEmpleado;
	PtrEmpleado: ^TEmpleado;
Begin
	Readln(alguien.apellido);
	New( PtrEmpleado);
	Readln(PtrEmpleado^.Sucursal, PtrEmpleado^.apellido);
	Readln(PtrEmpleado^.correoElectronico, PtrEmpleado^.sueldo);
	Dispose(PtrEmpleado);
end.
