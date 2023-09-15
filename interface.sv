interface fifo_interface(input clk, reset);
  logic i_wren;
  logic i_rden;
  logic [127:0] i_wrdata;
  logic o_full;
  logic o_empty;
  logic o_alm_full;
  logic o_alm_empty;
  logic [127:0] o_rddata;

  
  clocking d_cb @(posedge clk);
    default input #1 output #1;
    output i_wren;
    output i_rden;
    output i_wrdata;
 //   input o_full;
 //   input o_empty;
 //   input o_alm_full;
 //   input o_alm_empty;
 //   input [DATA_W-1:0] o_rddata;
  endclocking
  
  clocking m_cb_in @(posedge clk);
    default input #1 output #1;
    input i_wren;
    input i_rden;
    input i_wrdata;
endclocking
clocking m_cb_out @(posedge clk);
    default input #1 output #1;
    input o_full;
    input o_empty;
    input o_alm_full;
    input o_alm_empty;
    input o_rddata;
  endclocking
  
  modport d_mp (input clk, reset, clocking d_cb);
  modport m_mp_in (input clk, reset, clocking m_cb_in);
  modport m_mp_out (input clk, reset, clocking m_cb_out);
    
endinterface
