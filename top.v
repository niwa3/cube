//top.v
module top(clk, rst_n, mem20, mem21, mem22, mem23, mem24, mem25,mem26,mem27,mem28,mem29,mem30);
	input wire clk, rst_n;
	output wire [7:0] mem20,mem21,mem22,mem23,mem24,mem25,mem26,mem27,mem28,mem29,mem30;
	wire [15:0] imemop;
	wire [7:0] in0, in1, in2, out0, out1, out2, out3;
	wire sel1, sel2, regwe, pcwe, memwe, zf, zfin;
	wire [3:0] aluop, dst, src0, src1;
	wire [7:0] pcin, pc;


selB s0(.in0(in0), .in1(in1), .sel(sel1), .out(out0));
selB s1(.in0(out1), .in1(out2), .sel(sel2), .out(out3));
register r0(.src0(src0), .src1(src1), .dst(dst), .we(regwe), .data(out3), .data0(in1), .data1(in2), .rst_n(rst_n), .clk(clk));
alu a0(.in0(out0), .in1(in2), .op(aluop), .zf(zfin), .out(out1));
memory m0(.addr(in2), .din(out1), .dout(out2), .we(memwe), .rst_n(rst_n), .clk(clk), .mem20(mem20), .mem21(mem21), .mem22(mem22), .mem23(mem23), .mem24(mem24), .mem25(mem25), .mem26(mem26), .mem27(mem27), .mem28(mem28), .mem29(mem29), .mem30(mem30));
decoder d0(.pcin(pcin), .pcwe(pcwe), .dst(dst), .regwe(regwe), .src0(src0), .src1(src1), .sel1(sel1), .sel2(sel2), .data(in0), .aluop(aluop), .zf(zf), .memwe(memwe), .op(imemop));
pc p0(.pcin(pcin), .pcout(pc), .we(pcwe), .rst_n(rst_n), .clk(clk));
zf z0(.rst_n(rst_n), .zfin(zfin), .zfout(zf));
imem i0(.pc(pc), .op(imemop));

endmodule
