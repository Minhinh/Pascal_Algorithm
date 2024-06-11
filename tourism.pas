const
      maxE=round(1e4);
      maxC=100*maxE;
var
cp:array[1..100,1..100] of longint;
try,opt,save:array[1..101] of longint;
free:array[1..101] of boolean;
m,n,min:longint;
        procedure nhap;
        var i,j,k:longint;
        begin
                assign(input,'tourism.inp');  reset(input);
                readln(n,m);
                for i:=1 to n do
                for j:=1 to n do
                        if i=j then cp[i,j]:=0 else cp[i,j]:=maxC;
                for k:=1 to m do
                begin
                        readln(i,j,cp[i,j]);
                        cp[j,i]:=cp[i,j];
                end;
        end;
procedure init;
begin
fillchar(free,n,true);
free[1]:=false;
try[1]:=1;
save[1]:=0;
min:=maxC;
end;
                procedure find(i:longint);
                var j:longint;
                begin
                        if min= maxC then writeln('khong co loi giai');
                        for j:=2 to n do
                                if free[j] then
                                begin                                                                                                       try[i]:=j;
                                        save[i]:=save[i-1]+cp[try[i-1],j];
                                                if save[i]<min then
                                                        if i<n then
                                                        begin
                                                                free[j]:=false;
                                                                find(i+1);
                                                                free[j]:=true;
                                                        end
                                                        else
                                                                if save[n]+cp[try[n],1]<min then
                                                                begin
                                                                        opt:=try;
                                                                        min:=save[n]+cp[try[n],1];
                                                                end;
                                end;
                end;
procedure xuat;
var i:longint;
begin
assign(output,'tourism.out'); rewrite(output);
if min=maxC then
        for i:=1 to n do write(opt[i], '->')
  else
                for i:=1 to n do write(opt[i], '->');
                writeln(1);
                writeln( 'Cost:',min);
end;
        begin
        nhap;
        init;
        find(2);
        xuat;
        end.
