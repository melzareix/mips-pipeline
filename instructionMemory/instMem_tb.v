`include "inst_mem.v"
module tb;

reg [31:0] address;
wire [31:0] instruction;

instructionMemory im(address, instruction);


initial
	begin
		$monitor("%t %b %b", $time, address, instruction);
		# 5 address <= 32'b0;
		# 5 $finish;
	end

endmodule