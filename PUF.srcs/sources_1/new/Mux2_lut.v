// MUX pair for arbiter PUF
(* keep_hierarchy = "yes" *)
(* DONT_TOUCH = "yes" *)
(* keep = "true" *)
module Mux2_lut
(
    input in_t, in_b,
    input chal_bit,
    output out_t, out_b
);

    // Internal wires
    (* MARK_DEBUG = "TRUE" *) wire in_t_wire;
    (* MARK_DEBUG = "TRUE" *) wire in_b_wire;
    (* MARK_DEBUG = "TRUE" *) wire out_t_wire;
    (* MARK_DEBUG = "TRUE" *) wire out_b_wire;
    assign in_t_wire = in_t;
    assign in_b_wire = in_b;
    
    // Top mux
    (* LUTNM = "DISABLED" *)
    LUT3 #(8'hCA) mux_lut_t (
        .I0         (in_t_wire),
        .I1         (in_b_wire),
        .I2         (chal_bit),
        .O          (out_t_wire)
    );
    // bottom mux
    (* LUTNM = "DISABLED" *)
    LUT3 #(8'hCA) mux_lut_b (
        .I0         (in_b_wire),
        .I1         (in_t_wire),
        .I2         (chal_bit),
        .O          (out_b_wire)
    );
    
    assign out_t = out_t_wire;
    assign out_b = out_b_wire;

endmodule