`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/19/2022 02:00:41 PM
// Design Name: 
// Module Name: key_expansion
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


module key_expansion(key_in,rcon_indx,key_out);
   input  [127:0]key_in; 
   input  [3:0] rcon_indx;
   output [127:0] key_out;
   
   wire [31:0] temp, prev_key0,prev_key1,prev_key2, prev_key3;
         
    assign prev_key0 = key_in[127:96];
    assign prev_key1 = key_in[95:64];
    assign prev_key2 = key_in[63:32];
    assign prev_key3 = key_in[31:0];
    
    
    assign key_out[127:96]= prev_key0^temp^rcon(rcon_indx);
    assign key_out[95:64] = prev_key0^temp^rcon(rcon_indx)^prev_key1;
    assign key_out[63:32] = prev_key0^temp^rcon(rcon_indx)^prev_key1^prev_key2;
    assign key_out[31:0]  = prev_key0^temp^rcon(rcon_indx)^prev_key1^prev_key2^prev_key3;
    
    
    sbox a1(.in(prev_key3[23:16]),.out(temp[31:24]));
    sbox a2(.in(prev_key3[15:8]),.out(temp[23:16]));
    sbox a3(.in(prev_key3[7:0]),.out(temp[15:8]));
    sbox a4(.in(prev_key3[31:24]),.out(temp[7:0]));
       
     function [31:0] rcon;
      input	[3:0]	rcon_indx;
      case(rcon_indx)	
         4'h0: rcon =32'h01000000;
         4'h1: rcon =32'h02000000;
         4'h2: rcon =32'h04000000;
         4'h3: rcon =32'h08000000;
         4'h4: rcon =32'h10000000;
         4'h5: rcon =32'h20000000;
         4'h6: rcon =32'h40000000;
         4'h7: rcon =32'h80000000;
         4'h8: rcon =32'h1b000000;
         4'h9: rcon =32'h36000000;
         default: rcon_indx=32'h00000000;
       endcase
     endfunction

endmodule
