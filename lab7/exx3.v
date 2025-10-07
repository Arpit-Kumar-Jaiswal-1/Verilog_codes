`timescale 1ns/1ns
`include "ex3.v"

module tb_JKFF;
    reg J, K, clk, reset;
    wire Q;

    JKFF_sync_reset uut (
        .J(J),
        .K(K),
        .clk(clk),
        .reset(reset),
        .Q(Q)
    );

    initial begin
        clk = 0;
        forever #5 clk = ~clk;
    end

    initial begin
        $dumpfile("jkff_waveform.vcd");
        $dumpvars(0, tb_JKFF);

        J = 0; K = 0; reset = 0;
        #10 reset = 1;
        #10 reset = 0;
        #10 J = 1; K = 0;
        #20 J = 0; K = 1;
        #20 J = 1; K = 1;
        #20 J = 0; K = 0;
        #20 J = 1; K = 1;
        #50 $finish;
    end
endmodule

