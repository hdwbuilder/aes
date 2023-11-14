`timescale 1ns / 1ps

module mixcolumn_enc(in,out);
input [127:0] in;
output [127:0] out;

/*Defining Wires for LUT outputs to compute multiply by 2 and 3 */
wire [127:0] lut2,lut3;

/*Multiplying all bytes by 2*/
 mul2_lut s0(.in(in[127:120]),.out(lut2[127:120]));
 mul2_lut s1(.in(in[119:112]),.out(lut2[119:112]));
 mul2_lut s2(.in(in[111:104]),.out(lut2[111:104]));
 mul2_lut s3(.in(in[103:96]),.out(lut2[103:96]));    
 mul2_lut s4(.in(in[95:88]),.out(lut2[95:88]));
 mul2_lut s5(.in(in[87:80]),.out(lut2[87:80]));
 mul2_lut s6(.in(in[79:72]),.out(lut2[79:72]));
 mul2_lut s7(.in(in[71:64]),.out(lut2[71:64]));     
 mul2_lut s8(.in(in[63:56]),.out(lut2[63:56]));
 mul2_lut s9(.in(in[55:48]),.out(lut2[55:48]));
 mul2_lut s10(.in(in[47:40]),.out(lut2[47:40]));
 mul2_lut s11(.in(in[39:32]),.out(lut2[39:32]));     
 mul2_lut s12(.in(in[31:24]),.out(lut2[31:24]));
 mul2_lut s13(.in(in[23:16]),.out(lut2[23:16]));
 mul2_lut s14(.in(in[15:8]),.out(lut2[15:8]));
 mul2_lut s15(.in(in[7:0]),.out(lut2[7:0]));
 
 /*Multiplying all bytes by 3*/
 mul3_lut s20(.in(in[127:120]),.out(lut3[127:120]));
 mul3_lut s21(.in(in[119:112]),.out(lut3[119:112]));
 mul3_lut s22(.in(in[111:104]),.out(lut3[111:104]));
 mul3_lut s23(.in(in[103:96]),.out(lut3[103:96]));    
 mul3_lut s24(.in(in[95:88]),.out(lut3[95:88]));
 mul3_lut s25(.in(in[87:80]),.out(lut3[87:80]));
 mul3_lut s26(.in(in[79:72]),.out(lut3[79:72]));
 mul3_lut s27(.in(in[71:64]),.out(lut3[71:64]));     
 mul3_lut s28(.in(in[63:56]),.out(lut3[63:56]));
 mul3_lut s29(.in(in[55:48]),.out(lut3[55:48]));
 mul3_lut s30(.in(in[47:40]),.out(lut3[47:40]));
 mul3_lut s31(.in(in[39:32]),.out(lut3[39:32]));     
 mul3_lut s32(.in(in[31:24]),.out(lut3[31:24]));
 mul3_lut s33(.in(in[23:16]),.out(lut3[23:16]));
 mul3_lut s34(.in(in[15:8]),.out(lut3[15:8]));
 mul3_lut s35(.in(in[7:0]),.out(lut3[7:0]));

/*Multiplying based on the Mixcolumn Matrix*/
/*Column 1*/
assign out[127:120]= lut2[127:120] ^ lut3[119:112] ^ in[111:104] ^ in[103:96];
assign out[119:112]= in[127:120] ^ lut2[119:112] ^ lut3[111:104] ^ in[103:96];
assign out[111:104]= in[127:120] ^ in[119:112] ^ lut2[111:104] ^ lut3[103:96];
assign out[103:96]= lut3[127:120] ^ in[119:112] ^ in[111:104] ^ lut2[103:96];
/*Column 2*/
assign out[95:88]= lut2[95:88] ^ lut3[87:80] ^ in[79:72] ^ in[71:64];
assign out[87:80]= in[95:88] ^ lut2[87:80] ^ lut3[79:72] ^ in[71:64];
assign out[79:72]= in[95:88] ^ in[87:80] ^ lut2[79:72] ^ lut3[71:64];
assign out[71:64]= lut3[95:88] ^ in[87:80] ^ in[79:72] ^ lut2[71:64];
/*Column 3*/
assign out[63:56]= lut2[63:56] ^ lut3[55:48] ^ in[47:40] ^ in[39:32];
assign out[55:48]= in[63:56] ^ lut2[55:48] ^ lut3[47:40] ^ in[39:32];
assign out[47:40]= in[63:56] ^ in[55:48] ^ lut2[47:40] ^ lut3[39:32];
assign out[39:32]= lut3[63:56] ^ in[55:48] ^ in[47:40] ^ lut2[39:32];
/*Column 4*/
assign out[31:24]= lut2[31:24] ^ lut3[23:16] ^ in[15:8] ^ in[7:0];
assign out[23:16]= in[31:24] ^ lut2[23:16] ^ lut3[15:8] ^ in[7:0];
assign out[15:8]= in[31:24] ^ in[23:16] ^ lut2[15:8] ^ lut3[7:0];
assign out[7:0] = lut3[31:24] ^ in[23:16] ^ in[15:8] ^ lut2[7:0];

endmodule


module mixcolumn_dec(in,out);
input [127:0] in;
output [127:0] out;

wire [127:0] lut14,lut13,lut11,lut9;

 mul9_lut n0( .in(in[127:120]),.out(lut9[127:120]));
 mul9_lut n1( .in(in[119:112]),.out(lut9[119:112]));
 mul9_lut n2( .in(in[111:104]),.out(lut9[111:104]));
 mul9_lut n3( .in(in[103:96]),.out(lut9[103:96]));     
 mul9_lut n4( .in(in[95:88]),.out(lut9[95:88]));
 mul9_lut n5( .in(in[87:80]),.out(lut9[87:80]));
 mul9_lut n6( .in(in[79:72]),.out(lut9[79:72]));
 mul9_lut n7( .in(in[71:64]),.out(lut9[71:64]));     
 mul9_lut n8( .in(in[63:56]),.out(lut9[63:56]));
 mul9_lut n9( .in(in[55:48]),.out(lut9[55:48]));
 mul9_lut n10(.in(in[47:40]),.out(lut9[47:40]));
 mul9_lut n11(.in(in[39:32]),.out(lut9[39:32]));     
 mul9_lut n12(.in(in[31:24]),.out(lut9[31:24]));
 mul9_lut n13(.in(in[23:16]),.out(lut9[23:16]));
 mul9_lut n14(.in(in[15:8]),.out(lut9[15:8]));
 mul9_lut n16(.in(in[7:0]),.out(lut9[7:0]));
 
 mul11_lut o0( .in(in[127:120]),.out(lut11[127:120]));
 mul11_lut o1( .in(in[119:112]),.out(lut11[119:112]));
 mul11_lut o2( .in(in[111:104]),.out(lut11[111:104]));
 mul11_lut o3( .in(in[103:96]),.out(lut11[103:96]));     
 mul11_lut o4( .in(in[95:88]),.out(lut11[95:88]));
 mul11_lut o5( .in(in[87:80]),.out(lut11[87:80]));
 mul11_lut o6( .in(in[79:72]),.out(lut11[79:72]));
 mul11_lut o7( .in(in[71:64]),.out(lut11[71:64]));     
 mul11_lut o8( .in(in[63:56]),.out(lut11[63:56]));
 mul11_lut o9( .in(in[55:48]),.out(lut11[55:48]));
 mul11_lut o10(.in(in[47:40]),.out(lut11[47:40]));
 mul11_lut o11(.in(in[39:32]),.out(lut11[39:32]));     
 mul11_lut o12(.in(in[31:24]),.out(lut11[31:24]));
 mul11_lut o13(.in(in[23:16]),.out(lut11[23:16]));
 mul11_lut o14(.in(in[15:8]),.out(lut11[15:8]));
 mul11_lut o16(.in(in[7:0]),.out(lut11[7:0]));

 mul14_lut s0( .in(in[127:120]),.out(lut14[127:120]));
 mul14_lut s1( .in(in[119:112]),.out(lut14[119:112]));
 mul14_lut s2( .in(in[111:104]),.out(lut14[111:104]));
 mul14_lut s3( .in(in[103:96]),.out(lut14[103:96]));    
 mul14_lut s4( .in(in[95:88]),.out(lut14[95:88]));
 mul14_lut s5( .in(in[87:80]),.out(lut14[87:80]));
 mul14_lut s6( .in(in[79:72]),.out(lut14[79:72]));
 mul14_lut s7( .in(in[71:64]),.out(lut14[71:64]));     
 mul14_lut s8( .in(in[63:56]),.out(lut14[63:56]));
 mul14_lut s9( .in(in[55:48]),.out(lut14[55:48]));
 mul14_lut s10(.in(in[47:40]),.out(lut14[47:40]));
 mul14_lut s11(.in(in[39:32]),.out(lut14[39:32]));     
 mul14_lut s12(.in(in[31:24]),.out(lut14[31:24]));
 mul14_lut s13(.in(in[23:16]),.out(lut14[23:16]));
 mul14_lut s14(.in(in[15:8]),.out(lut14[15:8]));
 mul14_lut s16(.in(in[7:0]),.out(lut14[7:0]));

 mul13_lut p0( .in(in[127:120]),.out(lut13[127:120]));
 mul13_lut p1( .in(in[119:112]),.out(lut13[119:112]));
 mul13_lut p2( .in(in[111:104]),.out(lut13[111:104]));
 mul13_lut p3( .in(in[103:96]),.out(lut13[103:96]));   
 mul13_lut p4( .in(in[95:88]),.out(lut13[95:88]));
 mul13_lut p5( .in(in[87:80]),.out(lut13[87:80]));
 mul13_lut p6( .in(in[79:72]),.out(lut13[79:72]));
 mul13_lut p7( .in(in[71:64]),.out(lut13[71:64]));
 mul13_lut p8( .in(in[63:56]),.out(lut13[63:56]));
 mul13_lut p9( .in(in[55:48]),.out(lut13[55:48]));
 mul13_lut p10(.in(in[47:40]),.out(lut13[47:40]));
 mul13_lut p11(.in(in[39:32]),.out(lut13[39:32]));
 mul13_lut p12(.in(in[31:24]),.out(lut13[31:24]));
 mul13_lut p13(.in(in[23:16]),.out(lut13[23:16]));
 mul13_lut p14(.in(in[15:8]),.out(lut13[15:8]));
 mul13_lut p16(.in(in[7:0]),.out(lut13[7:0]));
     

     
/*Multiplying based on the Mixcolumn Matrix*/
/*Column 1*/
assign out[127:120]= lut14[127:120] ^ lut11[119:112] ^ lut13[111:104] ^ lut9[103:96];
assign out[119:112]= lut14[119:112] ^ lut11[111:104] ^ lut13[103:96] ^ lut9[127:120];
assign out[111:104]= lut14[111:104] ^ lut11[103:96] ^ lut13[127:120] ^ lut9[119:112];
assign out[103:96]= lut14[103:96] ^ lut11[127:120] ^ lut13[119:112] ^ lut9[111:104];
/*Column 2*/
assign out[95:88]= lut14[95:88] ^ lut11[87:80] ^ lut13[79:72] ^ lut9[71:64];
assign out[87:80]= lut14[87:80] ^ lut11[79:72] ^ lut13[71:64] ^ lut9[95:88];
assign out[79:72]= lut14[79:72] ^ lut11[71:64] ^ lut13[95:88] ^ lut9[87:80];
assign out[71:64]= lut14[71:64] ^ lut11[95:88] ^ lut13[87:80] ^ lut9[79:72];
/*Column 3*/
assign out[63:56]= lut14[63:56] ^ lut11[55:48] ^ lut13[47:40] ^ lut9[39:32];
assign out[55:48]= lut14[55:48] ^ lut11[47:40] ^ lut13[39:32] ^ lut9[63:56];
assign out[47:40]= lut14[47:40] ^ lut11[39:32] ^ lut13[63:56] ^ lut9[55:48];
assign out[39:32]= lut14[39:32] ^ lut11[63:56] ^ lut13[55:48] ^ lut9[47:40];
/*Column 4*/
assign out[31:24]= lut14[31:24] ^ lut11[23:16] ^ lut13[15:8] ^ lut9[7:0];
assign out[23:16]= lut14[23:16] ^ lut11[15:8] ^ lut13[7:0] ^ lut9[31:24];
assign out[15:8]= lut14[15:8] ^ lut11[7:0] ^ lut13[31:24] ^ lut9[23:16];
assign out[7:0]= lut14[7:0] ^ lut11[31:24] ^ lut13[23:16] ^ lut9[15:8];

endmodule
