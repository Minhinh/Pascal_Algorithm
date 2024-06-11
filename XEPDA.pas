uses math;
var f,g:text; a,b,c,l:array[1..10000] of longint; i,j,n,max,t:longint;
begin
        assign(f,'XEPDA.inp'); reset(f);
        assign(g,'XEPDA.out'); rewrite(g);
        readln(f,n); max:=0;
        for i:=1 to n do
        begin
                read(f,a[i],b[i],c[i]);
                if c[i]>=b[i] then
                begin
                        a[i]:=0;
                        b[i]:=0;
                        c[i]:=0;
                end;
        end;
        for i:=1 to n do
        begin
                for j:=1 to n do
                begin
                        if a[i]>a[j] then
                        begin
                                t:=a[i]; a[i]:=a[j]; a[j]:=t;
                                t:=b[i]; b[i]:=b[j]; b[j]:=t;
                                t:=c[i]; c[i]:=c[j]; c[j]:=t;
                        end
                        else if a[i]=a[j] then
                        begin
                                if b[i]<b[j] then
                                begin
                                        t:=a[i]; a[i]:=a[j]; a[j]:=t;
                                        t:=b[i]; b[i]:=b[j]; b[j]:=t;
                                        t:=c[i]; c[i]:=c[j]; c[j]:=t;
                                end;
                        end;
                end;
        end;
        for i:=1 to n do
        begin
                l[i]:=1;
                for j:=1 to i-1 do if (a[j]>=a[i]) and (b[j]>=b[i]) and (l[i]<l[j]+1) then l[i]:=l[j]+1;
                if max<=l[i] then max:=l[i];
        end;
        write(g,max); close(f); close(g);
end.

