== Problem X
-  Question 4
As a first experiment, assume the controller transfer function above. By setting Kd and Ki to zero and influencing Kp, note what happens to the output response. Why does the output behave like this?

#figure(caption: [$K_p$=100])[#image("2025-05-30-21-14-45.png")]
#figure(caption: [$K_p$=50])[#image("2025-05-30-21-17-19.png")]
#figure(caption: [$K_p$=10])[#image("2025-05-30-21-18-06.png")]
As $K_p$ increases, the setting time decreases, the steady state error increases, and it may oscillate. 
- Question 5
You can create a script that will plot the poles to allow you to visualise easily where the poles move to depending on the system gain configuration.
So from this what do you conclude is the reason for the output behaving as it does with Kp=1, Ki and Kd=0?

#figure(caption: [$K_p=1,K_i=K_d=0$])[#image("2025-05-30-21-35-55.png")]
$ e_"ss"=1/(1+K_p) $
$K_p=1$, the steady error is $0.5$.
- Question 6
Now in addition to Kp=1, add derivative gain, Kd=1 and note the change in behaviour. Explain this by again looking at the poles and zeros in the system
#figure(caption: [$K_d=1$])[#image("2025-05-30-21-38-28.png")]

#figure(caption: [Zeors-poles graph])[#image("2025-05-30-21-49-22.png", height: 30%)]
$ "CLTF"=(5s^3+22.5s^2+262.7s+245.2)/(s^4+12s^3+132.8s^2+606.1s+2651) $
- Problem 7
$ "CLTF"=(5s^5+22.5s^4+267.7s^3+262.7s^2+245.2s)/(s^6+12s^5+132.8s^4+611.1s^3+2669s^2+245.2s) $
#figure(caption: [ZP graph of Problem 7])[#image("2025-05-30-21-59-54.png", height: 40%)]
#figure(caption: [Response of Problem 7])[#image("2025-05-30-22-00-40.png", height: 40%)]
- Problem 8
The proportional gain, Kp, is always set to a non-zero value and influences both the rise time and steady-state error. However, it cannot eliminate steady-state error entirely on its own.

The derivative gain, Kd, responds to input signal changes, helping the system reach steady state faster. 

The integral gain, Ki, removes steady-state error by introducing a pole at DC. 
- Problem 9 and Problem 10 

 

// By setting Kd and Ki to zero we are getting a Proportional control, so as Kp increases, the settling time decreases, steady state error increases, and may becomes to oscillate.
