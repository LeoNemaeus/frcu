unit funcionalidad;
interface
uses listas2;
type
    tAgenda = record
        lista:tLista;
    end;

function buscarContacto(agenda:tAgenda; buscar:string; var contacto:tContacto):boolean;
function agregarContacto(var agenda:tAgenda; contacto:tContacto):boolean;
procedure listarContactos(agenda:tAgenda);
procedure eliminarContacto(var agenda:tAgenda; buscar:string);
procedure limpiar(var contacto:tContacto);
implementation

procedure limpiar(var contacto:tContacto);
begin
    contacto.idPersona := 0;
    contacto.nombre := '';
    contacto.telefono := 0;
    contacto.domicilio := '';
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

procedure eliminarContacto(var agenda:tAgenda; buscar:string);
var
    item:pNodo;
begin

    buscarLista(agenda.lista, buscar, item);
    removerLista(agenda.lista, item);
end;

end.