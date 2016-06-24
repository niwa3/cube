//alu.v
module alu(in0, in1, op, zf, out);
	input wire [7:0] in0, in1;
	input wire [3:0] op;
	output reg zf;
	output reg [7:0] out;
`include "def.h"

always @(*) begin
	case(op)
		AND : begin //$B%"%s%I$r$H$k(B
			out<= in0 & in1;
			zf <= 0;
		end
		OR : begin //$B%*%"$r$H$k(B
			out <= in0 | in1;
			zf <= 0;
		end
		ADD : begin //$BB-$9(B
			out <= in0 + in1;
			zf <= 0;
		end
		SUB : begin //$B0z$/(B
			out <= (in0>in1) ? in0 - in1 : in1 - in0;
			zf <= 0;
		end
		INC : begin //$B%$%s%/%j%a%s%H$9$k(B
			out <= in0 + 1;
			zf <= 0;
		end
		DEC : begin //$B%G%/%j%a%s%H$9$k(B
			out <= in0 - 1;
			zf <= 0;
		end
		COMP : begin //$B%3%s%Z%"$9$k(B
			zf <= (in0 == in1) ? 1:0;
		end
		CHECK : begin //$B%A%'%C%/$9$k(B
			zf <=(in0 == in1) ? 1:0;
		end
		LOAD : begin //$B%m!<%I$9$k(B
			out <= in0;
			zf <= 0;
		end
		STORE:begin //$B%9%H%"$9$k(B
			out <= in0;
			zf <= 0;
		end
		LI : begin //$B%l%8%9%?$KF~NO$7$?CM$rJ]B8(B
			out <= in0;
			zf <= 0;
		end
		R_90:begin //90$BEY2sE>(B
			if(in0==8'b00000000)begin
				out <= {in1[7:2],(in1[1:0]==2'b10)?in1[1:0]:(in1[1:0]~^2'b00)};
			end else if(in0==8'b00000001)begin
				out <= {in1[7:2],(in1[1:0]==2'b11)?in1[1:0]:(in1[1:0]~^2'b01)};
			end else if(in0==8'b00000010)begin
				out <= {in1[7:2],(in1[1:0]==2'b00)?in1[1:0]:(in1[1:0]~^2'b10)};
			end else begin
				out<=in1;
			end
		end
		R_180:begin //180$BEY2sE>(B
			if(in0==8'b00000000)begin
				out <= in1;
			end else if(in0==8'b00000001)begin
				out <= in1;
			end else if(in0==8'b00000010)begin
				out <= in1;
			end else begin
				out<=in1;
			end
		end

		default:begin
			out<=out;
		end

endcase
end
endmodule
