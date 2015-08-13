unit tipos;
interface
{const
  n = 65535;
type
  tNodo = word;
  tContacto = record
    idPersona:word;
    nombre:string[30];
    telefono:longint;
    domicilio:string[15];
  end;
  tLista = record
    vector: array[1..n] of tContacto;
    lim:tNodo;
  end;}


const
  n = 65535;
type
    tContacto = record
        idPersona:word;
        nombre:string[30];
        telefono:longint;
        domicilio:string[15];
    end;
  pNodo = ^tNodo;
  tNodo = record
    info:tContacto;
    sig:pNodo;
  end;
  tLista = record
    cab,actual: pNodo;
  end;
    tAgenda = record
        lista:tLista;
    end;

implementation
end.