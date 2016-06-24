//pc.v
module pc(pcin, pcout, we, rst_n, clk);
	input wire [7:0] pcin;
	input wire we,rst_n,clk; //we=write enable
	output reg [7:0] pcout;
	always@(posedge clk) begin
		if(!rst_n) begin
			pcout<=6'b000000;
		end else begin
			if(we) begin
				pcout<=pcin;
			end else begin
				pcout<=pcout+1;
			end
		end
	end

endmodule
