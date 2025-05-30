A PID controller (Proportional-Integral-Derivative controller) is a widely used feedback control mechanism that continuously calculates an error value as the difference between a desired setpoint and a measured process variable. It applies a correction based on three terms: 
+ Proportional (P)-Responds to the current error
+ Integral (I)-Eliminate steady-state offset by addressing accumulated past error
+ Derivate (D)-Improve stability by prediciting the future error 
== Exercise I 
#figure(caption: [System for exercise I])[#image("2025-05-30-15-21-04.png")]
$ G(s)=((s+1)(s+2))/(s^2(s+3)(s+4)(s+10)) $
$ H(s)=1 $
- OLTF
$ "OLTF"=G(s)H(s)=((s+1)(s+2))/(s^2(s+3)(s+4)(s+10)) $
- CLTF
$ "CLTF"=(G(s))/(1+G(s)H(s)) $
$ "CLTF"=((s+1)(s+2))/(s^2 (s+3)(s+4)(s+10)+(s+1)(s+2)) $
#pagebreak()
- Root locus 
#figure(caption: [Root locus])[#image("lab4_1.jpg")]
- Bode magnitude and phase plots 
#figure(caption: [Bode Plot of OLTF])[#image("lab4_2.jpg")]
#pagebreak()
- Nyquist plot of OLTF
#figure(caption: [Nyquist plot of OLTF])[#image("lab4_3.jpg")]
- Some parameters
```matlab
num = [1, 3, 2];           
den = poly([0, 0, -3, -4, -10]); 
G = tf(num, den);         
[GM, PM, GMFrequency, PMFrequency] = margin(G);
DM = PM / (180 * pi * PMFrequency); 
fprintf('Gain Margin (GM): %.4f (linear), %.4f dB\n', GM, 20*log10(GM));
fprintf('GM Frequency: %.4f rad/s\n', GMFrequency);
fprintf('Phase Margin (PM): %.4f degrees\n', PM);
fprintf('PM Frequency: %.4f rad/s\n', PMFrequency);
fprintf('Delay Margin (DM): %.4f seconds\n', DM);
fprintf('DM Frequency: %.4f rad/s\n', PMFrequency);
if PM > 0 && GM > 1
    fprintf('The system is stable.\n');
else
    fprintf('The system is unstable or marginally stable.\n');
end
``` 
Gain Margin (GM): 557.5962 (linear), 54.9264 dB

GM Frequency: 6.1756 rad/s

Phase Margin (PM): 6.0247 degrees

PM Frequency: 0.1297 rad/s

Delay Margin (DM): 0.0821 seconds

DM Frequency: 0.1297 rad/s

The system is stable.