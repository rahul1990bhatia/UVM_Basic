interface intf(input clk);
	
  logic [31:0] data_in,data_out;
  logic rst;

  
  default clocking cb @(posedge clk);
  	
    default input #1step output #1ns;
    input data_out;
    output data_in;
  
  endclocking
  
  modport DUT(input data_in,rst,clk, output data_out);
  modport TB(clocking cb,output rst);
  


endinterface
