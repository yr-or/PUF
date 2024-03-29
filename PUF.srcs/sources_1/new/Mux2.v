// MUX pair for arbiter PUF

module Mux2
(
    input in_t, in_b,
    input chal_bit,
    output out_t, out_b
);

    reg out_t_reg;
    reg out_b_reg;
    assign out_t = out_t_reg;
    assign out_b = out_b_reg;

    always @(*) begin
        if (chal_bit) begin
            out_t_reg = in_b;
            out_b_reg = in_t;
        end
        else begin
            out_t_reg = in_t;
            out_b_reg = in_b;
        end
    end

endmodule