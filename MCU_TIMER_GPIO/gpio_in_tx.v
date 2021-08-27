`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 27.08.2021 10:44:56
// Design Name: 
// Module Name: gpio_in_tx
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



module gpio_in_tx (pin,fun,gp_mem,uart_TX);
    inout pin;//outer world
    input [1:0] fun;//sel0,sel1
    inout gp_mem;
    input uart_TX;
    integer state=0;
    reg c0,c1,c2,ou_re;
   
    
    buff b0(pin,c0,gp_mem);
    buff b1(gp_mem,c1,pin);
    buff b2(uart_TX,c2,pin);
    always@(fun)
        begin
            case(fun)// say whoich function
                0:begin c0=1;c1=0;c2=0;end    //input 
                1: begin c0=0;c1=1;c2=0; end //output
                2: begin c0=0;c1=0;c2=1;end//uart_TX
                default:begin c0=0;c1=0;c2=0;end 
            endcase
        end   
endmodule
