#set_property -dict { PACKAGE_PIN H16   IOSTANDARD LVCMOS33 } [get_ports { clk }]; #IO_L13P_T2_MRCC_35 Sch=sysclk
#create_clock -add -name clk_pin -period 8.00 -waveform {0 4} [get_ports { clk }];
#set_property BEL A6LUT [get_cells genblk1[*].APUF/genblk1[*].muN/mux_b/out_INST_0]
#set_property BEL B6LUT [get_cells genblk1[*].APUF/genblk1[*].muN/mux_t/out_INST_0]
#set_property BEL A6LUT [get_cells genblk1[*].APUF/mu0/mux_b/out_INST_0]
#set_property BEL B6LUT [get_cells genblk1[*].APUF/mu0/mux_t/out_INST_0]
#set_property LUT_DECOMPOSE TRUE [get_cells genblk1[*].APUF/genblk1[*].muN/mux_b/out_INST_0]
#set_property LUT_DECOMPOSE TRUE [get_cells genblk1[*].APUF/genblk1[*].muN/mux_t/out_INST_0]
#set_property LUT_DECOMPOSE TRUE [get_cells genblk1[*].APUF/mu0/mux_b/out_INST_0]
#set_property LUT_DECOMPOSE TRUE [get_cells genblk1[*].APUF/mu0/mux_t/out_INST_0]