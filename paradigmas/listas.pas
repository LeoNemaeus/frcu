{$IFDEF FPC}
  {$MODE DELPHI}
{$ENDIF}


unit  archivos;

interface
uses
  Sysutils;

type
  pNodo = word;
  tLista = record
    cab: pNodo;
  end;

function insertarlista (var l: tLista; var x: tContacto):boolean;
function buscarLista(var lista:tLista; buscado:string; var salida:pNodo):boolean;
function removerLista(var lista:tLista; item:pNodo):boolean;
function obtenerItem(lista:tLista; nodo:pNodo):tContacto;
procedure recorrerLista(lista:tLista);

implementation

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

function leerCaracter(var archivo:TextFile):char;
var
  salida:char;
begin
  if (not eof(archivo)) then
  begin
    read(archivo, salida);
    leerCaracter := salida;
  end;
end;

function insertarlista (var l: tLista; var x: tContacto):boolean;
begin
  
end;  // #FIN DE INSERTARLISTA()

initialization
begin
function abrirArchivo(var archivo:TextFile; ruta:string):boolean;
procedure cerrarArchivo(var archivo:TextFile);
function leerCaracter(var archivo:TextFile):char;
end;  // ### FIN DE INITIALIZATION

end.  // ### FIN DE IMPLEMENTATION
