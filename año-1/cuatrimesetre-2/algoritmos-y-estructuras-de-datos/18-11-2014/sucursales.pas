unit sucursales;
interface

procedure sucursalStats(l:lEnvio; r:tStats);

implementation
procedure sucursalStats(l:lEnvio; r:tStats);
var
	aux:pEnvio;
begin
	r.envios := 0;
	r.total := 0;
	with aux^.info do
	begin
		aux := l.cab;
		r.sucursal := sucursal;
		while aux <> nil do
		begin
			r.envios := r.envios + 1;
			r.total := r.total + costo;
		end;
	end;
end;

procedure recorrerLista(var l:lEnvios);
var
	aux:pEnvio;
begin
	aux:l.cab;
	while aux <> nil do
	begin
		with aux^.info do
		begin
			writeln(sucursal, ':', código, '    destino: ', destino, '  costo:', costo);
		end;
		aux := aux^.sig;
	end;
end;

end.