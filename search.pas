const
        di:array[1..3] of -1..1 = (1,-1,0);
        dj:array[1..3] of 0..2 = (1,1,2);
var
        min,n,m:longint;
        qx,d,a:array[0..1000000] of longint;
procedure BFS;
var front,rear,k:longint;
        begin
                fillchar(a,sizeof(qx),0);
                front:=1; rear:=1;
                a[n]:=2;
                qx[1]:=n;
                d[qx[1]]:=0;
                        while front<=rear do
                                begin
                                        for k:=1 to 3 do
                                                if (qx[front]<>0) and ((a[qx[front]*dj[k] + di[k]])=0) then
                                                begin
                                                        inc(rear);
                                                        qx[rear]:=qx[front]*dj[k] + di[k];
                                                        d[qx[rear]]:=d[qx[front]]+1;
                                                        a[qx[rear]]:=2;
                                                        if qx[rear]=m then
                                                                begin
                                                                        min:=d[qx[rear]];
                                                                        exit;
                                                                end;
                                                end;
                                        inc(front);
                                end;
        end;
procedure xuat_nhap;
var i:integer;
        begin
                min:=high(longint);
                assign(input,'search.inp'); reset(input);
                assign(output,'search.out'); rewrite(output);
                readln(n,m);
                BFS;
                write(min);
        end;

begin
        xuat_nhap;
end.






