unit types;
interface
	const
		n = 5;
	type
		tEnvio = record
					sucursal:string[50];
					codigo:word;
					destino:string;
					costo:real;
				end;
		pEnvio = ^nEnvio;
		nEnvio = record
					info:tEnvio;
					sig:pEnvio;
				end;
		lEnvio = record
					cab:pEnvio;
					tam:word;
				end;
		
		tSucursal = record
					sucursal:string;
					l:lEnvio;
					end;
		vSucursal = array[1..n] of tSucursal;