== Problem IV 
$ g=9.81,m=5,l=0.4,c=0.7 $
- moment of inertia: $I=m (l/2)^2=0.2$
- undamped natural frequency:$omega_n=sqrt((m g l )/(2I))=7.0036$
- damping coefficient:$xi=c/(2*I*omega_n)$
- damped natural frequency:$omega_d=omega_n sqrt(1-xi^2)=6.7814$
- rise time:10% to 90%:$t_r=1/omega_d arctan(sqrt(1-xi^2)/x_i)=0.1944$
- peaking time from application of step:$t_p=pi/omega_d=0.4633$
- settling time based on $plus.minus 1%$ tolerance:$t_s=3/(xi omega_n)=1.7143$
- overshoot in %:$M_p=100 times e^(-xi omega_n t_p)=44.4540$
- CLTF(Closed-Loop Transfer Function): 
    $ 500/(s^2+3.5s+549) $
- sys(transfer function):
    $ 5/(s^2+3.5s+54.05) $
- Difference: 
    Different from the open-loop transfer function that only contains 
    forward loops, the closed-loop transfer function also contains the feedback, the output has an impact on the input. The closed-loop transfer function has lower gain and is more stable than the open-loop transfer function. 
#figure(caption: [The open-loop and closed-loop transfer function])[#image("2025-05-30-09-55-11.png")]
== Calculation of the open-loop transfer function 
$ "sys"="tf"(1/I, 2 xi omega_n omega_n^2) $
$ I=0.2 $
$ 2 xi omega_n =2 dot 0.25 dot 7.004 approx 3.502 $
$ omega_n^2=(7.004)^2 approx 49.056 $
$ "sys"=5/(s^2+3.502s+49.056) $
By transforming these frequency-domain equation to the time-domain equation:
$ "sys(t)"=5/omega_n^2 [1-e^(-xi omega_n t)/sqrt(1-xi^2) dot (cos(omega_d t)+xi/sqrt(1-xi^2) sin(omega_d t))] $
#figure(caption: [Response derived by two methods])[#image("2025-05-30-10-27-59.png")]
The matlab's result has lower peak value.
== Poles and zeros
#figure(caption: [])[#image("2025-05-30-10-53-15.png")]
== Analysis of polse and zeros of two methods' results
The poles and zeros from the two methods are the same 
== 13
// TODO
== 14 
// TODO 
