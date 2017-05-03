module instructionMemory(instruction, address);

input [6:0] address;
output reg [31:0] instruction;
reg[7:0] instruction_memory[511:0];

wire [6:0]wordAddress;
assign wordAddress = address;
                           //𝑎𝑛𝑑 $𝑡1, $𝑡2, $𝑡3 

initial
begin
//Arithmetic:

	//add $9, $15 , $20 (working)
	// instruction_memory[0] = 8'b000000_01;  
	// instruction_memory[1] = 8'b111_10100;     
	// instruction_memory[2] = 8'b01001000;
	// instruction_memory[3] = 8'b00_100000;

	//sub $9, $15 , $20 (working)
	// instruction_memory[0] = 8'b000000_01;  
	// instruction_memory[1] = 8'b111_10100;     
	// instruction_memory[2] = 8'b01001000;
	// instruction_memory[3] = 8'b00_100010;

	// addi $9, $0 ,9 (working)
	// instruction_memory[0] = 8'b00100000;  
	// instruction_memory[1] = 8'b00001001;     
	// instruction_memory[2] = 8'b00000000;
	// instruction_memory[3] = 8'b00001001;

//Load/Store:

	//lw $22, 1($20)  (working)
	// instruction_memory[0] = 8'b100011_10;
	// instruction_memory[1] = 8'b100_10110;
	// instruction_memory[2] = 8'b00000000;
	// instruction_memory[3] = 8'b00000001;

 	//sw $15, 0($0)
 	// instruction_memory[0] = 8'b101011_00;
 	// instruction_memory[1] = 8'b000_01111;
 	// instruction_memory[2] = 8'b00000000;
 	// instruction_memory[3] = 8'b00001100;

//Logic:

	//and $9, $15 , $20 (working)
	// instruction_memory[0] = 8'b000000_01;  
	// instruction_memory[1] = 8'b111_10100;     
	// instruction_memory[2] = 8'b01001000;
	// instruction_memory[3] = 8'b00_100100;

	//or $9, $15 , $20 (working)
	// instruction_memory[0] = 8'b000000_01;  
	// instruction_memory[1] = 8'b111_10100;     
	// instruction_memory[2] = 8'b01001000;
	// instruction_memory[3] = 8'b00_100101;

	//sll $9, $15 , 2 (working)
	// instruction_memory[0] = 8'b000000_00;
	// instruction_memory[1] = 8'b000_01111;  
	// instruction_memory[2] = 8'b01001_000;
	// instruction_memory[3] = 8'b10_000000;


	//srl $9, $15 , 1 (working)
	instruction_memory[0] = 8'b000000_00;
	instruction_memory[1] = 8'b000_01111;  
	instruction_memory[2] = 8'b01001_000;
	instruction_memory[3] = 8'b01_000010;

	// andi $10, $0, 10 (working)
	instruction_memory[4] = 8'b00110000;  
	instruction_memory[5] = 8'b00001010;     
	instruction_memory[6] = 8'b00000000;
	instruction_memory[7] = 8'b00001010;

	// ori $5 , $0, 7 (working)
	instruction_memory[8] = 8'b00110100;
	instruction_memory[9] = 8'b00000101;     
	instruction_memory[10] = 8'b00000000;
	instruction_memory[11] = 8'b00000111;

//Control Flow:

	//beq $20, $15 , 8 (working)
	// instruction_memory[0] = 8'b000100_10;
	// instruction_memory[1] = 8'b100_01111;
	// instruction_memory[2] = 8'b00000000;
	// instruction_memory[3] = 8'b00001000;

	//beq $15, $15 , 8 (working)
	// instruction_memory[0] = 8'b000100_01;
	// instruction_memory[1] = 8'b111_01111;
	// instruction_memory[2] = 8'b00000000;
	// instruction_memory[3] = 8'b00000100;

	//bne $20, $15 , 8 (working)
	// instruction_memory[0] = 8'b000101_10;
	// instruction_memory[1] = 8'b100_01111;
	// instruction_memory[2] = 8'b00000000;
	// instruction_memory[3] = 8'b00001000;

// Comparison:

	//slt $9, $15 , $20 (working)
	// instruction_memory[0] = 8'b000000_01;
	// instruction_memory[1] = 8'b111_10100;  
	// instruction_memory[2] = 8'b01001_000;
	// instruction_memory[3] = 8'b00_101010;

	//slt $9, $20 , $15 (working)
	// instruction_memory[0] = 8'b000000_10;
	// instruction_memory[1] = 8'b100_01111;  
	// instruction_memory[2] = 8'b01001_000;
	// instruction_memory[3] = 8'b00_101010;
end

always@(address)
begin
instruction = {instruction_memory[wordAddress], instruction_memory[wordAddress + 1],
					 instruction_memory[wordAddress + 2], instruction_memory[wordAddress + 3]};
end


endmodule
