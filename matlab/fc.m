function y=fc(isPloy,factorial);  
%function y=fc(isPloy,factorial);
%factorial��ʾԤ�⺯���Ľ׳˸���,Ĭ����5
%isPloy�жϲ����ĸ������������Ƿ�ÿ���׶����л�ͼ,Ĭ����0(�����л�ͼ)
%close  %�ر�ͼ�ν���
%clear  %����ϵͳ����




if  nargin==1   %�жϲ����ĸ������������Ƿ�ÿ���׶����л�ͼ
    isPloy=1;
    factorial=5;
elseif nargin>=2
else
    isPloy=0;
    factorial=5;  
end

%n=factorial;

fd=fopen('fcout.dat','w+');  %�򿪽���ı����ļ�
load fcin.dat;   %������ʷ����
x1=fcin(:,1);   %���ص�һ��Ϊx1
y1=fcin(:,2);   %���صڶ���Ϊy1������1
y2=fcin(:,3);   %���ص�����Ϊy2������2
y3=fcin(:,4);   %����3
y4=fcin(:,5);   %����4
y5=fcin(:,6);   %����5
y6=fcin(:,7);   %����6
y7=fcin(:,8);   %����




nextPoint=x1(length(x1))+1;  %�ӵ�һ�е����һ��ֵ��,��ȡ��һ��Ԥ��x��ֵ
k=nextPoint;
for n=1:1:factorial   %n��ʾԤ�⺯���Ľ���

    %%�����Ԥ�⺯���Ķ���ʽ����
    p1=polyfit(x1, y1, n);  
    p2=polyfit(x1, y2, n);
    p3=polyfit(x1, y3, n);
    p4=polyfit(x1, y4, n);
    p5=polyfit(x1, y5, n);
    p6=polyfit(x1, y6, n);
    p7=polyfit(x1, y7, n);

    xi=linspace(1,k , k);  %����Ԥ���x������

    %%�����������Щ������Ԥ���������x1��Ӧ��y��ֵ
    z1=polyval(p1, xi);
    z2=polyval(p2, xi);
    z3=polyval(p3, xi);
    z4=polyval(p4, xi);
    z5=polyval(p5, xi);
    z6=polyval(p6, xi);
    z7=polyval(p7, xi); 
    
    %��ӡԤ�����������һ��ֵ��ΪԤ��ֵ
    %fprintf('����Ϊ:%3d, ����%3d,%3d,%3d,%3d,%3d,%3d,����Ϊ:%3d/n',n,round(z1(k)),round(z2(k)),round(z3(k)),round(z4(k)),round(z5(k)),round(z6(k)),round(z7(k)));
    fprintf(fd,'����Ϊ:%3d, ����%3d,%3d,%3d,%3d,%3d,%3d,����Ϊ:%3d/n',n,round(z1(k)),round(z2(k)),round(z3(k)),round(z4(k)),round(z5(k)),round(z6(k)),round(z7(k)));
    if isPloy>0
        val=input('stop,enter');%����ͣ����
        plot(x1, y1,xi,z1, '+', x1, y2,xi,z2,'+',  x1, y3,xi,z3,'+',  x1, y4,xi,z4,'+',  x1, y5,xi,z5 ,'+',  x1, y6,xi,z6,'+',   x1, y7,xi,z7  ,'o' );
    end
end
    
 fclose(fd);
close
type fcout.dat
%��ͼ
plot(x1, y1,xi,z1, '+', x1, y2,xi,z2,'+',  x1, y3,xi,z3,'+',  x1, y4,xi,z4,'+',  x1, y5,xi,z5 ,'+',  x1, y6,xi,z6,'+',   x1, y7,xi,z7  ,'o' );
%plot(x1, y1,xi,z1,  x1, y2,xi,z2,  x1, y3,xi,z3,  x1, y3,xi,z3,  x1, y4,xi,z4 ,  x1, y5,xi,z5,   x1, y6,xi,z6  ,x1, y7,xi,z7  );