`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 31.08.2021 10:49:17
// Design Name: 
// Module Name: interrupt
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


module interrupt(en_0,int_0,m_0,it_0,out_0);
input en_0,int_0,m_0,it_0;
output out_0;
reg pointe,neinte,linp,linn;
reg countp, countn;

initial 
    begin
        neinte<=1'b0;
        pointe<=1'b0;
        linn<=1'b0;
        linp<=1'b0;
        countp<=1;
        countn<=1;
    end
assign out_0=en_0?(m_0?(it_0?pointe:neinte):(it_0?linp:linn)):1'b0;

always@(posedge int_0)
    begin
        if(en_0==1)
        begin
               pointe=1;  
        end
    end
              
    
always@(negedge int_0)
    begin
        if(en_0==1)
            begin
              neinte=1;  
            end
    end
    
   
always@(en_0)
        begin
            if(en_0==0)
            begin
                neinte<=1'b0;
                pointe<=1'b0;
                linn<=1'b0;
                linp<=1'b0;
                countp<=1;
                countn<=1;
            end
        end      

always @*
    begin
        if (int_0==1&en_0==1)
        begin
            if (countp==1)
                begin
                    linp<=1;
                    countp<=0;
                end
        end
               
        if (int_0==0&en_0==1)
           begin
               if (countn==1)
                   begin
                      linn<=1;
                      countn<=0;
                   end
           end
    end       
endmodule
