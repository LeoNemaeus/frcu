unit funcionalidad;
interface
uses listas2, ui, tipos;
type
    tAgenda = class
        contactos:record
            idPersona:word;
            nombre:string[30];
            telefono:longint;
            domicilio:string[15];
        end;
        function buscarContacto(agenda:tAgenda; buscar:string; var contacto:tContacto):boolean;
        function agregarContacto(var agenda:tAgenda; contacto:tContacto):boolean;
        procedure listarContactos(agenda:tAgenda);
        function eliminarContacto(var agenda:tAgenda; buscar:string; var x:tContacto):boolean;
        procedure limpiar(var contacto:tContacto);
    end;



implementation
procedure limpiar(var contacto:tContacto);
begin
    contacto.idPersona := 0;
    contacto.nombre := '';
    contacto.telefono := 0;
    contacto.domicilio := '';
end;
procedure mostrarContacto(var contacto:tContacto);
begin
    writeln('idPersona: ', contacto.idPersona);
    writeln('nombre: ', contacto.nombre);
    writeln('telefono: ', contacto.telefono);
    writeln('domicilio: ', contacto.domicilio);
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

function buscarContacto(agenda:tAgenda; buscar:string; var contacto:tContacto):boolean;
var
    item:pNodo;
    resultado:boolean;
begin
    resultado := buscarLista(agenda.lista, buscar, item);
    if not resultado then
        limpiar(contacto)
    else
        contacto := obtenerItem(agenda.lista, item);

    buscarContacto := resultado;
end;

function agregarContacto(var agenda:tAgenda; contacto:tContacto):boolean;
begin
    agregarContacto := insertarLista(agenda.lista, contacto);
end;

procedure listarContactos(agenda:tAgenda);
begin
    recorrerLista(agenda.lista);
end;

function eliminarContacto(var agenda:tAgenda; buscar:string; var x:tContacto):boolean;
var
    exito:boolean;
begin
    removerLista(agenda.lista, buscar, x, exito);
    eliminarContacto := exito;
end;

end.