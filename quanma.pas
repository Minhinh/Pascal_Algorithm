const   dx:array[1..8] of shortint=(-2,-1,1,2,2,1,-1,-2);
	dy:array[1..8] of shortint=(-1,-2,-2,-1,1,2,2,1);

var n,m,x1,y1,x2,y2,min:longint;
      a:array [0..1003,0..1003] of boolean;
    f:text;

procedure loangBFS(i,j:longint);
Var qx, qy,d:array[0..1000000] of longint;
    front,rear,k:longint;

Begin
    front:=1; rear:=1;
    qx[1]:=i; qy[1]:=j;
    a[i,j]:=true;
    min:=maxlongint;
	Repeat
        For k:=1 to 8 do if (qx[front]+dx[k]>=1)
                 and (qx[front]+dx[k]<=n)
                 and (qy[front]+dy[k]>=1)
                 and (qy[front]+dy[k]<=m)
                 and (a[qx[front]+dx[k],qy[front]+dy[k]]=false) then
           		Begin
               			rear:=rear+1;
                                qx[rear]:=qx[front]+dx[k]; qy[rear]:=qy[front]+dy[k];
                   		a[qx[rear],qy[rear]]:=true;
                                d[rear]:=d[front]+1;
                                if (d[rear]<min) and (qx[rear]=x2) and (qy[rear]=y2) then min:=d[rear];
                      	End;

        front:=front+1;
    Until ((qx[rear]=x2) and (qy[rear]=y2)) or (front>rear);

    if (min<>maxlongint) then write(f,min) else write(f,'-1');
End;

begin
 fillchar(a,sizeof(a),FALSE);
 assign(f,'QUANMA.inp');
 reset(f);
                readln(f,n,m);
                readln(f,x1,y1);
                read(f,x2,y2);
close(f);
 assign(f,'QUANMA.out');
 rewrite(f);
        loangBFS(x1,y1);
close(f);
end.



