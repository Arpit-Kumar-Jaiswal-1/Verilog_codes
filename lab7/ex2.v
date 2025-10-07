module TFF_async_reset (
    input  wire T,
    input  wire clk,
    input  wire reset_n,
    output reg  Q
);
    always @(negedge clk or negedge reset_n) begin
        if (!reset_n)
            Q <= 1'b0;
        else if (T)
            Q <= ~Q;
    end
endmodule

