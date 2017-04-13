#!/bin/bash -f
# Vivado (TM) v2016.2 (64-bit)
#
# Filename    : design_1.sh
# Simulator   : Synopsys Verilog Compiler Simulator
# Description : Simulation script for compiling, elaborating and verifying the project source files.
#               The script will automatically create the design libraries sub-directories in the run
#               directory, add the library logical mappings in the simulator setup file, create default
#               'do/prj' file, execute compilation, elaboration and simulation steps.
#
# Generated by Vivado on Fri Mar 31 13:06:10 -0400 2017
# IP Build 1577682 on Fri Jun  3 12:00:54 MDT 2016 
#
# usage: design_1.sh [-help]
# usage: design_1.sh [-lib_map_path]
# usage: design_1.sh [-noclean_files]
# usage: design_1.sh [-reset_run]
#
# Prerequisite:- To compile and run simulation, you must compile the Xilinx simulation libraries using the
# 'compile_simlib' TCL command. For more information about this command, run 'compile_simlib -help' in the
# Vivado Tcl Shell. Once the libraries have been compiled successfully, specify the -lib_map_path switch
# that points to these libraries and rerun export_simulation. For more information about this switch please
# type 'export_simulation -help' in the Tcl shell.
#
# You can also point to the simulation libraries by either replacing the <SPECIFY_COMPILED_LIB_PATH> in this
# script with the compiled library directory path or specify this path with the '-lib_map_path' switch when
# executing this script. Please type 'design_1.sh -help' for more information.
#
# Additional references - 'Xilinx Vivado Design Suite User Guide:Logic simulation (UG900)'
#
# ********************************************************************************************************

# Directory path for design sources and include directories (if any) wrt this path
ref_dir="."

# Override directory with 'export_sim_ref_dir' env path value if set in the shell
if [[ (! -z "$export_sim_ref_dir") && ($export_sim_ref_dir != "") ]]; then
  ref_dir="$export_sim_ref_dir"
fi

# Command line options
vlogan_opts="-full64 -timescale=1ps/1ps"
vhdlan_opts="-full64"
vcs_elab_opts="-full64 -debug_pp -t ps -licqueue -l elaborate.log"
vcs_sim_opts="-ucli -licqueue -l simulate.log"

# Design libraries
design_libs=(xil_defaultlib xpm fifo_generator_v13_0_3 v_vid_in_axi4s_v4_0_3 blk_mem_gen_v8_3_3 microblaze_v9_6_1 lmb_v10_v3_0_8 lmb_bram_if_cntlr_v4_0_9 axi_lite_ipif_v3_0_4 axi_intc_v4_1_7 mdm_v3_2_6 lib_cdc_v1_0_2 proc_sys_reset_v5_0_9 lib_pkg_v1_0_2 lib_srl_fifo_v1_0_2 axi_uartlite_v2_0_13 generic_baseblocks_v2_1_0 axi_infrastructure_v1_1_0 axi_register_slice_v2_1_9 fifo_generator_v13_1_1 axi_data_fifo_v2_1_8 axi_crossbar_v2_1_10 axi_bram_ctrl_v4_0_8 axi_protocol_converter_v2_1_9 axi_clock_converter_v2_1_8 axi_dwidth_converter_v2_1_9)

# Simulation root library directory
sim_lib_dir="vcs"

# Script info
echo -e "design_1.sh - Script generated by export_simulation (Vivado v2016.2 (64-bit)-id)\n"

# Main steps
run()
{
  check_args $# $1
  setup $1 $2
  compile
  elaborate
  simulate
}

# RUN_STEP: <compile>
compile()
{
  # Compile design files
  vlogan -work xil_defaultlib $vlogan_opts -sverilog +incdir+"$ref_dir/../../../ipstatic/axi_infrastructure_v1_1/hdl/verilog" +incdir+"$ref_dir/../../../ipstatic/clk_wiz_v5_3" \
    "C:/Xilinx/Vivado/2016.2/data/ip/xpm/xpm_cdc/hdl/xpm_cdc.sv" \
    "C:/Xilinx/Vivado/2016.2/data/ip/xpm/xpm_memory/hdl/xpm_memory_base.sv" \
    "C:/Xilinx/Vivado/2016.2/data/ip/xpm/xpm_memory/hdl/xpm_memory_dpdistram.sv" \
    "C:/Xilinx/Vivado/2016.2/data/ip/xpm/xpm_memory/hdl/xpm_memory_dprom.sv" \
    "C:/Xilinx/Vivado/2016.2/data/ip/xpm/xpm_memory/hdl/xpm_memory_sdpram.sv" \
    "C:/Xilinx/Vivado/2016.2/data/ip/xpm/xpm_memory/hdl/xpm_memory_spram.sv" \
    "C:/Xilinx/Vivado/2016.2/data/ip/xpm/xpm_memory/hdl/xpm_memory_sprom.sv" \
    "C:/Xilinx/Vivado/2016.2/data/ip/xpm/xpm_memory/hdl/xpm_memory_tdpram.sv" \
  2>&1 | tee -a vlogan.log

  vhdlan -work xpm $vhdlan_opts \
    "C:/Xilinx/Vivado/2016.2/data/ip/xpm/xpm_VCOMP.vhd" \
  2>&1 | tee -a vhdlan.log

  vhdlan -work fifo_generator_v13_0_3 $vhdlan_opts \
    "$ref_dir/../../../ipstatic/fifo_generator_v13_0/simulation/fifo_generator_vhdl_beh.vhd" \
    "$ref_dir/../../../ipstatic/fifo_generator_v13_0/hdl/fifo_generator_v13_0_rfs.vhd" \
  2>&1 | tee -a vhdlan.log

  vlogan -work v_vid_in_axi4s_v4_0_3 $vlogan_opts +v2k +incdir+"$ref_dir/../../../ipstatic/axi_infrastructure_v1_1/hdl/verilog" +incdir+"$ref_dir/../../../ipstatic/clk_wiz_v5_3" \
    "$ref_dir/../../../ipstatic/v_vid_in_axi4s_v4_0/hdl/verilog/v_vid_in_axi4s_v4_0_coupler.v" \
    "$ref_dir/../../../ipstatic/v_vid_in_axi4s_v4_0/hdl/verilog/v_vid_in_axi4s_v4_0_formatter.v" \
    "$ref_dir/../../../ipstatic/v_vid_in_axi4s_v4_0/hdl/verilog/v_vid_in_axi4s_v4_0.v" \
  2>&1 | tee -a vlogan.log

  vlogan -work xil_defaultlib $vlogan_opts +v2k +incdir+"$ref_dir/../../../ipstatic/axi_infrastructure_v1_1/hdl/verilog" +incdir+"$ref_dir/../../../ipstatic/clk_wiz_v5_3" \
    "$ref_dir/../../../bd/design_1/ip/design_1_v_vid_in_axi4s_0_0/sim/design_1_v_vid_in_axi4s_0_0.v" \
    "$ref_dir/../../../bd/design_1/hdl/design_1.v" \
  2>&1 | tee -a vlogan.log

  vlogan -work blk_mem_gen_v8_3_3 $vlogan_opts +v2k +incdir+"$ref_dir/../../../ipstatic/axi_infrastructure_v1_1/hdl/verilog" +incdir+"$ref_dir/../../../ipstatic/clk_wiz_v5_3" \
    "$ref_dir/../../../ipstatic/blk_mem_gen_v8_3/simulation/blk_mem_gen_v8_3.v" \
  2>&1 | tee -a vlogan.log

  vlogan -work xil_defaultlib $vlogan_opts +v2k +incdir+"$ref_dir/../../../ipstatic/axi_infrastructure_v1_1/hdl/verilog" +incdir+"$ref_dir/../../../ipstatic/clk_wiz_v5_3" \
    "$ref_dir/../../../bd/design_1/ip/design_1_blk_mem_gen_0_0/sim/design_1_blk_mem_gen_0_0.v" \
    "$ref_dir/../../../bd/design_1/ipshared/xilinx.com/ipu_wrapper_v1_0/block.v" \
    "$ref_dir/../../../bd/design_1/ipshared/xilinx.com/ipu_wrapper_v1_0/block_arbiter.v" \
    "$ref_dir/../../../bd/design_1/ipshared/xilinx.com/ipu_wrapper_v1_0/IPU_core.v" \
    "$ref_dir/../../../bd/design_1/ipshared/xilinx.com/ipu_wrapper_v1_0/IPU_wrapper.v" \
    "$ref_dir/../../../bd/design_1/ip/design_1_IPU_wrapper_0_1/sim/design_1_IPU_wrapper_0_1.v" \
    "$ref_dir/../../../bd/design_1/ip/design_1_clk_wiz_0_0/design_1_clk_wiz_0_0_clk_wiz.v" \
    "$ref_dir/../../../bd/design_1/ip/design_1_clk_wiz_0_0/design_1_clk_wiz_0_0.v" \
  2>&1 | tee -a vlogan.log

  vhdlan -work microblaze_v9_6_1 $vhdlan_opts \
    "$ref_dir/../../../ipstatic/microblaze_v9_6/hdl/microblaze_v9_6_vh_rfs.vhd" \
  2>&1 | tee -a vhdlan.log

  vhdlan -work xil_defaultlib $vhdlan_opts \
    "$ref_dir/../../../bd/design_1/ip/design_1_microblaze_0_0/sim/design_1_microblaze_0_0.vhd" \
  2>&1 | tee -a vhdlan.log

  vhdlan -work lmb_v10_v3_0_8 $vhdlan_opts \
    "$ref_dir/../../../ipstatic/lmb_v10_v3_0/hdl/vhdl/lmb_v10.vhd" \
  2>&1 | tee -a vhdlan.log

  vhdlan -work xil_defaultlib $vhdlan_opts \
    "$ref_dir/../../../bd/design_1/ip/design_1_dlmb_v10_0/sim/design_1_dlmb_v10_0.vhd" \
    "$ref_dir/../../../bd/design_1/ip/design_1_ilmb_v10_0/sim/design_1_ilmb_v10_0.vhd" \
  2>&1 | tee -a vhdlan.log

  vhdlan -work lmb_bram_if_cntlr_v4_0_9 $vhdlan_opts \
    "$ref_dir/../../../ipstatic/lmb_bram_if_cntlr_v4_0/hdl/vhdl/lmb_bram_if_funcs.vhd" \
    "$ref_dir/../../../ipstatic/lmb_bram_if_cntlr_v4_0/hdl/vhdl/lmb_bram_if_primitives.vhd" \
    "$ref_dir/../../../ipstatic/lmb_bram_if_cntlr_v4_0/hdl/vhdl/xor18.vhd" \
    "$ref_dir/../../../ipstatic/lmb_bram_if_cntlr_v4_0/hdl/vhdl/parity.vhd" \
    "$ref_dir/../../../ipstatic/lmb_bram_if_cntlr_v4_0/hdl/vhdl/parityenable.vhd" \
    "$ref_dir/../../../ipstatic/lmb_bram_if_cntlr_v4_0/hdl/vhdl/checkbit_handler.vhd" \
    "$ref_dir/../../../ipstatic/lmb_bram_if_cntlr_v4_0/hdl/vhdl/correct_one_bit.vhd" \
    "$ref_dir/../../../ipstatic/lmb_bram_if_cntlr_v4_0/hdl/vhdl/pselect_mask.vhd" \
    "$ref_dir/../../../ipstatic/lmb_bram_if_cntlr_v4_0/hdl/vhdl/axi_interface.vhd" \
    "$ref_dir/../../../ipstatic/lmb_bram_if_cntlr_v4_0/hdl/vhdl/lmb_mux.vhd" \
    "$ref_dir/../../../ipstatic/lmb_bram_if_cntlr_v4_0/hdl/vhdl/lmb_bram_if_cntlr.vhd" \
  2>&1 | tee -a vhdlan.log

  vhdlan -work xil_defaultlib $vhdlan_opts \
    "$ref_dir/../../../bd/design_1/ip/design_1_dlmb_bram_if_cntlr_0/sim/design_1_dlmb_bram_if_cntlr_0.vhd" \
    "$ref_dir/../../../bd/design_1/ip/design_1_ilmb_bram_if_cntlr_0/sim/design_1_ilmb_bram_if_cntlr_0.vhd" \
  2>&1 | tee -a vhdlan.log

  vlogan -work xil_defaultlib $vlogan_opts +v2k +incdir+"$ref_dir/../../../ipstatic/axi_infrastructure_v1_1/hdl/verilog" +incdir+"$ref_dir/../../../ipstatic/clk_wiz_v5_3" \
    "$ref_dir/../../../bd/design_1/ip/design_1_lmb_bram_0/sim/design_1_lmb_bram_0.v" \
  2>&1 | tee -a vlogan.log

  vhdlan -work axi_lite_ipif_v3_0_4 $vhdlan_opts \
    "$ref_dir/../../../ipstatic/axi_lite_ipif_v3_0/hdl/src/vhdl/ipif_pkg.vhd" \
    "$ref_dir/../../../ipstatic/axi_lite_ipif_v3_0/hdl/src/vhdl/pselect_f.vhd" \
    "$ref_dir/../../../ipstatic/axi_lite_ipif_v3_0/hdl/src/vhdl/address_decoder.vhd" \
    "$ref_dir/../../../ipstatic/axi_lite_ipif_v3_0/hdl/src/vhdl/slave_attachment.vhd" \
    "$ref_dir/../../../ipstatic/axi_lite_ipif_v3_0/hdl/src/vhdl/axi_lite_ipif.vhd" \
  2>&1 | tee -a vhdlan.log

  vhdlan -work axi_intc_v4_1_7 $vhdlan_opts \
    "$ref_dir/../../../ipstatic/axi_intc_v4_1/hdl/src/vhdl/double_synchronizer.vhd" \
    "$ref_dir/../../../ipstatic/axi_intc_v4_1/hdl/src/vhdl/shared_ram_ivar.vhd" \
    "$ref_dir/../../../ipstatic/axi_intc_v4_1/hdl/src/vhdl/pulse_synchronizer.vhd" \
    "$ref_dir/../../../ipstatic/axi_intc_v4_1/hdl/src/vhdl/intc_core.vhd" \
    "$ref_dir/../../../ipstatic/axi_intc_v4_1/hdl/src/vhdl/axi_intc.vhd" \
  2>&1 | tee -a vhdlan.log

  vhdlan -work xil_defaultlib $vhdlan_opts \
    "$ref_dir/../../../bd/design_1/ip/design_1_microblaze_0_axi_intc_0/sim/design_1_microblaze_0_axi_intc_0.vhd" \
  2>&1 | tee -a vhdlan.log

  vlogan -work xil_defaultlib $vlogan_opts +v2k +incdir+"$ref_dir/../../../ipstatic/axi_infrastructure_v1_1/hdl/verilog" +incdir+"$ref_dir/../../../ipstatic/clk_wiz_v5_3" \
    "$ref_dir/../../../bd/design_1/ipshared/xilinx.com/xlconcat_v2_1/xlconcat.v" \
    "$ref_dir/../../../bd/design_1/ip/design_1_microblaze_0_xlconcat_0/sim/design_1_microblaze_0_xlconcat_0.v" \
  2>&1 | tee -a vlogan.log

  vhdlan -work mdm_v3_2_6 $vhdlan_opts \
    "$ref_dir/../../../ipstatic/mdm_v3_2/hdl/vhdl/mdm_primitives.vhd" \
    "$ref_dir/../../../ipstatic/mdm_v3_2/hdl/vhdl/arbiter.vhd" \
    "$ref_dir/../../../ipstatic/mdm_v3_2/hdl/vhdl/srl_fifo.vhd" \
    "$ref_dir/../../../ipstatic/mdm_v3_2/hdl/vhdl/bus_master.vhd" \
    "$ref_dir/../../../ipstatic/mdm_v3_2/hdl/vhdl/jtag_control.vhd" \
    "$ref_dir/../../../ipstatic/mdm_v3_2/hdl/vhdl/mdm_core.vhd" \
    "$ref_dir/../../../ipstatic/mdm_v3_2/hdl/vhdl/mdm.vhd" \
  2>&1 | tee -a vhdlan.log

  vhdlan -work xil_defaultlib $vhdlan_opts \
    "$ref_dir/../../../bd/design_1/ip/design_1_mdm_1_0/sim/design_1_mdm_1_0.vhd" \
  2>&1 | tee -a vhdlan.log

  vhdlan -work lib_cdc_v1_0_2 $vhdlan_opts \
    "$ref_dir/../../../ipstatic/lib_cdc_v1_0/hdl/src/vhdl/cdc_sync.vhd" \
  2>&1 | tee -a vhdlan.log

  vhdlan -work proc_sys_reset_v5_0_9 $vhdlan_opts \
    "$ref_dir/../../../ipstatic/proc_sys_reset_v5_0/hdl/src/vhdl/upcnt_n.vhd" \
    "$ref_dir/../../../ipstatic/proc_sys_reset_v5_0/hdl/src/vhdl/sequence_psr.vhd" \
    "$ref_dir/../../../ipstatic/proc_sys_reset_v5_0/hdl/src/vhdl/lpf.vhd" \
    "$ref_dir/../../../ipstatic/proc_sys_reset_v5_0/hdl/src/vhdl/proc_sys_reset.vhd" \
  2>&1 | tee -a vhdlan.log

  vhdlan -work xil_defaultlib $vhdlan_opts \
    "$ref_dir/../../../bd/design_1/ip/design_1_rst_clk_wiz_0_50M_0/sim/design_1_rst_clk_wiz_0_50M_0.vhd" \
  2>&1 | tee -a vhdlan.log

  vhdlan -work lib_pkg_v1_0_2 $vhdlan_opts \
    "$ref_dir/../../../ipstatic/lib_pkg_v1_0/hdl/src/vhdl/lib_pkg.vhd" \
  2>&1 | tee -a vhdlan.log

  vhdlan -work lib_srl_fifo_v1_0_2 $vhdlan_opts \
    "$ref_dir/../../../ipstatic/lib_srl_fifo_v1_0/hdl/src/vhdl/cntr_incr_decr_addn_f.vhd" \
    "$ref_dir/../../../ipstatic/lib_srl_fifo_v1_0/hdl/src/vhdl/dynshreg_f.vhd" \
    "$ref_dir/../../../ipstatic/lib_srl_fifo_v1_0/hdl/src/vhdl/srl_fifo_rbu_f.vhd" \
    "$ref_dir/../../../ipstatic/lib_srl_fifo_v1_0/hdl/src/vhdl/srl_fifo_f.vhd" \
  2>&1 | tee -a vhdlan.log

  vhdlan -work axi_uartlite_v2_0_13 $vhdlan_opts \
    "$ref_dir/../../../ipstatic/axi_uartlite_v2_0/hdl/src/vhdl/dynshreg_i_f.vhd" \
    "$ref_dir/../../../ipstatic/axi_uartlite_v2_0/hdl/src/vhdl/uartlite_tx.vhd" \
    "$ref_dir/../../../ipstatic/axi_uartlite_v2_0/hdl/src/vhdl/uartlite_rx.vhd" \
    "$ref_dir/../../../ipstatic/axi_uartlite_v2_0/hdl/src/vhdl/baudrate.vhd" \
    "$ref_dir/../../../ipstatic/axi_uartlite_v2_0/hdl/src/vhdl/uartlite_core.vhd" \
    "$ref_dir/../../../ipstatic/axi_uartlite_v2_0/hdl/src/vhdl/axi_uartlite.vhd" \
  2>&1 | tee -a vhdlan.log

  vhdlan -work xil_defaultlib $vhdlan_opts \
    "$ref_dir/../../../bd/design_1/ip/design_1_axi_uartlite_0_0/sim/design_1_axi_uartlite_0_0.vhd" \
  2>&1 | tee -a vhdlan.log

  vlogan -work generic_baseblocks_v2_1_0 $vlogan_opts +v2k +incdir+"$ref_dir/../../../ipstatic/axi_infrastructure_v1_1/hdl/verilog" +incdir+"$ref_dir/../../../ipstatic/clk_wiz_v5_3" \
    "$ref_dir/../../../ipstatic/generic_baseblocks_v2_1/hdl/verilog/generic_baseblocks_v2_1_carry_and.v" \
    "$ref_dir/../../../ipstatic/generic_baseblocks_v2_1/hdl/verilog/generic_baseblocks_v2_1_carry_latch_and.v" \
    "$ref_dir/../../../ipstatic/generic_baseblocks_v2_1/hdl/verilog/generic_baseblocks_v2_1_carry_latch_or.v" \
    "$ref_dir/../../../ipstatic/generic_baseblocks_v2_1/hdl/verilog/generic_baseblocks_v2_1_carry_or.v" \
    "$ref_dir/../../../ipstatic/generic_baseblocks_v2_1/hdl/verilog/generic_baseblocks_v2_1_carry.v" \
    "$ref_dir/../../../ipstatic/generic_baseblocks_v2_1/hdl/verilog/generic_baseblocks_v2_1_command_fifo.v" \
    "$ref_dir/../../../ipstatic/generic_baseblocks_v2_1/hdl/verilog/generic_baseblocks_v2_1_comparator_mask_static.v" \
    "$ref_dir/../../../ipstatic/generic_baseblocks_v2_1/hdl/verilog/generic_baseblocks_v2_1_comparator_mask.v" \
    "$ref_dir/../../../ipstatic/generic_baseblocks_v2_1/hdl/verilog/generic_baseblocks_v2_1_comparator_sel_mask_static.v" \
    "$ref_dir/../../../ipstatic/generic_baseblocks_v2_1/hdl/verilog/generic_baseblocks_v2_1_comparator_sel_mask.v" \
    "$ref_dir/../../../ipstatic/generic_baseblocks_v2_1/hdl/verilog/generic_baseblocks_v2_1_comparator_sel_static.v" \
    "$ref_dir/../../../ipstatic/generic_baseblocks_v2_1/hdl/verilog/generic_baseblocks_v2_1_comparator_sel.v" \
    "$ref_dir/../../../ipstatic/generic_baseblocks_v2_1/hdl/verilog/generic_baseblocks_v2_1_comparator_static.v" \
    "$ref_dir/../../../ipstatic/generic_baseblocks_v2_1/hdl/verilog/generic_baseblocks_v2_1_comparator.v" \
    "$ref_dir/../../../ipstatic/generic_baseblocks_v2_1/hdl/verilog/generic_baseblocks_v2_1_mux_enc.v" \
    "$ref_dir/../../../ipstatic/generic_baseblocks_v2_1/hdl/verilog/generic_baseblocks_v2_1_mux.v" \
    "$ref_dir/../../../ipstatic/generic_baseblocks_v2_1/hdl/verilog/generic_baseblocks_v2_1_nto1_mux.v" \
  2>&1 | tee -a vlogan.log

  vlogan -work axi_infrastructure_v1_1_0 $vlogan_opts +v2k +incdir+"$ref_dir/../../../ipstatic/axi_infrastructure_v1_1/hdl/verilog" +incdir+"$ref_dir/../../../ipstatic/clk_wiz_v5_3" \
    "$ref_dir/../../../ipstatic/axi_infrastructure_v1_1/hdl/verilog/axi_infrastructure_v1_1_axi2vector.v" \
    "$ref_dir/../../../ipstatic/axi_infrastructure_v1_1/hdl/verilog/axi_infrastructure_v1_1_axic_srl_fifo.v" \
    "$ref_dir/../../../ipstatic/axi_infrastructure_v1_1/hdl/verilog/axi_infrastructure_v1_1_vector2axi.v" \
  2>&1 | tee -a vlogan.log

  vlogan -work axi_register_slice_v2_1_9 $vlogan_opts +v2k +incdir+"$ref_dir/../../../ipstatic/axi_infrastructure_v1_1/hdl/verilog" +incdir+"$ref_dir/../../../ipstatic/clk_wiz_v5_3" \
    "$ref_dir/../../../ipstatic/axi_register_slice_v2_1/hdl/verilog/axi_register_slice_v2_1_axic_register_slice.v" \
    "$ref_dir/../../../ipstatic/axi_register_slice_v2_1/hdl/verilog/axi_register_slice_v2_1_axi_register_slice.v" \
  2>&1 | tee -a vlogan.log

  vlogan -work fifo_generator_v13_1_1 $vlogan_opts +v2k +incdir+"$ref_dir/../../../ipstatic/axi_infrastructure_v1_1/hdl/verilog" +incdir+"$ref_dir/../../../ipstatic/clk_wiz_v5_3" \
    "$ref_dir/../../../ipstatic/fifo_generator_v13_1/simulation/fifo_generator_vlog_beh.v" \
  2>&1 | tee -a vlogan.log

  vhdlan -work fifo_generator_v13_1_1 $vhdlan_opts \
    "$ref_dir/../../../ipstatic/fifo_generator_v13_1/hdl/fifo_generator_v13_1_rfs.vhd" \
  2>&1 | tee -a vhdlan.log

  vlogan -work fifo_generator_v13_1_1 $vlogan_opts +v2k +incdir+"$ref_dir/../../../ipstatic/axi_infrastructure_v1_1/hdl/verilog" +incdir+"$ref_dir/../../../ipstatic/clk_wiz_v5_3" \
    "$ref_dir/../../../ipstatic/fifo_generator_v13_1/hdl/fifo_generator_v13_1_rfs.v" \
  2>&1 | tee -a vlogan.log

  vlogan -work axi_data_fifo_v2_1_8 $vlogan_opts +v2k +incdir+"$ref_dir/../../../ipstatic/axi_infrastructure_v1_1/hdl/verilog" +incdir+"$ref_dir/../../../ipstatic/clk_wiz_v5_3" \
    "$ref_dir/../../../ipstatic/axi_data_fifo_v2_1/hdl/verilog/axi_data_fifo_v2_1_axic_fifo.v" \
    "$ref_dir/../../../ipstatic/axi_data_fifo_v2_1/hdl/verilog/axi_data_fifo_v2_1_fifo_gen.v" \
    "$ref_dir/../../../ipstatic/axi_data_fifo_v2_1/hdl/verilog/axi_data_fifo_v2_1_axic_srl_fifo.v" \
    "$ref_dir/../../../ipstatic/axi_data_fifo_v2_1/hdl/verilog/axi_data_fifo_v2_1_axic_reg_srl_fifo.v" \
    "$ref_dir/../../../ipstatic/axi_data_fifo_v2_1/hdl/verilog/axi_data_fifo_v2_1_ndeep_srl.v" \
    "$ref_dir/../../../ipstatic/axi_data_fifo_v2_1/hdl/verilog/axi_data_fifo_v2_1_axi_data_fifo.v" \
  2>&1 | tee -a vlogan.log

  vlogan -work axi_crossbar_v2_1_10 $vlogan_opts +v2k +incdir+"$ref_dir/../../../ipstatic/axi_infrastructure_v1_1/hdl/verilog" +incdir+"$ref_dir/../../../ipstatic/clk_wiz_v5_3" \
    "$ref_dir/../../../ipstatic/axi_crossbar_v2_1/hdl/verilog/axi_crossbar_v2_1_addr_arbiter_sasd.v" \
    "$ref_dir/../../../ipstatic/axi_crossbar_v2_1/hdl/verilog/axi_crossbar_v2_1_addr_arbiter.v" \
    "$ref_dir/../../../ipstatic/axi_crossbar_v2_1/hdl/verilog/axi_crossbar_v2_1_addr_decoder.v" \
    "$ref_dir/../../../ipstatic/axi_crossbar_v2_1/hdl/verilog/axi_crossbar_v2_1_arbiter_resp.v" \
    "$ref_dir/../../../ipstatic/axi_crossbar_v2_1/hdl/verilog/axi_crossbar_v2_1_crossbar_sasd.v" \
    "$ref_dir/../../../ipstatic/axi_crossbar_v2_1/hdl/verilog/axi_crossbar_v2_1_crossbar.v" \
    "$ref_dir/../../../ipstatic/axi_crossbar_v2_1/hdl/verilog/axi_crossbar_v2_1_decerr_slave.v" \
    "$ref_dir/../../../ipstatic/axi_crossbar_v2_1/hdl/verilog/axi_crossbar_v2_1_si_transactor.v" \
    "$ref_dir/../../../ipstatic/axi_crossbar_v2_1/hdl/verilog/axi_crossbar_v2_1_splitter.v" \
    "$ref_dir/../../../ipstatic/axi_crossbar_v2_1/hdl/verilog/axi_crossbar_v2_1_wdata_mux.v" \
    "$ref_dir/../../../ipstatic/axi_crossbar_v2_1/hdl/verilog/axi_crossbar_v2_1_wdata_router.v" \
    "$ref_dir/../../../ipstatic/axi_crossbar_v2_1/hdl/verilog/axi_crossbar_v2_1_axi_crossbar.v" \
  2>&1 | tee -a vlogan.log

  vlogan -work xil_defaultlib $vlogan_opts +v2k +incdir+"$ref_dir/../../../ipstatic/axi_infrastructure_v1_1/hdl/verilog" +incdir+"$ref_dir/../../../ipstatic/clk_wiz_v5_3" \
    "$ref_dir/../../../bd/design_1/ip/design_1_xbar_0/sim/design_1_xbar_0.v" \
  2>&1 | tee -a vlogan.log

  vhdlan -work axi_bram_ctrl_v4_0_8 $vhdlan_opts \
    "$ref_dir/../../../ipstatic/axi_bram_ctrl_v4_0/hdl/vhdl/srl_fifo.vhd" \
    "$ref_dir/../../../ipstatic/axi_bram_ctrl_v4_0/hdl/vhdl/axi_bram_ctrl_funcs.vhd" \
    "$ref_dir/../../../ipstatic/axi_bram_ctrl_v4_0/hdl/vhdl/coregen_comp_defs.vhd" \
    "$ref_dir/../../../ipstatic/axi_bram_ctrl_v4_0/hdl/vhdl/axi_lite_if.vhd" \
    "$ref_dir/../../../ipstatic/axi_bram_ctrl_v4_0/hdl/vhdl/checkbit_handler_64.vhd" \
    "$ref_dir/../../../ipstatic/axi_bram_ctrl_v4_0/hdl/vhdl/checkbit_handler.vhd" \
    "$ref_dir/../../../ipstatic/axi_bram_ctrl_v4_0/hdl/vhdl/correct_one_bit_64.vhd" \
    "$ref_dir/../../../ipstatic/axi_bram_ctrl_v4_0/hdl/vhdl/correct_one_bit.vhd" \
    "$ref_dir/../../../ipstatic/axi_bram_ctrl_v4_0/hdl/vhdl/xor18.vhd" \
    "$ref_dir/../../../ipstatic/axi_bram_ctrl_v4_0/hdl/vhdl/parity.vhd" \
    "$ref_dir/../../../ipstatic/axi_bram_ctrl_v4_0/hdl/vhdl/ecc_gen.vhd" \
    "$ref_dir/../../../ipstatic/axi_bram_ctrl_v4_0/hdl/vhdl/lite_ecc_reg.vhd" \
    "$ref_dir/../../../ipstatic/axi_bram_ctrl_v4_0/hdl/vhdl/axi_lite.vhd" \
    "$ref_dir/../../../ipstatic/axi_bram_ctrl_v4_0/hdl/vhdl/sng_port_arb.vhd" \
    "$ref_dir/../../../ipstatic/axi_bram_ctrl_v4_0/hdl/vhdl/ua_narrow.vhd" \
    "$ref_dir/../../../ipstatic/axi_bram_ctrl_v4_0/hdl/vhdl/wrap_brst.vhd" \
    "$ref_dir/../../../ipstatic/axi_bram_ctrl_v4_0/hdl/vhdl/rd_chnl.vhd" \
    "$ref_dir/../../../ipstatic/axi_bram_ctrl_v4_0/hdl/vhdl/wr_chnl.vhd" \
    "$ref_dir/../../../ipstatic/axi_bram_ctrl_v4_0/hdl/vhdl/full_axi.vhd" \
    "$ref_dir/../../../ipstatic/axi_bram_ctrl_v4_0/hdl/vhdl/axi_bram_ctrl_top.vhd" \
    "$ref_dir/../../../ipstatic/axi_bram_ctrl_v4_0/hdl/vhdl/axi_bram_ctrl.vhd" \
  2>&1 | tee -a vhdlan.log

  vhdlan -work xil_defaultlib $vhdlan_opts \
    "$ref_dir/../../../bd/design_1/ip/design_1_axi_bram_ctrl_0_0/sim/design_1_axi_bram_ctrl_0_0.vhd" \
  2>&1 | tee -a vhdlan.log

  vlogan -work xil_defaultlib $vlogan_opts +v2k +incdir+"$ref_dir/../../../ipstatic/axi_infrastructure_v1_1/hdl/verilog" +incdir+"$ref_dir/../../../ipstatic/clk_wiz_v5_3" \
    "$ref_dir/../../../bd/design_1/ipshared/utoronto.ca/comm_v1_0/hdl/comm_v1_0_S00_AXI.v" \
    "$ref_dir/../../../bd/design_1/ipshared/utoronto.ca/comm_v1_0/hdl/comm_v1_0.v" \
    "$ref_dir/../../../bd/design_1/ip/design_1_comm_0_0/sim/design_1_comm_0_0.v" \
    "$ref_dir/../../../bd/design_1/ip/design_1_blk_mem_gen_1_0/sim/design_1_blk_mem_gen_1_0.v" \
    "$ref_dir/../../../bd/design_1/ipshared/utoronto.ca/vga_ip_v1_0/vga640x480.v" \
    "$ref_dir/../../../bd/design_1/ip/design_1_vga_ip_0_1/sim/design_1_vga_ip_0_1.v" \
    "$ref_dir/../../../bd/design_1/ipshared/utoronto.ca/video_in_v1_0/I2C_Controller.v" \
    "$ref_dir/../../../bd/design_1/ipshared/utoronto.ca/video_in_v1_0/I2C_OV7670_RGB444_Config.v" \
    "$ref_dir/../../../bd/design_1/ipshared/utoronto.ca/video_in_v1_0/pmod_cam.v" \
    "$ref_dir/../../../bd/design_1/ipshared/utoronto.ca/video_in_v1_0/I2C_AV_Config.v" \
    "$ref_dir/../../../bd/design_1/ipshared/utoronto.ca/video_in_v1_0/video_in.v" \
    "$ref_dir/../../../bd/design_1/ip/design_1_video_in_0_0/sim/design_1_video_in_0_0.v" \
  2>&1 | tee -a vlogan.log

  vlogan -work axi_protocol_converter_v2_1_9 $vlogan_opts +v2k +incdir+"$ref_dir/../../../ipstatic/axi_infrastructure_v1_1/hdl/verilog" +incdir+"$ref_dir/../../../ipstatic/clk_wiz_v5_3" \
    "$ref_dir/../../../ipstatic/axi_protocol_converter_v2_1/hdl/verilog/axi_protocol_converter_v2_1_a_axi3_conv.v" \
    "$ref_dir/../../../ipstatic/axi_protocol_converter_v2_1/hdl/verilog/axi_protocol_converter_v2_1_axi3_conv.v" \
    "$ref_dir/../../../ipstatic/axi_protocol_converter_v2_1/hdl/verilog/axi_protocol_converter_v2_1_axilite_conv.v" \
    "$ref_dir/../../../ipstatic/axi_protocol_converter_v2_1/hdl/verilog/axi_protocol_converter_v2_1_r_axi3_conv.v" \
    "$ref_dir/../../../ipstatic/axi_protocol_converter_v2_1/hdl/verilog/axi_protocol_converter_v2_1_w_axi3_conv.v" \
    "$ref_dir/../../../ipstatic/axi_protocol_converter_v2_1/hdl/verilog/axi_protocol_converter_v2_1_b_downsizer.v" \
    "$ref_dir/../../../ipstatic/axi_protocol_converter_v2_1/hdl/verilog/axi_protocol_converter_v2_1_decerr_slave.v" \
    "$ref_dir/../../../ipstatic/axi_protocol_converter_v2_1/hdl/verilog/axi_protocol_converter_v2_1_b2s_simple_fifo.v" \
    "$ref_dir/../../../ipstatic/axi_protocol_converter_v2_1/hdl/verilog/axi_protocol_converter_v2_1_b2s_wrap_cmd.v" \
    "$ref_dir/../../../ipstatic/axi_protocol_converter_v2_1/hdl/verilog/axi_protocol_converter_v2_1_b2s_incr_cmd.v" \
    "$ref_dir/../../../ipstatic/axi_protocol_converter_v2_1/hdl/verilog/axi_protocol_converter_v2_1_b2s_wr_cmd_fsm.v" \
    "$ref_dir/../../../ipstatic/axi_protocol_converter_v2_1/hdl/verilog/axi_protocol_converter_v2_1_b2s_rd_cmd_fsm.v" \
    "$ref_dir/../../../ipstatic/axi_protocol_converter_v2_1/hdl/verilog/axi_protocol_converter_v2_1_b2s_cmd_translator.v" \
    "$ref_dir/../../../ipstatic/axi_protocol_converter_v2_1/hdl/verilog/axi_protocol_converter_v2_1_b2s_b_channel.v" \
    "$ref_dir/../../../ipstatic/axi_protocol_converter_v2_1/hdl/verilog/axi_protocol_converter_v2_1_b2s_r_channel.v" \
    "$ref_dir/../../../ipstatic/axi_protocol_converter_v2_1/hdl/verilog/axi_protocol_converter_v2_1_b2s_aw_channel.v" \
    "$ref_dir/../../../ipstatic/axi_protocol_converter_v2_1/hdl/verilog/axi_protocol_converter_v2_1_b2s_ar_channel.v" \
    "$ref_dir/../../../ipstatic/axi_protocol_converter_v2_1/hdl/verilog/axi_protocol_converter_v2_1_b2s.v" \
    "$ref_dir/../../../ipstatic/axi_protocol_converter_v2_1/hdl/verilog/axi_protocol_converter_v2_1_axi_protocol_converter.v" \
  2>&1 | tee -a vlogan.log

  vlogan -work axi_clock_converter_v2_1_8 $vlogan_opts +v2k +incdir+"$ref_dir/../../../ipstatic/axi_infrastructure_v1_1/hdl/verilog" +incdir+"$ref_dir/../../../ipstatic/clk_wiz_v5_3" \
    "$ref_dir/../../../ipstatic/axi_clock_converter_v2_1/hdl/verilog/axi_clock_converter_v2_1_axic_sync_clock_converter.v" \
    "$ref_dir/../../../ipstatic/axi_clock_converter_v2_1/hdl/verilog/axi_clock_converter_v2_1_axic_sample_cycle_ratio.v" \
    "$ref_dir/../../../ipstatic/axi_clock_converter_v2_1/hdl/verilog/axi_clock_converter_v2_1_axi_clock_converter.v" \
  2>&1 | tee -a vlogan.log

  vlogan -work axi_dwidth_converter_v2_1_9 $vlogan_opts +v2k +incdir+"$ref_dir/../../../ipstatic/axi_infrastructure_v1_1/hdl/verilog" +incdir+"$ref_dir/../../../ipstatic/clk_wiz_v5_3" \
    "$ref_dir/../../../ipstatic/axi_dwidth_converter_v2_1/hdl/verilog/axi_dwidth_converter_v2_1_a_downsizer.v" \
    "$ref_dir/../../../ipstatic/axi_dwidth_converter_v2_1/hdl/verilog/axi_dwidth_converter_v2_1_b_downsizer.v" \
    "$ref_dir/../../../ipstatic/axi_dwidth_converter_v2_1/hdl/verilog/axi_dwidth_converter_v2_1_r_downsizer.v" \
    "$ref_dir/../../../ipstatic/axi_dwidth_converter_v2_1/hdl/verilog/axi_dwidth_converter_v2_1_w_downsizer.v" \
    "$ref_dir/../../../ipstatic/axi_dwidth_converter_v2_1/hdl/verilog/axi_dwidth_converter_v2_1_axi_downsizer.v" \
    "$ref_dir/../../../ipstatic/axi_dwidth_converter_v2_1/hdl/verilog/axi_dwidth_converter_v2_1_axi4lite_downsizer.v" \
    "$ref_dir/../../../ipstatic/axi_dwidth_converter_v2_1/hdl/verilog/axi_dwidth_converter_v2_1_axi4lite_upsizer.v" \
    "$ref_dir/../../../ipstatic/axi_dwidth_converter_v2_1/hdl/verilog/axi_dwidth_converter_v2_1_a_upsizer.v" \
    "$ref_dir/../../../ipstatic/axi_dwidth_converter_v2_1/hdl/verilog/axi_dwidth_converter_v2_1_r_upsizer.v" \
    "$ref_dir/../../../ipstatic/axi_dwidth_converter_v2_1/hdl/verilog/axi_dwidth_converter_v2_1_w_upsizer.v" \
    "$ref_dir/../../../ipstatic/axi_dwidth_converter_v2_1/hdl/verilog/axi_dwidth_converter_v2_1_w_upsizer_pktfifo.v" \
    "$ref_dir/../../../ipstatic/axi_dwidth_converter_v2_1/hdl/verilog/axi_dwidth_converter_v2_1_r_upsizer_pktfifo.v" \
    "$ref_dir/../../../ipstatic/axi_dwidth_converter_v2_1/hdl/verilog/axi_dwidth_converter_v2_1_axi_upsizer.v" \
    "$ref_dir/../../../ipstatic/axi_dwidth_converter_v2_1/hdl/verilog/axi_dwidth_converter_v2_1_top.v" \
  2>&1 | tee -a vlogan.log

  vlogan -work xil_defaultlib $vlogan_opts +v2k +incdir+"$ref_dir/../../../ipstatic/axi_infrastructure_v1_1/hdl/verilog" +incdir+"$ref_dir/../../../ipstatic/clk_wiz_v5_3" \
    "$ref_dir/../../../bd/design_1/ip/design_1_auto_ds_0/sim/design_1_auto_ds_0.v" \
    "$ref_dir/../../../bd/design_1/ip/design_1_auto_ds_1/sim/design_1_auto_ds_1.v" \
    "$ref_dir/../../../bd/design_1/ip/design_1_auto_ds_2/sim/design_1_auto_ds_2.v" \
    "$ref_dir/../../../bd/design_1/ip/design_1_auto_pc_0/sim/design_1_auto_pc_0.v" \
    "$ref_dir/../../../bd/design_1/ip/design_1_auto_us_0/sim/design_1_auto_us_0.v" \
  2>&1 | tee -a vlogan.log


  vlogan -work xil_defaultlib $vlogan_opts +v2k \
    glbl.v \
  2>&1 | tee -a vlogan.log

}

# RUN_STEP: <elaborate>
elaborate()
{
  vcs $vcs_elab_opts xil_defaultlib.design_1 xil_defaultlib.glbl -o design_1_simv
}

# RUN_STEP: <simulate>
simulate()
{
  ./design_1_simv $vcs_sim_opts -do simulate.do
}

# STEP: setup
setup()
{
  case $1 in
    "-lib_map_path" )
      if [[ ($2 == "") ]]; then
        echo -e "ERROR: Simulation library directory path not specified (type \"./design_1.sh -help\" for more information)\n"
        exit 1
      fi
      create_lib_mappings $2
    ;;
    "-reset_run" )
      reset_run
      echo -e "INFO: Simulation run files deleted.\n"
      exit 0
    ;;
    "-noclean_files" )
      # do not remove previous data
    ;;
    * )
      create_lib_mappings $2
  esac

  create_lib_dir

  # Add any setup/initialization commands here:-

  # <user specific commands>

}

# Define design library mappings
create_lib_mappings()
{
  file="synopsys_sim.setup"
  if [[ -e $file ]]; then
    if [[ ($1 == "") ]]; then
      return
    else
      rm -rf $file
    fi
  fi

  touch $file

  lib_map_path=""
  if [[ ($1 != "") ]]; then
    lib_map_path="$1"
  fi

  for (( i=0; i<${#design_libs[*]}; i++ )); do
    lib="${design_libs[i]}"
    mapping="$lib:$sim_lib_dir/$lib"
    echo $mapping >> $file
  done

  if [[ ($lib_map_path != "") ]]; then
    incl_ref="OTHERS=$lib_map_path/synopsys_sim.setup"
    echo $incl_ref >> $file
  fi
}

# Create design library directory paths
create_lib_dir()
{
  if [[ -e $sim_lib_dir ]]; then
    rm -rf $sim_lib_dir
  fi

  for (( i=0; i<${#design_libs[*]}; i++ )); do
    lib="${design_libs[i]}"
    lib_dir="$sim_lib_dir/$lib"
    if [[ ! -e $lib_dir ]]; then
      mkdir -p $lib_dir
    fi
  done
}

# Delete generated data from the previous run
reset_run()
{
  files_to_remove=(ucli.key design_1_simv vlogan.log vhdlan.log compile.log elaborate.log simulate.log .vlogansetup.env .vlogansetup.args .vcs_lib_lock scirocco_command.log 64 AN.DB csrc design_1_simv.daidir)
  for (( i=0; i<${#files_to_remove[*]}; i++ )); do
    file="${files_to_remove[i]}"
    if [[ -e $file ]]; then
      rm -rf $file
    fi
  done

  create_lib_dir
}

# Check command line arguments
check_args()
{
  if [[ ($1 == 1 ) && ($2 != "-lib_map_path" && $2 != "-noclean_files" && $2 != "-reset_run" && $2 != "-help" && $2 != "-h") ]]; then
    echo -e "ERROR: Unknown option specified '$2' (type \"./design_1.sh -help\" for more information)\n"
    exit 1
  fi

  if [[ ($2 == "-help" || $2 == "-h") ]]; then
    usage
  fi
}

# Script usage
usage()
{
  msg="Usage: design_1.sh [-help]\n\
Usage: design_1.sh [-lib_map_path]\n\
Usage: design_1.sh [-reset_run]\n\
Usage: design_1.sh [-noclean_files]\n\n\
[-help] -- Print help information for this script\n\n\
[-lib_map_path <path>] -- Compiled simulation library directory path. The simulation library is compiled\n\
using the compile_simlib tcl command. Please see 'compile_simlib -help' for more information.\n\n\
[-reset_run] -- Recreate simulator setup files and library mappings for a clean run. The generated files\n\
from the previous run will be removed. If you don't want to remove the simulator generated files, use the\n\
-noclean_files switch.\n\n\
[-noclean_files] -- Reset previous run, but do not remove simulator generated files from the previous run.\n\n"
  echo -e $msg
  exit 1
}

# Launch script
run $1 $2
