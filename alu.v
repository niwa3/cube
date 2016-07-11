//alu.v
module alu(in0, in1, op, zf, out);
	input wire [7:0] in0, in1;
	input wire [3:0] op;
	output reg zf;
	output reg [7:0] out;
`include "def.h"

always @(*) begin
	case(op)
		AND : begin //アンドをとる
			out<= in0 & in1;
			zf <= 0;
		end
		OR : begin //オアをとる
			out <= in0 | in1;
			zf <= 0;
		end
		ADD : begin //足す
			out <= in0 + in1;
			zf <= 0;
		end
		SUB : begin //引く
			out <= (in0>in1) ? in0 - in1 : in1 - in0;
			zf <= 0;
		end
		INC : begin //インクリメントする
			out <= in0 + 1;
			zf <= 0;
		end
		DEC : begin //デクリメントする
			out <= in0 - 1;
			zf <= 0;
		end
		COMP : begin //コンペアする
			zf <= (in0 == in1) ? 1:0;
		end
		CHECK : begin //チェックする
			zf <=(in0 == in1) ? 1:0;
		end
		LOAD : begin //ロードする
			out <= in0;
			zf <= 0;
		end
		STORE:begin //ストアする
			out <= in0;
			zf <= 0;
		end
		LI : begin //レジスタに入力した値を保存
			out <= in0;
			zf <= 0;
		end
		R_90:begin //90度回転方向は自分で指定
			if(in0==8'b00000000)begin//x
				out <= {in1[7:2],(in1[1:0]==2'b10)?in1[1:0]:(in1[1:0]~^2'b00)};
			end else if(in0==8'b00000001)begin//y
				out <= {in1[7:2],(in1[1:0]==2'b11)?in1[1:0]:(in1[1:0]~^2'b01)};
			end else if(in0==8'b00000010)begin//z
				out <= {in1[7:2],(in1[1:0]==2'b00)?in1[1:0]:(in1[1:0]~^2'b10)};
			end else begin
				out<=in1;
			end
		end
		R_180:begin //180度回転
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
