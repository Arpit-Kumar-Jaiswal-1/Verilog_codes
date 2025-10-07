module ex3 #(parameter N = 5) (
    input clk, input rst,
    output reg [N-1:0] q
);
    always @(posedge clk or posedge rst) begin
        if (rst)
            q <= {N{1'b0}};
        else
            q <= {~q[N-1], q[N-1:1]};
    end
endmodule

