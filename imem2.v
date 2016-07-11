//imem2.v
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
		op[7:0] <= 8'b10111;
//		op[7:0] <= 8'b00001111;
	end

	2:begin
		op[15:12] <= LI;
		op[11:8] <= 2;
		op[7:0] <= 8'b00111;
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
		op[7:0] <= 8'b01011;
//		op[7:0] <= EE;
	end

	5:begin
		op[15:12] <= LI;
		op[11:8] <= 5;
		op[7:0] <= 8'b10000;
//		op[7:0] <= 8'b00000111;
	end

	6:begin
		op[15:12] <= LI;
		op[11:8] <= 6;
		op[7:0] <= 8'b11011;
//		op[7:0] <= GG;
	end

	7:begin
		op[15:12] <= LI;
		op[11:8] <= 7;
		op[7:0] <= 8'b11110;
//		op[7:0] <= 8'b00010111;
	end

//serch
	8:begin
		op[15:12] <= LOAD;
		op[11:8] <= 11;
		op[7:4] <= 12;
	end

	9:begin
		op[15:12] <= LOAD;
		op[11:8] <= 14;
		op[7:4] <= 13;
	end

	10:begin
		op[15:12] <= LOAD;
		op[11:8] <= 10;
		op[7:4] <= 9;
	end

//case(i[n-1])同じ軸を繰り返さない
//1:
	11:begin
		op[15:12] <= CHECK;
		op[11:8] <= 11;
		op[7:0] <= 1;
	end

	12:begin
		op[15:12] <= JNZ;
		op[7:0] <= 221;
	end

	13:begin
		op[15:12] <= LI;
		op[11:8] <= 10;
		op[7:0] <= 1;
	end

//case(m[n])次何やるの？
//m=0:
	14:begin
		op[15:12] <= CHECK;
		op[11:8] <= 14;
		op[7:0] <= 0;
	end

	15:begin
		op[15:12] <= ZNJ;
		op[7:0] <= 18;
	end

	16:begin
		op[15:12] <= LI;
		op[11:8] <= 14;
		op[7:0] <= 1;
	end

	17:begin
		op[15:12] <= JMP;
		op[7:0] <= 65;
	end

//m=1:
	18:begin
		op[15:12] <= CHECK;
		op[11:8] <= 14;
		op[7:0] <= 1;
	end

	19:begin
		op[15:12] <= ZNJ;
		op[7:0] <= 22;
	end

	20:begin
		op[15:12] <= LI;
		op[11:8] <= 14;
		op[7:0] <= 2;
	end

	21:begin
		op[15:12] <= JMP;
		op[7:0] <= 71;
	end

//m=2:
	22:begin
		op[15:12] <= CHECK;
		op[11:8] <= 14;
		op[7:0] <= 2;
	end

	23:begin
		op[15:12] <= ZNJ;
		op[7:0] <= 26;
	end

	24:begin
		op[15:12] <= LI;
		op[11:8] <= 14;
		op[7:0] <= 3;
	end

	25:begin
		op[15:12] <= JMP;
		op[7:0] <= 77;
	end

//i=2:
	26:begin
		op[15:12] <= CHECK;
		op[11:8] <= 11;
		op[7:0] <= 2;
	end

	27:begin
		op[15:12] <= JNZ;
		op[7:0] <= 225;
	end

	28:begin
		op[15:12] <= LI;
		op[11:8] <= 10;
		op[7:0] <= 2;
	end

//m=3:
	29:begin
		op[15:12] <= CHECK;
		op[11:8] <= 14;
		op[7:0] <= 3;
	end

	30:begin
		op[15:12] <= ZNJ;
		op[7:0] <= 33;
	end

	31:begin
		op[15:12] <= LI;
		op[11:8] <= 14;
		op[7:0] <= 4;
	end

	32:begin
		op[15:12] <= JMP;
		op[7:0] <= 84;
	end

//m=4:
	33:begin
		op[15:12] <= CHECK;
		op[11:8] <= 14;
		op[7:0] <= 4;
	end

	34:begin
		op[15:12] <= ZNJ;
		op[7:0] <= 37;
	end

	35:begin
		op[15:12] <= LI;
		op[11:8] <= 14;
		op[7:0] <= 5;
	end

	36:begin
		op[15:12] <= JMP;
		op[7:0] <= 90;
	end

//m=5:
	37:begin
		op[15:12] <= CHECK;
		op[11:8] <= 14;
		op[7:0] <= 5;
	end

	38:begin
		op[15:12] <= ZNJ;
		op[7:0] <= 41;
	end

	39:begin
		op[15:12] <= LI;
		op[11:8] <= 14;
		op[7:0] <= 6;
	end

	40:begin
		op[15:12] <= JMP;
		op[7:0] <= 96;
	end

//i=3:
	41:begin
		op[15:12] <= CHECK;
		op[11:8] <= 11;
		op[7:0] <= 3;
	end

	42:begin
		op[15:12] <= JNZ;
		op[7:0] <= 58;
	end

	43:begin
		op[15:12] <= LI;
		op[11:8] <= 10;
		op[7:0] <= 3;
	end

//m=6:
	44:begin
		op[15:12] <= CHECK;
		op[11:8] <= 14;
		op[7:0] <= 6;
	end

	45:begin
		op[15:12] <= ZNJ;
		op[7:0] <= 48;
	end

	46:begin
		op[15:12] <= LI;
		op[11:8] <= 14;
		op[7:0] <= 7;
	end

	47:begin
		op[15:12] <= JMP;
		op[7:0] <= 103;
	end

//m=7:
	48:begin
		op[15:12] <= CHECK;
		op[11:8] <= 14;
		op[7:0] <= 7;
	end

	49:begin
		op[15:12] <= ZNJ;
		op[7:0] <= 52;
	end

	50:begin
		op[15:12] <= LI;
		op[11:8] <= 14;
		op[7:0] <= 8;
	end

	51:begin
		op[15:12] <= JMP;
		op[7:0] <= 109;
	end

//m=8:
	52:begin
		op[15:12] <= CHECK;
		op[11:8] <= 14;
		op[7:0] <= 8;
	end

	53:begin
		op[15:12] <= ZNJ;
		op[7:0] <= 56;
	end

	54:begin
		op[15:12] <= LI;
		op[11:8] <= 14;
		op[7:0] <= 9;
	end

	55:begin
		op[15:12] <= JMP;
		op[7:0] <= 115;
	end

//m=9:
	56:begin
		op[15:12] <= CHECK;
		op[11:8] <= 14;
		op[7:0] <= 9;
	end

	57:begin
		op[15:12] <= ZNJ;
		op[7:0] <= 140;
	end

	58:begin
		op[15:12] <= LI;
		op[11:8] <= 14;
		op[7:0] <= 0;
	end

	59:begin
		op[15:12] <= STORE;
		op[7:4] <= 13;
		op[3:0] <= 14;
	end

	60:begin
		op[15:12] <= DEC;
		op[11:8] <= 9;
		op[3:0] <= 9;
	end

	61:begin
		op[15:12] <= DEC;
		op[11:8] <= 12;
		op[3:0] <= 9;
	end

	62:begin
		op[15:12] <=DEC;
		op[11:8] <= 13;
		op[3:0] <= 13;
	end

	63:begin
		op[15:12] <=LOAD;
		op[11:8] <= 14;
		op[7:4] <= 13;
	end

	64:begin
		op[15:12] <= JMP;
		op[7:0] <= 146;
	end

//X_90+
	65:begin
		op[15:12] <= AND;
		op[11:8] <= 8;
		op[7:4] <= 1;
		op[3:0] <= 1;
	end

	66:begin
		op[15:12] <= R_90;
		op[11:8] <= 1;
		op[7:4] <= 5;
		op[3:0] <= 4'b0000;
	end

	67:begin
		op[15:12] <= R_90;
		op[11:8] <= 5;
		op[7:4] <= 7;
		op[3:0] <= 4'b0000;
	end

	68:begin
		op[15:12] <= R_90;
		op[11:8] <= 7;
		op[7:4] <= 3;
		op[3:0] <= 4'b0000;
	end

	69:begin
		op[15:12] <= R_90;
		op[11:8] <= 3;
		op[7:4] <= 8;
		op[3:0] <= 4'b0000;
	end

	70:begin
		op[15:12] <= JMP;
		op[7:0] <= 121;
	end

//X_90-
	71:begin
		op[15:12] <= AND;
		op[11:8] <= 8;
		op[7:4] <= 1;
		op[3:0] <= 1;
	end

	72:begin
		op[15:12] <= R_90;
		op[11:8] <= 1;
		op[7:4] <= 3;
		op[3:0] <= 0;
	end

	73:begin
		op[15:12] <= R_90;
		op[11:8] <= 3;
		op[7:4] <= 7;
		op[3:0] <= 0;
	end

	74:begin
		op[15:12] <= R_90;
		op[11:8] <= 7;
		op[7:4] <= 5;
		op[3:0] <= 0;
	end

	75:begin
		op[15:12] <= R_90;
		op[11:8] <= 5;
		op[7:4] <= 8;
		op[3:0] <= 0;
	end

	76:begin
		op[15:12] <= JMP;
		op[7:0] <= 121;
	end

//x_180
	77:begin
		op[15:12] <= AND;
		op[11:8] <= 8;
		op[7:4] <= 1;
		op[3:0] <= 1;
	end

	78:begin
		op[15:12] <= R_180;
		op[11:8] <= 1;
		op[7:4] <= 7;
		op[3:0] <= 0;
	end

	79:begin
		op[15:12] <=R_180;
		op[11:8] <= 7;
		op[7:4] <= 8;
		op[3:0] <= 0;
	end

	80:begin
		op[15:12] <= AND;
		op[11:8] <= 8;
		op[7:4] <= 3;
		op[3:0] <= 3;
	end

	81:begin
		op[15:12] <= R_180;
		op[11:8] <= 3;
		op[7:4] <= 5;
		op[3:0] <= 0;
	end

	82:begin
		op[15:12] <= R_180;
		op[11:8] <= 5;
		op[7:4] <= 8;
		op[3:0] <= 0;
	end

	83:begin
		op[15:12] <= JMP;
		op[7:0] <= 121;
	end

//Y_90+
	84:begin
		op[15:12] <= AND;
		op[11:8] <= 8;
		op[7:4] <= 2;
		op[3:0] <= 2;
	end

	85:begin
		op[15:12] <= R_90;
		op[11:8] <= 2;
		op[7:4] <= 3;
		op[3:0] <= 4'b0001;
	end

	86:begin
		op[15:12] <= R_90;
		op[11:8] <= 3;
		op[7:4] <= 7;
		op[3:0] <= 4'b0001;
	end

	87:begin
		op[15:12] <= R_90;
		op[11:8] <= 7;
		op[7:4] <= 6;
		op[3:0] <= 4'b0001;
	end

	88:begin
		op[15:12] <= R_90;
		op[11:8] <= 6;
		op[7:4] <= 8;
		op[3:0] <= 4'b0001;
	end

	89:begin
		op[15:12] <= JMP;
		op[7:0] <= 121;
	end

//Y_90-
	90:begin
		op[15:12] <= AND;
		op[11:8] <= 8;
		op[7:4] <= 2;
		op[3:0] <= 2;
	end

	91:begin
		op[15:12] <= R_90;
		op[11:8] <= 2;
		op[7:4] <= 6;
		op[3:0] <= 4'b0001;
	end

	92:begin
		op[15:12] <= R_90;
		op[11:8] <= 6;
		op[7:4] <= 7;
		op[3:0] <= 4'b0001;
	end

	93:begin
		op[15:12] <= R_90;
		op[11:8] <= 7;
		op[7:4] <= 3;
		op[3:0] <= 4'b0001;
	end

	94:begin
		op[15:12] <= R_90;
		op[11:8] <= 3;
		op[7:4] <= 8;
		op[3:0] <= 4'b0001;
	end

	95:begin
		op[15:12] <= JMP;
		op[7:0] <= 121;
	end

//Y_180
	96:begin
		op[15:12] <= AND;
		op[11:8] <= 8;
		op[7:4] <= 2;
		op[3:0] <= 2;
	end

	97:begin
		op[15:12] <= R_180;
		op[11:8] <= 2;
		op[7:4] <= 7;
		op[3:0] <= 4'b0001;
	end

	98:begin
		op[15:12] <=R_180;
		op[11:8] <= 7;
		op[7:4] <= 8;
		op[3:0] <= 4'b0001;
	end

	99:begin
		op[15:12] <= AND;
		op[11:8] <= 8;
		op[7:4] <= 3;
		op[3:0] <= 3;
	end

	100:begin
		op[15:12] <= R_180;
		op[11:8] <= 3;
		op[7:4] <= 6;
		op[3:0] <= 4'b0001;
	end

	101:begin
		op[15:12] <= R_180;
		op[11:8] <= 6;
		op[7:4] <= 8;
		op[3:0] <= 4'b0001;
	end

	102:begin
		op[15:12] <= JMP;
		op[7:0] <= 121;
	end

//Z_90+
	103:begin
		op[15:12] <= AND;
		op[11:8] <= 8;
		op[7:4] <= 4;
		op[3:0] <= 4;
	end

	104:begin
		op[15:12] <= R_90;
		op[11:8] <= 4;
		op[7:4] <= 6;
		op[3:0] <= 4'b0010;
	end

	105:begin
		op[15:12] <= R_90;
		op[11:8] <= 6;
		op[7:4] <= 7;
		op[3:0] <= 4'b0010;
	end

	106:begin
		op[15:12] <= R_90;
		op[11:8] <= 7;
		op[7:4] <= 5;
		op[3:0] <= 4'b0010;
	end

	107:begin
		op[15:12] <= R_90;
		op[11:8] <= 5;
		op[7:4] <= 8;
		op[3:0] <= 4'b0010;
	end

	108:begin
		op[15:12] <= JMP;
		op[7:0] <= 121;
	end

//Z_90-
	109:begin
		op[15:12] <= AND;
		op[11:8] <= 8;
		op[7:4] <= 4;
		op[3:0] <= 4;
	end

	110:begin
		op[15:12] <= R_90;
		op[11:8] <= 4;
		op[7:4] <= 5;
		op[3:0] <= 4'b0010;
	end

	111:begin
		op[15:12] <= R_90;
		op[11:8] <= 5;
		op[7:4] <= 7;
		op[3:0] <= 4'b0010;
	end

	112:begin
		op[15:12] <= R_90;
		op[11:8] <= 7;
		op[7:4] <= 6;
		op[3:0] <= 4'b0010;
	end

	113:begin
		op[15:12] <= R_90;
		op[11:8] <= 6;
		op[7:4] <= 8;
		op[3:0] <= 4'b0010;
	end

	114:begin
		op[15:12] <= JMP;
		op[7:0] <= 121;
	end

//Z_180
	115:begin
		op[15:12] <= AND;
		op[11:8] <= 8;
		op[7:4] <= 4;
		op[3:0] <= 4;
	end

	116:begin
		op[15:12] <= R_180;
		op[11:8] <= 4;
		op[7:4] <= 7;
		op[3:0] <= 4'b0010;
	end

	117:begin
		op[15:12] <=R_180;
		op[11:8] <= 7;
		op[7:4] <= 8;
		op[3:0] <= 4'b0010;
	end

	118:begin
		op[15:12] <= AND;
		op[11:8] <= 8;
		op[7:4] <= 5;
		op[3:0] <= 5;
	end

	119:begin
		op[15:12] <= R_180;
		op[11:8] <= 5;
		op[7:4] <= 6;
		op[3:0] <= 4'b0010;
	end

	120:begin
		op[15:12] <= R_180;
		op[11:8] <= 6;
		op[7:4] <= 8;
		op[3:0] <= 4'b0010;
	end

//check
	121:begin
		op[15:12] <= STORE;
		op[7:4] <= 13;
		op[3:0] <= 14;
	end

	122:begin
		op[15:12] <= STORE;
		op[7:4] <= 9;
		op[3:0] <= 10;
	end

	123:begin
		op[15:12] <= CHECK;
		op[11:8]<=0;
		op[7:0]<=AA;
	end

	124:begin
		op[15:12] <= ZNJ;
		op[7:0] <= 140;
	end

	125:begin
		op[15:12] <= CHECK;
		op[11:8]<=1;
		op[7:0]<=BB;
	end

	126:begin
		op[15:12] <= ZNJ;
		op[7:0] <= 140;
	end

	127:begin
		op[15:12] <= CHECK;
		op[11:8]<=2;
		op[7:0]<=CC;
	end

	128:begin
		op[15:12] <= ZNJ;
		op[7:0] <= 140;
	end


	129:begin
		op[15:12] <= CHECK;
		op[11:8]<=3;
		op[7:0]<=DD;
	end

	130:begin
		op[15:12] <= ZNJ;
		op[7:0] <= 140;
	end


	131:begin
		op[15:12] <= CHECK;
		op[11:8]<=4;
		op[7:0]<=EE;
	end

	132:begin
		op[15:12] <= ZNJ;
		op[7:0] <= 140;
	end

	133:begin
		op[15:12] <= CHECK;
		op[11:8]<=5;
		op[7:0]<=FF;
	end

	134:begin
		op[15:12] <= ZNJ;
		op[7:0] <= 140;
	end

	135:begin
		op[15:12] <= CHECK;
		op[11:8]<=6;
		op[7:0]<=GG;
	end

	136:begin
		op[15:12] <= ZNJ;
		op[7:0] <= 140;
	end

	137:begin
		op[15:12] <= CHECK;
		op[11:8]<=7;
		op[7:0]<=HH;
	end

	138:begin
		op[15:12] <= ZNJ;
		op[7:0] <= 140;
	end

	139:begin
		op[15:12] <= JMP;
		op[7:0] <= 229;
	end

//tekazu
	140:begin
		op[15:12] <= CHECK;
		op[11:8] <= 9;
		op[7:0] <= 3;
	end

	141:begin
		op[15:12] <= JNZ;
		op[7:0] <= 146;
	end

	142:begin
		op[15:12] <= INC;
		op[11:8] <= 9;
		op[3:0] <= 9;
	end

	143:begin
		op[15:12] <= DEC;
		op[11:8] <= 12;
		op[3:0] <= 9;
	end

	144:begin
		op[15:12] <= INC;
		op[11:8] <= 13;
		op[3:0] <= 13;
	end

	145:begin
		op[15:12] <= JMP;
		op[7:0] <= 8;
	end

//逆回転で戻すで
	146:begin
		op[15:12] <= CHECK;
		op[11:8] <= 14;
		op[7:0] <= 2;
	end

	147:begin
		op[15:12] <= ZNJ;
		op[7:0] <= 154;
	end

//X_90+
	148:begin
		op[15:12] <= AND;
		op[11:8] <= 8;
		op[7:4] <= 1;
		op[3:0] <= 1;
	end

	149:begin
		op[15:12] <= R_90;
		op[11:8] <= 1;
		op[7:4] <= 5;
		op[3:0] <= 4'b0000;
	end

	150:begin
		op[15:12] <= R_90;
		op[11:8] <= 5;
		op[7:4] <= 7;
		op[3:0] <= 4'b0000;
	end

	151:begin
		op[15:12] <= R_90;
		op[11:8] <= 7;
		op[7:4] <= 3;
		op[3:0] <= 4'b0000;
	end

	152:begin
		op[15:12] <= R_90;
		op[11:8] <= 3;
		op[7:4] <= 8;
		op[3:0] <= 4'b0000;
	end

	153:begin
		op[15:12] <= JMP;
		op[7:0] <= 8;
	end

	154:begin
		op[15:12] <= CHECK;
		op[11:8] <= 14;
		op[7:0] <= 1;
	end

	155:begin
		op[15:12] <= ZNJ;
		op[7:0] <= 162;
	end

//X_90-
	156:begin
		op[15:12] <= AND;
		op[11:8] <= 8;
		op[7:4] <= 1;
		op[3:0] <= 1;
	end

	157:begin
		op[15:12] <= R_90;
		op[11:8] <= 1;
		op[7:4] <= 3;
		op[3:0] <= 0;
	end

	158:begin
		op[15:12] <= R_90;
		op[11:8] <= 3;
		op[7:4] <= 7;
		op[3:0] <= 0;
	end

	159:begin
		op[15:12] <= R_90;
		op[11:8] <= 7;
		op[7:4] <= 5;
		op[3:0] <= 0;
	end

	160:begin
		op[15:12] <= R_90;
		op[11:8] <= 5;
		op[7:4] <= 8;
		op[3:0] <= 0;
	end

	161:begin
		op[15:12] <= JMP;
		op[7:0] <= 8;
	end

	162:begin
		op[15:12] <= CHECK;
		op[11:8] <= 14;
		op[7:0] <= 3;
	end

	163:begin
		op[15:12] <= ZNJ;
		op[7:0] <= 171;
	end

//x_180
	164:begin
		op[15:12] <= AND;
		op[11:8] <= 8;
		op[7:4] <= 1;
		op[3:0] <= 1;
	end

	165:begin
		op[15:12] <= R_180;
		op[11:8] <= 1;
		op[7:4] <= 7;
		op[3:0] <= 0;
	end

	166:begin
		op[15:12] <=R_180;
		op[11:8] <= 7;
		op[7:4] <= 8;
		op[3:0] <= 0;
	end

	167:begin
		op[15:12] <= AND;
		op[11:8] <= 8;
		op[7:4] <= 3;
		op[3:0] <= 3;
	end

	168:begin
		op[15:12] <= R_180;
		op[11:8] <= 3;
		op[7:4] <= 5;
		op[3:0] <= 0;
	end

	169:begin
		op[15:12] <= R_180;
		op[11:8] <= 5;
		op[7:4] <= 8;
		op[3:0] <= 0;
	end

	170:begin
		op[15:12] <= JMP;
		op[7:0] <= 8;
	end

	171:begin
		op[15:12] <= CHECK;
		op[11:8] <= 14;
		op[7:0] <= 5;
	end

	172:begin
		op[15:12] <= ZNJ;
		op[7:0] <= 179;
	end

//Y_90+
	173:begin
		op[15:12] <= AND;
		op[11:8] <= 8;
		op[7:4] <= 2;
		op[3:0] <= 2;
	end

	174:begin
		op[15:12] <= R_90;
		op[11:8] <= 2;
		op[7:4] <= 3;
		op[3:0] <= 4'b0001;
	end

	175:begin
		op[15:12] <= R_90;
		op[11:8] <= 3;
		op[7:4] <= 7;
		op[3:0] <= 4'b0001;
	end

	176:begin
		op[15:12] <= R_90;
		op[11:8] <= 7;
		op[7:4] <= 6;
		op[3:0] <= 4'b0001;
	end

	177:begin
		op[15:12] <= R_90;
		op[11:8] <= 6;
		op[7:4] <= 8;
		op[3:0] <= 4'b0001;
	end

	178:begin
		op[15:12] <= JMP;
		op[7:0] <= 8;
	end

	179:begin
		op[15:12] <= CHECK;
		op[11:8] <= 14;
		op[7:0] <= 4;
	end

	180:begin
		op[15:12] <= ZNJ;
		op[7:0] <= 187;
	end

//Y_90-
	181:begin
		op[15:12] <= AND;
		op[11:8] <= 8;
		op[7:4] <= 2;
		op[3:0] <= 2;
	end

	182:begin
		op[15:12] <= R_90;
		op[11:8] <= 2;
		op[7:4] <= 6;
		op[3:0] <= 4'b0001;
	end

	183:begin
		op[15:12] <= R_90;
		op[11:8] <= 6;
		op[7:4] <= 7;
		op[3:0] <= 4'b0001;
	end

	184:begin
		op[15:12] <= R_90;
		op[11:8] <= 7;
		op[7:4] <= 3;
		op[3:0] <= 4'b0001;
	end

	185:begin
		op[15:12] <= R_90;
		op[11:8] <= 3;
		op[7:4] <= 8;
		op[3:0] <= 4'b0001;
	end

	186:begin
		op[15:12] <= JMP;
		op[7:0] <= 8;
	end

	187:begin
		op[15:12] <= CHECK;
		op[11:8] <= 14;
		op[7:0] <= 6;
	end

	188:begin
		op[15:12] <= ZNJ;
		op[7:0] <= 196;
	end
	
//Y_180
	189:begin
		op[15:12] <= AND;
		op[11:8] <= 8;
		op[7:4] <= 2;
		op[3:0] <= 2;
	end

	190:begin
		op[15:12] <= R_180;
		op[11:8] <= 2;
		op[7:4] <= 7;
		op[3:0] <= 4'b0001;
	end

	191:begin
		op[15:12] <=R_180;
		op[11:8] <= 7;
		op[7:4] <= 8;
		op[3:0] <= 4'b0001;
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
		op[7:4] <= 6;
		op[3:0] <= 4'b0001;
	end

	194:begin
		op[15:12] <= R_180;
		op[11:8] <= 6;
		op[7:4] <= 8;
		op[3:0] <= 4'b0001;
	end

	195:begin
		op[15:12] <= JMP;
		op[7:0] <= 8;
	end

	196:begin
		op[15:12] <= CHECK;
		op[11:8] <= 14;
		op[7:0] <= 8;
	end

	197:begin
		op[15:12] <= ZNJ;
		op[7:0] <= 204;
	end

//Z_90+
	198:begin
		op[15:12] <= AND;
		op[11:8] <= 8;
		op[7:4] <= 4;
		op[3:0] <= 4;
	end

	199:begin
		op[15:12] <= R_90;
		op[11:8] <= 4;
		op[7:4] <= 6;
		op[3:0] <= 4'b0010;
	end

	200:begin
		op[15:12] <= R_90;
		op[11:8] <= 6;
		op[7:4] <= 7;
		op[3:0] <= 4'b0010;
	end

	201:begin
		op[15:12] <= R_90;
		op[11:8] <= 7;
		op[7:4] <= 5;
		op[3:0] <= 4'b0010;
	end

	202:begin
		op[15:12] <= R_90;
		op[11:8] <= 5;
		op[7:4] <= 8;
		op[3:0] <= 4'b0010;
	end

	203:begin
		op[15:12] <= JMP;
		op[7:0] <= 8;
	end

	204:begin
		op[15:12] <= CHECK;
		op[11:8] <= 14;
		op[7:0] <= 7;
	end

	205:begin
		op[15:12] <= ZNJ;
		op[7:0] <= 212;
	end

//Z_90-
	206:begin
		op[15:12] <= AND;
		op[11:8] <= 8;
		op[7:4] <= 4;
		op[3:0] <= 4;
	end

	207:begin
		op[15:12] <= R_90;
		op[11:8] <= 4;
		op[7:4] <= 5;
		op[3:0] <= 4'b0010;
	end

	208:begin
		op[15:12] <= R_90;
		op[11:8] <= 5;
		op[7:4] <= 7;
		op[3:0] <= 4'b0010;
	end

	209:begin
		op[15:12] <= R_90;
		op[11:8] <= 7;
		op[7:4] <= 6;
		op[3:0] <= 4'b0010;
	end

	210:begin
		op[15:12] <= R_90;
		op[11:8] <= 6;
		op[7:4] <= 8;
		op[3:0] <= 4'b0010;
	end

	211:begin
		op[15:12] <= JMP;
		op[7:0] <= 8;
	end

	212:begin
		op[15:12] <= CHECK;
		op[11:8] <= 14;
		op[7:0] <= 9;
	end

	213:begin
		op[15:12] <= ZNJ;
		op[7:0] <= 8;
	end

//Z_180
	214:begin
		op[15:12] <= AND;
		op[11:8] <= 8;
		op[7:4] <= 4;
		op[3:0] <= 4;
	end

	215:begin
		op[15:12] <= R_180;
		op[11:8] <= 4;
		op[7:4] <= 7;
		op[3:0] <= 4'b0010;
	end

	216:begin
		op[15:12] <=R_180;
		op[11:8] <= 7;
		op[7:4] <= 8;
		op[3:0] <= 4'b0010;
	end

	217:begin
		op[15:12] <= AND;
		op[11:8] <= 8;
		op[7:4] <= 5;
		op[3:0] <= 5;
	end

	218:begin
		op[15:12] <= R_180;
		op[11:8] <= 5;
		op[7:4] <= 6;
		op[3:0] <= 4'b0010;
	end

	219:begin
		op[15:12] <= R_180;
		op[11:8] <= 6;
		op[7:4] <= 8;
		op[3:0] <= 4'b0010;
	end

	220:begin
		op[15:12] <= JMP;
		op[7:0] <= 8;
	end

//飛ばした分mを変える
	221:begin
		op[15:12] <= CHECK;
		op[11:8] <= 14;
		op[7:0] <= 0;
	end

	222:begin
		op[15:12] <= ZNJ;
		op[7:0] <= 26;
	end

	223:begin
		op[15:12] <= LI;
		op[11:8] <= 14;
		op[7:0] <= 3;
	end

	224:begin
		op[15:12] <= JMP;
		op[7:0] <= 26;
	end

	225:begin
		op[15:12] <= CHECK;
		op[11:8] <= 14;
		op[7:0] <= 3;
	end

	226:begin
		op[15:12] <= ZNJ;
		op[7:0] <= 41;
	end

	227:begin
		op[15:12] <= LI;
		op[11:8] <= 14;
		op[7:0] <= 6;
	end

	228:begin
		op[15:12] <= JMP;
		op[7:0] <= 41;
	end

	229:begin
	end

	endcase
end

endmodule
