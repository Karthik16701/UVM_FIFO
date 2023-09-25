import uvm_pkg::*;
`include "uvm_macros.svh"
`include "interface.sv"
`include "sequence_item.sv"
`include "sequence.sv"
`include "sequencer.sv"
`include "driver.sv"
`include "monitor.sv"
`include " agent.sv"
`include "scoreboard.sv"
`include "environment.sv"
`include "test.sv"

module tb;
  bit clk;
  bit reset;
  
  always #5 clk = ~clk;
  
  initial begin
    clk = 1;
    reset = 1;
    #5;
    reset = 0;
  end
  
  fifo_interface tif(clk, reset);
  
  my_fifo dut(.clk(tif.clk),
               .rst(tif.reset),
               .data_in(tif.i_wrdata),
               .write_en(tif.i_wren),
               .read_en(tif.i_rden),
               .full(tif.o_full),
               .empty(tif.o_empty),
               .almost_full(tif.o_alm_full),
               .almost_empty(tif.o_alm_empty),
               .data_out(tif.o_rddata));
  
  initial begin
   uvm_config_db#(virtual fifo_interface)::set(null, "", "vif", tif);
    $dumpfile("dump.vcd"); 
    $dumpvars;
    run_test("fifo_test");
  end
  
endmodule
