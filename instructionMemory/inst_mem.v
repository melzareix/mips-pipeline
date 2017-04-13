module instructionMemory(address, instruction);

input [31:0] address;
output[31:0] instruction;
wire[7:0] instruction_memory[511:0];

assign instruction = {instruction_memory[address], instruction_memory[address + 1],
					 instruction_memory[address + 2], instruction_memory[address + 3]};

/*
	Dummy Memory Data.
*/
  
assign instruction_memory[0] = 8'b10000000; //sub R8,R9,R10 
assign instruction_memory[1] = 8'b10000000; //sub R8,R9,R10 
assign instruction_memory[2] = 8'b10000000; //addi R10, R9, 12
assign instruction_memory[3] = 8'b10011000; //mult R0,R8,R9


endmodule