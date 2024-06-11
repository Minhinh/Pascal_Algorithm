var n:longint;
a:array[2..2000] of boolean;
procedure nhap;
var i:longint;
begin
        assign(input,'sangnt.inp');
        readln(n);
end;
        procedure xuat;
        var i,j:longint;
        begin
        assign(output,'sangnt.out');
        fillchar(a,sizeof(a),true);
                for i:=2 to n div 2 do
                        if a[i]=true then for j:=2 to n div i do
                                a[i*j]:=false;

                for i:=2 to n do if a[i]= true then writeln(i);
        end;
begin
nhap;
xuat;
end.
