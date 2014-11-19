program sucursales;
uses types;

var
	op:char; arg1:string; pos, arg2:word;
	stats, moreStats:tStats;
begin

	

	repeat
		readln(op);
		case op of
			'1': begin
				for i := 1 to n do
				begin
					recorrerlista(v[i].l);
				end;
			end;
			'2': begin
				readln(arg);
				bbin(v, n, arg, pos);
				sucursalStats(v[pos].l, stats);
				writeln(stats.envios, stats.total);
			end;
			'3': begin
				sucursalStats(v[1].l, stats);
				moreStats := stats;
				i := 2;
				while i < n do
				begin
					sucursalStats(v[i].l, stats);
					if stats.envios > ac then moreStats := stats;
				end;
				writeln('Sucursal: ', moreStats.sucursal, ' - ', moreStats.envios);
			end;
			'4': begin
				readln(arg1);
				readln(arg2);
				bbin(v, n, arg1, pos);
				if pos <> 0 then
				buscarLista(v[pos].l, arg2, x);
			end;
			'5': begin
			
			end;
end.