uses math;
var f,g:text; a,b,c,d:array[1..1000] of longint; l:array[0..2000,0..2000] of longint; i,j,n,m,q:longint;
begin
        assign(f,'FARMER.inp'); reset(f);
        assign(g,'FARMER.out'); rewrite(g);
        readln(f,n,m,q);
        for i:=1 to n do
        begin
                read(f,a[i]);
                c[i]:=a[i];
                d[i]:=a[i]-1;
        end; readln(f);
        for i:=1 to m do
        begin
                read(f,b[i]);
                c[i+n]:=b[i];
                d[i+n]:=b[i];
        end;
        for i:=1 to n+m do
        begin
                for j:=1 to q do
                begin
                        if c[i]<=j then l[i,j]:=max(l[i-1,j-c[i]]+d[i],l[i-1,j])
                        else l[i,j]:=l[i-1,j];
                end;
        end; write(g,l[n+m,q]);
        close(f); close(g);
end.
