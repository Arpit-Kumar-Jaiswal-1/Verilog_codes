`timescale 1ns/1ps
`include "ex2.v"   // include design file

module tb_decoder;
    reg en;
    reg [3:0] a;
    wire [15:0] y;

    // Instantiate 4-to-16 decoder
    decoder_4to16 uut (
        .en(en),
        .a(a),
        .y(y)
    );

    integer i;

    initial begin
        // Dumpfile for waveform simulation
        $dumpfile("tb_decoder.vcd");   // creates VCD file
        $dumpvars(0, tb_decoder);      // dump all signals in this module

        // Monitor signals in console
        $monitor("Time=%0t | en=%b | a=%b | y=%b", $time, en, a, y);

        // Disabled case
        en = 0; a = 4'b0000; #10;
        en = 0; a = 4'b1010; #10;

        // Enabled: test all inputs
        en = 1;
        for (i = 0; i < 16; i = i + 1) begin
            a = i;
            #10;
        end

        $finish;
    end
endmodule

