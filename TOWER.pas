uses math;
var f,g:text; a,b,n,i,j,d,t:longint;
begin
        assign(f,'TOWER.inp'); reset(f);
        assign(g,'TOWER.out'); rewrite(g);
        readln(f,a,b);
        if (b mod a<>0) or (a<=0) or (b<=0) then write(g,-1)
        else
        begin
                n:=b div a; i:=2; t:=a; j:=a;
                repeat
                        while n mod i<>0 do inc(i);
                        j:=j*i; inc(t,j);
                        inc(d); n:=n div i;
                until n=1;
        end; inc(d);
        write(g,d,' ',t);
        close(f); close(g);
end.
