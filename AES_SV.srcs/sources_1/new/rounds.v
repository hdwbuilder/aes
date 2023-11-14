`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/19/2022 02:03:52 PM
// Design Name: 
// Module Name: enc_last_round
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////

module enc_rounds(clk,data,key,rndout);
input clk;
input [127:0]data;
input  [127:0]key;
output [127:0]rndout;

wire [127:0] sb,sr,mcl;

subbytes_enc t1(data,sb);
shiftrow_enc t2(sb,sr);
mixcolumn_enc t3(sr,mcl);
assign rndout= key^mcl;
endmodule

module enc_last_round(clk,rin,key,fout);
input clk;
input [127:0]rin;
input [127:0]key;
output [127:0]fout;

wire [127:0] sb,sr,mcl,keyout;

subbytes_enc t1(rin,sb);
shiftrow_enc t2(sb,sr);
assign fout= key^sr;
endmodule

module dec_first_round(clk,rin,keyin,fout);
input clk;
input [127:0]rin;
input [127:0]keyin;
output [127:0]fout;

wire [127:0] sb,sr,mcl;

subbytes_dec t1(sb,fout);
shiftrow_dec t2(sr,sb);
assign sr= keyin^rin;

endmodule

module dec_rounds(clk,data,keyin,rndout);
input clk;
input [127:0]data;
input [127:0]keyin;
output [127:0]rndout;

wire [127:0] sb,sr,mcl;

subbytes_dec t1(sb,rndout);
shiftrow_dec t2(sr,sb);
mixcolumn_dec t3(mcl,sr);
assign mcl= keyin^data;

endmodule
