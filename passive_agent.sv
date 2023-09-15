//`include "f_sequence_item.sv"
//`include "f_sequence.sv"
//`include "f_sequencer.sv"
//`include "f_driver.sv"
//`include "f_passive_monitor.sv"

class fifo_passive_agent extends uvm_agent;
//  f_sequencer f_seqr;
//f_driver f_dri;
  fifo_passive_monitor fifo_pass_mon;
  `uvm_component_utils(fifo_passive_agent)
  
  function new(string name = "fifo_passive_agent", uvm_component parent);
    super.new(name, parent);
  endfunction
  
  virtual function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    //    if(get_is_active() == UVM_PASSIVE) begin
//    f_seqr = f_sequencer::type_id::create("f_seqr", this);
//      f_dri = f_driver::type_id::create("f_dri", this);
//    end
    fifo_pass_mon = fifo_passive_monitor::type_id::create("fifo_mon", this);
  endfunction
  
// virtual function void connect_phase(uvm_phase phase);
// if(get_is_active() == UVM_ACTIVE)
//   f_dri.seq_item_port.connect(f_seqr.seq_item_export);
// endfunction
  
endclass
    
    
