function y=fc(isPloy,factorial);  
%function y=fc(isPloy,factorial);
%factorial表示预测函数的阶乘个数,默认是5
%isPloy判断参数的个数，来决定是否，每个阶都进行画图,默认是0(不进行画图)
%close  %关闭图形界面
%clear  %清理系统变量




if  nargin==1   %判断参数的个数，来决定是否，每个阶都进行画图
    isPloy=1;
    factorial=5;
elseif nargin>=2
else
    isPloy=0;
    factorial=5;  
end

%n=factorial;

fd=fopen('fcout.dat','w+');  %打开结果的保存文件
load fcin.dat;   %加载历史数据
x1=fcin(:,1);   %加载第一列为x1
y1=fcin(:,2);   %加载第二列为y1，红球1
y2=fcin(:,3);   %加载第三列为y2，红球2
y3=fcin(:,4);   %红球3
y4=fcin(:,5);   %红球4
y5=fcin(:,6);   %红球5
y6=fcin(:,7);   %红球6
y7=fcin(:,8);   %篮球




nextPoint=x1(length(x1))+1;  %从第一列的最后一个值中,获取下一个预期x轴值
k=nextPoint;
for n=1:1:factorial   %n表示预测函数的阶数

    %%计算出预测函数的多项式参数
    p1=polyfit(x1, y1, n);  
    p2=polyfit(x1, y2, n);
    p3=polyfit(x1, y3, n);
    p4=polyfit(x1, y4, n);
    p5=polyfit(x1, y5, n);
    p6=polyfit(x1, y6, n);
    p7=polyfit(x1, y7, n);

    xi=linspace(1,k , k);  %产生预测的x轴向量

    %%计算出根据这些函数，预测出来的与x1对应的y轴值
    z1=polyval(p1, xi);
    z2=polyval(p2, xi);
    z3=polyval(p3, xi);
    z4=polyval(p4, xi);
    z5=polyval(p5, xi);
    z6=polyval(p6, xi);
    z7=polyval(p7, xi); 
    
    %打印预测向量的最后一个值，为预测值
    %fprintf('阶数为:%3d, 红球%3d,%3d,%3d,%3d,%3d,%3d,篮球为:%3d/n',n,round(z1(k)),round(z2(k)),round(z3(k)),round(z4(k)),round(z5(k)),round(z6(k)),round(z7(k)));
    fprintf(fd,'阶数为:%3d, 红球%3d,%3d,%3d,%3d,%3d,%3d,篮球为:%3d/n',n,round(z1(k)),round(z2(k)),round(z3(k)),round(z4(k)),round(z5(k)),round(z6(k)),round(z7(k)));
    if isPloy>0
        val=input('stop,enter');%起到暂停作用
        plot(x1, y1,xi,z1, '+', x1, y2,xi,z2,'+',  x1, y3,xi,z3,'+',  x1, y4,xi,z4,'+',  x1, y5,xi,z5 ,'+',  x1, y6,xi,z6,'+',   x1, y7,xi,z7  ,'o' );
    end
end
    
 fclose(fd);
close
type fcout.dat
%画图
plot(x1, y1,xi,z1, '+', x1, y2,xi,z2,'+',  x1, y3,xi,z3,'+',  x1, y4,xi,z4,'+',  x1, y5,xi,z5 ,'+',  x1, y6,xi,z6,'+',   x1, y7,xi,z7  ,'o' );
%plot(x1, y1,xi,z1,  x1, y2,xi,z2,  x1, y3,xi,z3,  x1, y3,xi,z3,  x1, y4,xi,z4 ,  x1, y5,xi,z5,   x1, y6,xi,z6  ,x1, y7,xi,z7  );