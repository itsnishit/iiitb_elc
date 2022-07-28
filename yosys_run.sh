# read design

read_verilog iiitb_elc.v

# generic synthesis
synth -top iiitb_elc

# mapping to mycells.lib
dfflibmap -liberty /home/nishit/ElevatorController/sky130RTLDesignAndSynthesisWorkshop-main/my_lib/lib/sky130_fd_sc_hd__tt_025C_1v80.lib
abc -liberty /home/nishit/ElevatorController/sky130RTLDesignAndSynthesisWorkshop-main/my_lib/lib/sky130_fd_sc_hd__tt_025C_1v80.lib
clean
flatten
# write synthesized design
write_verilog -assert iiitb_elc_synth.v

