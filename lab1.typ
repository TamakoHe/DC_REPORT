== Baisc principles 
This lab session's topic is the RLC circuit which are commonly used as bandpass and notch filters. The response of the RLC circuit can be classified as *overdamped, critically damped and underdamped*. The transition between initial and final conditions for component voltages and currents is fastest in a critically damped circuit which is difficult to achieve.
== Principles
#figure(caption: [Lab1 setup])[#image("2025-05-29-09-56-19.png", width: 40%)]<l1-setup>
A basic RLC circuit is shown in #ref(<l1-setup>). 
An essential factor that can describe this factor is the damping ratio.

$ zeta=R/2 sqrt(C/L) $
- $zeta>1$, overdamped
#figure(caption: [overdamped])[#image("2025-05-29-10-25-36.png", width: 40%)]
- $zeta=1$, critically damped
#figure(caption: [critically damped])[#image("2025-05-29-10-28-24.png")]
- $zeta<1$, underdamped
#figure(caption: [underdamped])[#image("2025-05-29-10-31-19.png", width: 80%)]
== Q2 (A)
#figure(caption: [RLC circuit with series and non-series components for experiment])[#image("2025-05-29-10-50-11.png")]
Analysis of the response: 
+ Convert $V_1$ and $R_"th"$ into its equivalent current source $I_x$ and parallel resistor
  $ I_x=V_1/R_"th" $
  $ R_p=R_"th" $
+ Combine the parallel resistor $R_2$ with  giving $R_"eq"$
  $ R_"eq"=(R_"th"R_2)/(R_"th"+R_2) $
+ Convert $I_x$ and $R_"eq"$ into $V_x$ and $R_"eq2"$
  $ V_x=(V_1 R_2)/(R_"th"+R_2) $
  $ R_"eq2"=R_"eq"=(R_"th"R_2)/(R_"th"+R_2) $
+ Rearrange the components so as to get a RLC series circuit 
#figure(caption: [Lab1 Q2])[#image("2025-05-29-15-49-03.png")]
The equivalent impedance of $C_1$ and $R_2$ is 
  $ Z_p=1/(1/R_2+s C_1)=R_2/(1+s R_2 C_1) $
The total impedance is 
  $ Z_"total"=R_"eq2"+s L_1+Z_p=R_"eq2"+s L_1+R_2/(1+s R_2 C_1) $
Apply the voltage divider rule
  $ H(s)=(V_"C1"(S))/(V_x(s))=(R_2/(1+s R_2 C_1))/(R_"eq2"+s L_1+R_2/(1+s R_2 C_1)) $
  $ H_0(s)=(V_"C1"(S))/(V_1)=(V_"C1"(S))/(V_x(s))=(R_2/(1+s R_2 C_1))/(R_"eq2"+s L_1+R_2/(1+s R_2 C_1)) times R_2/(R_2+R_"th") $
== Q2 (B)
- Natural frequency 
$ H(s)=K/(a s^2+b s+c) $
$ a s^2+b s+c=a[s^2+b/a s+c/a] $
$ omega_0^2=c/a $
$ omega_0=sqrt((R_"eq2"+R_2)/(L_1 R_2 C_1)) $
- Attenuation ($alpha$)
$ 2 alpha=b/a $
$ alpha=(R_"eq2"R_2C_1+L_1)/(2L_1R_2C_1) $
- Damping factor ($zeta$)
$ 2 zeta omega_0=b/a $
$ zeta=(R_"eq2"R_2C_1+L_1)/(2sqrt((L_1R_2C_1)(R_"eq2"+R_2))) $
- Damping frequency ($omega_d$)
$ omega_d=omega_0 sqrt(1-zeta^2) $
If $R_"ps"$ is considered:
- $a=L_1 R_2 C_1$
- $b=R_s R_2 C_1+L_1$
- $c=R_s+R_2$
- $R_s=R_"eq2"+R_"ps"$
$ omega_0=sqrt((R_s+R_2)/(L_1R_2C_1)) $
$ alpha=1/2 (R_s/L_1+1/(R_2 C_1)) $
$ zeta=(R_s/L_1+1/(R_2 C_1))/(2 sqrt((R_s+R_2)/(L_1R_2C_1))) $
$ omega_d=sqrt(omega_0^2-zeta^2 omega_0^2) zeta<1 $
== Q2 (C)
```matlab
function [f_n, alpha, zeta, f_d] = system_charateristics(R_th, R_2, R_ps, R_1)
    Req=(R_th*R_2)/(R_th+R_2);
    R_2=R_1;
    Rs=Req+R_ps;
    L1=10e-3;
    C1=1e-9;
    omega_0=sqrt((Rs+R_2)/(L1*R_2*C1));
    f_n=(2*pi)/omega_0;
    alpha=0.5*(Rs/L1+1/(R_2*C1));
    zeta=(Rs/L1+1/(R_2*C1))/(2*sqrt((Rs+R_2)/(L1*R_2*C1)));
    omega_d=sqrt(omega_0^2-zeta^2*omega_0^2);
    f_d=(2*pi)/(omega_d);
    disp(['the natural frequency is: ', num2str(f_n), ' Hz']);
    disp(['the attenuation is: ', num2str(alpha)]);
    disp(['the damping factor is: ', num2str(zeta)]);
    disp(['the damping frequency is: ', num2str(f_d), ' Hz']);
end
```
