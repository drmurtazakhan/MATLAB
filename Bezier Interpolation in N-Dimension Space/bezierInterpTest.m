close all, clc,clear all 
str1='Bezier Curve'; str2='Control Polygon'; str3='Control Point';

t=linspace(0,1,100);
k=1;
% % ---------------------------------------------------------- 
% % 1D Bezier Interplation 
Px=[292 280 321 356];
[Q1D]=bezierInterp([Px(k)],[Px(k+1)],[Px(k+2)],[Px(k+3)]);
% % ---------------------------------------------------------- 
% % 2D Bezier Interplation
Px=[292 280 321 356];
Py=[196 153 140 148];

% % % Option 1 to call  bezierInterp method without passing t
[Q2D]=bezierInterp([Px(k),Py(k)],[Px(k+1),Py(k+1)],[Px(k+2),Py(k+2)],[Px(k+3),Py(k+3)]);

% % % Option 2 to call  bezierInterp method and passing t
% [Q2D]=bezierInterp([Px(k),Py(k)],[Px(k+1),Py(k+1)],[Px(k+2),Py(k+2)],[Px(k+3),Py(k+3)],t);

figure
plot(Q2D(:,1),Q2D(:,2),'b','LineWidth',2) % plot curve
hold on
plot(Px,Py,'g:','LineWidth',2)        % plot control polygon
plot(Px,Py,'ro','LineWidth',2)        % plot control points
legend(str1,str2,str3);
title('\bf2D Bezier Curve')
% % ---------------------------------------------------------- 
% % 3D Bezier Interplation
Px=[292 280 321 356];
Py=[196 153 140 148];
Pz=[-56 75 140 248];

% % % Option 1 to call  bezierInterp method without passing t
% [Q3D]=bezierInterp([Px(k),Py(k),Pz(k)],[Px(k+1),Py(k+1),Pz(k+1)],[Px(k+2),Py(k+2),Pz(k+2)],[Px(k+3),Py(k+3),Pz(k+3)]);

% % % Option 2 to call  bezierInterp method and passing t
 [Q3D]=bezierInterp([Px(k),Py(k),Pz(k)],[Px(k+1),Py(k+1),Pz(k+1)],[Px(k+2),Py(k+2),Pz(k+2)],[Px(k+3),Py(k+3),Pz(k+3)],t);

figure
plot3(Q3D(:,1),Q3D(:,2),Q3D(:,3),'b','LineWidth',2),
hold on
plot3(Px,Py,Pz,'g:','LineWidth',2)        % plot control polygon
plot3(Px,Py,Pz,'ro','LineWidth',2)     % plot control points
legend(str1,str2,str3);
title('\bf3D Bezier Curve')
view(3);
box;
% % ---------------------------------------------------------- 
% % % % % % 3D Bezier Interplation Connecting Two Curves% % % % % %
Px=[392 280 321 356 400 300 250 ];
Py=[196 153 140 200 250 320 260 ];
Pz=[-56 -75  10 148 153 40 -148 ];
k=1;
[Q3Da]=bezierInterp([Px(k),Py(k),Pz(k)],[Px(k+1),Py(k+1),Pz(k+1)],[Px(k+2),Py(k+2),Pz(k+2)],[Px(k+3),Py(k+3),Pz(k+3)]);
k=4;
[Q3Db]=bezierInterp([Px(k),Py(k),Pz(k)],[Px(k+1),Py(k+1),Pz(k+1)],[Px(k+2),Py(k+2),Pz(k+2)],[Px(k+3),Py(k+3),Pz(k+3)]);
figure
plot3(Q3Da(:,1),Q3Da(:,2),Q3Da(:,3),'b','LineWidth',2),
hold on
plot3(Px,Py,Pz,'g:','LineWidth',2)        % plot control polygon
plot3(Px,Py,Pz,'ro','LineWidth',2)     % plot control points
plot3(Q3Db(:,1),Q3Db(:,2),Q3Db(:,3),'b','LineWidth',2),
hold on
plot3(Px,Py,Pz,'g:','LineWidth',2)        % plot control polygon
plot3(Px,Py,Pz,'ro','LineWidth',2)     % plot control points
legend(str1,str2,str3);
title('\bfTwo 3D Connected Bezier Curves')
view(3);
box;
% % ---------------------------------------------------------- 
% % 4D Bezier Interplation 
k=1;
Pw=[192 380 421 356];
Px=[292 280 321 256];
Py=[196 153 140 148];
Pz=[-56 75 140 248];

[Q4D]=bezierInterp([Pw(k),Px(k),Py(k),Pz(k)],...
                 [Pw(k+1),Px(k+1),Py(k+1),Pz(k+1)],...
                 [Pw(k+2),Px(k+2),Py(k+2),Pz(k+2)],...
                 [Pw(k+3),Px(k+3),Py(k+3),Pz(k+3)],t);

% plotting is left as an exercise :)
% % ---------------------------------------------------------- 
% Similary you can do Interpolation of N-Dimensional Bezier Curve

% % % --------------------------------
% % % Author: Dr. Murtaza Khan
% % % Email : drkhanmurtaza@gmail.com
% % % --------------------------------
