unit tool;

interface

	type
		t_dato = record
			nom: string[40];
			tel: string[15];
		end;
		
		t_punt = ^t_nodo;
		
		t_nodo = record
				info:t_dato;
				sig:t_punt;
			end;
			
		t_lista = record
					cab:t_punt;
					tam:word;
				end;

	procedure crearLista(var l:t_lista);
	procedure insertarLista(var l: t_lista; var x:t_dato);
	procedure recorrerListar(l:t_lista);
	procedure buscar(l:t_lista; bus:string; var dir:t_punt);
	procedure eliminarLista(l:t_lista; bus:string; var x:t_dato; var exito:boolean);
	
	function listaVacia(l: t_lista): boolean;
	function listaLlena(l:t_lista): boolean;
	
implementation
	procedure crearLista(var l:t_lista);
	begin
		l.cab := nil;
		l.tam := 0;
	end;
procedure insertarLista(var l: t_lista; var x:t_dato);
	var
		dir:t_punt;
		ant:t_punt;
		act:t_punt;
	begin
		new(dir);
		
		dir^.info := x;
		
		if(l.cab = nil) AND (l.cab^.info.nom > x.nom) then
		begin
			dir^.sig := l.cab;
			l.cab := dir;
		end
		else
		begin
			ant := l.cab;
			act := l.cab^.sig;
			
			while (act <> nil) AND (act^.info.nom < x.nom) do
			begin
				ant := act;
				act := act^.sig;
			end;
			
			dir^.sig := act;
			ant^.sig := dir;
		end;
		inc(l.tam)
	end;
	
	procedure recorrerListar(l:t_lista);
	var
		aux:t_punt;
	begin
		aux := l.cab;
		
		while (aux <> nil) do
		begin
			write(aux.info^.nombre, aux.info^.tel);
		end;
		aux := aux^.sig;
	end;
	
	procedure buscar(l:t_lista; bus:string; var dir:t_punt);
	var
		aux:t_punt;
	begin
		aux := l.cab;
		while (aux <> nil) AND (aux^.info.tel) do
		begin
			aux := aux^.sig;
			if ( aux<> nil) AND (aux^.info.nom  = bus) then dir := aux
			else dir := nilL;
		end;
	end;
	
	procedure eliminarLista(l:t_lista; bus:string; var x:t_dato; var exito:boolean);
	var
		act:t_punt;
		ant:t_punt;
	begin
		if l.cab^.info.nom = bus then
		begin
			x := l.cab^.info;
			act := l.cab;
			l.cab := act^.sig;
			dispose(act);
			l.tam := l.tam - 1;
			exito := true;
		end;
		else
		begin
			ant := l.cab;
			act := l.cab^.sig;
			
			while (act <> nil) AND (act^info.nom < bus) do
			begin
				ant := act;
				act := act^.sig;
			end;
			if (act <> nil) AND (act^.info.nom = bus) then
			begin
				x :0 act^.info;
				exito := true;
				ant^.sig := act^.sig;
				dispose(act);
				dec(l.tam);
			end;
			else exito := false;

		end;
	end;
	
	
	function listaVacia(l: t_lista): boolean;var
	begin
		if l.cab = nil then listaVacia := true
		else listaVacia := false;
	end;
	
	function listaLlena(l:t_lista): boolean;
	begin
		listaLlena := memavail < (57*l.tam);
	end;
