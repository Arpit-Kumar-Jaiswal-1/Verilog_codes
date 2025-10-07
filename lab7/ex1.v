module DFF_async_reset (
    input  wire D,
    input  wire clk,
    input  wire reset, 
    output reg  Q
);
    always @(posedge clk or posedge reset) begin
        if (reset)
            Q <= 1'b0;
        else
            Q <= D;
    end
endmodule

