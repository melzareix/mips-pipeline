module controlUnit(instruction, EX, MEM, WB,Shamt,bne);

input [31:0] instruction;
reg [5:0] opcode;
output reg [4:0] EX;
output reg [2:0] MEM;
output reg [1:0] WB;
output reg [4:0] Shamt;
output reg bne;
reg ALUSrc=0, RegDst=0, Branch=0, MemRead=0, MemWrite=0, MemtoReg=0, RegWrite=0;
reg [2:0] ALUOp=3'b0;

initial
begin
	opcode= 6'b0;
	EX= 5'b0;
	MEM= 3'b0;
	WB= 2'b0;
	Shamt= 5'b0;
	bne=0;
end


always@(instruction)
begin

 	opcode = {instruction[31],instruction[30],instruction[29],instruction[28],instruction[27],instruction[26]};
	case (opcode)
	6'b000000:// R
		begin
		ALUOp = 3'b010;
		RegDst = 1'b1;
		RegWrite = 1'b1;
		ALUSrc = 1'b0;
		MemWrite = 1'b0;
		MemRead = 1'b0;
		MemtoReg = 1'b1;// changed
		Branch = 1'b0;
		bne=0;
	end
	
	6'b001000: // ADDI
	begin
		ALUOp = 3'b011;
		RegDst = 1'b0; //changed
		RegWrite = 1'b1;
		ALUSrc = 1'b1; // changed
		MemWrite = 1'b0;
		MemRead = 1'b0;
		MemtoReg = 1'b1;// changed
		Branch = 1'b0;
		bne=0;
	end
	
	6'b001100: // ANDI
	begin
		ALUOp = 3'b100;
		RegDst = 1'b0;// changed
		RegWrite = 1'b1;
		ALUSrc = 1'b1; // changed
		MemWrite = 1'b0;
		MemRead = 1'b0;
		MemtoReg = 1'b1;// changed
		Branch = 1'b0;
		bne=0;
	end
	
	6'b001101: //ORI
	begin
		ALUOp = 3'b101;
		RegDst = 1'b0;// changed
		RegWrite = 1'b1;
		ALUSrc = 1'b1; //changed
		MemWrite = 1'b0;
		MemRead = 1'b0;
		MemtoReg = 1'b1;// changed
		Branch = 1'b0;
		bne=0;
	end
	
	

	6'b100011: // LW
	begin
		ALUOp = 3'b000;
		RegDst = 1'b0;// changed
		RegWrite = 1'b1;
		ALUSrc = 1'b1; // changed
		MemWrite = 1'b0;
		MemRead = 1'b1;
		MemtoReg = 1'b0;// changed
		Branch = 1'b0;
		bne=0;
	end

	6'b101011: // SW
	begin
		ALUOp = 3'b000;
		RegDst = 1'b0;
		RegWrite = 1'b0;
		ALUSrc = 1'b1;
		MemWrite = 1'b1;
		MemRead = 1'b0;
		MemtoReg = 1'b0;
		Branch = 1'b0;
		bne=0;
	end

	6'b000100: // BEQ
	begin
		ALUOp = 3'b001;
		RegDst = 1'b0;
		RegWrite = 1'b0;
		ALUSrc = 1'b0;
		MemWrite = 1'b0;
		MemRead = 1'b0;
		MemtoReg = 1'b0;
		Branch = 1'b1;
		bne=0;
	end

		6'b000101: //BNE
	begin
		ALUOp = 3'b001;
		RegDst = 1'b0;
		RegWrite = 1'b0;
		ALUSrc = 1'b0;
		MemWrite = 1'b0;
		MemRead = 1'b0;
		MemtoReg = 1'b0;
		Branch = 1'b0;
		bne=1;
	end
	endcase
	 WB =  {RegWrite,MemtoReg};
 	MEM =  {Branch,MemRead,MemWrite};
 	EX =  {RegDst,ALUOp,ALUSrc};
	 Shamt = {instruction[10],instruction[9],instruction[8],instruction[7],instruction[6]};



end
endmodule