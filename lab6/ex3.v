// 2-to-4 Decoder with active-high enable and active-low outputs
module dec2to4 (
    input en,
    input [1:0] w,
    output reg [3:0] y
);
    always @(*) begin
        if (en) begin
            case (w)
                2'b00: y = 4'b1110;  // only y[0] active (low)
                2'b01: y = 4'b1101;  // only y[1] active
                2'b10: y = 4'b1011;  // only y[2] active
                2'b11: y = 4'b0111;  // only y[3] active
                default: y = 4'b1111;
            endcase
        end else begin
            y = 4'b1111;  // all inactive (high)
        end
    end
endmodule
// 4-to-16 Decoder using four 2-to-4 decoders
module dec4to16 (
    input en,
    input [3:0] w,
    output [15:0] y
);
    wire [3:0] en_lines;
    wire [3:0] y0, y1, y2, y3;

    // First 2-to-4 decoder generates enables for the four blocks
    dec2to4 en_decoder (
        .en(en),
        .w(w[3:2]),
        .y(en_lines)
    );

    // Each block handles 4 outputs
    dec2to4 d0 (.en(~en_lines[0]), .w(w[1:0]), .y(y0));
    dec2to4 d1 (.en(~en_lines[1]), .w(w[1:0]), .y(y1));
    dec2to4 d2 (.en(~en_lines[2]), .w(w[1:0]), .y(y2));
    dec2to4 d3 (.en(~en_lines[3]), .w(w[1:0]), .y(y3));

    assign y = {y3, y2, y1, y0};
endmodule

