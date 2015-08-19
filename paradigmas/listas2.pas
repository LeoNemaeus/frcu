unit listas2;
interface
uses tipos, ui, sysutils;

type
  pNodo = ^tNodo;
  tNodo = record
    info:tContacto;
    sig:pNodo;
  end;
  tLista = record
    cab, actual: pNodo;
    tam:word;
  end;

procedure  inicializar(var lista:tLista);
function agregarlista (var l: tLista; var x: tContacto):boolean;
function buscarLista(var lista:tLista; buscado:string; var salida:pNodo):boolean;
procedure removerLista(var lista:tLista; buscado:string; var x:tContacto; var exito:boolean);
function leerLista(var lista:tLista):tContacto;
procedure primeroLista(var lista:tLista);
procedure siguienteLista(var lista:tLista);
function finLista(var lista:tLista):boolean;
procedure finalizarLista(var lista:tLista);


implementation
procedure  inicializar(var lista:tLista);
begin
  lista.cab := nil;
  lista.actual := nil;
  lista.tam := 0;
end;

function agregarlista (var l: tLista; var x: tContacto):boolean;
var dir: pNodo; ant: pNodo; act : pNodo;
begin
new (dir);
dir^.info := x;
if (l.cab = nil) or (l.cab^.info.nombre > x.nombre) then
   begin
   dir^.sig := l.cab;
   l.cab := dir;
   inc(l.tam)
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
inc(l.tam);
insertarLista := true;
end;

function buscarLista(var lista:tLista; buscado:string; var salida:pNodo):boolean;
begin
  primeroLista(lista);
  while (ansiCompareStr(lista.actual^.info.nombre, buscado) < 0) and (not finLista(lista)) do
  begin
    siguienteLista(lista)
  end;

  if (finLista(lista)) and ((lista.actual^.info.nombre = buscado) or (pos(buscado, actual^.info.nombre) > 0)) then
  begin
    salida := lista.actual;
    buscarLista := true
  end
  else
  begin
    buscarLista := false
  end;
end;

function removerLista(var lista:tLista; buscado:string; var x:tContacto):boolean;
var
  actual, anterior:pNodo;
begin
  if (lista.cab^.info.nombre = buscado) or (pos(buscado, lista.cab^.info.nombre) > 0) then
  begin
    x := lista.cab^.info;
    actual := lista.cab;
    lista.cab := lista.cab^.sig;
    dispose(actual);
    dec(lista.tam);
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
      dec(lista.tam);
      exito := true;
    end
    else
      exito := false
  end;
end;

{
  # Lee el elemento al que apunta Actual.
}
function leerLista(var lista:tLista):tContacto;
begin
  if nodo <> nil then
    leerLista := lista.actual^.info;
end;

procedure primeroLista(var lista:tLista);
begin
  lista.actual := lista.cab;
end;

procedure siguienteLista(var lista:tLista);
begin
  lista.actual := lista.actual^.sig;
end;

function finLista(var lista:tLista):boolean;
begin
  fin:= (lista.actual = nil);
end;

procedure finalizarLista(var lista:tLista);
begin
  while (lista.actual <> nil)
  begin
    removerLista(lista, )
  end;
end;
end.