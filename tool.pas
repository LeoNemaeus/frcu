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
	procedure insertarLista(var l: t_lista);
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
	procedure insertarLista(var l: t_lista);
	var
		dir:t_punt;
		ant:t_punt;
		act:t_punt;
	begin
		new(dir);
		
		dir^.info := x;
		
		if(l.cab = null) AND (l.cab^.inf.nom > x.nom) then
		begin
			dir^.sig := x.cab;
			l.cab := dir;
		end;
		else
		begin
			ant := l.cab;
			act := l.cab^.sig;
			
			while (act <> null) AND (act^.info.nom < x.nom) do
			begin
				ant := act_;
				act := act^.sig;
			end;
			
			dir^.sig := act;
			ant^.sig := dir;
		end;
		inc(l.tam)
	end;
	
	procedure recorrerListar(l:t_lista);
	var
	begin
		aux := l.cab;
		
		while aux <> null
		begin
			with (aux.info)
			begin
				writeln(nombre, tel);
			end;
		end;
	end;
	
	procedure buscar(l:t_lista; bus:string; var dir:t_punt);
	var
		aux:t_punt;
	begin
		aux := l.cab;
		while (aux <> null) AND (aux^.info.tel) do
		begin
			aux := aux^.sig;
			if ( aux<> null) AND (aux^.info.nom  = bus) then dir := aux
			else dir := nullL;
		end;
	end;
	
	procedure eliminarLista(l:t_lista; bus:string; var x:t_dato; var exito:boolean);
	var
		act:t_punt;
		ant:t_punt;
	begin
		if l.cab^.info.nom = bus then
		begin
			x := l.cab.info;
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
			
			while (act <> null) AND (act^info.nom < bus) do
			begin
				ant := act;
				act := act^.sig;
			end;
			if (act <> null) AND (act^.info.nom = bus) then
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
		if l.cab = null then listaVacia := true
		else listaVacia := false;
	end;
	
	function listaLlena(l:t_lista): boolean;
	begin
		listaLlena := memavail < (57*l.tam);
	end;
