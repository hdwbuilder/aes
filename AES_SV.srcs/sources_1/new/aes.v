`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/20/2022 11:52:49 AM
// Design Name: 
// Module Name: aes
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


module aes(
 input  wire clk,
 //input  wire [127:0] plain_text,key,
 output wire [127:0] encrypt_text, decrypt_text
 );
    
   // plain_text = 128'h54776F204F6E65204E696E652054776F;
     //   key = 128'h5468617473206D79204B756E67204675;
 //aes_main a1(.clk(clk),.plain_text(plain_text),.key(key),.encrypt_text(encrypt_text),.decrypt_text(decrypt_text));  
 aes_main a1(.clk(clk),.plain_text(128'h54776F204F6E65204E696E652054776F),
             .key(128'h5468617473206D79204B756E67204675),
             .encrypt_text(encrypt_text),
             .decrypt_text(decrypt_text));  
endmodule

