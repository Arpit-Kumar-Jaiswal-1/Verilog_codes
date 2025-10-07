`timescale 1ns/1ns
`include "ex2.v"

module ex2_tb;
    reg clk, rst;
    reg [7:0] d;
    wire [7:0] q;

    ex2 #(8) uut(clk, rst, d, q);

    initial begin
        clk = 0;
        forever #5 clk = ~clk;
    end

    initial begin
        $dumpfile("ex2.vcd");
        $dumpvars(0, ex2_tb);

        rst = 1; d = 8'h00; #10;
        rst = 0; d = 8'hAA; #10;
        d = 8'h55; #10;
        d = 8'hFF; #10;
        d = 8'h0F; #20;
        $finish;
    end
endmodule

