class fifo_passive_monitor extends uvm_monitor;
virtual fifo_interface vif;
   fifo_sequence_item item_got2;
    uvm_analysis_port#(fifo_sequence_item) item_got_port2;
   `uvm_component_utils(fifo_passive_monitor)
   
   function new(string name = "fifo_passive_monitor", uvm_component parent);
     super.new(name,parent);
     item_got_port2 =new("item_got_port2",this);
   endfunction
   
   virtual function void build_phase(uvm_phase phase);
     super.build_phase(phase);
       item_got2 = fifo_sequence_item::type_id::create("item_got2");
     if(!uvm_config_db#(virtual fifo_interface)::get(this, "", "vif", vif))
       `uvm_fatal(" passive Monitor: ", "No vif is found!")
  endfunction
       
        virtual task run_phase(uvm_phase phase);
    forever begin
      @(posedge vif.m_mp_out.clk)
      begin
        item_got.o_rddata = vif.m_mp_out.m_cb_out.o_rddata;
        item_got.o_alm_full =vif.m_mp_out.m_cb_out.o_alm_full;
        item_got.o_alm_empty =vif.m_mp_out.m_cb_out.o_alm_empty;
        item_got.o_full =vif.m_mp_out.m_cb_out.o_full;
        item_got.o_empty =vif.m_mp_out.m_cb_out.o_empty;
        item_got_port2.write(item_got2);
      end
    end
  endtask
endclass
       
   
   

