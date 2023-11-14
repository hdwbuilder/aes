`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Shrey Malhotra(sm10141) and Vivek Khithani(vk2279)
// 
// Create Date: 02/19/2022 01:14:16 PM
// Design Name: 
// Module Name: aes_main
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
module aes_test_bench(
);
	reg clk = 0;
	reg [7:0] bit_count = 0, byte_index = 0;
	reg [2:0] bit_count8 = 0;
	
	reg [127:0]plain_text = 128'h00112233445566778899aabbccddeeff;
	reg [127:0]cipher_text = 128'h69c4e0d86a7b0430d8cdb78070b4c55a;	
	reg [127:0]key = 128'h000102030405060708090a0b0c0d0e0f;
	reg [127:0]buffer = 0;
	
	reg [7:0]data_in = 0;
	wire [7:0]data_out; 
	
	wire encrypt_strobe;
	wire decrypt_strobe;
	
	reg [127:0]encrypt_out = 0;
	reg [127:0]decrypt_out = 0;


   aes_main uut(
   .clk(clk),
   .data_in(data_in),
   .data_out(data_out),
   .encrypt_done(encrypt_strobe),
   .decrypt_done(decrypt_strobe)
   );
         
    always begin 
      #5 clk <= ~clk;
      
    end

	initial begin
	
     for( bit_count = 0; bit_count < 128 ; bit_count = bit_count+1) begin
      data_in[bit_count8] = plain_text[bit_count];
      bit_count8 = bit_count8 + 1;
      if(  bit_count%8 == 7 ) 
       begin  
        #10; 
        bit_count8 = 0; 
       end 
     end
      bit_count =0;
     
    
     for( bit_count = 0;  bit_count < 128 ; bit_count = bit_count +1) begin
      data_in[bit_count8] = key[ bit_count];
      bit_count8 = bit_count8 + 1;
      if( bit_count%8 == 7 ) 
       begin  
        #10; 
        bit_count8 = 0; 
       end 
      end  
 
    #130
   
     
    for( bit_count = 0;  bit_count < 128 ; bit_count = bit_count +1) begin
      buffer[bit_count] = data_out[bit_count8];
      bit_count8 = bit_count8 + 1;
      if( bit_count%8 == 7 ) 
       begin  
        #10; 
        bit_count8 = 0; 
       end 
      end
 
    encrypt_out <= buffer;
    bit_count8 = 0; 
    buffer = 0;
    #10
    for( bit_count = 0;  bit_count < 128 ; bit_count = bit_count +1) begin
      buffer[bit_count] = data_out[bit_count8];
      bit_count8 = bit_count8 + 1;
      if( bit_count%8 == 7 ) 
       begin  
        #10; 
        bit_count8 = 0; 
       end 
      end
      decrypt_out <= buffer;
     
    
        #200
     
            if(encrypt_out != cipher_text) $display("Incorrect Encryption ");
            if(decrypt_out != plain_text) $display("Incorrect Decryption ");

          
        $display("Encryption & Decryption are successful!!");
        $finish;
	end
endmodule

