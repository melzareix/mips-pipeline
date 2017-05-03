module MEM_WEB(MemoryWordReadO,AluResO,RdO,MemToReg,RegWrite,clk,
	MemoryWordRead,AluRes,Rd,WB);

// outputs 
output reg [31:0] MemoryWordReadO,AluResO;
output reg [4:0] RdO;

output reg RegWrite;
output reg MemToReg ;

// inputs 
input clk ;
input   [31:0] MemoryWordRead,AluRes;
input [4:0] Rd;
input [1:0] WB;

initial
begin
	MemoryWordReadO=32'b0;
	AluResO=32'b0;
	RdO=5'b0;
	RegWrite=0;
	MemToReg=0;
end


// On clock
always@(posedge clk)
    begin
        MemoryWordReadO = MemoryWordRead;
        AluResO = AluRes;
        RdO = Rd;
        RegWrite = WB[1];
        MemToReg = WB[0];
    end

endmodule
// o 5-bits Rd field (writeReg)
// o 2-bits WB control signals
