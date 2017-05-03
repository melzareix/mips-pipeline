module ALU(zeroFlag,out,reg1,reg2,ALUcontrol,shamt);
 
input [31:0] reg1,reg2;
input [2:0] ALUcontrol; 
input [4:0] shamt;

output reg [31:0] out;
output reg zeroFlag;
 
 
always @ (reg1, reg2, ALUcontrol)
begin
    case (ALUcontrol)
        0: out = reg1 + reg2;
        1: out = reg1 - reg2;
        2: out = reg1 & reg2;
        3: out = reg1 | reg2;
        4: out = reg2 << shamt;
        5: out = reg2 >> shamt;
        6: out = reg1<reg2? 32'b11111111111111111111111111111111:32'b0;
    endcase
end
 
always @ (out)
begin
    zeroFlag = (out == 0)? 1:0;
end
 
endmodule
 
