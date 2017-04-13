module controlUnit(opcode, RegDst, Branch, MemRead, MemtoReg, ALUOp, MemWrite, ALUSrc, RegWrite);

input [5:0] opcode;
output reg RegDst, Branch, MemRead, MemtoReg, MemWrite, ALUSrc, RegWrite;
output reg [1:0] ALUOp;

always@(opcode)
begin
	case (opcode)
	6'b000000, 6'b001000, 6'b001100, 6'b001101: // R, ADDI, ANDI, ORI
	begin
		ALUOp <= 2'b10;
		RegDst <= 1'b1;
		RegWrite <= 1'b1;
		ALUSrc <= 1'b0;
		MemWrite <= 1'b0;
		MemRead <= 1'b0;
		MemtoReg <= 1'b0;
		Branch <= 1'b0;
	end

	6'b100011: // LW
	begin
		ALUOp <= 2'b00;
		RegDst <= 1'b0;
		RegWrite <= 1'b1;
		ALUSrc <= 1'b1;
		MemWrite <= 1'b0;
		MemRead <= 1'b1;
		MemtoReg <= 1'b1;
		Branch <= 1'b0;
	end

	6'b101011: // SW
	begin
		ALUOp <= 2'b00;
		RegDst <= 1'b0;
		RegWrite <= 1'b0;
		ALUSrc <= 1'b1;
		ALUOp <= 2'b10;
		MemWrite <= 1'b1;
		MemRead <= 1'b0;
		MemtoReg <= 1'b0;
		Branch <= 1'b0;
	end

	6'b000100, 6'b000101: // BEQ, BNE
	begin
		ALUOp <= 2'b01;
		RegDst <= 1'b0;
		RegWrite <= 1'b0;
		ALUSrc <= 1'b0;
		ALUOp <= 2'b10;
		MemWrite <= 1'b0;
		MemRead <= 1'b0;
		MemtoReg <= 1'b0;
		Branch <= 1'b1;
	end
	endcase
end
endmodule
