
module DataMemory(readData,wordAddress,writeData,MemWrite,MemRead,clk);
 
input MemWrite,MemRead;
input [31:0] wordAddress; // too large for memory check if it works 
input [31:0] writeData;
input clk ;
output reg [31:0]readData;
reg [7:0] memory[511:0];
reg [8:0] i;

initial
begin
	memory[4] = 8'h0f;
	memory[5] = 8'h0a;
	memory[6] = 8'h0f;
	memory[7] = 8'h07;

	memory[8] = 8'h00;
	memory[9] = 8'h11;
	memory[10] = 8'hff;
	memory[11] = 8'h01;

end

 always@(negedge clk)
 begin
		if(MemWrite)
		begin

		  	memory[wordAddress] = writeData[31:24];
		 	memory[wordAddress+1] = writeData[23:16];
		  	memory[wordAddress+2] = writeData[15:8];
		  	memory[wordAddress+3] = writeData[7:0];

		end
 end
   
   
always@(wordAddress)
begin
if(MemRead)
begin
 readData = {memory[wordAddress],memory[wordAddress+1],memory[wordAddress+2],memory[wordAddress+3]};
end
 end

 initial
 begin
 	#191 begin
	 	for(i=0; i<128; i=i+1)
	 	begin
	 		$display("Mem[%d]: %b \n",i,{memory[i*4],memory[i*4+1],memory[i*4+2],memory[i*4+3]});
	 	end
 	end
 end

endmodule

