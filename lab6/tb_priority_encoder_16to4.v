`timescale 1ns/1ps
`include "priority_encoder_16to4.v"

module tb_priority_encoder_16to4;
    reg [15:0] D;
    wire [3:0] Y;
    wire valid;

    priority_encoder_16to4 uut (
        .D(D),
        .Y(Y),
        .valid(valid)
    );

    initial begin
        $dumpfile("tb_priority_encoder_16to4.vcd");
        $dumpvars(0, tb_priority_encoder_16to4);
        $monitor("Time=%0t | D=%b | Y=%b | valid=%b", $time, D, Y, valid);

        D = 16'b0000_0000_0000_0000; #10;
        D = 16'b0000_0000_0000_0001; #10;
        D = 16'b0000_0000_0000_1000; #10;
        D = 16'b0000_0001_0000_0000; #10;
        D = 16'b1000_0000_0000_0000; #10;
        D = 16'b1010_0000_0000_0000; #10; // bit 15 wins
        D = 16'b0000_1111_0000_0000; #10; // bit 11 wins
        D = 16'b0000_0000_1111_0000; #10; // bit 7 wins

        $finish;
    end
endmodule

