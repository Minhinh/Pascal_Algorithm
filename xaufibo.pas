var
fi:array[1..35] of string;
s:string;
n,dem,i:integer;
begin
assign(input,'fibo.inp');
assign(output,'fibo.out');
reset(input);
rewrite(output);
readln(n);
readln(s);
fi[1] :='A';
fi[2] :='B';
fi[3] :='AB';
fi[4] :='BAB';
fi[5] :='ABBAB';
fi[6] :='BABABBAB';
dem:=0;
if n>6 then
for i:=7 to n do
fi[i]:=fi[i-2]+fi[i-1];
for i:=1 to length(fi[n]) - length(s)+1 do
        if fi[n][i] = s[1] then
                if s=copy(fi[n],i,length(s)) then inc(dem);
        writeln(dem);
end.