# read design

read_verilog iiitb_elc.v

# generic synthesis
synth -top iiitb_elc

# mapping to mycells.lib
dfflibmap -liberty /home/nishit/iiitb_elc/iiitb_elc/lib/sky130_fd_sc_hd__tt_025C_1v80.lib
abc -liberty /home/nishit/iiitb_elc/iiitb_elc/lib/sky130_fd_sc_hd__tt_025C_1v80.lib -script +strash;scorr;ifraig;retime,{D};strash;dch,-f;map,-M,1,{D}
clean
flatten
# write synthesized design
write_verilog -noattr iiitb_elc_synth.v
stat
show
