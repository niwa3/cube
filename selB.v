//selB.v
module selB(in0, in1, sel, out);
	input[7:0] in0, in1;
	input sel;
	output reg [7:0] out;

	always@(in0 or in1 or sel)begin
		out <= (sel)? in0:in1;
	end
endmodule
