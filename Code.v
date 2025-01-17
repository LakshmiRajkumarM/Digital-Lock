// Decimal to Binary Converter
module converter(input [3:0]A,output reg B3,B2,B1,B0);

always @(*)begin
case(A)
0:{B3,B2,B1,B0}<=4'b0000;
1:{B3,B2,B1,B0}<=4'b0001;
2:{B3,B2,B1,B0}<=4'b0010;
3:{B3,B2,B1,B0}<=4'b0011;
4:{B3,B2,B1,B0}<=4'b0100;
5:{B3,B2,B1,B0}<=4'b0101;
6:{B3,B2,B1,B0}<=4'b0110;
7:{B3,B2,B1,B0}<=4'b0111;
8:{B3,B2,B1,B0}<=4'b1000;
9:{B3,B2,B1,B0}<=4'b1001;
10:{B3,B2,B1,B0}<=4'b1010;
11:{B3,B2,B1,B0}<=4'b1011;
12:{B3,B2,B1,B0}<=4'b1100;
13:{B3,B2,B1,B0}<=4'b1101;
14:{B3,B2,B1,B0}<=4'b1110;
15: {B3,B2,B1,B0}<=4'b1111;
endcase
end
endmodule

// Shift Register
module shiftreg4(input [3:0]shift_inp,input clk,rst,output reg[3:0]shift_out);
always @(posedge clk)begin
if(rst)begin
shift_out[0]=0;
shift_out[1]=0;
shift_out[2]=0;
shift_out[3]=0;
end
else 
begin
shift_out[0]<=shift_inp[0];
shift_out[1]<=shift_inp[1];
shift_out[2]<=shift_inp[2];
shift_out[3]<=shift_inp[3];
end

end

endmodule

// Top Module
module lock(input [3:0]dec,input clk,input rst,output y);
wire b3,b2,b1,b0;
wire y0,y1,y2,y3,y4,y5,y6,y7,y8,y9,y10,y11,y12,y13,y15; 

converter f1(dec,b3,b2,b1,b0);
shiftreg4 f2({b3,b2,b1,b0},clk,rst,{y3,y2,y1,y0});
shiftreg4 f3({y3,y2,y1,y0},clk,rst,{y7,y6,y5,y4});
shiftreg4 f4({y7,y6,y5,y4},clk,rst,{y11,y10,y9,y8});
shiftreg4 f5({y11,y10,y9,y8},clk,rst,{y15,y14,y13,y12});

wire a,b,c,d;
assign a = (~(y15)&(~y14)&(~y13)&(~y12));
assign b = ((~y11)& y10 &(~y9)& y8);
assign c = ((~y7)& y6 & y5 &(~y4));
assign d = ((y3) & (~y2) &(~y1) &(~y0));

assign y = (a & b & c & d);
endmodule
