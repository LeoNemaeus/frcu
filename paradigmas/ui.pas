unit ui;
interface
uses tipos;
type
    claseMenu = (principal, agregar, buscar, listar, modificar);
    tMsj = (contactoAgregado, contactoNoAgregado);

function mostrar(tipo:claseMenu):shortint;
procedure cargarContacto(var contacto:tContacto);
procedure limpiar(var contacto:tContacto);
procedure mostrarContacto(var contacto:tContacto);
procedure mensaje(msj:tMsj);

implementation
function mostrar(tipo:claseMenu):shortint;
var
    opcion:shortint;
begin
    case tipo of
    principal:
    begin
        writeln('Ingrese opcion:');
        writeln('1: agregar contacto');
        writeln('2: listar contactos');
        writeln('3: buscar un contacto');
        writeln('4: modificar un contacto');

        readln(opcion);

        if (1 <= opcion) and (opcion <= 4) then
            mostrar := opcion;
    end;

    end;
end;

procedure cargarContacto(var contacto:tContacto);
begin
    write('Ingrese apellido y nombre (', contacto.nombre , '): ');
    readln(contacto.nombre);

    write('Ingrese telefono (', contacto.telefono, '): ');
    readln(contacto.telefono);

    write('Ingrese domicilio (', contacto.domicilio, '): ');
    readln(contacto.domicilio);
end;

procedure mostrarContacto(var contacto:tContacto);
begin
    writeln('idPersona: ', contacto.idPersona);
    writeln('nombre: ', contacto.nombre);
    writeln('telefono: ', contacto.telefono);
    writeln('domicilio: ', contacto.domicilio);
end;

procedure limpiar(var contacto:tContacto);
begin
    contacto.idPersona := 0;
    contacto.nombre := '';
    contacto.telefono := 0;
    contacto.domicilio := '';
end;

procedure mensaje(msj:tMsj);
begin
    case msj of
     contactoAgregado:writeln('Contacto agregado correctamente');
     contactoNoAgregado:writeln('Error: contacto no agregado');
    end;
end;

end.