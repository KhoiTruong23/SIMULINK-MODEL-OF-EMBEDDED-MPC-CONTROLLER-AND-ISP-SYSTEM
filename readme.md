## SIMULINK MODEL OF EMBEDDED MPC CONTROLLER AND ISP SYSTEM 
###### To run qpOASES on SIMULINK, user need to dowload MATLAB Support for MinGW-w64 C/C++/Fortran Compiler. Instruction can be found in qpOASES manual document. 
###### After dowloading the COMPILER, Run file Initialize_Hessian_matrix.m and make.m before running SIMULINK model.  

#### Overall of System


<p align="center">
  <img src="resources/overall.png" width=600><br/>
  <i>Overall of System</i>
</p>

##### MPC block 
- The MPC block is used to solve below optimation problem at each steps where E is Hessian Matrix and F is gradient vector
- 
  <p align="center">
  <img src="resources/Optimization_problem.png" width=600><br/>
  <i>Optimization_problem</i>
</p>


<p align="center">
  <img src="resources/MPC_block.png" width=600><br/>
  <i>MPC_block</i>
</p>

##### Kalman Estimator block
- Kalman filter block for pitch and yaw axis are designed by MATLAB function using following flow: 
<p align="center">
  <img src="resources/Kalman.png" width=600><br/>
  <i>Flow of Kalman Filter in 1 estimation window 
</i>
</p>

#### Output of Kalman estimator with disturbance
<p align="center">
  <img src="resources/pitch_estimator.png" width=600><br/>
  <i>Output of Kalman estimator for pitch axis with disturbances 
</i>
</p>

<p align="center">
  <img src="resources/yaw_estimator.png" width=600><br/>
  <i>Output of Kalman estimator for yaw axis with disturbances 
</i>
</p>

#### Output of system

<p align="center">
  <img src="resources/system_response.png" width=600><br/>
  <i>Response of system with disturbance 
</i>
</p>