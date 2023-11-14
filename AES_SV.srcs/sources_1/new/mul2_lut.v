`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/17/2022 12:21:55 AM
// Design Name: 
// Module Name: mul2_lut
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

`timescale 1ns / 1ps

module mul2_lut(in,out);
    
input  [7:0] in;
output [7:0] out;
    
reg [7:0] out;
    
    
   always @(in)
    case (in)
        8'h0: out=8'h0;
        8'h1: out=8'h2;
        8'h2: out=8'h4;
        8'h3: out=8'h6;
        8'h4: out=8'h8;
        8'h5: out=8'h0a;
        8'h6: out=8'h0c;
        8'h7: out=8'h0e;
        8'h8: out=8'h10;
        8'h9: out=8'h12;
        8'hA: out=8'h14;
        8'hB: out=8'h16;
        8'hC: out=8'h18;
        8'hD: out=8'h1a;
        8'hE: out=8'h1c;
        8'hF: out=8'h1e;
        8'h10: out=8'h20;
        8'h11: out=8'h22;
        8'h12: out=8'h24;
        8'h13: out=8'h26;
        8'h14: out=8'h28;
        8'h15: out=8'h2a;
        8'h16: out=8'h2c;
        8'h17: out=8'h2e;
        8'h18: out=8'h30;
        8'h19: out=8'h32;
        8'h1A: out=8'h34;
        8'h1B: out=8'h36;
        8'h1C: out=8'h38;
        8'h1D: out=8'h3a;
        8'h1E: out=8'h3c;
        8'h1F: out=8'h3e;
        8'h20: out=8'h40;
        8'h21: out=8'h42;
        8'h22: out=8'h44;
        8'h23: out=8'h46;
        8'h24: out=8'h48;
        8'h25: out=8'h4a;
        8'h26: out=8'h4c;
        8'h27: out=8'h4e;
        8'h28: out=8'h50;
        8'h29: out=8'h52;
        8'h2A: out=8'h54;
        8'h2B: out=8'h56;
        8'h2C: out=8'h58;
        8'h2D: out=8'h5a;
        8'h2E: out=8'h5c;
        8'h2F: out=8'h5e;
        8'h30: out=8'h60;
        8'h31: out=8'h62;
        8'h32: out=8'h64;
        8'h33: out=8'h66;
        8'h34: out=8'h68;
        8'h35: out=8'h6a;
        8'h36: out=8'h6c;
        8'h37: out=8'h6e;
        8'h38: out=8'h70;
        8'h39: out=8'h72;
        8'h3A: out=8'h74;
        8'h3B: out=8'h76;
        8'h3C: out=8'h78;
        8'h3D: out=8'h7a;
        8'h3E: out=8'h7c;
        8'h3F: out=8'h7e;
        8'h40: out=8'h80;
        8'h41: out=8'h82;
        8'h42: out=8'h84;
        8'h43: out=8'h86;
        8'h44: out=8'h88;
        8'h45: out=8'h8a;
        8'h46: out=8'h8c;
        8'h47: out=8'h8e;
        8'h48: out=8'h90;
        8'h49: out=8'h92;
        8'h4A: out=8'h94;
        8'h4B: out=8'h96;
        8'h4C: out=8'h98;
        8'h4D: out=8'h9a;
        8'h4E: out=8'h9c;
        8'h4F: out=8'h9e;
        8'h50: out=8'ha0;
        8'h51: out=8'ha2;
        8'h52: out=8'ha4;
        8'h53: out=8'ha6;
        8'h54: out=8'ha8;
        8'h55: out=8'haa;
        8'h56: out=8'hac;
        8'h57: out=8'hae;
        8'h58: out=8'hb0;
        8'h59: out=8'hb2;
        8'h5A: out=8'hb4;
        8'h5B: out=8'hb6;
        8'h5C: out=8'hb8;
        8'h5D: out=8'hba;
        8'h5E: out=8'hbc;
        8'h5F: out=8'hbe;
        8'h60: out=8'hc0;
        8'h61: out=8'hc2;
        8'h62: out=8'hc4;
        8'h63: out=8'hc6;
        8'h64: out=8'hc8;
        8'h65: out=8'hca;
        8'h66: out=8'hcc;
        8'h67: out=8'hce;
        8'h68: out=8'hd0;
        8'h69: out=8'hd2;
        8'h6A: out=8'hd4;
        8'h6B: out=8'hd6;
        8'h6C: out=8'hd8;
        8'h6D: out=8'hda;
        8'h6E: out=8'hdc;
        8'h6F: out=8'hde;
        8'h70: out=8'he0;
        8'h71: out=8'he2;
        8'h72: out=8'he4;
        8'h73: out=8'he6;
        8'h74: out=8'he8;
        8'h75: out=8'hea;
        8'h76: out=8'hec;
        8'h77: out=8'hee;
        8'h78: out=8'hf0;
        8'h79: out=8'hf2;
        8'h7A: out=8'hf4;
        8'h7B: out=8'hf6;
        8'h7C: out=8'hf8;
        8'h7D: out=8'hfa;
        8'h7E: out=8'hfc;
        8'h7F: out=8'hfe;
        8'h80: out=8'h1b;
        8'h81: out=8'h19;
        8'h82: out=8'h1f;
        8'h83: out=8'h1d;
        8'h84: out=8'h13;
        8'h85: out=8'h11;
        8'h86: out=8'h17;
        8'h87: out=8'h15;
        8'h88: out=8'h0b;
        8'h89: out=8'h9;
        8'h8A: out=8'h0f;
        8'h8B: out=8'h0d;
        8'h8C: out=8'h3;
        8'h8D: out=8'h1;
        8'h8E: out=8'h7;
        8'h8F: out=8'h5;
        8'h90: out=8'h3b;
        8'h91: out=8'h39;
        8'h92: out=8'h3f;
        8'h93: out=8'h3d;
        8'h94: out=8'h33;
        8'h95: out=8'h31;
        8'h96: out=8'h37;
        8'h97: out=8'h35;
        8'h98: out=8'h2b;
        8'h99: out=8'h29;
        8'h9A: out=8'h2f;
        8'h9B: out=8'h2d;
        8'h9C: out=8'h23;
        8'h9D: out=8'h21;
        8'h9E: out=8'h27;
        8'h9F: out=8'h25;
        8'hA0: out=8'h5b;
        8'hA1: out=8'h59;
        8'hA2: out=8'h5f;
        8'hA3: out=8'h5d;
        8'hA4: out=8'h53;
        8'hA5: out=8'h51;
        8'hA6: out=8'h57;
        8'hA7: out=8'h55;
        8'hA8: out=8'h4b;
        8'hA9: out=8'h49;
        8'hAA: out=8'h4f;
        8'hAB: out=8'h4d;
        8'hAC: out=8'h43;
        8'hAD: out=8'h41;
        8'hAE: out=8'h47;
        8'hAF: out=8'h45;
        8'hB0: out=8'h7b;
        8'hB1: out=8'h79;
        8'hB2: out=8'h7f;
        8'hB3: out=8'h7d;
        8'hB4: out=8'h73;
        8'hB5: out=8'h71;
        8'hB6: out=8'h77;
        8'hB7: out=8'h75;
        8'hB8: out=8'h6b;
        8'hB9: out=8'h69;
        8'hBA: out=8'h6f;
        8'hBB: out=8'h6d;
        8'hBC: out=8'h63;
        8'hBD: out=8'h61;
        8'hBE: out=8'h67;
        8'hBF: out=8'h65;
        8'hC0: out=8'h9b;
        8'hC1: out=8'h99;
        8'hC2: out=8'h9f;
        8'hC3: out=8'h9d;
        8'hC4: out=8'h93;
        8'hC5: out=8'h91;
        8'hC6: out=8'h97;
        8'hC7: out=8'h95;
        8'hC8: out=8'h8b;
        8'hC9: out=8'h89;
        8'hCA: out=8'h8f;
        8'hCB: out=8'h8d;
        8'hCC: out=8'h83;
        8'hCD: out=8'h81;
        8'hCE: out=8'h87;
        8'hCF: out=8'h85;
        8'hD0: out=8'hbb;
        8'hD1: out=8'hb9;
        8'hD2: out=8'hbf;
        8'hD3: out=8'hbd;
        8'hD4: out=8'hb3;
        8'hD5: out=8'hb1;
        8'hD6: out=8'hb7;
        8'hD7: out=8'hb5;
        8'hD8: out=8'hab;
        8'hD9: out=8'ha9;
        8'hDA: out=8'haf;
        8'hDB: out=8'had;
        8'hDC: out=8'ha3;
        8'hDD: out=8'ha1;
        8'hDE: out=8'ha7;
        8'hDF: out=8'ha5;
        8'hE0: out=8'hdb;
        8'hE1: out=8'hd9;
        8'hE2: out=8'hdf;
        8'hE3: out=8'hdd;
        8'hE4: out=8'hd3;
        8'hE5: out=8'hd1;
        8'hE6: out=8'hd7;
        8'hE7: out=8'hd5;
        8'hE8: out=8'hcb;
        8'hE9: out=8'hc9;
        8'hEA: out=8'hcf;
        8'hEB: out=8'hcd;
        8'hEC: out=8'hc3;
        8'hED: out=8'hc1;
        8'hEE: out=8'hc7;
        8'hEF: out=8'hc5;
        8'hF0: out=8'hfb;
        8'hF1: out=8'hf9;
        8'hF2: out=8'hff;
        8'hF3: out=8'hfd;
        8'hF4: out=8'hf3;
        8'hF5: out=8'hf1;
        8'hF6: out=8'hf7;
        8'hF7: out=8'hf5;
        8'hF8: out=8'heb;
        8'hF9: out=8'he9;
        8'hFA: out=8'hef;
        8'hFB: out=8'hed;
        8'hFC: out=8'he3;
        8'hFD: out=8'he1;
        8'hFE: out=8'he7;
        8'hFF: out=8'he5;



	endcase

endmodule
 



