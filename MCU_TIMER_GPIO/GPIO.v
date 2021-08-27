`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 27.08.2021 10:41:27
// Design Name: 
// Module Name: GPIO
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


module GPIO(pin,pinsel0,pinsel1,gp_mem,uart_RX0,uart_TX0,IE0,IE1 ,uart_RX1,uart_TX1);
    inout [15:0]pin;
    input [15:0]pinsel0;
    input [15:0]pinsel1;
    inout [15:0]gp_mem;
    output IE0,IE1;//giving the the Intrrupt
    output  uart_RX0,uart_RX1;//giving to the UART
    input uart_TX0,uart_TX1;// taking form the UART
    
    wire [1:0]fun0,fun1,fun2,fun3,fun4,fun5,fun6,fun7,fun8,fun9,fun10,fun11,fun12,fun13,fun14,fun15;
    
    assign fun0=pinsel0[1:0];
    assign fun1=pinsel0[3:2];
    assign fun2=pinsel0[5:4];
    assign fun3=pinsel0[7:6];
    assign fun4=pinsel0[9:8];
    assign fun5=pinsel0[11:10];
    assign fun6=pinsel0[13:12];
    assign fun7=pinsel0[15:14];
    
    assign fun8=pinsel1[1:0];
    assign fun9=pinsel1[3:2];
    assign fun10=pinsel1[5:4];
    assign fun11=pinsel1[7:6];
    assign fun12=pinsel1[9:8];
    assign fun13=pinsel1[11:10];
    assign fun14=pinsel1[13:12];
    assign fun15=pinsel1[15:14];
    
    
    wire nouse15,nouse6,nouse7,nouse8,nouse9,nouse10,nouse11,nouse12,nouse13,nouse14;
    
    gpio_in gp0(pin[0],fun0,gp_mem[0],IE0);
    gpio_in gp1(pin[1],fun1,gp_mem[1],IE1);

    gpio_in gp2(pin[2],fun2,gp_mem[2],uart_RX0);
    gpio_in_tx gp3(pin[3],fun3,gp_mem[3],uart_TX0);
       
    gpio_in gp4(pin[4],fun4,gp_mem[4],uart_RX1);
    gpio_in_tx gp5(pin[5],fun5,gp_mem[5],uart_TX1);
       
    gpio_in gp6(pin[6],fun6,gp_mem[6],nouse6);
    gpio_in gp7(pin[7],fun7,gp_mem[7],nouse7);
       
    gpio_in gp8(pin[8],fun8,gp_mem[8],nouse8);
    gpio_in gp9(pin[9],fun9,gp_mem[9],nouse9);
       
    gpio_in gp10(pin[10],fun10,gp_mem[10],nouse10);
    gpio_in gp11(pin[11],fun11,gp_mem[11],nouse11);
       
    gpio_in gp12(pin[12],fun12,gp_mem[12],nouse12);
    gpio_in gp13(pin[13],fun13,gp_mem[13],nouse13);
       
    gpio_in gp14(pin[14],fun14,gp_mem[14],nouse14);
    gpio_in gp15(pin[15],fun15,gp_mem[15],nouse15);
     
endmodule
