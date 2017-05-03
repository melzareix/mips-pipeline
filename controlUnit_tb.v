module tb;

reg [31:0] instruction;
wire RegDst, Branch, MemRead, MemtoReg, MemWrite, ALUSrc, RegWrite;
wire [2:0] ALUOp;
wire [4:0] Shamt;
// controlUnit cu(instruction, RegDst, Branch, MemRead, MemtoReg, ALUOp, MemWrite, ALUSrc, RegWrite,Shamt);


// initial
// 	begin
// 		$monitor("%t %h %h %h %h %h %h %h %h %h", $time, opcode, RegDst, Branch, MemRead, MemtoReg, ALUOp, MemWrite, ALUSrc, RegWrite);
// 		# 5 opcode <= 6'b001000;
// 		# 5 opcode <= 6'b100011;
// 		# 5 opcode <= 6'b000100;
// 		# 10000 $finish;
// 	end

endmodule