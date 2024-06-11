uses math;
var f,g:text;
    a:array [1..101,1..101] of boolean;
    free:array [1..101] of boolean;
    q:array [1..101] of integer;
    n,m,s,dau,cuoi: integer;

procedure init;
begin
        fillchar(a,sizeof(a),false);
        fillchar(free,sizeof(free),true);
end;

procedure readf;
var i,u,v:integer;
begin
        readln(f,n,m,s);
        for i:=1 to m do
        begin
                readln(f,u,v);
                a[u,v]:=true;
                a[v,u]:=true;
        end;
end;

procedure DFS(u:integer);
var v:integer;
begin
        writeln(g,u);
        free[u]:=false;
        for v:=1 to n do if a[u,v] and free[v] then dfs(v);
end;

procedure main;
var i:integer;
begin
        init;
        readf;
        DFS(s);
end;

begin
        assign(f,'DFS.inp'); reset(f);
        assign(g,'DFS.out'); rewrite(g);
        main;
        close(f); close(g);
end.
