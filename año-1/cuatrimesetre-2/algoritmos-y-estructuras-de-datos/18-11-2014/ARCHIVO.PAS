UNIT ARCHIVO;
INTERFACE
USES CRT;
CONST
RUTA= 'ARCHIVODATOS.DAT';
b=20;

TYPE
        t_dato= record
               desc: string[40];
               imei: string[15];
               p_c: STRING [10];
               p_v: STRING [10];
               f_i: string [10];
               f_e: string [10];
               hora: string [10];
                end;
        t_archivo= file of t_dato;

PROCEDURE  CREAR(VAR V_AR:T_ARCHIVO);
PROCEDURE  ABRIR (VAR V_AR: T_ARCHIVO);
PROCEDURE CERRAR (VAR V_AR: T_ARCHIVO);
PROCEDURE TRAEREGISTRO(VAR V_AR:T_ARCHIVO; VAR REG: T_DATO; POS:WORD);
PROCEDURE GRABAREGISTRO (VAR V_AR:T_ARCHIVO; VAR REG:T_DATO; POS: WORD);
PROCEDURE CARGAREGISTRO (VAR REG: T_DATO);
PROCEDURE MUESTRAREGISTRO (VAR REG: T_DATO);
PROCEDURE DRAW (X1,Y1,X2,Y2: INTEGER);
IMPLEMENTATION

PROCEDURE  CREAR(VAR V_AR:T_ARCHIVO);
BEGIN
ASSIGN (V_AR, RUTA);
REWRITE (V_AR);
END;


PROCEDURE  ABRIR (VAR V_AR: T_ARCHIVO);
BEGIN
ASSIGN (V_AR, RUTA);
RESET (V_AR);
END;


PROCEDURE CERRAR (VAR V_AR: T_ARCHIVO);
BEGIN
CLOSE (V_AR);
END;

PROCEDURE TRAEREGISTRO(VAR V_AR:T_ARCHIVO; VAR REG: T_DATO; POS:WORD);
BEGIN
SEEK (V_AR,POS);
READ (V_AR,REG);
END;

PROCEDURE GRABAREGISTRO (VAR V_AR:T_ARCHIVO; VAR REG:T_DATO; POS: WORD);
BEGIN
SEEK (V_AR,POS);
WRITE (V_AR,REG);
END;

PROCEDURE CARGAREGISTRO (VAR REG: T_DATO);
BEGIN
     WITH REG DO
        BEGIN
             WRITE ('Descripci¢n: ');
             READLN (desc);
             WRITE ('Imei: ');
             READLN (imei);
             WRITE ('PRECIO COSTO: ');
             READLN (p_c);
             WRITE ('PRECIO VENTA: ');
             READLN (p_v);
             WRITE ('FECHA DE INGRESO: ');
             READLN (f_i);
             WRITE ('HORA DE INGRESO: ');
             READLN (hora);
             WRITE ('FECHA DE EGRESO: ');
             READLN (f_e);
        END;
END;

PROCEDURE MUESTRAREGISTRO (VAR REG: T_DATO);
        BEGIN
            WITH REG DO
            begin
            WRITELN ('  ');
            WRITELN ('Descripcion: ',(COPY(desc,1,40)),'  ','Imei: ',(COPY(imei,1,15)));
            WRITELN ('Precio de costo: ',(COPY(p_c,1,10)),'  ','Precio de Venta: ',(COPY(p_v,1,10)));
            WRITELN ('Fecha de ingreso: ',(COPY(f_i,1,10)),'  ','Hora: ',(COPY(hora,1,10)),'  ','Fecha de Egreso: ',(COPY(f_e,1,10)));
            end;
        END;
PROCEDURE DRAW (X1,Y1,X2,Y2: INTEGER);
BEGIN
    GOTOXY (X1,Y1);
    WRITE ('.');
    GOTOXY (X2,Y2);
    WRITE ('.');
    GOTOXY (X1,Y2);
    WRITE ('.');
    GOTOXY (X2,Y1);
    WRITE ('.');
END;
        END.
