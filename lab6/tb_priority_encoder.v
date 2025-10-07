`timescale 1ns/1ps
`include "priority_encoder_4to2.v"

module tb_priority_encoder;
    reg [3:0] D;
    wire [1:0] Y;
    wire valid;

    priority_encoder_4to2 uut (
        .D(D),
        .Y(Y),
        .valid(valid)
    );

    initial begin
        $dumpfile("tb_priority_encoder.vcd");
        $dumpvars(0, tb_priority_encoder);
        $monitor("Time=%0t | D=%b | Y=%b | valid=%b", $time, D, Y, valid);

        D = 4'b0000; #10;
        D = 4'b0001; #10;
        D = 4'b0010; #10;
        D = 4'b0100; #10;
        D = 4'b1000; #10;
        D = 4'b1010; #10;
        D = 4'b0111; #10;
        D = 4'b0011; #10;

        $finish;
    end
endmodule

