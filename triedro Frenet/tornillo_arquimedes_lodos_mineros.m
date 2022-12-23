
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

t=0:pi/32:2*pi;
u=2.7*cos(t);
v=2.7*sin(t);
w=5.7*t

plot3(u,v,w,'r') 

%calculando la torsion en el problema pedido:

%Vectores que debemos definir:
%tp es el valor de t en el punto que nos indique el ejercicio donde
%queremos calcular el triedro de Frenet, En este ejercicio decia en el
%punto de la coordenada z=4.2/2 lo que me permitio sacar tp=4.2/(2*5.7)
syms t
modulo = @(v) simplify ( sqrt ( v * transpose(v) ) )
unitario = @(v) v / modulo (v)
dibuja_vector = @(v,r,color) plot3 ( [r(1), r(1)+v(1)], [r(2), r(2)+v(2)], [r(3), r(3)+v(3)], color)
xt = 2.7*cos(t), yt = 2.7*sin(t), zt = 5.7*t, tmin = 0, tmax = 2*pi, tp = 4.2/(2*5.7)
r = [ xt, yt, zt]
pretty(r)
rp = subs(r , {t}, {tp} ), xp = rp(1), yp = rp(2), zp =rp(3)

%Vectores velocidad y aceleración

ezplot3( xt, yt, zt, [tmin, tmax] ), hold on, scatter3( xp, yp, zp, 'filled' ), hold off
axis equal, title( 'CURVA TRABAJO')
v = simplify( diff (r) ), pretty(v), modv = simplify( modulo (v) ), pretty(modv) %velocidad
a = simplify( diff (v) ), pretty(a), moda = simplify( modulo (a) ), pretty(moda) %aceleración
vp = subs(v , {t}, {tp} ), ap = subs(a , {t}, {tp} ) %velocidad y aceleración en el punto
ezplot3( xt, yt, zt, [tmin, tmax]), hold on,
scatter3( xp, yp, zp, 'filled' ),
dibuja_vector( vp, rp, 'red')
dibuja_vector( ap, rp, 'black')
hold off
axis equal, title( 'VELOCIDAD Y ACELERACIÓN')
subplot(2,1,1), ezplot( modv, [tmin, tmax] ), xlabel ( ' Parámetro t '), ylabel( 'Velocidad' ), title('Módulo de la Velocidad')
subplot(2,1,2), ezplot( moda, [tmin, tmax] ), xlabel( ' Parámetro t '), ylabel( 'Aceleración' ), title('Módulo de la Aceleración')


%Longitud del arco de curva.

L_t = simplify( int ( modv, t ) )
L = simplify( int (modv, t, tmin, tmax) )
double(L)

%Triedro de Frénet.
T = simplify( unitario(v) ) %Vector Tangente.
pretty (T)
N = simplify( unitario( diff (T) ) ) %Vector Normal Principal.
pretty(N)
B = simplify( cross(T,N) ) %Vector Binormal.
pretty(B)

 %Triedro de Frénet en el punto.
Tp = subs(T , {t}, {tp} ), Np = subs(N , {t}, {tp} ), Bp = subs(B , {t}, {tp} )



%Dibujo del Triedro de Frénet en el punto.
ezplot3( xt, yt, zt, [tmin, tmax]), hold on,
scatter3( xp, yp, zp, 'filled' ),
dibuja_vector( Tp, rp, 'red')
dibuja_vector( Np, rp, 'black')
dibuja_vector( Bp, rp, 'magenta')
hold off
axis equal, title( 'Triedro de Frénet')


%Planos del Triedro de Frénet.
syms x y z
X = [ x, y, z]

%Plano Normal.
Plano_N = simplify( (X - r) * transpose(T) )
pretty(Plano_N)

%Plano Normal en el punto.
Plano_N_p = vpa(subs(Plano_N , {t}, {tp} ), 3 )

%Dibujo del Plano Normal.
ezplot3( xt, yt, zt, [tmin, tmax]), hold on
scatter3( xp, yp, zp, 'filled' )
dibuja_vector( Tp, rp, 'red')
hold off
implicitplot3d( Plano_N_p, 0, xp-1, xp+1, yp-1, yp+1, zp-1, zp+1, 40,'blue')
axis equal, title( 'Plano Normal y Tangente')

%Plano Rectificante.
Plano_R = simplify( (X - r) * transpose(N) )
pretty(Plano_R)

%Plano Rectificante en el punto.
Plano_R_p = vpa(subs(Plano_R , {t}, {tp} ), 3 )

%Dibujo del Plano Rectificante.
ezplot3( xt, yt, zt, [tmin, tmax]), hold on
scatter3( xp, yp, zp, 'filled' )
dibuja_vector( Np, rp, 'red')
hold off
implicitplot3d( Plano_R_p, 0, xp-1, xp+1, yp-1, yp+1, zp-1, zp+1, 40,'blue')
axis equal, title( 'Plano Rectificante y Normal Principal')

%Plano Osculador.
Plano_O = simplify( (X - r) * transpose(B) )
pretty(Plano_O)

%Plano Osculador en el punto.
Plano_O_p = vpa(subs(Plano_O , {t}, {tp} ), 3 )

%Dibujo del Plano Osculador.
ezplot3( xt, yt, zt, [tmin, tmax]), hold on
scatter3( xp, yp, zp, 'filled' )
dibuja_vector( Bp, rp, 'red')
hold off
implicitplot3d( Plano_O_p, 0, xp-1, xp+1, yp-1, yp+1, zp-1, zp+1, 40,'blue')
axis equal, title( 'Plano Osculador y Binormal')

%Curvatura.
kappa = simplify( modulo( diff (T) ) / modv )
pretty(kappa)

%Torsión.
tau = simplify( - diff (B) * transpose(N) / modv )
pretty(tau)

%Dibujo de ambas.
subplot(2,1,1), ezplot( kappa, [tmin, tmax] ), xlabel( ' Parámetro t '), ylabel( 'Curvatura' ), title('CURVATURA')
subplot(2,1,2), ezplot( tau, [tmin, tmax] ), xlabel( ' Parámetro t '), ylabel( 'Torsión' ), title('TORSIÓN')

%Aceleración Tangencial.
aT = simplify( diff (modv) ), pretty(aT)

%Aceleración Normal.
aN = simplify( kappa * modv^2), pretty(aN)

