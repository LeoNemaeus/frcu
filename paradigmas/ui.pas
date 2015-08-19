unit ui;
interface
uses tipos;

procedure cargarContacto(var contacto:tContacto);
procedure limpiar(var contacto:tContacto);
procedure mostrarContacto(var contacto:tContacto);

implementation
procedure cargar_contacto();
begin
    write('Ingrese apellido y nombre (', contacto.nombre , '): ');
    readln(aux.nombre);

    write('Ingrese telefono (', contacto.telefono, '): ');
    readln(aux.telefono);

    write('Ingrese domicilio (', contacto.domicilio, '): ');
    readln(aux.domicilio);
end;
end.