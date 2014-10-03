program tp10_8;
uses crt;
const
	n = 4;

type
	t_alumno = record
					id:word;
					nota:1..10;
					sexo:char;
				end;
	
	t_v_alumno = array[1..n] of t_alumno;
    cte = 1..n;

procedure init(VAR v:t_v_alumno);
var
   i:1..n;
begin
	for i:= 1 to n do
		v[i].id := 0;
		v[i].nota := 1;
		v[i].sexo := #36;
end;

procedure cargar(VAR v:t_v_alumno);
var i:1..n;
begin
	for i := 1 to n do
     begin
		v[i].id := i;
        writeln('');
        writeln('Alumno: ', v[i].id);
		write('Ingrese nota: ');
		readln(v[i].nota);
		write('Ingrese sexo: ');
		readln(v[i].sexo);
  end;
end;

function varones_aprobados(v:t_v_alumno):cte;
var
	i: 1..n;
	lim: 0..n;
	
begin
     lim := 1;
	for i := 1 to n do
		if v[i].nota >= 4 then inc(lim);
		varones_aprobados:=lim;
end;

function mujeres_excelente(v:t_v_alumno):real;
var
	i:1..n;
	c:0..n;
	r:real;
begin
     c:= 0;
	for i := 1 to n do
		with v[i] do
			if (v[i].nota = 10) AND (v[i].sexo = 'F') then
				inc(c);
		
	r := (c*100)/n;
	mujeres_excelente := r;
end;

function desaprobados(v:t_v_alumno):real;
var
	i:1..n;
	c:0..n;
	r:real;
begin
     c:=0;
	for i := 1 to n do
			if (v[i].nota < 4) then
				inc(c);
		
	r := (c*100)/n;
	desaprobados := r;
end;

var
	v:t_v_alumno;
    op:char;
    key:char;
    run:boolean;

begin 			{**principal**}
      run := true;
	repeat

		writeln('Seleccione una opcion: ');
		writeln('	1: inicializar el vector');
		writeln('	2: cargar el vector');
		writeln('	3: ver varones aprobados');
		writeln('	4: ver mujeres con nota = 10');
		writeln('	5: ver desaprobados');
        op := readkey;
		
		case op of
			'1': init(v);
			'2': cargar(v);
			'3': begin
                    writeln('');
                    writeln(varones_aprobados(v));
                 end;
			'4': begin
                 writeln('');
                  writeln(mujeres_excelente(v)3:1);
             end;
			'5': begin
                 writeln('');
                   writeln(desaprobados(v):3:1);
                   end;
             #27: run := false;
        end;
	until run = false;
 end.
