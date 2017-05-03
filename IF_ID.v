module IF_ID(InstructionO,PCO,Instruction,PC,clk);
output reg [31:0] InstructionO;
output reg [6:0] PCO;
input   [31:0] Instruction;
input [6:0] PC;
input clk ;

initial
begin
	InstructionO=32'b0;
	PCO= 7'b0;
end

always@(posedge clk)
    begin
      InstructionO = Instruction ;
      PCO = PC ;
    end

endmodule
 
