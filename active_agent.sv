//`include "fifo_sequence_item.sv"
//`include "fifo_sequence.sv"
//`include "fifo_sequencer.sv"
//`include "fifo_driver.sv"
//`include "fifo_active_monitor.sv"
//`include "fifo_active_agent.sv"

class fifo_active_agent extends uvm_agent;
  fifo_sequencer fifo_seqr;
  fifo_driver fifo_dri;
  fifo_active_monitor fifo_act_mon;
  `uvm_component_utils(fifo_active_agent)
  
  function new(string name = "fifo_active_agent", uvm_component parent);
    super.new(name, parent);
  endfunction
  
  virtual function void build_phase(uvm_phase phase);
    super.build_phase(phase);
 //  if(get_is_active() == UVM_ACTIVE) begin
      fifo_seqr = fifo_sequencer::type_id::create("fifo_seqr", this);
      fifo_dri = fifo_driver::type_id::create("fifo_dri", this);
 //  end
    fifo_act_mon = fifo_active_monitor::type_id::create("fifo_mon", this);
  endfunction
  
  virtual function void connect_phase(uvm_phase phase);
 //   if(get_is_active() == UVM_ACTIVE)
      fifo_dri.seq_item_port.connect(fifo_seqr.seq_item_export);
  endfunction
  
endclass
    
