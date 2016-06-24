//imem.v
//命令手順
module imem(pc, op);
	input wire [7:0] pc;
	output reg [15:0] op;
`include"def.h"
parameter[7:0]
	AA = 8'b00000000,
	BB = 8'b00000100,
	CC = 8'b00001000,
	DD = 8'b00001100,
	EE = 8'b00010000,
	FF = 8'b00010100,
	GG = 8'b00011000,
	HH = 8'b00011100;

always @(pc) begin
	case(pc)
	//初期値を手動で入力
	0:begin
		op[15:12] <= LI;
		op[11:8] <= 0;
		op[7:0] <= 8'b00000;
//		op[7:0] <= AA;
	end

	1:begin
		op[15:12] <= LI;
		op[11:8] <= 1;
		op[7:0] <= 8'b11110;
//		op[7:0] <= 8'b00001111;
	end

	2:begin
		op[15:12] <= LI;
		op[11:8] <= 2;
		op[7:0] <= 8'b10010;
//		op[7:0] <= CC;
	end

	3:begin
		op[15:12] <= LI;
		op[11:8] <= 3;
		op[7:0] <= 8'b01111;
//		op[7:0] <= 8'b00011111;
	end

	4:begin
		op[15:12] <= LI;
		op[11:8] <= 4;
		op[7:0] <= 8'b11000;
//		op[7:0] <= EE;
	end

	5:begin
		op[15:12] <= LI;
		op[11:8] <= 5;
		op[7:0] <= 8'b00100;
//		op[7:0] <= 8'b00000111;
	end

	6:begin
		op[15:12] <= LI;
		op[11:8] <= 6;
		op[7:0] <= 8'b01010;
//		op[7:0] <= GG;
	end

	7:begin
		op[15:12] <= LI;
		op[11:8] <= 7;
		op[7:0] <= 8'b10110;
//		op[7:0] <= 8'b00010111;
	end

	8:begin
		op[15:12] <= JMP;
		op[7:0] <=92;
	end

//X_90+
	9:begin
		op[15:12] <= AND;
		op[11:8] <= 8;
		op[7:4] <= 1;
		op[3:0] <= 1;
	end

	10:begin
		op[15:12] <= R_90;
		op[11:8] <= 1;
		op[7:4] <= 5;
		op[3:0] <= 4'b0000;
	end

	11:begin
		op[15:12] <= R_90;
		op[11:8] <= 5;
		op[7:4] <= 7;
		op[3:0] <= 4'b0000;
	end

	12:begin
		op[15:12] <= R_90;
		op[11:8] <= 7;
		op[7:4] <= 3;
		op[3:0] <= 4'b0000;
	end

	13:begin
		op[15:12] <= R_90;
		op[11:8] <= 3;
		op[7:4] <= 8;
		op[3:0] <= 4'b0000;
	end

	14:begin
		op[15:12] <= STORE;
		op[7:4] <= 9;
		op[3:0] <= 10;
	end


	15:begin
		op[15:12] <= JMP;
		op[7:0] <= 74;
	end

//X_90-
	16:begin
		op[15:12] <= AND;
		op[11:8] <= 8;
		op[7:4] <= 1;
		op[3:0] <= 1;
	end

	17:begin
		op[15:12] <= R_90;
		op[11:8] <= 1;
		op[7:4] <= 3;
		op[3:0] <= 0;
	end

	18:begin
		op[15:12] <= R_90;
		op[11:8] <= 3;
		op[7:4] <= 7;
		op[3:0] <= 0;
	end

	19:begin
		op[15:12] <= R_90;
		op[11:8] <= 7;
		op[7:4] <= 5;
		op[3:0] <= 0;
	end

	20:begin
		op[15:12] <= R_90;
		op[11:8] <= 5;
		op[7:4] <= 8;
		op[3:0] <= 0;
	end

	21:begin
		op[15:12] <= STORE;
		op[7:4] <= 9;
		op[3:0] <= 10;
	end


	22:begin
		op[15:12] <= JMP;
		op[7:0] <= 74;
	end

//x_180
	23:begin
		op[15:12] <= AND;
		op[11:8] <= 8;
		op[7:4] <= 1;
		op[3:0] <= 1;
	end

	24:begin
		op[15:12] <= R_180;
		op[11:8] <= 1;
		op[7:4] <= 7;
		op[3:0] <= 0;
	end

	25:begin
		op[15:12] <=R_180;
		op[11:8] <= 7;
		op[7:4] <= 8;
		op[3:0] <= 0;
	end

	26:begin
		op[15:12] <= AND;
		op[11:8] <= 8;
		op[7:4] <= 3;
		op[3:0] <= 3;
	end

	27:begin
		op[15:12] <= R_180;
		op[11:8] <= 3;
		op[7:4] <= 5;
		op[3:0] <= 0;
	end

	28:begin
		op[15:12] <= R_180;
		op[11:8] <= 5;
		op[7:4] <= 8;
		op[3:0] <= 0;
	end


	29:begin
		op[15:12] <= STORE;
		op[7:4] <= 9;
		op[3:0] <= 10;
	end


	30:begin
		op[15:12] <= JMP;
		op[7:0] <= 74;
	end

//Y_90+
	31:begin
		op[15:12] <= AND;
		op[11:8] <= 8;
		op[7:4] <= 2;
		op[3:0] <= 2;
	end

	32:begin
		op[15:12] <= R_90;
		op[11:8] <= 2;
		op[7:4] <= 3;
		op[3:0] <= 4'b0001;
	end

	33:begin
		op[15:12] <= R_90;
		op[11:8] <= 3;
		op[7:4] <= 7;
		op[3:0] <= 4'b0001;
	end

	34:begin
		op[15:12] <= R_90;
		op[11:8] <= 7;
		op[7:4] <= 6;
		op[3:0] <= 4'b0001;
	end

	35:begin
		op[15:12] <= R_90;
		op[11:8] <= 6;
		op[7:4] <= 8;
		op[3:0] <= 4'b0001;
	end

	36:begin
		op[15:12] <= STORE;
		op[7:4] <= 9;
		op[3:0] <= 10;
	end

	37:begin
		op[15:12] <= JMP;
		op[7:0] <= 74;
	end

//Y_90-
	38:begin
		op[15:12] <= AND;
		op[11:8] <= 8;
		op[7:4] <= 2;
		op[3:0] <= 2;
	end

	39:begin
		op[15:12] <= R_90;
		op[11:8] <= 2;
		op[7:4] <= 6;
		op[3:0] <= 4'b0001;
	end

	40:begin
		op[15:12] <= R_90;
		op[11:8] <= 6;
		op[7:4] <= 7;
		op[3:0] <= 4'b0001;
	end

	41:begin
		op[15:12] <= R_90;
		op[11:8] <= 7;
		op[7:4] <= 3;
		op[3:0] <= 4'b0001;
	end

	42:begin
		op[15:12] <= R_90;
		op[11:8] <= 3;
		op[7:4] <= 8;
		op[3:0] <= 4'b0001;
	end

	43:begin
		op[15:12] <= STORE;
		op[7:4] <= 9;
		op[3:0] <= 10;
	end

	44:begin
		op[15:12] <= JMP;
		op[7:0] <= 74;
	end

//Y_180
	45:begin
		op[15:12] <= AND;
		op[11:8] <= 8;
		op[7:4] <= 2;
		op[3:0] <= 2;
	end

	46:begin
		op[15:12] <= R_180;
		op[11:8] <= 2;
		op[7:4] <= 7;
		op[3:0] <= 4'b0001;
	end

	47:begin
		op[15:12] <=R_180;
		op[11:8] <= 7;
		op[7:4] <= 8;
		op[3:0] <= 4'b0001;
	end

	48:begin
		op[15:12] <= AND;
		op[11:8] <= 8;
		op[7:4] <= 3;
		op[3:0] <= 3;
	end

	49:begin
		op[15:12] <= R_180;
		op[11:8] <= 3;
		op[7:4] <= 6;
		op[3:0] <= 4'b0001;
	end

	50:begin
		op[15:12] <= R_180;
		op[11:8] <= 6;
		op[7:4] <= 8;
		op[3:0] <= 4'b0001;
	end

	51:begin
		op[15:12] <= STORE;
		op[7:4] <= 9;
		op[3:0] <= 10;
	end

	52:begin
		op[15:12] <= JMP;
		op[7:0] <= 74;
	end

//Z_90+
	53:begin
		op[15:12] <= AND;
		op[11:8] <= 8;
		op[7:4] <= 4;
		op[3:0] <= 4;
	end

	54:begin
		op[15:12] <= R_90;
		op[11:8] <= 4;
		op[7:4] <= 6;
		op[3:0] <= 4'b0010;
	end

	55:begin
		op[15:12] <= R_90;
		op[11:8] <= 6;
		op[7:4] <= 7;
		op[3:0] <= 4'b0010;
	end

	56:begin
		op[15:12] <= R_90;
		op[11:8] <= 7;
		op[7:4] <= 5;
		op[3:0] <= 4'b0010;
	end

	57:begin
		op[15:12] <= R_90;
		op[11:8] <= 5;
		op[7:4] <= 8;
		op[3:0] <= 4'b0010;
	end

	58:begin
		op[15:12] <= STORE;
		op[7:4] <= 9;
		op[3:0] <= 10;
	end

	59:begin
		op[15:12] <= JMP;
		op[7:0] <= 74;
	end

//Z_90-
	60:begin
		op[15:12] <= AND;
		op[11:8] <= 8;
		op[7:4] <= 4;
		op[3:0] <= 4;
	end

	61:begin
		op[15:12] <= R_90;
		op[11:8] <= 4;
		op[7:4] <= 5;
		op[3:0] <= 4'b0010;
	end

	62:begin
		op[15:12] <= R_90;
		op[11:8] <= 5;
		op[7:4] <= 7;
		op[3:0] <= 4'b0010;
	end

	63:begin
		op[15:12] <= R_90;
		op[11:8] <= 7;
		op[7:4] <= 6;
		op[3:0] <= 4'b0010;
	end

	64:begin
		op[15:12] <= R_90;
		op[11:8] <= 6;
		op[7:4] <= 8;
		op[3:0] <= 4'b0010;
	end

	65:begin
		op[15:12] <= STORE;
		op[7:4] <= 9;
		op[3:0] <= 10;
	end

	66:begin
		op[15:12] <= JMP;
		op[7:0] <= 74;
	end

//Z_180
	67:begin
		op[15:12] <= AND;
		op[11:8] <= 8;
		op[7:4] <= 4;
		op[3:0] <= 4;
	end

	68:begin
		op[15:12] <= R_180;
		op[11:8] <= 4;
		op[7:4] <= 7;
		op[3:0] <= 4'b0010;
	end

	69:begin
		op[15:12] <=R_180;
		op[11:8] <= 7;
		op[7:4] <= 8;
		op[3:0] <= 4'b0010;
	end

	70:begin
		op[15:12] <= AND;
		op[11:8] <= 8;
		op[7:4] <= 5;
		op[3:0] <= 5;
	end

	71:begin
		op[15:12] <= R_180;
		op[11:8] <= 5;
		op[7:4] <= 6;
		op[3:0] <= 4'b0010;
	end

	72:begin
		op[15:12] <= R_180;
		op[11:8] <= 6;
		op[7:4] <= 8;
		op[3:0] <= 4'b0010;
	end

	73:begin
		op[15:12] <= STORE;
		op[7:4] <= 9;
		op[3:0] <= 10;
	end

//check
	74:begin
		op[15:12] <= STORE;
		op[7:4] <= 13;
		op[3:0] <= 14;
	end

	75:begin
		op[15:12] <= CHECK;
		op[11:8]<=0;
		op[7:0]<=AA;
	end

	76:begin
		op[15:12] <= ZNJ;
		op[7:0] <= 150;
	end

	77:begin
		op[15:12] <= CHECK;
		op[11:8]<=1;
		op[7:0]<=BB;
	end

	78:begin
		op[15:12] <= ZNJ;
		op[7:0] <= 150;
	end

	79:begin
		op[15:12] <= CHECK;
		op[11:8]<=2;
		op[7:0]<=CC;
	end

	80:begin
		op[15:12] <= ZNJ;
		op[7:0] <= 150;
	end


	81:begin
		op[15:12] <= CHECK;
		op[11:8]<=3;
		op[7:0]<=DD;
	end

	82:begin
		op[15:12] <= ZNJ;
		op[7:0] <= 150;
	end


	83:begin
		op[15:12] <= CHECK;
		op[11:8]<=4;
		op[7:0]<=EE;
	end

	84:begin
		op[15:12] <= ZNJ;
		op[7:0] <= 150;
	end

	85:begin
		op[15:12] <= CHECK;
		op[11:8]<=5;
		op[7:0]<=FF;
	end

	86:begin
		op[15:12] <= ZNJ;
		op[7:0] <= 150;
	end

	87:begin
		op[15:12] <= CHECK;
		op[11:8]<=6;
		op[7:0]<=GG;
	end

	88:begin
		op[15:12] <= ZNJ;
		op[7:0] <= 150;
	end

	89:begin
		op[15:12] <= CHECK;
		op[11:8]<=7;
		op[7:0]<=HH;
	end

	90:begin
		op[15:12] <= ZNJ;
		op[7:0] <= 150;
	end

	91:begin
		op[15:12] <= JMP;
		op[7:0] <= 246;
	end

//serch
//変数をメモリーから読み込む
	92:begin
		op[15:12] <= LOAD;
		op[11:8] <= 11;
		op[7:4] <= 12;
	end

	93:begin
		op[15:12] <= LOAD;
		op[11:8] <= 14;
		op[7:4] <= 13;
	end

	94:begin
		op[15:12] <= LOAD;
		op[11:8] <= 10;
		op[7:4] <= 9;
	end

//case(i[n-1])同じ軸を繰り返さない
//1:
	95:begin
		op[15:12] <= CHECK;
		op[11:8] <= 11;
		op[7:0] <= 1;
	end

	96:begin
		op[15:12] <= JNZ;
		op[7:0] <= 247;
	end

//case(m[n])次何やるの？
//m=0:
	97:begin
		op[15:12] <= CHECK;
		op[11:8] <= 14;
		op[7:0] <= 0;
	end

	98:begin
		op[15:12] <= ZNJ;
		op[7:0] <= 102;
	end

	99:begin
		op[15:12] <= LI;
		op[11:8] <= 10;
		op[7:0] <= 1;
	end

	100:begin
		op[15:12] <= LI;
		op[11:8] <= 14;
		op[7:0] <= 1;
	end

	101:begin
		op[15:12] <= JMP;
		op[7:0] <= 9;
	end

//m=1:
	102:begin
		op[15:12] <= CHECK;
		op[11:8] <= 14;
		op[7:0] <= 1;
	end

	103:begin
		op[15:12] <= ZNJ;
		op[7:0] <= 107;
	end

	104:begin
		op[15:12] <= LI;
		op[11:8] <= 10;
		op[7:0] <= 1;
	end

	105:begin
		op[15:12] <= LI;
		op[11:8] <= 14;
		op[7:0] <= 2;
	end

	106:begin
		op[15:12] <= JMP;
		op[7:0] <= 16;
	end

//m=2:
	107:begin
		op[15:12] <= CHECK;
		op[11:8] <= 14;
		op[7:0] <= 2;
	end

	108:begin
		op[15:12] <= ZNJ;
		op[7:0] <= 112;
	end

	109:begin
		op[15:12] <= LI;
		op[11:8] <= 10;
		op[7:0] <= 1;
	end

	110:begin
		op[15:12] <= LI;
		op[11:8] <= 14;
		op[7:0] <= 3;
	end

	111:begin
		op[15:12] <= JMP;
		op[7:0] <= 23;
	end

//i=2:
	112:begin
		op[15:12] <= CHECK;
		op[11:8] <= 11;
		op[7:0] <= 2;
	end

	113:begin
		op[15:12] <= JNZ;
		op[7:0] <= 251;
	end

//m=3:
	114:begin
		op[15:12] <= CHECK;
		op[11:8] <= 14;
		op[7:0] <= 3;
	end

	115:begin
		op[15:12] <= ZNJ;
		op[7:0] <= 119;
	end

	116:begin
		op[15:12] <= LI;
		op[11:8] <= 10;
		op[7:0] <= 2;
	end

	117:begin
		op[15:12] <= LI;
		op[11:8] <= 14;
		op[7:0] <= 4;
	end

	118:begin
		op[15:12] <= JMP;
		op[7:0] <= 31;
	end

//m=4:
	119:begin
		op[15:12] <= CHECK;
		op[11:8] <= 14;
		op[7:0] <= 4;
	end

	120:begin
		op[15:12] <= ZNJ;
		op[7:0] <= 124;
	end

	121:begin
		op[15:12] <= LI;
		op[11:8] <= 10;
		op[7:0] <= 2;
	end

	122:begin
		op[15:12] <= LI;
		op[11:8] <= 14;
		op[3:0] <= 5;
	end

	123:begin
		op[15:12] <= JMP;
		op[7:0] <= 38;
	end

//m=5:
	124:begin
		op[15:12] <= CHECK;
		op[11:8] <= 14;
		op[7:0] <= 5;
	end

	125:begin
		op[15:12] <= ZNJ;
		op[7:0] <= 129;
	end

	126:begin
		op[15:12] <= LI;
		op[11:8] <= 10;
		op[7:0] <= 2;
	end

	127:begin
		op[15:12] <= LI;
		op[11:8] <= 14;
		op[7:0] <= 6;
	end

	128:begin
		op[15:12] <= JMP;
		op[7:0] <= 45;
	end

//i=3:
	129:begin
		op[15:12] <= CHECK;
		op[11:8] <= 11;
		op[7:0] <= 3;
	end

	130:begin
		op[15:12] <= JNZ;
		op[7:0] <= 148;
	end

//m=6:
	131:begin
		op[15:12] <= CHECK;
		op[11:8] <= 14;
		op[7:0] <= 6;
	end

	132:begin
		op[15:12] <= ZNJ;
		op[7:0] <= 136;
	end

	133:begin
		op[15:12] <= LI;
		op[11:8] <= 10;
		op[7:0] <= 3;
	end

	134:begin
		op[15:12] <= LI;
		op[11:8] <= 14;
		op[7:0] <= 7;
	end

	135:begin
		op[15:12] <= JMP;
		op[7:0] <= 53;
	end

//m=7:
	136:begin
		op[15:12] <= CHECK;
		op[11:8] <= 14;
		op[7:0] <= 7;
	end

	137:begin
		op[15:12] <= ZNJ;
		op[7:0] <= 141;
	end

	138:begin
		op[15:12] <= LI;
		op[11:8] <= 10;
		op[7:0] <= 3;
	end

	139:begin
		op[15:12] <= LI;
		op[11:8] <= 14;
		op[7:0] <= 8;
	end

	140:begin
		op[15:12] <= JMP;
		op[7:0] <= 60;
	end

//m=8:
	141:begin
		op[15:12] <= CHECK;
		op[11:8] <= 14;
		op[7:0] <= 8;
	end

	142:begin
		op[15:12] <= ZNJ;
		op[7:0] <= 146;
	end

	143:begin
		op[15:12] <= LI;
		op[11:8] <= 10;
		op[7:0] <= 3;
	end

	144:begin
		op[15:12] <= LI;
		op[11:8] <= 14;
		op[3:0] <= 9;
	end

	145:begin
		op[15:12] <= JMP;
		op[7:0] <= 67;
	end

//m=9:
	146:begin
		op[15:12] <= CHECK;
		op[11:8] <= 14;
		op[7:0] <= 9;
	end

	147:begin
		op[15:12] <= ZNJ;
		op[7:0] <= 150;
	end

	148:begin
		op[15:12] <= LI;
		op[11:8] <= 14;
		op[7:0] <= 10;
	end

	149:begin
		op[15:12] <= JMP;
		op[7:0] <= 150;
	end

//m=10:n--;
	150:begin
		op[15:12] <= CHECK;
		op[11:8] <= 14;
		op[7:0] <= 10;
	end

	151:begin
		op[15:12] <= ZNJ;
		op[7:0] <= 165;
	end

//	152:begin
//		op[15:12] <= AND;
//		op[11:8] <= 8;
//		op[7:4] <= 4;
//		op[3:0] <= 4;
//	end
//
//	153:begin
//		op[15:12] <= R_180;
//		op[11:8] <= 4;
//		op[7:4] <= 7;
//		op[3:0] <= 4'b0010;
//	end
//
//	154:begin
//		op[15:12] <=R_180;
//		op[11:8] <= 7;
//		op[7:4] <= 8;
//		op[3:0] <= 4'b0010;
//	end
//
//	155:begin
//		op[15:12] <= AND;
//		op[11:8] <= 8;
//		op[7:4] <= 5;
//		op[3:0] <= 5;
//	end
//
//	156:begin
//		op[15:12] <= R_180;
//		op[11:8] <= 5;
//		op[7:4] <= 6;
//		op[3:0] <= 4'b0010;
//	end
//
//	157:begin
//		op[15:12] <= R_180;
//		op[11:8] <= 6;
//		op[7:4] <= 8;
//		op[3:0] <= 4'b0010;
//	end

	158:begin
		op[15:12] <= LI;
		op[11:8] <= 14;
		op[7:0] <= 0;
	end

	159:begin
		op[15:12] <= STORE;
		op[7:4] <= 13;
		op[3:0] <= 14;
	end

	160:begin
		op[15:12] <= DEC;
		op[11:8] <= 9;
		op[3:0] <= 9;
	end

	161:begin
		op[15:12] <= DEC;
		op[11:8] <= 12;
		op[3:0] <= 9;
	end

	162:begin
		op[15:12] <=DEC;
		op[11:8] <= 13;
		op[3:0] <= 13;
	end

	163:begin
		op[15:12] <=LOAD;
		op[11:8] <= 14;
		op[7:4] <= 13;
	end

	164:begin
		op[15:12] <= JMP;
		op[7:0] <= 171;
	end

//tekazu
	165:begin
		op[15:12] <= CHECK;
		op[11:8] <= 9;
		op[7:0] <= 7;
	end

	166:begin
		op[15:12] <= JNZ;
		op[7:0] <= 171;
	end

	167:begin
		op[15:12] <= INC;
		op[11:8] <= 9;
		op[3:0] <= 9;
	end

	168:begin
		op[15:12] <= DEC;
		op[11:8] <= 12;
		op[3:0] <= 9;
	end

	169:begin
		op[15:12] <= INC;
		op[11:8] <= 13;
		op[3:0] <= 13;
	end

	170:begin
		op[15:12] <= JMP;
		op[7:0] <= 92;
	end

//逆回転で戻すで
	171:begin
		op[15:12] <= CHECK;
		op[11:8] <= 14;
		op[7:0] <= 2;
	end

	172:begin
		op[15:12] <= ZNJ;
		op[7:0] <= 179;
	end

//X_90+
	173:begin
		op[15:12] <= AND;
		op[11:8] <= 8;
		op[7:4] <= 1;
		op[3:0] <= 1;
	end

	174:begin
		op[15:12] <= R_90;
		op[11:8] <= 1;
		op[7:4] <= 5;
		op[3:0] <= 4'b0000;
	end

	175:begin
		op[15:12] <= R_90;
		op[11:8] <= 5;
		op[7:4] <= 7;
		op[3:0] <= 4'b0000;
	end

	176:begin
		op[15:12] <= R_90;
		op[11:8] <= 7;
		op[7:4] <= 3;
		op[3:0] <= 4'b0000;
	end

	177:begin
		op[15:12] <= R_90;
		op[11:8] <= 3;
		op[7:4] <= 8;
		op[3:0] <= 4'b0000;
	end

	178:begin
		op[15:12] <= JMP;
		op[7:0] <= 170;
	end

	179:begin
		op[15:12] <= CHECK;
		op[11:8] <= 14;
		op[7:0] <= 1;
	end

	180:begin
		op[15:12] <= ZNJ;
		op[7:0] <= 187;
	end

//X_90-
	181:begin
		op[15:12] <= AND;
		op[11:8] <= 8;
		op[7:4] <= 1;
		op[3:0] <= 1;
	end

	182:begin
		op[15:12] <= R_90;
		op[11:8] <= 1;
		op[7:4] <= 3;
		op[3:0] <= 0;
	end

	183:begin
		op[15:12] <= R_90;
		op[11:8] <= 3;
		op[7:4] <= 7;
		op[3:0] <= 0;
	end

	184:begin
		op[15:12] <= R_90;
		op[11:8] <= 7;
		op[7:4] <= 5;
		op[3:0] <= 0;
	end

	185:begin
		op[15:12] <= R_90;
		op[11:8] <= 5;
		op[7:4] <= 8;
		op[3:0] <= 0;
	end

	186:begin
		op[15:12] <= JMP;
		op[7:0] <= 170;
	end

	187:begin
		op[15:12] <= CHECK;
		op[11:8] <= 14;
		op[7:0] <= 3;
	end

	188:begin
		op[15:12] <= ZNJ;
		op[7:0] <= 196;
	end

//x_180
	189:begin
		op[15:12] <= AND;
		op[11:8] <= 8;
		op[7:4] <= 1;
		op[3:0] <= 1;
	end

	190:begin
		op[15:12] <= R_180;
		op[11:8] <= 1;
		op[7:4] <= 7;
		op[3:0] <= 0;
	end

	191:begin
		op[15:12] <=R_180;
		op[11:8] <= 7;
		op[7:4] <= 8;
		op[3:0] <= 0;
	end

	192:begin
		op[15:12] <= AND;
		op[11:8] <= 8;
		op[7:4] <= 3;
		op[3:0] <= 3;
	end

	193:begin
		op[15:12] <= R_180;
		op[11:8] <= 3;
		op[7:4] <= 5;
		op[3:0] <= 0;
	end

	194:begin
		op[15:12] <= R_180;
		op[11:8] <= 5;
		op[7:4] <= 8;
		op[3:0] <= 0;
	end

	195:begin
		op[15:12] <= JMP;
		op[7:0] <= 170;
	end

	196:begin
		op[15:12] <= CHECK;
		op[11:8] <= 14;
		op[7:0] <= 5;
	end

	197:begin
		op[15:12] <= ZNJ;
		op[7:0] <= 204;
	end

//Y_90+
	198:begin
		op[15:12] <= AND;
		op[11:8] <= 8;
		op[7:4] <= 2;
		op[3:0] <= 2;
	end

	199:begin
		op[15:12] <= R_90;
		op[11:8] <= 2;
		op[7:4] <= 3;
		op[3:0] <= 4'b0001;
	end

	200:begin
		op[15:12] <= R_90;
		op[11:8] <= 3;
		op[7:4] <= 7;
		op[3:0] <= 4'b0001;
	end

	201:begin
		op[15:12] <= R_90;
		op[11:8] <= 7;
		op[7:4] <= 6;
		op[3:0] <= 4'b0001;
	end

	202:begin
		op[15:12] <= R_90;
		op[11:8] <= 6;
		op[7:4] <= 8;
		op[3:0] <= 4'b0001;
	end

	203:begin
		op[15:12] <= JMP;
		op[7:0] <= 170;
	end

	204:begin
		op[15:12] <= CHECK;
		op[11:8] <= 14;
		op[7:0] <= 4;
	end

	205:begin
		op[15:12] <= ZNJ;
		op[7:0] <= 212;
	end

//Y_90-
	206:begin
		op[15:12] <= AND;
		op[11:8] <= 8;
		op[7:4] <= 2;
		op[3:0] <= 2;
	end

	207:begin
		op[15:12] <= R_90;
		op[11:8] <= 2;
		op[7:4] <= 6;
		op[3:0] <= 4'b0001;
	end

	208:begin
		op[15:12] <= R_90;
		op[11:8] <= 6;
		op[7:4] <= 7;
		op[3:0] <= 4'b0001;
	end

	209:begin
		op[15:12] <= R_90;
		op[11:8] <= 7;
		op[7:4] <= 3;
		op[3:0] <= 4'b0001;
	end

	210:begin
		op[15:12] <= R_90;
		op[11:8] <= 3;
		op[7:4] <= 8;
		op[3:0] <= 4'b0001;
	end

	211:begin
		op[15:12] <= JMP;
		op[7:0] <= 170;
	end

	212:begin
		op[15:12] <= CHECK;
		op[11:8] <= 14;
		op[7:0] <= 6;
	end

	213:begin
		op[15:12] <= ZNJ;
		op[7:0] <= 221;
	end
	
//Y_180
	214:begin
		op[15:12] <= AND;
		op[11:8] <= 8;
		op[7:4] <= 2;
		op[3:0] <= 2;
	end

	215:begin
		op[15:12] <= R_180;
		op[11:8] <= 2;
		op[7:4] <= 7;
		op[3:0] <= 4'b0001;
	end

	216:begin
		op[15:12] <=R_180;
		op[11:8] <= 7;
		op[7:4] <= 8;
		op[3:0] <= 4'b0001;
	end

	217:begin
		op[15:12] <= AND;
		op[11:8] <= 8;
		op[7:4] <= 3;
		op[3:0] <= 3;
	end

	218:begin
		op[15:12] <= R_180;
		op[11:8] <= 3;
		op[7:4] <= 6;
		op[3:0] <= 4'b0001;
	end

	219:begin
		op[15:12] <= R_180;
		op[11:8] <= 6;
		op[7:4] <= 8;
		op[3:0] <= 4'b0001;
	end

	220:begin
		op[15:12] <= JMP;
		op[7:0] <= 170;
	end

	221:begin
		op[15:12] <= CHECK;
		op[11:8] <= 14;
		op[7:0] <= 8;
	end

	222:begin
		op[15:12] <= ZNJ;
		op[7:0] <= 229;
	end

//Z_90+
	223:begin
		op[15:12] <= AND;
		op[11:8] <= 8;
		op[7:4] <= 4;
		op[3:0] <= 4;
	end

	224:begin
		op[15:12] <= R_90;
		op[11:8] <= 4;
		op[7:4] <= 6;
		op[3:0] <= 4'b0010;
	end

	225:begin
		op[15:12] <= R_90;
		op[11:8] <= 6;
		op[7:4] <= 7;
		op[3:0] <= 4'b0010;
	end

	226:begin
		op[15:12] <= R_90;
		op[11:8] <= 7;
		op[7:4] <= 5;
		op[3:0] <= 4'b0010;
	end

	227:begin
		op[15:12] <= R_90;
		op[11:8] <= 5;
		op[7:4] <= 8;
		op[3:0] <= 4'b0010;
	end

	228:begin
		op[15:12] <= JMP;
		op[7:0] <= 170;
	end

	229:begin
		op[15:12] <= CHECK;
		op[11:8] <= 14;
		op[7:0] <= 7;
	end

	230:begin
		op[15:12] <= ZNJ;
		op[7:0] <= 237;
	end

//Z_90-
	231:begin
		op[15:12] <= AND;
		op[11:8] <= 8;
		op[7:4] <= 4;
		op[3:0] <= 4;
	end

	232:begin
		op[15:12] <= R_90;
		op[11:8] <= 4;
		op[7:4] <= 5;
		op[3:0] <= 4'b0010;
	end

	233:begin
		op[15:12] <= R_90;
		op[11:8] <= 5;
		op[7:4] <= 7;
		op[3:0] <= 4'b0010;
	end

	234:begin
		op[15:12] <= R_90;
		op[11:8] <= 7;
		op[7:4] <= 6;
		op[3:0] <= 4'b0010;
	end

	235:begin
		op[15:12] <= R_90;
		op[11:8] <= 6;
		op[7:4] <= 8;
		op[3:0] <= 4'b0010;
	end

	236:begin
		op[15:12] <= JMP;
		op[7:0] <= 170;
	end

	237:begin
		op[15:12] <= CHECK;
		op[11:8] <= 14;
		op[7:0] <= 9;
	end

	238:begin
		op[15:12] <= ZNJ;
		op[7:0] <= 170;
	end

//Z_180
	239:begin
		op[15:12] <= AND;
		op[11:8] <= 8;
		op[7:4] <= 4;
		op[3:0] <= 4;
	end

	240:begin
		op[15:12] <= R_180;
		op[11:8] <= 4;
		op[7:4] <= 7;
		op[3:0] <= 4'b0010;
	end

	241:begin
		op[15:12] <=R_180;
		op[11:8] <= 7;
		op[7:4] <= 8;
		op[3:0] <= 4'b0010;
	end

	242:begin
		op[15:12] <= AND;
		op[11:8] <= 8;
		op[7:4] <= 5;
		op[3:0] <= 5;
	end

	243:begin
		op[15:12] <= R_180;
		op[11:8] <= 5;
		op[7:4] <= 6;
		op[3:0] <= 4'b0010;
	end

	244:begin
		op[15:12] <= R_180;
		op[11:8] <= 6;
		op[7:4] <= 8;
		op[3:0] <= 4'b0010;
	end

	245:begin
		op[15:12] <= JMP;
		op[7:0] <= 170;
	end

//all end
	246:begin
	end

//飛ばした分mを変える
	247:begin
		op[15:12] <= CHECK;
		op[11:8] <= 14;
		op[7:0] <= 0;
	end

	248:begin
		op[15:12] <= ZNJ;
		op[7:0] <= 112;
	end

	249:begin
		op[15:12] <= LI;
		op[11:8] <= 14;
		op[7:0] <= 3;
	end

	250:begin
		op[15:12] <= JMP;
		op[7:0] <= 112;
	end

	251:begin
		op[15:12] <= CHECK;
		op[11:8] <= 14;
		op[7:0] <= 3;
	end

	252:begin
		op[15:12] <= ZNJ;
		op[7:0] <= 129;
	end

	253:begin
		op[15:12] <= LI;
		op[11:8] <= 14;
		op[7:0] <= 6;
	end

	254:begin
		op[15:12] <= JMP;
		op[7:0] <= 129;
	end

	endcase
end

endmodule
