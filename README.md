# Triedro-Frenet-MATLAB
en este ejercicio hacemos un tornillo de lodos sacando las componentes vectoriales tridimensionales del triedro de frenet de un tornillo de lodos minero. Primero sacamos la interseccion entre dos superficies con ecuaciones paramétricas y luego calculamos el triedro de frenet en un punto de la interseccion para finalmente pintar todo. 

Recomiendo que ejecuten primero tornillo arquímedes lodos mineros dando a run y luego que copien el primer párafo del texto del documento word tornillo arquimedes lodos: mineros que es esta parte:

[![tornillo-lodos-mineros.png](https://i.postimg.cc/C5FS61jt/tornillo-lodos-mineros.png)](https://postimg.cc/2bXs1C9F)

[x,y]=meshgrid(0:0.1:4.2)
z=5.7.*atan(y./x) ; mesh(x,y,z) %Helicoide recto
hold on
 % cilindro
 
t=linspace(0,2*pi,20);
radio=2.7
zv=[0,4.2];
[U V]=meshgrid(t,zv);
X1=radio*cos(U);Y1=radio*sin(U);Z1=V;
surf(X1,Y1,Z1);
axis equal
hold on
 
% a. Halle las  ecuaciones  paramétricas  de la intersección  de las dos 
%superficies 
% b. Grafique la curva. 
%(Hecho a mano el hallar la intersección de las dos curvas)
 
t=0:pi/32:2*pi;
u=2.7*cos(t);
v=2.7*sin(t);
w=5.7*t
 
plot3(u,v,w,'r')
 
 ....... y así podran empezar a ver como funciona y ustedes podran meter otras superficies paramétricas intersectadas a su antojo o necesidad. 
 *****Tienen la descripcion de como se usa este programa en el documento word triedro de frenet donde se explica el uso detallado del programa y los scripts
  
