uses math;
var f,g:text; a:array[0..1000,0..1000] of longint; b:array[1..1000] of real; l:array[0..1000] of longint; i,j,k,n,t1,m:longint; t2:real;
begin
        assign(f,'TAMGIAC.inp'); reset(f);
        assign(g,'TAMGIAC.out'); rewrite(g);
        readln(f,n); m:=0;
        for i:=1 to n do
        begin
                for j:=1 to 6 do read(f,a[i,j]);
                b[i]:=0.5*abs((a[i,3]-a[i,1])*(a[i,6]-a[i,2])-(a[i,5]-a[i,1])*(a[i,4]-a[i,2]));
        end;
        for i:=1 to n do
        begin
                for j:=1 to n do
                begin
                        if b[i]<b[j] then
                        begin
                                for k:=1 to 6 do
                                begin
                                        t1:=a[i,k];
                                        a[i,k]:=a[j,k];
                                        a[j,k]:=t1;
                                end;
                                t2:=b[i];
                                b[i]:=b[j];
                                b[j]:=t2;
                        end;
                end;
        end;
        for i:=1 to n do
        begin
                l[i]:=1;
                for j:=1 to i-1 do
                begin
                        if ( 0.5*( abs((a[i,3]-a[j,1])*(a[i,6]-a[j,2])-(a[i,5]-a[j,1])*(a[i,4]-a[j,2])) + abs((a[i,1]-a[j,1])*(a[i,4]-a[j,2])-(a[i,3]-a[j,1])*(a[i,2]-a[j,2])) + abs((a[i,1]-a[j,1])*(a[i,6]-a[j,2])-(a[i,5]-a[j,1])*(a[i,2]-a[j,2])) )=b[i] )
                        and ( 0.5*( abs((a[i,3]-a[j,3])*(a[i,6]-a[j,4])-(a[i,5]-a[j,3])*(a[i,4]-a[j,4])) + abs((a[i,1]-a[j,3])*(a[i,4]-a[j,4])-(a[i,3]-a[j,3])*(a[i,2]-a[j,4])) + abs((a[i,1]-a[j,3])*(a[i,6]-a[j,4])-(a[i,5]-a[j,3])*(a[i,2]-a[j,4])) )=b[i] )
                        and ( 0.5*( abs((a[i,3]-a[j,5])*(a[i,6]-a[j,6])-(a[i,5]-a[j,5])*(a[i,4]-a[j,6])) + abs((a[i,1]-a[j,5])*(a[i,4]-a[j,6])-(a[i,3]-a[j,5])*(a[i,2]-a[j,6])) + abs((a[i,1]-a[j,5])*(a[i,6]-a[j,6])-(a[i,5]-a[j,5])*(a[i,2]-a[j,6])) )=b[i] )
                        then inc(l[i]);
                end;
                m:=max(m,l[i]);
        end; write(g,m);
        close(f); close(g);
end.
