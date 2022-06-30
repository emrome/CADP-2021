{Un centro de estetica ofrece 20 planes para sus clientes: ozonoterapia, cama solar ..etc. * 
Cada plan posee un codigo de plan (1..20), un costo y una cantidad de sesiones.Ademas, el centro 
dispone de una estructura con informacion de los clientes del centro de estetica. * De cada 
cliente se conoce nombre, DNI, ciudad de origen  codigo de plan contratado, y si ya finalizo 
el tratamiento.
Realizar un programa que lea y almacene la informacion de los planes del centro. Una vez leida 
y almacenada la informacion, procesar los datos para:
1) informar la ganancia del centro para cada tipo de plan (incluyendo tratamientos finalizados y no finalizados
2) Almacenar en una lista todos los datos de los clientes cuyos tratamientos ya han finalizado. 
* NOTAS:     
* registro de clientes     
* registro de plan    
* vector planes   
* subrango para los planes 
* lista de clientes - SE DISPONE   
* vector para las ganancias}
Program centroDeEstetica;
const     
PLANES= 20;
type     
  rango: 1..PLANES;    
  cadena30 = string[30];   
  plan = record        
    //cod: rango;        
    costo: real;        
    cantSesiones: integer;   
  end;    
  cliente = record    
     nombre: cadena30; 
     dni: integer;   
     ciudadO: cadena30;
     codp: rango;  
     fin: Boolean;    
   end;    
   vector = array [rango] of plan;    
   vectorGanancias = array [rango] of real;     
   lista = ^nodo;        
   nodo = record               
      dato: cliente;        
      sig: lista;    
    end;

   procedure leerPlan(var p: plan)    
     begin         
        //readln(p.cod); lo sacamos porque utilizamos el indice del vector como codigo        
        readln(p.costo);        
        readln(p.cantSesiones);    
     end;    
 
   procedure leerCliente(var c: cliente);      //SE DISPONE    
   procedure agregar(var l: lista; c: cliente) //SE DISPONE    
   procedure cargarLista(var l: lista);        //SE DISPONE 
    
   procedure inicializarGanancias( var v: vectorGanancias);        
    var          
       i: integer;    
    begin         
      for i:= 1 to PLANES do            
         v[i]:= 0;    
    end;    
 
   procedure cargarVectorPlanes(var v: vector);    
    var       
       i: integer;    
    begin         
       for i:= 1 to PLANES do             
          leerPlan(v[i]);//supongo que los planes se leen ordenados    
    end; 

   procedure agregarL2(var l: lista; c: cliente);    
    var         
      nue: lista;    
    begin        
      new(nue);        
      nue^.dato:= c;        
      nue^.sig:= l;         
      l:= nue;    
    end;  
   
   procedure recorrer(l: lista; var l2: lista; v: vector; var vc: vectorGanancias);    
    begin         
       while (l <> nil) do begin             
         //1) informar la ganancia del centro para cada tipo de plan (incluyendo tratamientos finalizados y no finalizados)            
         vc[l^.dato.codp]:= vc[l^.dato.codp] + v[l^.dato.codp].costo;             
         //2) Almacenar en una lista todos los datos de los clientes cuyos tratamientos ya han finalizado.             
         if (l^.dato.fin) then                 
            agregarL2(l2, l^.dato);                       
         l:= l^.sig;        
       end;    
    end;    

   procedure informarGanancias (v: vectorGanancias);    
    var         
      i: integer;    
    begin         
      for i:= 1 to PLANES do             
        writeln('La ganancia del centro de estetica para el codigo de plan ', i, ' es: ', v[i]);    
    end;

var         
   l, l2: lista;        
   vGanancias: vectorGanancias;        
   vPlanes: vector;    
begin         
   l:= nil;       
   l2:= nil;         
   cargarLista(l);  //SE DISPONE        
   inicializarGanancias(vGanancias);        
   cargarVectorPlanes(vPlanes);        
   recorrer(l, l2, vPlanes, vGanancias);        
   informarGanancias(vGanancias);    
end.
