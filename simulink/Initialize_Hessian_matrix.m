
Np = 10 ; 
Nc = 4;



A_yaw =  [0.8395358858304703     -0.04847432078257747   0.0                 0.0;
 0.0018635915154337373   0.9996816594546751   -0.5060644359497555  0.0;
 0.0                     0.01392345527731321   0.7448461065980053  0.3870783090569654;
 0.0                     0.0                  -0.4708561993095687  0.8385926646058729 ];
B_yaw = [-0.21792759566688183;
 -0.038489522945624556;
  0.011141404129424179;
 -0.034621154732298216];
C_yaw = [-0.15780307636762234  -0.04495569299225192  0.47795874838852487  0.8449536781870718];
D_yaw = [0];



%%%% for pitch and yaw %%%%
[m1,n1] = size(C_yaw);
[n1,n_in] = size(B_yaw);
A_aug = eye(n1+m1,n1+m1);
A_aug(1:n1,1:n1) = A_yaw;
A_aug(n1+1:n1+m1,1:n1) = C_yaw*A_yaw;
B_aug = zeros(n1+m1,n_in);
B_aug(1:n1,:) = B_yaw;
B_aug(n1+1:n1+m1,:) = C_yaw*B_yaw;
C_aug = zeros(m1,n1+m1);
C_aug(:,n1+1:n1+m1) = eye(m1,m1);

% Matrizes para modelo matricial Y = Fx(k) + PhiU
F(1,:) = C_aug*A_aug;
temp1(1,:) = C_aug;
for i = 2:1:Np
    F(i,:) = F(i-1,:)*A_aug;
    temp1(i,:) = temp1(i-1,:)*A_aug;
end


%only pitch 
columm1 = temp1*B_aug;
row = zeros(1,Nc);
Phi_yaw = toeplitz(columm1,row);
Ro_yaw = Phi_yaw;
Phi_yaw = F; 
omega_yaw = 0.6*eye(4); 
omega_yaw = blkdiag(omega_yaw,0.4*eye(5))
omega_yaw = blkdiag(omega_yaw,1);
Psi_yaw = 0.1*eye(4);
H_yaw = 2*(Psi_yaw+Ro_yaw'*omega_yaw*Ro_yaw);


Np = 10 ; 
Nc = 4;

A_pitch = [.36510488797294954  -0.2818303608478543     0.0                 0.0;
 0.8960574394292654    1.3762504151997674    -1.6750222787717166  0.0;
 0.0                  -0.006060682717179857   0.7071615442060207  0.41207960935436705;
 0.0                   0.0                   -0.5162046114370005  0.32823439556025524;]
B_pitch = [ -1.0201806764501928;
  1.1740501247521735;
 -0.10944958687299033;
  0.0067613477039227205]
C_pitch = [-0.2722799907498721  -0.1210718371168788  1.2985249010575335  0.3133364932049975]
D_pitch = 0





%%%% for only pitch %%%%
[m1,n1] = size(C_pitch);
[n1,n_in] = size(B_pitch);
A_aug_pitch = eye(n1+m1,n1+m1);
A_aug_pitch(1:n1,1:n1) = A_pitch;
A_aug_pitch(n1+1:n1+m1,1:n1) = C_pitch*A_pitch;
B_aug_pitch = zeros(n1+m1,n_in);
B_aug_pitch(1:n1,:) = B_pitch;
B_aug_pitch(n1+1:n1+m1,:) = C_pitch*B_pitch;
C_aug_pitch = zeros(m1,n1+m1);
C_aug_pitch(:,n1+1:n1+m1) = eye(m1,m1);

% Matrizes para modelo matricial Y = Fx(k) + PhiU
F2(1,:) = C_aug_pitch*A_aug_pitch;
temp2(1,:) = C_aug_pitch;
for i = 2:1:Np
    F2(i,:) = F2(i-1,:)*A_aug_pitch;
    temp2(i,:) = temp2(i-1,:)*A_aug_pitch;
end


%only pitch 
columm2 = temp2*B_aug_pitch;
row_pitch = zeros(1,Nc);
Phi_pitch = toeplitz(columm2,row_pitch);
Ro_pitch = Phi_pitch;
Phi_pitch = F2; 
omega_pitch = 0.6*eye(4); 
omega_pitch = blkdiag(omega_pitch,0.4*eye(5))
omega_pitch = blkdiag(omega_pitch,1);
Psi_pitch = 0.1*eye(4);
H_pitch = 2*(Psi_pitch+Ro_pitch'*omega_pitch*Ro_pitch);

H_pitch_yaw = [H_pitch zeros(4,4);
               zeros(4,4)  H_yaw];


