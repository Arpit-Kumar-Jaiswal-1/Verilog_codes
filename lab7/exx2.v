`timescale 1ns/1ns
`include "ex2.v"

module tb_TFF;
    reg T, clk, reset_n;
    wire Q;

    TFF_async_reset uut (
        .T(T),
        .clk(clk),
        .reset_n(reset_n),
        .Q(Q)
    );

    initial begin
        clk = 0;
        forever #5 clk = ~clk;
    end

    initial begin
        $dumpfile("tff_waveform.vcd");
        $dumpvars(0, tb_TFF);

        T = 0; reset_n = 0;
        #10 reset_n = 1;
        #10 T = 1;
        #20 T = 0;
        #20 T = 1;
        #20 reset_n = 0;
        #10 reset_n = 1;
        #30 $finish;
    end
endmodule

