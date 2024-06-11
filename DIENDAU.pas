uses math;
var f,g:text; a:array[0..1000] of longint; l:array[-10000..10000,-10000..10000] of longint; i,j,n,s,t:longint;
begin
        assign(f,'DIENDAU.inp'); reset(f);
        assign(g,'DIENDAU.out'); rewrite(g);
        readln(f,n,s); t:=0;
        for i:=1 to n do
        begin
                read(f,a[i]);
                inc(t,a[i]);
        end; l[1,a[1]]:=1;
        for i:=1 to n do
        begin
                for j:=-1000 to 1000 do
                begin
                        if (l[i-1,j+a[i]]=1) or (l[i-1,j-a[i]]=1) then l[i,j]:=1;
                end;
        end;
        if l[n,s]=1 then writeln(g,'CO')
        else writeln(g,'KHONG');
        close(f); close(g);
end.
