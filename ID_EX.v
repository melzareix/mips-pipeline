module ID_EX(PCO,ReadReg1O,ReadReg2O,ShamtO,OffsetO,RtO,RdO,WBO,MEMO,ALUop,ALUSrc,RegDst,PC,bneO,clk,
    ReadReg1,ReadReg2,Shamt,Offset,Rt,Rd,WB,MEM,EX,bne);

// outputs 
output reg [31:0] ReadReg1O,ReadReg2O,OffsetO;
output reg [6:0] PCO;
output reg [4:0] RtO,RdO;
output reg [1:0] WBO;
output reg [2:0] MEMO;
output reg [2:0] ALUop;
output reg ALUSrc, RegDst;
output reg [4:0] ShamtO;
output reg bneO;

// inputs 
input clk ;
input [31:0] ReadReg1,ReadReg2,Offset;
input [6:0] PC;
input [4:0] Rt,Rd;
input [1:0] WB;
input [2:0]MEM;
input [4:0] EX;
input  [4:0] Shamt;
input bne;

initial
begin
    ReadReg1O=32'b0;
    ReadReg2O=32'b0;
    OffsetO=32'b0;
    PCO=7'b0;
    RtO=5'b0;
    RdO=5'b0;
    WBO=2'b0;
    MEMO=3'b0;
    ALUop=3'b0;
    ALUSrc=0;
    RegDst=0;
    ShamtO=5'b0;
    bneO=0;
end

// On clock
always@(posedge clk)
    begin
        ReadReg1O <= ReadReg1;
        ReadReg2O <= ReadReg2;
        OffsetO <= Offset;
        PCO <= PC;
        RtO<= Rt;
        RdO<= Rd;
        WBO<= WB;
        MEMO<= MEM;
        ALUSrc<= EX[0];
        ALUop<= {EX[3],EX[2],EX[1]};
        RegDst<= EX[4];
        ShamtO<= Shamt;
        bneO<=bne;
    end


endmodule
 
