program programaAgenda;

procedure cargarContacto(var contacto:tContacto);
begin
    writeln('')
end;

var
    contacto:tContacto;
begin
    repeat
        writeln('Seleccione una opción:');
        writeln('1: agregar contacto');

        readln(opcion);

        case opcion of
        1:
        begin
            cargarContacto(contacto);
            agregarContacto(agenda, contacto);
        end;
    until opcion = 0;
end.