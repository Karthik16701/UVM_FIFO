 // Code your testbench here
// or browse Examples
 class fifo_scoreboard extends uvm_scoreboard;
   uvm_analysis_imp#(fifo_sequence_item, fifo_scoreboard) item_got_export;
 
  `uvm_component_utils(fifo_scoreboard)
  
   function new(string name = "fifo_scoreboard", uvm_component parent);
    super.new(name, parent);
     item_got_export1 = new("item_got_export1", this);
 
  endfunction
  
  virtual function void build_phase(uvm_phase phase);
    super.build_phase(phase);
  endfunction
  
  bit [127:0] queue[$];
 
  
   function void write(input fifo_sequence_item item_got);
     bit [127:0] examdata;
     if(item_got.i_wren == 'b1)
       begin
         if(queue.size()<1024)
           begin
       queue.push_back(item_got.i_wrdata);
     
             `uvm_info("write Data", $sformatf("i_wren: %0b i_rden: %0b i_wrdata: %0d full: %0b",item_got.i_wren, item_got.i_rden,item_got.i_wrdata), UVM_LOW);
    end
      if (item_got.i_rden == 'b1)
        begin
      if(queue.size() >= 'd1)
        begin     
        examdata = queue.pop_front();
          `uvm_info("Data read operation", $sformatf("data: %0d , the read data is(local var)=%0d", data,temp_var), UVM_LOW);
          if(examdata == temp_var)
          $display("-------- 		Pass! 		--------");
        
        else 
          $display("--------		Fail!		--------");
      end
    end
  endfunction
endclass
         
         
         
