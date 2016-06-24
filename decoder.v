//decoder.v
module decoder(pcin, pcwe, dst, regwe, src0, src1, sel1, sel2, data, aluop, zf, memwe, op);
	input wire [15:0] op;
	input wire zf;
	output reg [7:0] pcin;
	output reg pcwe;
	output reg [3:0] src0, src1, dst;
	output reg sel1, sel2;
	output reg [7:0] data;
	output reg [3:0] aluop;
	output reg memwe;
	output reg regwe;
`include "def.h"

always @(op) begin
//synopsys parallel_case full_case
	case (op[15:12])
	AND : begin
		aluop <= op[15:12];//alu$B$KL?Na$rAw$k(B
		dst <= op[11:8];//register$B$N3JG<@h%"%I%l%9(B
		src1 <= op[7:4];//$B%l%8%9%?$N%"%I%l%9(B
		src0 <= op[3:0];//$B%l%8%9%?$N%"%I%l%9(B
		pcin <= 0;//$B%W%m%0%i%`%+%&%s%?$KF~NO$9$kCM(B
		pcwe <= 0;//$B%W%m%0%i%`%+%&%s%?$K=q$-9~$_$r5v2D$9$k$+(B
		regwe <= 1;//$B%l%8%9%?$K=q$-9~$_$r5v2D$9$k$+(B
		sel1 <= 0;//$B%;%k$NA*Br(B
		sel2 <= 1;//$B%;%k$NA*Br(B
		data <= 0;//$BD>@\F~NO$7$?CM(B
		memwe <= 0;//$B%a%b%j$K=q$-9~$_$r5v2D$9$k$+(B
	end

	OR : begin
		aluop <= op[15:12];
		dst <= op[11:8];
		src1 <= op[7:4];
		src0 <= op[3:0];
		pcin <= 0;
		pcwe <= 0;
		regwe <= 1;
		sel1 <= 0;
		sel2 <= 1;
		data <= 0;
		memwe <= 0;
	end

	ADD : begin
		aluop <= op[15:12];
		dst <= op[11:8];
		src1 <= op[7:4];
		src0 <= op[3:0];
		pcin <= 0;
		pcwe <= 0;
		regwe <= 1;
		sel1 <= 0;
		sel2 <= 1;
		data <= 0;
		memwe <= 0;
	end

	SUB : begin
		aluop <= op[15:12];
		dst <= op[11:8];
		src1 <= op[7:4];
		src0 <= op[3:0];
		pcin <= 0;
		pcwe <= 0;
		regwe <= 1;
		sel1 <= 0;
		sel2 <= 1;
		data <= 0;
		memwe <= 0;
	end

	INC : begin
		aluop <= op[15:12];
		dst <= op[11:8];
		src1 <= op[7:4];
		src0 <= op[3:0];
		pcin <= 0;
		pcwe <= 0;
		regwe <= 1;
		sel1 <= 0;
		sel2 <= 1;
		data <= 0;
		memwe <= 0;
	end

	DEC : begin
		aluop <= op[15:12];
		dst <= op[11:8];
		src1 <= op[7:4];
		src0 <= op[3:0];
		pcin <= 0;
		pcwe <= 0;
		regwe <= 1;
		sel1 <= 0;
		sel2 <= 1;
		data <= 0;
		memwe <= 0;
	end

	COMP : begin
		aluop <= op[15:12];
		dst <= 0;
		src1 <= op[7:4];
		src0 <= op[3:0];
		pcin <= 0;
		pcwe <= 0;
		regwe <= 0;
		sel1 <= 1;
		sel2 <= 0;
		data <= 0;
		memwe <= 0;
	end

	CHECK : begin
		aluop <= op[15:12];
		dst <= 0;
		src1 <= op[11:8];
		src0 <= 0;
		pcin <= 0;
		pcwe <= 0;
		regwe <= 0;
		sel1 <= 1;
		sel2 <= 0;
		data <= op[7:0];
		memwe <= 0;
	end

	LOAD : begin
		aluop <= op[15:12];
		dst <= op[11:8];
		src1 <= op[7:4];
		src0 <= 0;
		pcin <= 0;
		pcwe <= 0;
		regwe <= 1;
		sel1 <= 0;
		sel2 <= 0;
		data <= 0;
		memwe <= 0;
	end

	STORE : begin
		aluop <= op[15:12];
		dst <= 0;
		src1 <= op[7:4];
		src0 <= op[3:0];
		pcin <= 0;
		pcwe <= 0;
		regwe <= 0;
		sel1 <= 0;
		sel2 <= 0;
		data <= 0;
		memwe <= 1;
	end

	LI : begin
		aluop <= op[15:12];
		dst <= op[11:8];
		src1 <= 0;
		src0 <= 0;
		pcin <= 0;
		pcwe <= 0;
		regwe <= 1;
		sel1 <= 1;
		sel2 <= 1;
		data <= op[7:0];
		memwe <= 0;
	end

	JMP:begin
		aluop <= op[15:12];
		dst <= 0;
		src1 <= 0;
		src0 <= 0;
		pcin <= op[7:0];
		pcwe <= 1;
		regwe <= 0;
		sel1 <= 0;
		sel2 <= 0;
		data <= 0;
		memwe <= 0;
	end

	JNZ:begin//$B%U%i%0$,N)$C$F$$$l$P(BJMP
		aluop <= op[15:12];
		dst <= 0;
		src1 <= 0;
		src0 <= 0;
		pcin <= op[7:0];
		pcwe <= zf;
		regwe <= 0;
		sel1 <= 0;
		sel2 <= 0;
		data <= 0;
		memwe <= 0;
	end

	ZNJ:begin//JNZ$B$N5U(B
		aluop <= op[15:12];
		dst <= 0;
		src1 <= 0;
		src0 <= 0;
		pcin <= op[7:0];
		pcwe <= ~zf;
		regwe <= 0;
		sel1 <= 0;
		sel2 <= 0;
		data <= 0;
		memwe <= 0;
	end

	R_90 : begin//90$BEY2sE>(B
		aluop <= op[15:12];
		dst <= op[11:8];
		src1 <= op[7:4];
		src0 <= 0;
		pcin <= 0;
		pcwe <= 0;
		regwe <= 1;
		sel1 <= 1;
		sel2 <= 1;
		data <= {4'b0000,op[3:0]};//$B2sE>J}8~$r7h$a$k(B
		memwe <= 0;
	end

	R_180 : begin//180$BEY2sE>(B
		aluop <= op[15:12];
		dst <= op[11:8];
		src1 <= op[7:4];
		src0 <= 0;
		pcin <= 0;
		pcwe <= 0;
		regwe <= 1;
		sel1 <= 1;
		sel2 <= 1;
		data <= {4'b0000,op[3:0]};//$B2sE>J}8~$r7h$a$k(B
		memwe <= 0;
	end


	default:begin
		pcwe <= 0;
	end

	endcase
end
endmodule





