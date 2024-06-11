uses math;
var f,g:text; s:string; i,n,d,dem,kt:longint;
begin
        assign(f,'ARMY.inp'); reset(f);
        assign(g,'ARMY.out'); rewrite(g);
        readln(f,n); read(f,s); kt:=0;
        for i:=1 to n do
        begin
                if a[i]='>' then kt:=1;
                if kt=1 then
                begin
                        if a[i]='>' then inc(dem);
                        if a[i]='<' then
                        begin
                                if d<dem then d:=dem
                                else inc(d);
                        end;
                end;
        end; writeln(g,d);
        close(f); close(g);
end.
