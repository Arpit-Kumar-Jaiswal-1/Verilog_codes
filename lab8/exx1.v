`timescale 1ns/1ns
`include "ex1.v"

module ex1_tb;
    reg clk, rst, din;
    wire [5:0] q;

    ex1 uut(clk, rst, din, q);

    initial begin
        clk = 0;
        forever #5 clk = ~clk;
    end

    initial begin
        $dumpfile("ex1.vcd");
        $dumpvars(0, ex1_tb);

        rst = 1; din = 0; #10;
        rst = 0; din = 1; #10;
        din = 0; #10;
        din = 1; #10;
        din = 1; #10;
        din = 0; #50;
        $finish;
    end
endmodule
 
