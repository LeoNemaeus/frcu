unit listas2;
interface
uses tipos, ui, sysutils;

function insertarlista (var l: tLista; var x: tContacto):boolean;
function buscarLista(var lista:tLista; buscado:string; var salida:pNodo):boolean;
procedure removerLista(var lista:tLista; buscado:string; var x:tContacto; var exito:boolean);
function obtenerItem(lista:tLista; nodo:pNodo):tContacto;
procedure recorrerLista(lista:tLista);

implementation

function insertarlista (var l: tLista; var x: tContacto):boolean;
var dir: pNodo; ant: pNodo; act : pNodo;
begin
new (dir);
dir^.info := x;
if (l.cab = nil) or (l.cab^.info.nombre > x.nombre) then
   begin
   dir^.sig := l.cab;
   l.cab := dir;
   end
else
    begin
    ant := l.cab;
    act := l.cab^.sig;
    while (act <> nil) and (act^.info.nombre < x.nombre) do
          begin
          ant := act;
          act := act^.sig;
          end;
    ant^.sig := dir;
    dir^.sig := act;
    end;
    insertarLista := true;
end;
function buscarLista(var lista:tLista; buscado:string; var salida:pNodo):boolean;
var
  actual:pNodo;
begin
  actual :=  lista.cab;
  while (ansiCompareStr(actual^.info.nombre, buscado) < 0) and (actual <> nil) do
  begin
    actual := actual^.sig;
  end;

  if (actual <> nil) and ((actual^.info.nombre = buscado) or (pos(buscado, actual^.info.nombre) > 0)) then
  begin
    salida := actual;
    buscarLista := true
  end
  else
  begin
    buscarLista := false
  end;
end;
procedure removerLista(var lista:tLista; buscado:string; var x:tContacto; var exito:boolean);
var
  actual, anterior:pNodo;
begin
  if (lista.cab^.info.nombre = buscado) or (pos(buscado, lista.cab^.info.nombre) > 0) then
  begin
    x := lista.cab^.info;
    actual := lista.cab;
    lista.cab := lista.cab^.sig;
    dispose(actual);
    exito := true
  end
  else
  begin
    actual := lista.cab;
    anterior := actual;
    while (ansiCompareStr(actual^.info.nombre, buscado) < 0) and (actual <> nil) do
    begin
      anterior := actual;
      actual := actual^.sig;
    end;

    if (actual <> nil) and ((actual^.info.nombre = buscado) or (pos(buscado, actual^.info.nombre) > 0)) then
    begin
      x := actual^.info;
      anterior^.sig := actual^.sig;
      dispose(actual);
      exito := true;
    end
    else
      exito := false
  end;
end;
function obtenerItem(lista:tLista; nodo:pNodo):tContacto;
begin
  if nodo <> nil then
    obtenerItem := nodo^.info;
end;

procedure recorrerLista(lista:tLista);
var
  actual:pNodo;
  begin
  actual := lista.cab;

while(actual <> nil) do
  begin
    mostrarContacto(actual^.info);
    actual := actual^.sig;
  end;
end;
end.