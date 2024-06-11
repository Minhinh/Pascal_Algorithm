uses math;
const max=100; oo=32000;
type mang=array[1..100] of integer;
var f,g:text;
    a:array[1..100,1..100] of integer;
    d:mang;
    truoc:mang;
    chon:array[1..100] of boolean;
    n,m,s,z,u,v,i:integer;
procedure input;
begin
     assign(f,'DIJKSTRA.inp'); reset(f);
     readln(f,n,m,s,z);
     for u:=1 to n do
      for v:=1 to n do
       if u=v then a[u,v]:=0 else a[u,v]:=32000;
     for i:=1 to m do readln(f,u,v,a[u,v]);
     close(f);
end;

procedure init;
begin
        for v:=1 to n do
        begin
                d[v]:=a[s,v];
                truoc[v]:=s;
                chon[v]:=false;
        end;
        d[s]:=0;
        chon[s]:=true;
        u:=s;
end;

procedure dijkstra;
var min:integer;
begin
        repeat
         for v:=1 to z do
          if (not chon[v]) and (d[v]>d[u]+a[u,v]) then
          begin
                d[v]:=d[u]+a[u,v];
                truoc[v]:=u;
          end;
         min:=32000;
         for i:=1 to n do
          if (not chon[i]) and (d[i]<min) then
          begin
                min:=d[i];
                u:=i;
          end;
         if (min<> oo) then chon[u]:=true;
        until (chon[z]) or (min=oo);
end;

procedure output;
var st,tam:string;
begin
        assign(g,'DIJKSTRA.out'); rewrite(g);
        if d[z]=32000 then writeln('NO')
        else
        begin
                writeln(g,'YES');
                writeln(g,d[z]);
                st:='';
                while (z<>s) do
                begin
                        str(z,tam);
                        st:=st+tam;
                        z:=truoc[z];
                end;
                write(g,s);
                for i:=length(st) downto 1 do write(g,' -> ',st[i]);
        end; close(g);
end;

begin
        input; init; dijkstra; output;
end.
