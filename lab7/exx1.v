`timescale 1ns/1ns
`include "ex1.v"

module tb_DFF;
    reg D, clk, reset;
    wire Q;

    DFF_async_reset uut (.D(D), .clk(clk), .reset(reset), .Q(Q));

    initial begin
        clk = 0;
        forever #5 clk = ~clk;
    end

    initial begin
        $dumpfile("dff_waveform.vcd");
        $dumpvars(0, tb_DFF);

        D = 0; reset = 0;
        #2 reset = 1;
        #8 reset = 0;
        #10 D = 1;
        #10 D = 0;
        #10 D = 1;
        #10 D = 0;
        #10 reset = 1;
        #10 reset = 0;
        #20 $finish;
    end
endmodule


