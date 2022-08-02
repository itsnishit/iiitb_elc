# iiitb_elc - Elevator Controller

## INTRODUCTION
 The project illustrates how an elevator
controller can be designed for as many floors as per
the requirement. Here, a 10-storey elevator
control system has been proposed. 

The elevator decides the direction of movement of the elevator
based on the request occurring at the instant. It also
consists of a sensor which senses the weight of the
people inside the elevator. If the weight inside the
elevator exceeds the maximum weight then it stops
the further movement of the elevator and also
indicates that the weight inside elevator has
exceeded the safe limit through the Weight Alert
signal.

Moreover it also has another sensor which
senses the duration of the door being open.
Normally the Door Alert signal is low but goes high
whenever the door has been open for more than
three minutes. Furthermore, a sensor is situated at
each floor indicating that the elevator has passed the
current floor.

## OVERVIEW LAYOUT 
The layout shown below gives a brief idea as how the elevator controller would function keeping in mind the input control signals as well as the inbuilt sensors (flag variables).

![image](https://user-images.githubusercontent.com/86912339/181421889-b4421784-15f3-4491-bd5a-a5abe78d6292.png)



## SIMULATIONS: WAVEFORM 
![image](https://user-images.githubusercontent.com/86912339/181697982-ae52f52b-0d68-4793-bf72-97d74ce055dd.png)



## Functional Simulation
### Tools Used
To clone the Repository and download the required files for Simulation, enter the following commands in your terminal.
```
$  sudo apt install -y git
$  git clone https://github.com/itsnishit/iiitb_elc
$  cd iiitb_elc
```
####  I-VERILOG
Icarus Verilog used to compile verilog files
To run the verilog files insall Icarus Verilog (simulation and synthesis tool),enter the following commands in your terminal

```$  sudo apt install iverilog ```

#### GTKWAVE
GTKWAVE is an analysis tool which is a VCD waveform viewer. It is used to perform debugging on Verilog models
To install GTKWAVE, enter the following commands in your terminal

```$  sudo apt install gtkwave ```

## Contributors
> Nishit Chechani 

> Kunal Gosh

## Acknowledgments
> Kunal Ghosh, Director, VSD Corp. Pvt. Ltd.

## Contact Information
> Nishit Dinesh Chechani, Postgraduate Student, International Institute of Information Technology, Bangalore 
> > E-Mail: nishitchechani@gmail.com

> Kunal Ghosh, Director, VSD Corp. Pvt. Ltd
> > E-Mail: kunalghosh@gmail.com


