uses math;
var f,g:text; a,b:array[1..1000] of longint; l:array[0..1000,0..1000] of longint; i,j,w,n:longint;
begin
        assign(f,'VALIB.inp'); reset(f);
        assign(g,'VALIB.out'); rewrite(g);
        readln(f,n,w);
        for i:=1 to n do readln(f,a[i],b[i]);
        for i:=1 to n do
        begin
                for j:=1 to w do
                begin
                        if a[i]<=j then l[i,j]:=max(l[i-1,j-a[i]]+b[i],l[i-1,j])
                        else l[i,j]:=l[i-1,j];
                end;
        end; write(g,l[n,w]);
        close(f); close(g);
end.
