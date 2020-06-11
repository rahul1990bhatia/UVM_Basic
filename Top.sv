`include uvm_macros.svh
module top();
  
  import uvm_pkg::*;
  
  bit clk;
  intf intf_inst(clk);
  DUT_wrapper dut_inst(.intf1(intf_inst.DUT));
  initial forever #10 clk = !clk;
  
  default clocking cb @(posedge clk);
  endclocking
  
  
  initial
    begin
      `uvm_info("TB","Hello world", UVM_LOW);
      $dumpfile("dump.vcd"); 
      $dumpvars(0,top);
      #500ns $finish;
    end
  
  initial
    begin
      packet p;
      for (int i =0; i < 10; i++ )
        begin
          p=new();
          p.randomize();
          //repeat(5) @(intf_inst.cb);
          ##5;
          intf_inst.data_in = p.data;
        end
    end
  
endmodule
