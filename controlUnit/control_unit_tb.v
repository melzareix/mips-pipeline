`include "control_unit.v"
module tb;

reg [5:0] opcode;
wire RegDst, Branch, MemRead, MemtoReg, MemWrite, ALUSrc, RegWrite;
wire [1:0] ALUOp;

controlUnit cu(opcode, RegDst, Branch, MemRead, MemtoReg, ALUOp, MemWrite, ALUSrc, RegWrite);


initial
	begin
		$monitor("%t %h %h %h %h %h %h %h %h %h", $time, opcode, RegDst, Branch, MemRead, MemtoReg, ALUOp, MemWrite, ALUSrc, RegWrite);
		# 5 opcode <= 6'b001000;
		# 5 opcode <= 6'b100011;
		# 5 opcode <= 6'b000100;
		# 5 $finish;
	end

endmodule