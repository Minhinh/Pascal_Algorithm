uses math;
var f,g:text; s,t:string; i,j,n,m,p:longint; l:array[0..1000,0..1000] of longint;
begin
        assign(f,'STRINGC.inp'); reset(f);
        assign(g,'STRINGC.out'); rewrite(g);
        readln(f,n,m); readln(f,s); readln(f,t);
        for i:=1 to n do
        begin
                for j:=1 to m do
                begin
                        l[0,j]:=j; l[i,0]:=i;
                        if s[i]=t[j] then l[i,j]:=l[i-1,j-1]
                        else
                        begin
                                p:=min(l[i-1,j],l[i,j-1]);
                                l[i,j]:=min(p,l[i-1,j-1])+1;
                        end;
                end;
        end; write(g,l[n,m]);
        close(f); close(g);
end.
