`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 29.09.2025 19:38:39
// Design Name: 
// Module Name: fsm
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


module pattern_detection_FSM(
       
       input clk,reset,
       input x,
       output reg out
);
    reg [4:0] state, next_state;

    parameter A=0, B=1, C=2, D=3, E=4;
    
    
    //state transition logic
    always@(*)begin
        case(state)
           
           A: next_state = (x == 1'b1) ? B: A;
           B: next_state = (x==1'b0) ? C: B;
           C: next_state = (x==1'b1)? D:A;
           D: next_state = (x==1'b0) ? E: B;
           E: next_state = (x==1'b1)? D: A;
           default: next_state = A;
          endcase
    end
    
    always@(posedge clk)begin
       if(reset)
          state<= A;
        else
           state<= next_state;
    end 
    
    //output logic
    always@(*)begin
      case(state)
        A: out <= 0;
        B: out <= 0;
        C: out <= 0;
        D: out <= 0;
        E: out <= 1;
        default: out <= 0;
      endcase 
    end
endmodule
    

