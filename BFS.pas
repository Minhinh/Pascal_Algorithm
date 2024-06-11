uses math;
var f,g:text;
    a:array [1..101,1..101] of boolean;
    free:array [1..101] of boolean;
    q:array [1..101] of integer;
    n,m,s,dau,cuoi:integer;

procedure init;
begin
        fillchar(a,sizeof(a),false);
        fillchar(free,sizeof(free),true);
        dau:=1; cuoi:=0;
end;

procedure readf;
var i,u,v:integer;
begin
        readln(f,n,m,s);
        for i:=1 to m do
        begin
                readln(f,u,v);
                a[u,v] := true;
                a[v,u] := true;
        end;
end;

procedure push(u:integer);
begin
        inc(cuoi);
        q[cuoi]:=u;
end;

function pop:integer;
begin
        pop:=q[dau];
        inc(dau);
end;

procedure BFS(i:integer);
var u,v:integer;
begin
        push(i);
        free[i] := false;
        while dau<=cuoi do
        begin
                u:=pop;
                writeln(g,u);
                for v:=1 to n do
                if a[u,v] and free[v] then
                begin
                        push(v);
                        free[v]:=false;
                end;
        end;
end;

procedure main;
var i:integer;
begin
        init;
        readf;
        BFS(s);
end;

begin
        assign(f,'BFS.inp'); reset(f);
        assign(g,'BFS.out'); rewrite(g);
        main;
        close(f); close(g);
end.
