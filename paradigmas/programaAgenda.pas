program programaAgenda;

uses listas2, ui, sysutils, tipos;

procedure opcionAgregarContacto(var agenda:tAgenda);
var
    contacto:tContacto;
begin
    limpiar(contacto);
    cargarContacto(contacto);
    if agregarContacto(agenda, contacto) then
        writeln('Contacto agregado correctamente')
    else
        writeln('Error al agregar contacto');
end;

procedure opcionListarContactos(agenda:tAgenda);
begin
    recorrerLista(agenda.lista);
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
    contacto:tContacto;
    nombre:string;
begin
    writeln('Ingrese el nombre de la persona que desea buscar: ');
    read(nombre);
    if buscarContacto(agenda, nombre, contacto) then
    begin
        cargarContacto(contacto);
        eliminarContacto(agenda, nombre);
        agregarContacto(agenda, contacto)
    end
    else
        writeln('Error, contacto no encontrado');
end;

var
    opcion:shortint;
    contacto:tContacto;
    agenda:tAgenda;
begin

    agenda.lista.cab := nil;
    repeat
    begin
        readln(opcion);
        case opcion of
        1:opcionAgregarContacto(agenda);
        2:opcionListarContactos(agenda);
        3:opcionBuscarContacto(agenda);
        4:opcionModificarContacto(agenda);
        {5:opcionRemoverContacto(agenda);}
        end;
    end
    until opcion = 0;


{


    repeat
    begin
        readln(opcion);
        case opcion of
        1:
        begin
            limpiar(contacto);
            cargarContacto(contacto);
            if (agregarContacto(agenda, contacto)) then
                mensaje(contactoAgregado)
            else
                mensaje(contactoNoAgregado);
        end;
        2:
        begin
            listarContactos(agenda);
        end;
        end;
    end
    until opcion = 0;}
    // 3:
    // begin
    //     readln(buscado);
    //     if buscarContacto(agenda, buscado, contacto) then
    //         mostrarContacto(contacto)
    //     else
    //         writeln('contacto no encontrado');
    // end;
    // 4:
    // begin
    //     readln(buscado);
    //     if buscarContacto(agenda, buscado, contacto) then
    //         cargarContacto(foo);
    //         eliminarContacto(agenda, contacto);
    //         agregarContacto(agenda, foo);
    //     else
    //         writeln('contacto no encontrado');
    // end;

end.