module timer(init,clk,en,flag);
 input [15:0]init;
 inout clk,en;
 output reg flag=0;
 reg en1;
 reg [15:0]count;

 always@(posedge en)
 begin
 flag=0;
  count=init;
 end

 always@(posedge clk & en)
 begin
  if(flag==0 & en==1)
  begin
   count=count-1;
   if(count==0)
   flag=1;
  end
 end
 


//assign en=(flag)?0:1'bZ;
endmodule
