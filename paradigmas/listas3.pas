unit listadin;

interface
uses tipos;

procedure crearlista (var l: t_lista);
procedure insertarlista (var l: t_lista; var x: t_datolista);
procedure listar (var l: t_lista;F:t_fecha;opcion2:word);
procedure listarmes (var l: t_lista;F:t_fecha;opcion2:word);
function listavacia (var l: t_lista): boolean;

implementation

procedure crearlista (var l: t_lista);
begin
l.cab := nil;
l.tam := 0;
end;

procedure insertarlista (var l: t_lista; var x: t_datolista);
var dir: t_punt; ant: t_punt; act : t_punt;
begin
new (dir);
dir^.info := x;
if (l.cab = nil) or (l.cab^.info.pat > x.pat) then
   begin
   dir^.sig := l.cab;
   l.cab := dir;
   end
else
    begin
    ant := l.cab;
    act := l.cab^.sig;
    while (act <> nil) and (act^.info.pat < x.pat) do
          begin
          ant := act;
          act := act^.sig;
          end;
    ant^.sig := dir;
    dir^.sig := act;
    end;
inc (l.tam);
end;

procedure listar (var l: t_lista;F:t_fecha;opcion2:word);
var act: t_punt; tecla:char;

begin
act := l.cab;
while (act <> nil) and (tecla<>'n') do
begin
     if  (F.aa=act^.info.F.aa) and (F.mm=act^.info.F.mm) then
     begin
         if (F.dd=act^.info.F.dd) then
         begin
         writeln('');
         with act^.info do
         begin
         writeln ('PATENTE ',pat);
         writeln ('NOMBRE ',nom);
         writeln ('DNI ',DNI);
         writeln ('VELOCIDAD ',vel,'km/h');
         writeln ('MULTA $',mul:0:2);
         writeln ('CUADRANTE ',cuad);
         writeln ('FECHA ',f.dd,'/',f.mm,'/',f.aa);
         writeln ('ID ',pos);
          if activo=true then
          writeln('pago de multa pendiente')
          else
          writeln('multa pagada');
          writeln('');
          writeln('¨seguir mostrando? s/n');
         readln(tecla);
         end;
      end;
      end;
      act := act^.sig;
end;
end;

procedure listarmes (var l: t_lista;F:t_fecha;opcion2:word);
var act: t_punt; tecla:char;

begin
act := l.cab;
while (act <> nil) and (tecla<>'n') do
begin
     if  (F.aa=act^.info.F.aa) and (F.mm=act^.info.F.mm) then
     begin
         writeln('');
         with act^.info do
         begin
         writeln ('PATENTE ',pat);
         writeln ('NOMBRE ',nom);
         writeln ('DNI ',DNI);
         writeln ('VELOCIDAD ',vel,'km/h');
         writeln ('MULTA $',mul:0:2);
         writeln ('CUADRANTE ',cuad);
         writeln ('FECHA ',f.dd,'/',f.mm,'/',f.aa);
         writeln ('ID ',pos);
          if activo=true then
          writeln('pago de multa pendiente')
          else
          writeln('multa pagada');
          writeln('');
          writeln('¨seguir mostrando? s/n');
         readln(tecla);
         end;
         end;
      act := act^.sig;
end;
end;

function listavacia (var l: t_lista): boolean;
begin
listavacia := (l.tam = 0);
end;

end.