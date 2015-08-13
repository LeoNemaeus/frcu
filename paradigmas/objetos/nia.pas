unit nia;
interface
type
    contacto = object
        idPersona:word;
        nombre:string[30];
        telefono:longint;
        domicilio:string[15];
    procedure cargar();
    procedure limpiar();
    procedure setNombre(entrada:string);
    procedure setTelefono(entrada:longint);
    procedure setDomicilio(entrada:string);
    function getNombre():string;
    function getTelefono():longint;
    function getDomicilio():string;
    //procedure mostrar();
    end;

implementation
procedure contacto.limpiar();
begin
    idPersona := 0;
    nombre := '';
    telefono := 0;
    domicilio := '';
end;
procedure contacto.cargar();
begin
    readln(nombre);
    readln(telefono);
    readln(domicilio);
end;
//ACCESSORS
procedure contacto.setNombre(entrada:string);
begin
    nombre := entrada;
end;
procedure contacto.setTelefono(entrada:longint);
begin
    telefono := entrada;
end;
procedure contacto.setDomicilio(entrada:string);
begin
    domicilio := entrada;
end;

function contacto.getNombre():string;
begin
    getNombre := nombre;
end;
function contacto.getTelefono():longint;
begin
    getTelefono := telefono;
end;
function contacto.getDomicilio():string;
begin
    getDomicilio := domicilio;
end;
end.