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


module aes_main(
 input wire clk,
 input wire [7:0] data_in,
 output reg [7:0] data_out,
 output reg encrypt_done,
 output reg decrypt_done
 );
    initial begin data_out[7:0] = 0; end
    reg [1:0] state = 0;
    reg start_data_out = 0, encrypt_done = 0, decrypt_done = 0; 
    reg [3:0] index = 0;
    reg [127:0] enc_rnd_input, dec_rnd_input, expanded_keys[0:9];
    reg [4:0] i = 0, v = 0;
    reg [1:0] j = 0, s = 0; 
    
    reg [127:0] plain_text = 0, key = 0, encrypt_text = 0, decrypt_text = 0, buffer = 0;
    
    wire [127:0] encrypt_tmp, 
                 decrypt_tmp, 
                 enc_rnd_output, 
                 key_output,
                 dec_rnd_output;             
	
	always @(posedge clk) begin 
	if (j == 2) begin 
        case(state)
         default: begin 
                index = 0;
                if ( decrypt_text != plain_text)
                 begin
                 state <= 2'd1;
                 encrypt_done <= 1'b0;
                 enc_rnd_input <= plain_text ^ key;
                 expanded_keys[0] <= key;
                end 
                end        
        
          2'd1: begin 
                if(index<9) begin 
                 index<=index+1;
                 enc_rnd_input <= enc_rnd_output;
                 expanded_keys[index+1] <= key_output;
                end     
                else begin 
                 encrypt_text <= encrypt_tmp;
                 encrypt_done <= 1'b1;
                 state <= 2'd2;
                end   
               end  
         2'd2: begin                   
                if(index == 0) begin 
                  decrypt_text <= decrypt_tmp ^ expanded_keys[0];
                  decrypt_done <= 1'b1;
                  state <=2'd0;
                 end 
                 else begin 
                 if(index == 9) dec_rnd_input <= dec_rnd_output; 
                 else dec_rnd_input <= decrypt_tmp;
                 index <= index -1; 
                 end
               end  
        endcase
	 end 
    end
	
	always@(posedge clk) begin
	if (j <= 1) begin
	case(i)
	4'd0: begin 
	      buffer[7:0] <= data_in[7:0];
	      i <= 4'd1;
	      end  
	4'd1: begin 
	      buffer[15:8] <= data_in[7:0];
	      i <= 4'd2;
	      end  
	4'd2: begin 
	      buffer[23:16] <= data_in[7:0];
	      i <= 4'd3;
	      end  
	4'd3: begin 
	      buffer[31:24] <= data_in[7:0];
	      i <= 4'd4;
	      end  
	4'd4: begin 
	      buffer[39:32] <= data_in[7:0];
	      i <= 4'd5;
	      end  
	4'd5: begin 
	      buffer[47:40] <= data_in[7:0];
	      i <= 4'd6;
	      end  
	4'd6: begin 
	      buffer[55:48] <= data_in[7:0];
	      i <= 4'd7;
	      end  
	4'd7: begin 
	      buffer[63:56] <= data_in[7:0];
	      i <= 4'd8;
	      end  
	4'd8: begin 
	      buffer[71:64] <= data_in[7:0];
	      i <= 4'd9;
	      end  
	4'd9: begin 
	      buffer[79:72] <= data_in[7:0];
	      i <= 4'd10;
	      end  
	4'd10:begin 
	      buffer[87:80] <= data_in[7:0];
	      i <= 4'd11;
	      end  
	4'd11:begin 
	      buffer[95:88] <= data_in[7:0];
	      i <= 4'd12;
	      end  
	4'd12:begin 
	      buffer[103:96] <= data_in[7:0];
	      i <= 4'd13;
	      end  
	4'd13:begin 
	      buffer[111:104] <= data_in[7:0];
	      i <= 4'd14;
	      end  
	4'd14:begin 
	      buffer[119:112] <= data_in[7:0];
	      i <= 4'd15;
	      end  
	4'd15:begin 
	      buffer[127:120] <= data_in[7:0];
	      i <= 4'd0;
	      if ( j == 0) plain_text[127:0] <= buffer[127:0];
	      if ( j == 1) key[127:0] <= buffer[127:0];  
	      j <= j + 1;
	      end        
	 endcase    
	end      
 end
 

  always@(posedge clk) begin
  if ((encrypt_done == 1'b1) && (decrypt_done == 1'b0)) begin  
   buffer[127:0] <= encrypt_text; 
   start_data_out <= 1'b1;
  end 
  
  if ((encrypt_done == 1'b0) && (decrypt_done == 1'b1)) begin
   buffer[127:0] <= decrypt_text;
   
   start_data_out <= 1'b1;
   decrypt_done <= 1'b0;
  end

  if  (start_data_out == 1'b1) begin	    	    
	case(v)
	4'd0: begin 
	      data_out[7:0] <= buffer[7:0];
	      v <=  4'd1;
	      end  
	4'd1: begin 
	      data_out[7:0] <=  buffer[15:8];
	      v <=  4'd2;
	      end  
	4'd2: begin 
	      data_out[7:0] <= buffer[23:16];
	      v <=  4'd3;
	      end  
	4'd3: begin 
          data_out[7:0] <= buffer[31:24];
	      v <=  4'd4;
	      end  
	4'd4: begin 
	      data_out[7:0] <= buffer[39:32];
	      v <=  4'd5;
	      end  
	4'd5: begin 
	      data_out[7:0] <= buffer[47:40];
	      v <=  4'd6;
	      end  
	4'd6: begin 
	      data_out[7:0] <=  buffer[55:48];
	      v <=  4'd7;
	      end  
	4'd7: begin 
	      data_out[7:0] <=  buffer[63:56];
	      v <=  4'd8;
	      end  
	4'd8: begin 
	      data_out[7:0] <= buffer[71:64];
	      v <=  4'd9;
	      end  
	4'd9: begin 
	      data_out[7:0] <= buffer[79:72];
	      v <=  4'd10;
	      end  
	4'd10:begin 
	      data_out[7:0] <= buffer[87:80];
	      v <=  4'd11;
	      end  
	4'd11:begin 
	      data_out[7:0] <= buffer[95:88];
	      v <=  4'd12;
	      end  
	4'd12:begin 
	      data_out[7:0] <= buffer[103:96];
	      v <=  4'd13;
	      end  
	4'd13:begin 
	      data_out[7:0] <=  buffer[111:104];
	      v <=  4'd14;
	      end  
	4'd14:begin 
	      data_out[7:0] <= buffer[119:112];
	      v <=  4'd15;
	      end  
	4'd15:begin 
	      data_out[7:0] <= buffer[127:120];
	      v <=  4'd0;
	      start_data_out <= 1'b0;
	      encrypt_done <= 0;
	      end        
	 endcase    
	end      
 end
 	
	key_expansion k1(expanded_keys[index],index,key_output);
	 
    enc_rounds re1(.clk(clk),.data(enc_rnd_input),.key(key_output),.rndout(enc_rnd_output));
    enc_last_round re10(.clk(clk),.rin(enc_rnd_input),.key(key_output),.fout(encrypt_tmp));
    
    dec_first_round rd1(.clk(clk),.rin(encrypt_tmp),.keyin(key_output),.fout(dec_rnd_output));
    dec_rounds rd10 (.clk(clk),.data(dec_rnd_input),.keyin(expanded_keys[index+1]),.rndout(decrypt_tmp));
        
endmodule
