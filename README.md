# iiitb_elc - Elevator Controller

The major goal of this project is to implement an elevator controller chip using skywater 130nm Technology. The project is still under modification.

## INTRODUCTION
 The project below illustrates how an elevator
controller can be designed for as many floors as per
the requirement. Here, an 8-storey elevator
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

### WAVEFORM 
![image](https://user-images.githubusercontent.com/86912339/181697982-ae52f52b-0d68-4793-bf72-97d74ce055dd.png)


## Functional Simulation
## Gate Level Synthesis (GLS) <br/>
GLS is generating the simulation output by running test bench with netlist file generated from synthesis as design under test. Netlist is logically same as RTL code, therefore, same test bench can be used for it.The picture below gives an insight of the procedure. Here while using iverilog, you also include gate level verilog models to generate GLS simulation.
![image](https://user-images.githubusercontent.com/86912339/186620865-4341338a-8aa6-47c1-a6d0-663fa17f3997.png)
<br/>

**To clone the repository and download the netlist files for simulation, enter the following command in your terminal***<br/>
```
$ git clone https://github.com/itsnishit/iiitb_elc
```
***After cloning the git repository, type the following in "iiitb_elc directory in the terminal for RTL Simulation.***<br/>
```
$ iverilog iiitb_elc.v iiitb_elc_tb.v
$ ./a.out 
$ gtkwave iiitb_elc.vcd
```
***For synthesis, run "yosys_run.sh" file in the same directory in terminal.***<br/>
```
$ yosys -s yosys_run.sh
```
The above commands create the netlist of iverilog code.<br/><br/>
***For Gate level syntheses(GLS), type the following in the same directory in terminal***<br/>
```
$ iverilog -DFUNCTIONAL -DUNIT_DELAY=#1 ../iiitb_elc/verilog_model/primitives.v ../iiitb_elc/verilog_model/sky130_fd_sc_hd.v iiitb_elc_synth.v iiitb_elcb.v
```
***To generate the simulation, type the following in the same directory in terminal***<br/>
```
$ ./a.out
$ gtkwave iiitb_elc.vcd
```

## NETLIST <br/>
In electronic design, a netlist is a description of the connectivity of an electronic circuit.In its simplest form, a netlist consists of a list of the electronic components in a circuit and a list of the nodes they are connected to. A network (net) is a collection of two or more interconnected components.<br/>

![image](https://user-images.githubusercontent.com/86912339/186622967-f2ba3656-701b-450e-b3c6-eaad65c9b4a4.png)
<br/>
The above picture shows a small portion of the netlist of the project after synthesis.<br/>

### STATISTICS
![image](https://user-images.githubusercontent.com/86912339/186624145-7942b5ef-c1b3-4906-99f6-252600352e71.png)



## Post synthesis simulation <br/>

![image](https://user-images.githubusercontent.com/86912339/186624359-c0235710-ff74-4886-8c4a-47d70ec57d13.png)


## Contributors
> Nishit Chechani 

> Kunal Ghosh

## Acknowledgments
> Kunal Ghosh, Director, VSD Corp. Pvt. Ltd.

## Contact Information
> Nishit Dinesh Chechani, Postgraduate Student, International Institute of Information Technology, Bangalore 
> > E-Mail: nishitchechani@gmail.com

> Kunal Ghosh, Director, VSD Corp. Pvt. Ltd
> > E-Mail: kunalghosh@gmail.com


