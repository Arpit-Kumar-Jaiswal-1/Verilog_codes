module decoder_2to4 (
    input en,
    input [1:0] a,
    output reg [3:0] y
);
    always @(*) begin
        if (en) begin
            if (a == 2'b00) y = 4'b0001;
            else if (a == 2'b01) y = 4'b0010;
            else if (a == 2'b10) y = 4'b0100;
            else if (a == 2'b11) y = 4'b1000;
            else y = 4'b0000;   // default safe case
        end else begin
            y = 4'b0000;        // disabled → all outputs low
        end
    end
endmodule
module decoder_3to8 (
    input en,
    input [2:0] a,
    output [7:0] y
);
    wire [3:0] y0, y1;

    // Lower half (when MSB = 0)
    decoder_2to4 d0 (
        .en(en & ~a[2]),
        .a(a[1:0]),
        .y(y0)
    );

    // Upper half (when MSB = 1)
    decoder_2to4 d1 (
        .en(en & a[2]),
        .a(a[1:0]),
        .y(y1)
    );

    // Combine outputs
    assign y = {y1, y0};
endmodule

