program AgendaASD;

uses funcionalidad, tipos,  listas2;


var
    opcion:shortint;
    contacto:tContacto;
    Agenda:tAgenda;
begin

    crearLista(agenda.lista)
    repeat
    begin
        readln(opcion);
        case opcion of
        1:opcionAgregarContacto(agenda);
        2:opcionListarContactos(agenda);
        3:opcionBuscarContacto(agenda);
        4:opcionModificarContacto(agenda);
        5:opcionRemoverContacto(agenda);
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