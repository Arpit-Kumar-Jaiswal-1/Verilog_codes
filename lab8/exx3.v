`timescale 1ns/1ns
`include "ex3.v"

module ex3_tb;
    reg clk, rst;
    wire [4:0] q;

    ex3 #(5) uut(clk, rst, q);

    initial begin
        clk = 0;
        forever #5 clk = ~clk;
    end

    initial begin
        $dumpfile("ex3.vcd");
        $dumpvars(0, ex3_tb);

        rst = 1; #10;
        rst = 0; #200;
        $finish;
    end
endmodule

