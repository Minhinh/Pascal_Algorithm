uses math;
var f,g:text; a,b,c:array[0..10000] of longint; i,m,max,n:longint;
begin
        assign(f,'DAY.inp'); reset(f);
        assign(g,'DAY.out'); rewrite(g);
        readln(f,n);
        for i:=1 to n do
        begin
                readln(f,a[i]);
                a[i+n]:=a[i];
                if a[i]<a[i-1]+a[i] then
                begin
                        a[i]:=a[i-1]+a[i];
                        b[i]:=b[i-1]+1;
                        c[i]:=c[i-1];
                end
                else
                begin
                        b[i]:=1;
                        c[i]:=i;
                end;
                if max<a[i] then
                begin
                        max:=a[i];
                        m:=i;
                end;
        end;
        for i:=n+1 to n*2-1 do
        begin
                if a[i]<a[i-1]+a[i] then
                begin
                        a[i]:=a[i-1]+a[i];
                        b[i]:=b[i-1]+1;
                        c[i]:=c[i-1];
                end
                else
                begin
                        b[i]:=1;
                        c[i]:=i;
                end;
                if b[i]>n then break
                else if a[i]>max then
                begin
                        max:=a[i];
                        m:=i;
                end;
        end; writeln(g,max); writeln(g,c[m],' ',b[m]);
        close(f); close(g);
end.