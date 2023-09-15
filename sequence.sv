 class fifo_sequence extends uvm_sequence#(fifo_sequence_item);
  `uvm_object_utils(fifo_sequence)
  
  function new(string name = "fifo_sequence");
    super.new(name);
  endfunction
  
  virtual task body();
    repeat(1024) begin
      req = fifo_sequence_item::type_id::create("req");
      start_item(req);
      assert(req.randomize() with {i_wren == 1;i_rden ==0;});
      finish_item(req);
    end
    
    repeat(1024) begin
      req = fifo_sequence_item::type_id::create("req");
      start_item(req);
      assert(req.randomize() with {i_wren==0;i_rden == 1;});
      finish_item(req);
    end
 
     repeat(1024) begin
      req = fifo_sequence_item::type_id::create("req");
      start_item(req);
       assert(req.randomize() with {i_wren==0;i_rden == 1;});
      assert(req.randomize() with {i_wren == 1;i_rden ==0;});
      finish_item(req);
    end
    
  endtask
  
endclass

