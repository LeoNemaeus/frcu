program tp10_5;
uses crt;
const
     n = 5;

type
	t_libro = record
					cod:word;
					stock:word;
				end;
	t_v_libro = array[1..n] of t_libro;
       cte=0..N;
procedure init(VAR v:t_v_libro);
var
   i:1..n;
begin
	for i:= 1 to n do
		v[i].cod := 0;
		v[i].stock := 0;
end;

procedure cargar(VAR v:t_v_libro);
var i:1..n;
begin
	for i := 1 to n do
	begin
		writeln('');
		write('Ingrese codigo del libro: ');
		readln(v[i].cod);
		write('Ingrese stock del libro: ');
		readln(v[i].stock);
	end;
end;

function check_stock(l:t_libro):boolean;
var
	r:boolean;
begin
	if l.stock <= 3 then
            r := true
    else
        r := false;

	check_stock := r;
end;

procedure llenar_stock(VAR v:t_v_libro; VAR  r:t_v_libro; VAR lim:cte);
var
	i:1..n;
begin
	lim := 0;
	for i:= 1 to n do
	begin
		if check_stock(v[i]) then
		begin
			lim := lim + 1;
			r[lim].cod := v[i].cod;
		end;
	end;
end;

procedure ver_stock(v:t_v_libro);
var
	i:1..n;
	v_nstock: t_v_libro;
	lim:1..n;
begin
	llenar_stock(v, v_nstock, lim);
	writeln('Los libros que requieren reponer el stock son:');
	for i := 1 to lim do write(v_nstock[i].cod, ', ');
end;

var
	v:t_v_libro;
    op:char;
    run:boolean;

begin 			{**principal**}
    run := true;

	repeat
		writeln('Seleccione una opción: ');
		writeln('	1: inicializar el vector');
		writeln('	2: cargar el vector');
		writeln('	3: ver stock');
		op := readkey;

		case op of
			'1': init(v);
			'2': cargar(v);
			'3': ver_stock(v);
			#27: run := false;
		end;
	until run=false;
end.
