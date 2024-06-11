uses math;
var f,g:text; a,l1,l2:array[1..10000] of longint; i,j,n,max:longint;
begin
        assign(f,'WAVIO.inp'); reset(f);
        assign(g,'WAVIO.out'); rewrite(g);
        readln(f,n); max:=0;
        for i:=1 to n do read(f,a[i]);
        for i:=1 to n do
        begin
                l1[i]:=1;
                for j:=1 to i-1 do if (a[j]<=a[i]) and (l1[i]<l1[j]+1) then L1[i]:=L1[j]+1;
        end;
        for i:=n downto 1 do
        begin
                l2[i]:=1;
                for j:=n downto i+1 do if (a[j]<=a[i]) and (l2[i]<l2[j]+1) then L2[i]:=L2[j]+1;
        end;
        for i:=1 to n do if l1[i]+l2[i]>=max then max:=l1[i]+l2[i];
        write(g,max-1); close(f); close(g);
end.
