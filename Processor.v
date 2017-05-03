module Processor();
reg [6:0] address;
wire [31:0] instruction, instructionO, Offset_Extended, aluReg2, read_data_1, read_data_2, write_data,
            ReadReg1O, ReadReg2O, OffsetO, out, AluOut, readData,AluResO,WriteDataO,MemoryWordReadO;
wire [15:0] Offset;
wire [6:0] PC, PCO, incAddress, incAddress0, BranchAddress, BranchAddressO;
wire [5:0] funct;
wire [4:0] write_reg, Shamt, Rs, Rt, Rd, EX, read_reg_1, read_reg_2,
           ShamtO, RtO, RdO,RdOO,DESTINATION;
wire [2:0] MEM, MEMO, ALUop, ALUcontrol;
wire [1:0] WB, WBO, WBOO;
wire  zeroFlag, zeroFlagO,MemWrite,MemRead,Branch;
wire RegDst;
wire ALUSrc;
wire MemToReg;
reg PCsrc;
wire regWrite;
reg clk;

assign incAddress= address+4;
// clock
initial
begin
PCsrc=0;
clk = 0;
address=0;
forever
	begin
		#10 clk = ~clk;
	end
end

initial
begin
    #200 $finish;
end



// PC
always @(posedge clk)
begin
address <= (PCsrc==1)? BranchAddressO: incAddress;
end

// IF
instructionMemory IM(instruction, address);
IF_ID IFID(instructionO,incAddress0,instruction,incAddress,clk);



//ID
assign Shamt = {instructionO[10],instructionO[9],instructionO[8],instructionO[7],instructionO[6]};
assign Offset = {instructionO[15],instructionO[14],instructionO[13],instructionO[12],instructionO[11],
            instructionO[10],instructionO[9],instructionO[8],instructionO[7],instructionO[6],
            instructionO[5],instructionO[4],instructionO[3],instructionO[2],instructionO[1],instructionO[0]};
            
assign Rs = {instructionO[25],instructionO[24],instructionO[23],instructionO[22],instructionO[21]};
assign Rt = {instructionO[20],instructionO[19],instructionO[18],instructionO[17],instructionO[16]};
assign Rd = {instructionO[15],instructionO[14],instructionO[13],instructionO[12],instructionO[11]};

assign Offset_Extended = (Offset[15]==1)? {16'hffff,Offset}: {16'h0000,Offset};
assign BranchAddress= PCO+OffsetO*4;

assign funct = {OffsetO[5],OffsetO[4],OffsetO[3],OffsetO[2],OffsetO[1],OffsetO[0]};


registerFile RF(Rs, Rt, write_reg, write_data, regWrite, read_data_1, read_data_2, clk);
controlUnit CUcontrolUnit(instructionO, EX, MEM, WB,Shamt,bne);

ID_EX IDEX(PCO,ReadReg1O,ReadReg2O,ShamtO,OffsetO,RtO,RdO,WBO,MEMO,ALUop,ALUSrc,RegDst,
        incAddress0,bneO,clk,read_data_1,read_data_2,Shamt,Offset_Extended,Rt,Rd,WB,MEM,EX,bne);



//EX
assign aluReg2 = (ALUSrc==1)? OffsetO:ReadReg2O;
ALU alu(zeroFlag,out,ReadReg1O,aluReg2,ALUcontrol,ShamtO);
ALUControl aluc(ALUcontrol,ALUop,funct);

assign DESTINATION = (RegDst==1)? RdO:RtO;
EX_MEM exMem(WriteDataO,AluOut,BranchAddressO,RdOO,WBOO,MemRead, MemWrite, Branch,zeroFlagO,bneOO,clk,
            ReadReg2O,out,BranchAddress,DESTINATION,WBO,MEMO,zeroFlag,bneO);


always@(zeroFlagO,Branch)
begin
    PCsrc = (zeroFlagO & Branch) || (bneOO & !zeroFlagO);
end
//MEM
DataMemory DM(readData,AluOut,WriteDataO,MemWrite,MemRead,clk);





//WB
MEM_WEB MW(MemoryWordReadO,AluResO,write_reg,MemToReg,regWrite,clk,readData,AluOut,RdOO,WBOO);
assign write_data = (MemToReg==0)? MemoryWordReadO:AluResO;

endmodule