Const 	fin	='FOOD.inp';
        fout    ='FOOD.out';
Var 	a: array [1..1000000] of longint;
		b: array [1..1000000] of longint;
		d: array [1..1000000] of real;
		tamr: real;
		max,n,k,j,i,tam,buy,cost,h : longint;
		f,g 	:text;
Procedure xuli;
Begin
	cost:=0;
	for i:=1 to n-1 do
		for j:=i+1 to n do
			if d[i]>d[j] then
				begin
					tamr:=d[i];
					d[i]:=d[j];
					d[j]:=tamr;
					tam:=a[i];
					a[i]:=a[j];
					a[j]:=tam;
					tam:=b[i];
					b[i]:=b[j];
					b[j]:=tam;
				end;
	i:=1;
	repeat
		buy:=h div a[i];
		cost:=cost+(buy*b[i]);
		h:=h mod a[i];
		inc(i);
	until h=0;
	write (g,cost);
End;
Begin
	assign (f,fin); reset (f);
	assign (g,fout); rewrite (g);
	readln (f,n,h);
	for i:=1 to n do
	begin
		readln(f,a[i],b[i]);
		d[i]:=b[i]/a[i];
	end;
	xuli;
    close (f);
 	close (g);
End.
