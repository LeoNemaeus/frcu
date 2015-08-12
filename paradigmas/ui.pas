unit ui;
interface
uses tipos;

procedure cargarContacto(var contacto:tContacto);
procedure limpiar(var contacto:tContacto);
procedure mostrarContacto(var contacto:tContacto);

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
begin
    write('Ingrese apellido y nombre (', contacto.nombre , '): ');
    readln(contacto.nombre);

    write('Ingrese telefono (', contacto.telefono, '): ');
    readln(contacto.telefono);

    write('Ingrese domicilio (', contacto.domicilio, '): ');
    readln(contacto.domicilio);
end;
end.