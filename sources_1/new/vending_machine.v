`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05.06.2025 19:00:45
// Design Name: 
// Module Name: vending_machine
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


module vending_machine(
       
       input clk, rst,
       input [1:0] in,    //01 for 5 Rs, 10 for 10 Rs
       output reg out, 
       output reg[1:0] change

);
    

       reg[1:0] current_state, next_state;

       parameter s0 = 2'b00;
       parameter s1 = 2'b01;
       parameter s2 = 2'b10;

       always@(posedge clk)
        begin
         if(rst == 1)
          begin
           current_state = 0;
           next_state = 0;
           change =0;
          end
         else
          current_state = next_state;

         case(current_state)
          s0:
          if(in == 2'b00)
           begin
            next_state = s0;
            out =0;
            change = 2'b00;
           end
          else if(in == 2'b01)
             begin
              next_state = s1;
              out = 0;
              change = 2'b00;
             end
           
          else if(in == 2'b10)
             begin
              next_state = s2;
              out =0;
              change = 2'b00;
             end

          s1:
          if(in == 2'b00)
           begin
            next_state = s0;
            out =0;
            change = 2'b01;
           end
          else if(in == 2'b01)
           begin
            next_state = s2;
            out =0;
            change =2'b00;
           end
          else if(in == 2'b10)
           begin
            next_state = s0;
            out =1;
            change = 2'b00;
           end


          s2:
          if(in == 2'b00)
           begin
            next_state = s0;
            out =0;
            change =2'b10;
           end

          else if(in == 2'b01)
           begin
            next_state = s0;
            out =1 ;
            change = 2'b00;
           end
          else if(in == 2'b10)
           begin
            next_state = s0;
            out =1;
            change = 2'b01;
           end
          endcase
        end
endmodule

         
          
