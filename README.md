# iiitb_elc - Elevator Controller

## Introduction
The project illustrates how an elevator
controller can be designed for as many floors as per
the requirement. Here, a 10-storey elevator
control system has been proposed. The elevator
decides the direction of movement of the elevator
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


## Functional Simulation
### Tools Used
To clone the Repository and download the required files for Simulation, enter the following commands in your terminal.
```
$  sudo apt install -y git
$  git clone https://github.com/itsnishit/iiitb_elc
$  cd iiitb_elc
```
#### > I VERILOG
Icarus Verilog used to compile verilog files
To run the verilog files insall Icarus Verilog (simulation and synthesis tool),enter the following commands in your terminal

```$  sudo apt install iverilog ```

#### > GTKWAVE
GTKWAVE is an analysis tool which is a VCD waveform viewer. It is used to perform debugging on Verilog models
To install GTKWAVE, enter the following commands in your terminal

```$  sudo apt install gtkwave ```




