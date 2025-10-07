`timescale 1ns/1ps
`include "ex3.v"   // contains dec2to4 and dec4to16

module tb_decoder3;
    reg en;
    reg [3:0] w;
    wire [15:0] y;

    // Instantiate 4-to-16 decoder
    dec4to16 uut (
        .en(en),
        .w(w),
        .y(y)
    );

    integer i;

    initial begin
        // Dumpfile for waveform simulation
        $dumpfile("tb_decoder3.vcd");
        $dumpvars(0, tb_decoder3);

        // Monitor signals
        $monitor("Time=%0t | en=%b | w=%b | y=%b", $time, en, w, y);

        // Disabled case
        en = 0; w = 4'b0000; #10;
        en = 0; w = 4'b1010; #10;

        // Enabled: test all inputs
        en = 1;
        for (i = 0; i < 16; i = i + 1) begin
            w = i;
            #10;
        end

        $finish;
    end
endmodule

