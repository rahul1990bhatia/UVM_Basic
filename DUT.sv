module DUT(clk,rst,data_in,data_out);

input clk,rst;
input [31:0] data_in;
output reg [31:0] data_out;



always @ (posedge clk or negedge rst)begin
if(!rst)begin
	data_out <= 0;
end else begin
	data_out <= data_in & 32'hBABEBABE;
end
end

endmodule

module DUT_wrapper(intf intf1);

	DUT dut1(.clk(intf1.clk),.rst(intf1.rst),.data_in(intf1.data_in),.data_out(intf1.data_out));

endmodule

