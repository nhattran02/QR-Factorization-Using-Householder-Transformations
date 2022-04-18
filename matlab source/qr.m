function [Q ,R ] = qr ( A )
% Phan tich QR cua ma tran A ( mxn ) dung
% bien doi Householder
A = input ( ’ nhap A : ’) ;
[m , n ] = size ( A ) ;
Q = eye ( m ) ; % Bien doi truc giao
R = A ; % Ma tran da bien doi
for j = 1: n
% -- Tim H = I - tau * w * wT de dat 0 vao duoi R (j , j )
normx = norm ( R ( j : end , j ) ) ;
s = - sign ( R (j , j ) ) ;
u1 = R (j , j ) - s * normx ;
w = R ( j: end , j ) / u1 ;
w (1) = 1;
tau = -s * u1 / normx ;
% -- R := HR , Q := QH
R ( j : end ,:) = R ( j : end ,:) -( tau *w ) *( w ’* R ( j : end ,:) ) ;
Q (: , j : end ) = Q (: , j : end ) -( Q (: , j : end ) * w ) *( tau * w ) ’;
end
disp ( ’Q = ’) ;
disp ( - Q ) ; % Dat -Q de ket qua giong voi tinh toan vi Q * R =( - Q ) *( - R )
disp ( ’R = ’) ;
disp ( - R ) ;
