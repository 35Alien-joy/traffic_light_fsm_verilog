`timescale 1ns/1ps

module traffic_light_tb;

reg clk;
reg reset;

wire highway_g;
wire highway_y;
wire highway_r;
wire side_g;
wire side_r;

traffic_light uut(
    .clk(clk),
    .reset(reset),
    .highway_g(highway_g),
    .highway_y(highway_y),
    .highway_r(highway_r),
    .side_g(side_g),
    .side_r(side_r)
);

always #5 clk = ~clk;

initial
begin
    clk = 0;
    reset = 1;

    #20 reset = 0;

    #200 $stop;
end

endmodule
