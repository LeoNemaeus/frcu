unit listaContacto;
interface
listaContacto = class
    pNodo  := ^tNodo;
    tNodo := record
    // PROPIEDADES
        info:contacto;
        sig:pNodo;
    var
        contacto:tContacto
    //METODOS
        function insertarlista (var l: tLista; var x: tContacto):boolean;
        function buscarLista(var lista:tLista; buscado:string; var salida:pNodo):boolean;
        procedure removerLista(var lista:tLista; buscado:string; var x:tContacto; var exito:boolean);
        function obtenerItem(lista:tLista; nodo:pNodo):tContacto;
        procedure recorrerLista(lista:tLista);
    end;
end;


end.