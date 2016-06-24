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
		aluop <= op[15:12];//aluに命令を送る
		dst <= op[11:8];//registerの格納先アドレス
		src1 <= op[7:4];//レジスタのアドレス
		src0 <= op[3:0];//レジスタのアドレス
		pcin <= 0;//プログラムカウンタに入力する値
		pcwe <= 0;//プログラムカウンタに書き込みを許可するか
		regwe <= 1;//レジスタに書き込みを許可するか
		sel1 <= 0;//セルの選択
		sel2 <= 1;//セルの選択
		data <= 0;//直接入力した値
		memwe <= 0;//メモリに書き込みを許可するか
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

	JNZ:begin//フラグが立っていればJMP
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

	ZNJ:begin//JNZの逆
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

	R_90 : begin//90度回転
		aluop <= op[15:12];
		dst <= op[11:8];
		src1 <= op[7:4];
		src0 <= 0;
		pcin <= 0;
		pcwe <= 0;
		regwe <= 1;
		sel1 <= 1;
		sel2 <= 1;
		data <= {4'b0000,op[3:0]};//回転方向を決める
		memwe <= 0;
	end

	R_180 : begin//180度回転
		aluop <= op[15:12];
		dst <= op[11:8];
		src1 <= op[7:4];
		src0 <= 0;
		pcin <= 0;
		pcwe <= 0;
		regwe <= 1;
		sel1 <= 1;
		sel2 <= 1;
		data <= {4'b0000,op[3:0]};//回転方向を決める
		memwe <= 0;
	end


	default:begin
		pcwe <= 0;
	end

	endcase
end
endmodule





