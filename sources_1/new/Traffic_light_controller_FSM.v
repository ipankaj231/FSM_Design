`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 28.05.2025 23:02:13
// Design Name: 
// Module Name: traffic_light_controller
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


module Traffic_Light_Controller(
     

     input clk, rst,
     output reg[2:0] light_M1, light_M2, light_MT, light_S
);

     reg[2:0]count;
     parameter S1=0, S2= 1, S3 =2, S4= 3, S5= 4, S6= 5;
     reg[2:0] ps;
     parameter T_mg =7, T_y=2, T_tg = 5, T_sg = 3;


     always@(posedge clk or posedge rst)
       begin

           if(rst==1)
             begin
                ps<=S1;
                count<=0;
             end
            else

              case(ps)

                S1: if(count<T_mg)
                     begin

                        ps<=S1;
                        count<=count+1;
                     end
                    else
                     begin

                        ps<=S2;
                        count<=0;
                     end
                S2: if(count<T_y)

                     begin

                        ps<=S2;
                        count<=count+1;
                     end
                    else
                     begin

                        ps<=S3;
                        count<= 0;
                     end
                S3: if(count<T_tg)
                     begin

                        ps<= S3;
                        count <= count+1;
                     end
                    else
                     begin

                        ps<= S4;
                        count<=0;
                     end
                S4: if(count< T_y)
                     begin

                        ps <= S4;
                        count <= count+1;
                     end
                    else
                     begin
                        ps <= S5;
                        count <= 0;
                     end

                S5: if(count < T_sg)
                     begin

                        ps <= S5;
                        count <= count +1;
                     end

                    else
                     begin

                        ps <= S6;
                        count <= 0;
                     end
                S6: if(count < T_y)
                     begin

                        ps <= S6;
                        count <= count + 1;
                     end
                    else
                     begin

                        ps <= S1;
                        count <= 0;
                     end

                default: ps <= S1;
              endcase
         end

     always@(ps)

        begin

           case(ps)

             S1:
             begin

                 light_M1 <= 3'b001;
                 light_M2 <= 3'b001;
                 light_MT <= 3'b100;
                 light_S <= 3'b100;
             end
            
             S2:
             begin

                 light_M1 <= 3'b001;
                 light_M2 <= 3'b010;
                 light_MT <= 3'b100;
                 light_S <= 3'b100;
             end

             S3:
             begin
                 
                 light_M1 <= 3'b001;
                 light_M2 <= 3'b100;
                 light_MT <= 3'b001;
                 light_S <= 3'b100;
             end

             S4:
             begin

                 light_M1 <= 3'b010;
                 light_M2 <= 3'b100;
                 light_MT <= 3'b010;
                 light_S <= 3'b100;
             end

             S5:
             begin

                 light_M1 <= 3'b100;
                 light_M2 <= 3'b100;
                 light_MT <= 3'b100;
                 light_S <= 3'b001;
             end
             
             S6:
             begin

                 light_M1 <= 3'b100;
                 light_M2 <= 3'b100;
                 light_MT <= 3'b100;
                 light_S <= 3'b010;
             end

             default:
             begin
                 light_M1 <= 3'b00;
                 light_M2 <= 3'b000;
                 light_MT <= 3'b000;
                 light_S <= 3'b000;
             end

            endcase
        end
        
endmodule




