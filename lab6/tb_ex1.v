`timescale 1ns/1ps
`include "ex1.v"   // contains decoder_2to4 and decoder_3to8

module tb_ex1;
    reg en;
    reg [2:0] a;
    wire [7:0] y;

    // Instantiate the 3-to-8 decoder
    decoder_3to8 uut (
        .en(en),
        .a(a),
        .y(y)
    );

    initial begin
        // Dumpfile for waveform simulation
        $dumpfile("tb_ex1.vcd");   // creates VCD file
        $dumpvars(0, tb_ex1);      // dump all signals in this module

        // Monitor signals in console
        $monitor("Time=%0t | en=%b | a=%b | y=%b", $time, en, a, y);

        // Initialize
        en = 0; a = 3'b000;
        #10;

        // Enable = 0 → outputs should be 0
        en = 0; a = 3'b101; #10;

        // Enable = 1 → test all input combinations
        en = 1;
        a = 3'b000; #10;
        a = 3'b001; #10;
        a = 3'b010; #10;
        a = 3'b011; #10;
        a = 3'b100; #10;
        a = 3'b101; #10;
        a = 3'b110; #10;
        a = 3'b111; #10;

        // Finish simulation
        $finish;
    end
endmodule

