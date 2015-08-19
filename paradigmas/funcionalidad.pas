unit funcionalidad;
interface
uses listas2, tipos;
type
    tAgenda = record
        lista:tLista;
    end;

function buscarContacto(agenda:tAgenda; buscar:string; var contacto:tContacto):boolean;
function agregarContacto(var agenda:tAgenda; contacto:tContacto):boolean;
procedure listarContactos(agenda:tAgenda);
function eliminarContacto(var agenda:tAgenda; buscar:string; var x:tContacto):boolean;
procedure limpiar(var contacto:tContacto);

implementation
procedure inicializarContacto(var contacto:tContacto);
begin
    contacto.idPersona := 0;
    contacto.nombre := '';
    contacto.telefono := 0;
    contacto.domicilio := '';
end;


procedure listarContactos(var agenda:tAgenda);
begin
    with agenda do
        primerolista(lista);
        while not finlista(lista) 
            begin
            mostrarContacto(lista.actual^.info);
            siguientelista(lista);
            end;
    end;
end;

procedure mostrarContacto(var contacto:tContacto);
begin
    writeln('idPersona: ', contacto.idPersona);
    writeln('nombre: ', contacto.nombre);
    writeln('telefono: ', contacto.telefono);
    writeln('domicilio: ', contacto.domicilio);
end;



function buscarContacto(agenda:tAgenda; buscar:string; var contacto:tContacto):boolean;
var
    item:pNodo;
    
begin
    if not buscarLista(agenda.lista, buscar, item) then
    buscarContacto := false
    else
        begin
        contacto := leerLista(agenda.lista, item);
        buscarContacto := true;
        end;
end;


procedure cargarContacto(var contacto:tContacto);
var
    aux:tContacto;
begin
    write('Ingrese apellido y nombre (', contacto.nombre , '): ');
    readln(aux.nombre);

    write('Ingrese telefono (', contacto.telefono, '): ');
    readln(aux.telefono);

    write('Ingrese domicilio (', contacto.domicilio, '): ');
    readln(aux.domicilio);

    if aux.nombre <> '' then contacto.nombre := aux.nombre;
    if aux.telefono <> 0 then contacto.telefono := aux.telefono;
    if aux.domicilio <> '' then contacto.domicilio := aux.domicilio;
end;

function agregarContacto(var agenda:tAgenda; contacto:tContacto):boolean;
begin
    agregarContacto := agregarLista(agenda.lista, contacto);
end;


function eliminarContacto(var agenda:tAgenda; buscar:string; var x:tContacto):boolean;
var
    exito:boolean;
begin
    removerLista(agenda.lista, buscar, x, exito);
    eliminarContacto := exito;
end;

procedure opcionAgregarContacto(var agenda:tAgenda);
var
    contacto:tContacto;
begin
    inicializarContacto(contacto);
    cargarContacto(contacto);
    if agregarContacto(agenda, contacto) then
        writeln('Contacto agregado correctamente')
    else
        writeln('Error al agregar contacto');
end;

procedure opcionListarContactos(agenda:tAgenda);
begin
     listarContactos(agenda)
end;

procedure opcionBuscarContacto(agenda:tAgenda);
var
    nombre:string;
    contacto:tContacto;
begin
    writeln('Ingrese el nombre de la persona que desea buscar: ');
    read(nombre);
    if buscarContacto(agenda, nombre, contacto) then
        mostrarContacto(contacto)
    else
        writeln('Error, contacto no encontrado');
end;

procedure opcionModificarContacto(var agenda:tAgenda);
var
    contacto, x:tContacto;
    nombre:string;
begin
    writeln('Ingrese el nombre de la persona que desea buscar: ');
    readln(nombre);
    if buscarContacto(agenda, nombre, contacto) then
    begin
        cargarContacto(contacto);
        if eliminarContacto(agenda, nombre, x) then
            agregarContacto(agenda, contacto)
    end
    else
        writeln('Error, contacto no encontrado');
end;


procedure opcionRemoverContacto(var agenda:tAgenda);
var
    contacto:tContacto;
    nombre:string;
begin
    writeln('Ingrese el nombre de la persona que desea buscar: ');
    readln(nombre);
    if eliminarContacto(agenda, nombre, contacto) then
    begin
        mostrarContacto(contacto);
        writeln('Contacto eliminado correctamente');
    end
    else
        writeln('Error, contacto no encontrado');
end;


end.