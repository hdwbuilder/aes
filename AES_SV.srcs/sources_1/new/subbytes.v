`timescale 1ns / 1ps

module subbytes_enc(data,sb);

input [127:0] data;
output [127:0] sb;

     sbox s0( .in(data[127:120]),.out(sb[127:120]) );
     sbox s1( .in(data[119:112]),.out(sb[119:112]) );
     sbox s2( .in(data[111:104]),.out(sb[111:104]) );
     sbox s3( .in(data[103:96]),.out(sb[103:96]) );
     
     sbox s4( .in(data[95:88]),.out(sb[95:88]) );
     sbox s5( .in(data[87:80]),.out(sb[87:80]) );
     sbox s6( .in(data[79:72]),.out(sb[79:72]) );
     sbox s7( .in(data[71:64]),.out(sb[71:64]) );
     
     sbox s8( .in(data[63:56]),.out(sb[63:56]) );
     sbox s9( .in(data[55:48]),.out(sb[55:48]) );
     sbox s10(.in(data[47:40]),.out(sb[47:40]) );
     sbox s11(.in(data[39:32]),.out(sb[39:32]) );
     
     sbox s12(.in(data[31:24]),.out(sb[31:24]) );
     sbox s13(.in(data[23:16]),.out(sb[23:16]) );
     sbox s14(.in(data[15:8]),.out(sb[15:8]) );
     sbox s16(.in(data[7:0]),.out(sb[7:0]) );
	  
endmodule

module subbytes_dec(data,sb);

input [127:0] data;
output [127:0] sb;

     sboxi si0( .in(data[127:120]),.out(sb[127:120]) );
     sboxi si1( .in(data[119:112]),.out(sb[119:112]) );
     sboxi si2( .in(data[111:104]),.out(sb[111:104]) );
     sboxi si3( .in(data[103:96]),.out(sb[103:96]) );
     
     sboxi si4( .in(data[95:88]),.out(sb[95:88]) );
     sboxi si5( .in(data[87:80]),.out(sb[87:80]) );
     sboxi si6( .in(data[79:72]),.out(sb[79:72]) );
     sboxi si7( .in(data[71:64]),.out(sb[71:64]) );
     
     sboxi si8( .in(data[63:56]),.out(sb[63:56]) );
     sboxi si9( .in(data[55:48]),.out(sb[55:48]) );
     sboxi si10(.in(data[47:40]),.out(sb[47:40]) );
     sboxi si11(.in(data[39:32]),.out(sb[39:32]) );
     
     sboxi si12(.in(data[31:24]),.out(sb[31:24]) );
     sboxi si13(.in(data[23:16]),.out(sb[23:16]) );
     sboxi si14(.in(data[15:8]),.out(sb[15:8]) );
     sboxi si16(.in(data[7:0]),.out(sb[7:0]) );
	  
endmodule

