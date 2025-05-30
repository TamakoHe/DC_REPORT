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
// == Q2 (A)
// #figure(caption: [RLC circuit with series and non-series components for experiment])[#image("2025-05-29-10-50-11.png")]
// Analysis of the response: 
// + Convert $V_1$ and $R_"th"$ into its equivalent current source $I_x$ and parallel resistor
//   $ I_x=V_1/R_"th" $
//   $ R_p=R_"th" $
// + Combine the parallel resistor $R_2$ with  giving $R_"eq"$
//   $ R_"eq"=(R_"th"R_2)/(R_"th"+R_2) $
// + Convert $I_x$ and $R_"eq"$ into $V_x$ and $R_"eq2"$
//   $ V_x=(V_1 R_2)/(R_"th"+R_2) $
//   $ R_"eq2"=R_"eq"=(R_"th"R_2)/(R_"th"+R_2) $
// + Rearrange the components so as to get a RLC series circuit 
// #figure(caption: [Lab1 Q2])[#image("2025-05-29-15-49-03.png")]
// The equivalent impedance of $C_1$ and $R_2$ is 
//   $ Z_p=1/(1/R_2+s C_1)=R_2/(1+s R_2 C_1) $
// The total impedance is 
//   $ Z_"total"=R_"eq2"+s L_1+Z_p=R_"eq2"+s L_1+R_2/(1+s R_2 C_1) $
// Apply the voltage divider rule
//   $ H(s)=(V_"C1"(S))/(V_x(s))=(R_2/(1+s R_2 C_1))/(R_"eq2"+s L_1+R_2/(1+s R_2 C_1)) $
//   $ H_0(s)=(V_"C1"(S))/(V_1)=(V_"C1"(S))/(V_x(s))=(R_2/(1+s R_2 C_1))/(R_"eq2"+s L_1+R_2/(1+s R_2 C_1)) times R_2/(R_2+R_"th") $
// == Q2 (B)
// - Natural frequency 
// $ H(s)=K/(a s^2+b s+c) $
// $ a s^2+b s+c=a[s^2+b/a s+c/a] $
// $ omega_0^2=c/a $
// $ omega_0=sqrt((R_"eq2"+R_2)/(L_1 R_2 C_1)) $
// - Attenuation ($alpha$)
// $ 2 alpha=b/a $
// $ alpha=(R_"eq2"R_2C_1+L_1)/(2L_1R_2C_1) $
// - Damping factor ($zeta$)
// $ 2 zeta omega_0=b/a $
// $ zeta=(R_"eq2"R_2C_1+L_1)/(2sqrt((L_1R_2C_1)(R_"eq2"+R_2))) $
// - Damping frequency ($omega_d$)
// $ omega_d=omega_0 sqrt(1-zeta^2) $
// If $R_"ps"$ is considered:
// - $a=L_1 R_2 C_1$
// - $b=R_s R_2 C_1+L_1$
// - $c=R_s+R_2$
// - $R_s=R_"eq2"+R_"ps"$
// $ omega_0=sqrt((R_s+R_2)/(L_1R_2C_1)) $
// $ alpha=1/2 (R_s/L_1+1/(R_2 C_1)) $
// $ zeta=(R_s/L_1+1/(R_2 C_1))/(2 sqrt((R_s+R_2)/(L_1R_2C_1))) $
// $ omega_d=sqrt(omega_0^2-zeta^2 omega_0^2) zeta<1 $
// == Q2 (C)
// ```matlab
// function [f_n, alpha, zeta, f_d] = system_charateristics(R_th, R_2, R_ps, R_1)
//     Req=(R_th*R_2)/(R_th+R_2);
//     R_2=R_1;
//     Rs=Req+R_ps;
//     L1=10e-3;
//     C1=1e-9;
//     omega_0=sqrt((Rs+R_2)/(L1*R_2*C1));
//     f_n=(2*pi)/omega_0;
//     alpha=0.5*(Rs/L1+1/(R_2*C1));
//     zeta=(Rs/L1+1/(R_2*C1))/(2*sqrt((Rs+R_2)/(L1*R_2*C1)));
//     omega_d=sqrt(omega_0^2-zeta^2*omega_0^2);
//     f_d=(2*pi)/(omega_d);
//     disp(['the natural frequency is: ', num2str(f_n), ' Hz']);
//     disp(['the attenuation is: ', num2str(alpha)]);
//     disp(['the damping factor is: ', num2str(zeta)]);
//     disp(['the damping frequency is: ', num2str(f_d), ' Hz']);
// end
// ```
== Q2(G)
- Plot_response($zeta$)
```matlab
function plot_response(zeta)
    %custom function to plot response of the graph
    t=0:0.1:200;
    omega = 1;
    s1 = -1*omega*(zeta - sqrt(zeta^2-1)); %compute first variable s1
    s2 = -1*omega*(zeta + sqrt(zeta^2-1)); %compute second variable s2
    i = 1*exp(s1*t) + 1*exp(s2*t); %compute current taking unity constants i.e. A1 = A2 = 1
    plot(t, real(i), 'linewidth', 2); %plot command
    xlabel('t (seconds)'), ylabel('I(t)'), title('Response of RLC network'), grid on; %titles and labels
    if zeta>0 axis tight, else axis([-10 150 -2 2.5]);end %add flexible axis
end
```
- system_characteristics
```matlab
function [f_n, alpha, zeta, f_d] = system_characteristics(R_th, R_2, R_ps, R_1)
    %system_characteristics(R_th, R_2, R_ps, R_1)
    %function to compute system characteristics which include natural
    %frequency, f_n, attenuation, alpha, damping factor, zeta, and damping frequency, f_d
    %the function takes in R_th, R_2, R_ps and R_1, and outputs the system
    %characteristics in terms of the natural frequency, attenuation, the damping factor
    %and the damping frequency

    % to be completed by student!!
    % write code here
    %b = L1*C1;
    %a = b^(1/2);
    %g = (L1*C1)^(1/2)

    C1 = 0.01;
    f_n = 1/((L1*C1)^(1/2));
    R = (R_th + R_2)/(R_th + R_2) + R_ps + R_1;
    alpha = R/(2*L1);
    zeta = alpha/f_n;
    f_d = f_n*((1-zeta^2)^(1/2));
    f1_n = f_n/(2*pi);
    f1_d = f_d/(2*pi);

    % Comment out the next five lines below after you have completed your code
    %f_n = 0; zeta = 0; alpha = 0; f_d=0; %comment out this line after completing your code
    disp(['the natural frequency is: ', num2str(f_n), ' rad/s']); %code to display output
    disp(['the natural frequency is: ', num2str(f1_n), ' Hz']); %code to display output
    disp(['the attenuation is: ', num2str(alpha)]); 
    disp(['the damping factor is: ', num2str(zeta)]); 
    disp(['the damping frequency is: ', num2str(f_d), ' rad/s']); 
    disp(['the damping frequency is: ', num2str(f1_d), ' Hz']); 
end
```
- function_A
```matlab
function [A1, A2] = function_A(alpha, w_d, vc_inf, vc_before_0) %#ok<INUSD>
    %functionA(alpha, w_f, vc_inf, vc_before_0)
    %This function is to compute the values of A1 and A2, it takes in alpha,
    %damping frequency, Vc at t=infinity and Vc just before t=0.
    % to be completed by student!!
    % write code here
    v_s = 2.91;
    A1 = vc_before_0 - v_s;
    A2 = (A1*alpha)/w_d;

    % Comment out the next four lines below after you have completed your code
    disp(['the value of A1 is: ', num2str(A1)]); %code to display outputs
    disp(['the value of A2 is: ', num2str(A2)]); 
end
```
- plot_vc 
```matlab
function plot_vc(A1, A2, alpha, w_d)
    %plot_vc(A1, A2, alpha, w_d)
    %function takes in pre-computed values of A1,
    %A2, attenuation Walpha, across capacitor frequency w_d and gives out a sketch
    %of the voltage across capacitor
    %Detailed explanation goes here
    t = 0:1e-6:0:0.25e-3; %time range for plot
    % to be completed by student!!
    % write code here
    vc = (A1*cos(w_d*t) + A2*sin(w_d*t)) .* exp(-alpha*t) + 2.91;
    
    % Comment out the next one line below after you have completed your code
    grid minor;
    plot(t*1e3, vc); %plot command
    title('Voltage across C1') %title and labels
    xlabel('time (ms)')
    ylabel('VC1 (V)')
    axis tight
end
```
- general_characteristics
```matlab
function general_characteristics(L_1, C_1, alphar, A1, A2)
    %general_characteristics(L_1, C_1, alpha, A1, A2)
    %function to compute general system characteristics
    %the function takes in the inductor value L_1, capacitor C_1, attenuation alpha, A1, A2 (computed earlier)
    %plots the system characteristics

    % to be completed by student!!
    % write code here
    t = 0:1e-6:0.25e-3; %time range for plot
    w_n = 1/((L_1*C_1)^(1/2));
    zeta = alphar/w_n;
    w_d = w_n*((1-zeta^2)^(1/2));
    vc = (A1*cos(w_d*t) + A2*sin(w_d*t)) .* exp(-alphar*t) + 2.91;

    % Comment out the next one line below after you have completed your code
    figure %to use new plot window
    plot(t*1e3, vc); %plot command
    title('Voltage across C1') %title and labels
    xlabel('time (ms)')
    ylabel('Vc1 (V)')
    grid minor
    axis tight
end
```
== Q3
=== A 
When adjusting only the parameter $alpha$, it solely affects the amplitude or intensity of the oscillation. An increase in α leads to a slight reduction in the oscillation's intensity.
#figure(caption: [$L_1=0.004, C_1=1e-8, "alphar"=2e 4$])[#image("2025-05-30-23-56-50.png", height: 30%)]
#figure(caption: [$L_1=0.004, C_1=1e-8, "alphar"=25000$])[#image("2025-05-30-23-57-47.png", height: 30%)]
== B 
The magnitude of oscillations gradually decreases, eventually leading to a more stable response, as the inductance coefficient is altered. Therefore, increasing the inductance value, particularly $L_1$, is recommended as an effective strategy to minimize oscillations in the transient response.
#figure(caption: [$L_1=1e-3, C_1=1e-7, "alphar"=2e 4$])[#image("2025-05-31-00-02-27.png")]
#figure(caption: [$L_1=0.02,C_1=1e-7, "alphar"=2e 4$])[#image("2025-05-31-00-03-22.png")]
== C 
Based on the examination of the following images, it is evident that keeping L and α constant while raising the capacitance leads to a decrease in oscillation frequency. Moreover, the amplitude of the oscillations undergoes a minor decline. Consequently, to mitigate oscillations in the transient response, it is advisable to enhance the value of C.
== D 
In RLC circuits, the rate at which voltage or energy in a capacitor dissipates is significantly affected by the equivalent resistance, regardless of whether it is configured in series or parallel. When damping occurs, the energy held in the capacitor is slowly released following an exponential decay pattern.
== E 
When the capacitance in a circuit is raised while keeping other components such as resistance and inductance unchanged, the amplitude of voltage overshoot in the transient response is likely to decrease. This happens because an increased capacitance extends the circuit's time constant, resulting in a more gradual voltage shift during the transient period. As a result, the voltage overshoot is reduced.
