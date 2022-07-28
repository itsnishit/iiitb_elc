# read design

read_verilog iiitb_elc.v

# generic synthesis
synth -top iiitb_elc

# mapping to mycells.lib
dfflibmap -liberty /usr/local/share/qflow/tech/osu018/osu018_stdcells.lib
abc -liberty /usr/local/share/qflow/tech/osu018/osu018_stdcells.lib
clean
flatten
# write synthesized design
write_verilog -assert synth_iiitb_elc.v

