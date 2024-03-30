// MUX pair for arbiter PUF
(* keep_hierarchy = "yes" *)
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

    // Instantiate top mux
    Mux mux_t(
        .a          (in_t),
        .b          (in_b),
        .sel        (chal_bit),
        .out        (out_t)
    );
    
    // Instantiate bottom mux
    Mux mux_b(
        .a          (in_b),
        .b          (in_t),
        .sel        (chal_bit),
        .out        (out_b)
    );

endmodule