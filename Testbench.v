module lock_tb();
reg [3:0]dec;
reg clk=0;
reg rst;
wire y;

lock dut(.dec(dec),.y(y),.clk(clk),.rst(rst));

initial
begin
forever #10 clk=~clk;
end

initial
begin
rst=1;
#20 rst=0; dec=4'd0;
#20 dec=4'd9;
#20 dec=4'd0;
#20 dec=4'd5;
#20 dec=4'd6;
#20 dec=4'd8;
#20 dec=4'd9;
#20 $stop;
end
endmodule
