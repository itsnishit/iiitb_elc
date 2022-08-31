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

# Layout

## Preparation
The layout is generated using OpenLane. To run a custom design on openlane, Navigate to the openlane folder and run the following commands:<br>
```
$ cd designs

$ mkdir iiitb_elc

$ cd iiitb_elc

$ mkdir src

$ touch config.json

$ cd src

$ touch iiitb_elc.v
```
The iiitb_elc.v file should contain the verilog RTL code you have used and got the post synthesis simulation for. <br>

Copy  `sky130_fd_sc_hd__fast.lib`, `sky130_fd_sc_hd__slow.lib`, `sky130_fd_sc_hd__typical.lib` and `sky130_vsdinv.lef` files to `src` folder in your design. The final src folder should contain 5 files <br>

The contents of the config.json are as follows. this can be modified as per requirement for your design as and when required. <br>

NOTE: As mentioned by Kunal sir, remove defined `DIE_AREA` and `FP_SIZING : absolute`, use `FP_SIZING : relative`
```
{
    "DESIGN_NAME": "iiitb_elc",
    "VERILOG_FILES": "dir::src/iiitb_elc.v",
    "CLOCK_PORT": "clk",
    "CLOCK_NET": "clk",
    "GLB_RESIZER_TIMING_OPTIMIZATIONS": true,
    "CLOCK_PERIOD": 100,
    "PL_RANDOM_GLB_PLACEMENT": 1,
    "PL_TARGET_DENSITY": 0.9,
    "FP_SIZING" : "relative",

"LIB_SYNTH": "dir::src/sky130_fd_sc_hd__typical.lib",
"LIB_FASTEST": "dir::src/sky130_fd_sc_hd__fast.lib",
"LIB_SLOWEST": "dir::src/sky130_fd_sc_hd__slow.lib",
"LIB_TYPICAL": "dir::src/sky130_fd_sc_hd__typical.lib",
"TEST_EXTERNAL_GLOB": "dir::../iiitb_elc/src/*",
"SYNTH_DRIVING_CELL":"sky130_vsdinv",

    "pdk::sky130*": {
        "FP_CORE_UTIL": 5,
        "scl::sky130_fd_sc_hd": {
            "FP_CORE_UTIL": 11
        }
    }
}
```


After saving the changes, navigate to the Openlane directory in terminal and give the following command :<br>
![image](https://user-images.githubusercontent.com/86912339/187433175-fcafe542-68cd-4c50-918a-dd3c48a13748.png)

After entering the openlane container give the following command:<br>
```
$ ./flow.tcl interactive
```
This command will take you into the tcl console. In the tcl console type the following commands:<br>

```
% package require openlane 0.9
% prep -design iiitb_freqdiv
```
![image](https://user-images.githubusercontent.com/86912339/187434250-a1627cc0-dd95-4a43-9e12-8be62b67aa60.png)

## Synthesis 
```
% run_synthesis
```
![image](https://user-images.githubusercontent.com/86912339/187435853-da2c9e31-ecc3-4b78-8860-4a4b48f33686.png)

### Synthesis Reports
Statistics<br>
<br>
![image](https://user-images.githubusercontent.com/86912339/187436971-b48d6492-ceec-4936-a650-8a0c301de79d.png)<br>
<br>

Setup and Hold Slack after synthesis<br>
<br>
![image](https://user-images.githubusercontent.com/86912339/187608498-e937f11d-8565-4dc3-8478-fe24ac36cb83.png)<br>
<br>


## Floorplan
```
% run_floorplan
```
![image](https://user-images.githubusercontent.com/86912339/187438430-d1ae2570-de39-4294-ae8c-3ae0e0422dd0.png)<br>

### Floorplan Reports
Die Area <br>
<br>
![image](https://user-images.githubusercontent.com/86912339/187438948-6ff30254-e10f-438a-b0b2-f38556e3ed11.png)<br>
<br>
Core Area <br>
<br>
![image](https://user-images.githubusercontent.com/86912339/187439296-4e1ff4e9-4fc1-45d7-a6c2-5db850f301d2.png)<br>


Navigate to results->placement and type the Magic command in terminal to open the floorplan <br>
```
$ magic -T /home/nishit/OpenLane/pdks/sky130A/libs.tech/magic/sky130A.tech lef read ../../tmp/merge.nom.lef def read iiitb_elc.def &
```
Floorplan view <br>
<br>
![image](https://user-images.githubusercontent.com/86912339/187609014-c9613d33-82c1-42e5-a642-b3b04c25bf57.png)<br>
<br>
<br>

## Placement
```
% run_placement
```
![image](https://user-images.githubusercontent.com/86912339/187609665-a7bf08bc-ceb8-4c64-8028-a4bf742de621.png)<br>

### Placement Reports

Navigate to results->placement and type the Magic command in terminal to open the floorplan <br>
```
$ magic -T /home/nishit/OpenLane/pdks/sky130A/libs.tech/magic/sky130A.tech lef read ../../tmp/merge.nom.lef def read iiitb_elc.def &
```
Placement view <br>
<br>
![image](https://user-images.githubusercontent.com/86912339/187609946-5ed9e35f-8f1c-4ac4-8580-eab50d4f82a9.png)<br>
<br>
<b>sky130_vsdinv</b> in the placement view :<br>
<br>
![image](https://user-images.githubusercontent.com/86912339/187610219-4cc3a555-888d-43f4-9bd0-d23e436e8ce8.png)
<br>
<br>
The sky130_vsdinv should also reflect in the netlist after placement <br>
<br>
![image](https://user-images.githubusercontent.com/86912339/187610526-64d46252-f4a3-4274-b59d-72dce3d941fa.png)<br>

## Clock Tree Synthesis (CTS)
```
% run_cts
```
<br>![image](https://user-images.githubusercontent.com/86912339/187610755-d7d9e2e4-ee5e-4735-b18f-a9b9b2f66ab0.png)<br>
<br>
Slack Report post CTS<br>
<br>
![image](https://user-images.githubusercontent.com/86912339/187611155-b6dadc2c-3591-4d49-8d35-1954dbd0ea6f.png)<br>
<br>

Clock Skew Report post CTS<br>
<br>
![image](https://user-images.githubusercontent.com/86912339/187611322-38de2697-5d88-47a0-936d-5167d4ea9945.png)<br>
<br>

Power Report post CTS<br>
<br>![image](https://user-images.githubusercontent.com/86912339/187611440-33a9b5e7-fda1-4fee-a9ce-6101410431ef.png)<br>
<br>

## Routing
```
% run_routing
```
![22](https://user-images.githubusercontent.com/62461290/187060096-ad41aab7-6435-45c8-a266-e6ebb955d691.png)<br>

### Routing Reports
Navigate to results->routing and type the Magic command in terminal to open the routing view <br>
```
$ magic -T /home/nishit/OpenLane/pdks/sky130A/libs.tech/magic/sky130A.tech lef read ../../tmp/merge.nom.lef def read iiitb_elc.def &
```
Routing View<br>
<br>
![image](https://user-images.githubusercontent.com/86912339/187611810-9e468310-bdef-46b0-9d90-c7cc9ac263fa.png)<br>
<br>
<br>
![image](https://user-images.githubusercontent.com/86912339/187611938-d6bd3d5a-a105-47ec-a48b-00eb0c111760.png)<br>
<br>
<b>sky130_vsdinv</b> in the routing view :<br>
<br>
![image](https://user-images.githubusercontent.com/86912339/187612076-1e1bc05d-f6b5-4809-bd23-8a6de0ab706c.png)<br>
<br>









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


