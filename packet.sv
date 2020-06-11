class packet extends uvm_sequence_item;
  
  `uvm_object_utils(packet)
  
  function new(string name="packet");
    super.new(name);
  endfunction
  
  rand logic [31:0] data;
  
  constraint data_c {
    data inside {[100:200],[300:500]};  
    data > 105;
    data < 450;
  }
  
endclass
