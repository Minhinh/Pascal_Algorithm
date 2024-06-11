uses math;
var f,g:text; a,max,l,p:array[1..10000] of longint; i,j,n,max2,max3,u,t:longint;
begin
        assign(f,'DOIDAU.inp'); reset(f);
        assign(g,'DOIDAU.out'); rewrite(g);
        readln(f,n,t,u);
        for i:=1 to n do read(f,a[i]);
        max[1]:=0; max2:=0;
        for i:=1 to n do
        begin
                l[i]:=1; p[i]:=1;
                for j:=1 to i-t do
                begin
                        if (a[i]-u<=a[j]) and (a[j]<=a[i]) and (l[i]<l[j]+1) then l[i]:=l[j]+1;
                        if (a[i]<=a[j]) and (a[j]<=a[i]+u) and (p[i]<p[j]+1) then p[i]:=p[j]+1;
                end;
                if max2<=l[i] then max2:=l[i];
                if max3<=p[i] then max3:=p[i];
        end;
        if max2>=max3 then write(g,max2)
        else write(g,max3);
        close(f); close(g);
end.
