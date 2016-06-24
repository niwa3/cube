//register.v
module register(src0, src1, dst, we, data, data0, data1, rst_n, clk);
	input wire [3:0] src0, src1, dst;
	input wire[7:0] data;
	input wire we, rst_n, clk;
	output wire [7:0] data1,data0;
	reg [7:0] regfile[16:0];
	wire [7:0] regf0,regf1,regf3,regf5,regf7, regf8, regf9,regf10;
	always@(posedge clk ) begin
		if(!rst_n) begin
			regfile[0] <= 0;
			regfile[1] <= 0;
			regfile[2] <= 0;
			regfile[3] <= 0;
			regfile[4] <= 0;
			regfile[5] <= 0;
			regfile[6] <= 0;
			regfile[7] <= 0;
			regfile[8] <= 0;
			regfile[9] <= 1;
			regfile[10] <= 0;
			regfile[11] <= 0;
			regfile[12] <= 0;
			regfile[13] <= 20;
			regfile[14] <= 0;
			regfile[15] <= 0;
			regfile[16] <= 0;
		end else begin
			if(we) begin
				regfile[dst] <= data;
			end else begin
//				regfile[dst] <= regfile[dst];
				regfile[dst] = regfile[dst];
			end
		end
	end
	assign data0 = regfile[src0];
	assign data1 = regfile[src1];
	
	assign regf0=regfile[0];
	assign regf1=regfile[1];
	assign regf3=regfile[3];
	assign regf5=regfile[5];
	assign regf7=regfile[7];
	assign regf8=regfile[8];
	assign regf9=regfile[9];
	assign regf10=regfile[10];
endmodule
