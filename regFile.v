module registerFile(read_reg_1, read_reg_2, write_reg, write_data, regWrite, read_data_1, read_data_2, clk);
input clk;
input [4:0] read_reg_1, read_reg_2, write_reg;
input [31:0] write_data;
input regWrite; // Control signal
output reg[31:0] read_data_1, read_data_2;

reg[31:0] registers[31:0];
reg [5:0] i;

initial
begin
	registers[0] = 32'b0;
	registers[15] = 32'd5;
	registers[20] = 32'd3;
end

always @(read_reg_1,read_reg_2)
begin
	read_data_1 = (read_reg_1==0)? 32'b0 : registers[read_reg_1];
	read_data_2 = (read_reg_2==0)? 32'b0 : registers[read_reg_2];	
end

always @(negedge clk)
begin
	if (regWrite) 
		begin
			registers[write_reg] = write_data;
			$display("-> %d %d ", write_reg, write_data);
		end	
end

 initial
 begin
 	#191 begin
	 	for(i=0; i<32; i=i+1)
	 	begin
	 		$display("RegFile[%d]: %b \n",i,registers[i]);
	 	end
 	end
 end
endmodule