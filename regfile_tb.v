
module tb3;
reg clk;
reg [4:0] read_reg_1, read_reg_2, write_reg;
reg [31:0] write_data;
reg regWrite;
wire [31:0] read_data_1, read_data_2;

registerFile r(read_reg_1, read_reg_2, write_reg, write_data, regWrite, read_data_1, read_data_2, clk);

// initial begin clk = 0;

// forever
// 	begin
// 		#5 clk = ~clk;
// 	end
// end 

// initial
// 	begin
// 		$monitor("%t %b %b %b", $time, read_data_1, read_data_2,clk);
// 		# 5 read_reg_1 <= 5'b0;
// 		# 5 write_reg <= 5'b01; regWrite <= 1; write_data <= 32'd55;
// 		# 5 read_reg_2 <= 5'b01;
// 		# 1000000 $finish;
// 	end
endmodule