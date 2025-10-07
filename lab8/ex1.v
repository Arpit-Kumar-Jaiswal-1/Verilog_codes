module dff (input clk, input rst, input d, output reg q);
    always @(posedge clk or posedge rst) begin
        if (rst)
            q <= 1'b0;
        else
            q <= d;
    end
endmodule

module ex1 (
    input clk, input rst, input din,
    output [5:0] q
);
    dff d0(clk, rst, din, q[0]);
    dff d1(clk, rst, q[0], q[1]);
    dff d2(clk, rst, q[1], q[2]);
    dff d3(clk, rst, q[2], q[3]);
    dff d4(clk, rst, q[3], q[4]);
    dff d5(clk, rst, q[4], q[5]);
endmodule

