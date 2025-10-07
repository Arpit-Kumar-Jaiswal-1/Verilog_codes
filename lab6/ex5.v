module priority_encoder_16to4 (
    input  [15:0] D,
    output reg [3:0] Y,
    output reg valid
);
    integer i;
    always @(*) begin
        Y = 4'b0000;
        valid = 0;
        for (i = 15; i >= 0; i = i - 1) begin
            if (D[i]) begin
                Y = i[3:0];   // assign index as output
                valid = 1;
                disable for;  // stop at highest-priority input
            end
        end
    end
endmodule

