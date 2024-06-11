uses math;
var f,g:text; a,l:array[0..1000] of longint; i,j,n,t,s:longint;
begin
        assign(f,'TONGS.inp'); reset(f);
        assign(g,'TONGS.out'); rewrite(g);
        readln(f,n,s); t:=s;
        for i:=1 to n do read(f,a[i]);
        l[0]:=1;
        for i:=1 to n do
        begin
                for t:=s downto a[i] do
                begin
                        if (l[t]=0) and (l[t-a[i]]=1) then l[t]:=1;
                end;
        end;
        if l[s]=1 then write(g,1)
        else write(g,-1);
        close(f); close(g);
end.
