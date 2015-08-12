{$IFDEF FPC}
  {$MODE DELPHI}
{$ENDIF}


unit  archivos;

interface
uses
  Sysutils;

function insertarlista (var l: tLista; var x: tContacto):boolean;
function buscarLista(var lista:tLista; buscado:string; var salida:pNodo):boolean;
procedure removerLista(var lista:tLista; buscado:string; var x:tContacto; var exito:boolean);
function obtenerItem(lista:tLista; nodo:pNodo):tContacto;
procedure recorrerLista(lista:tLista);

implementation


procedure ordenar(var v:vector; var lim: word);
var
  aux:tcontacto;
  i:word;
  j:word;
begin
  for i := 1 to lim do
  begin
    for j := 1 to lim do
    begin
      if (v[i].apellido >= v[j].apellido) then
      begin
        aux := v[i];
        v[i] := v[j];
        v[i] := aux;
      end;
    end;
  end;
end;

function insertarlista (var l: tLista; var x: tContacto):boolean;
var dir: pNodo; ant: pNodo; act : pNodo;
begin
  seekEOF(archivo);
  ordenar(archivo);
end;  // #FIN DE INSERTARLISTA()

function abrirArchivo(var archivo:TextFile; ruta:string):boolean;
begin
  {$I-}
  {try
    reset(archivo);
  finally
    try
      assignFile(archivo, ruta);
      reset(archivo);
    finally
      abrirArchivo := false;
    end;  // ### FIN DE TRY 2
  end;  // ### FIN DE TRY 1}

  assignFile(archivo, ruta);
  reset(archivo);

  abrirArchivo := true;
  {$I+}
end;  // ### FIN DE abrirArchivo

procedure cerrarArchivo(var archivo:TextFile);
begin
  closeFile(archivo);
end;

function leer(var archivo:TextFile; ):char;
var
  salida:char;
begin
  if (not eof(archivo)) then
  begin
    read(archivo, salida);
    leerCaracter := salida;
  end;
end;

initialization
begin
function abrirArchivo(var archivo:TextFile; ruta:string):boolean;
procedure cerrarArchivo(var archivo:TextFile);
function leerCaracter(var archivo:TextFile):char;
end;  // ### FIN DE INITIALIZATION

end.  // ### FIN DE IMPLEMENTATION
