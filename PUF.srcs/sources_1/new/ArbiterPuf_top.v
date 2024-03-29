module ArbiterPuf_top(
    input clk
);

    // Create internal wires to connect ILA and VIO
    wire            signal;
    wire [127:0]    chal;
    wire            resp;
    wire            out_top;
    wire            out_bot;
    wire            reset;

    // VIO
    vio_0 vio(
        .clk        (clk),
        .probe_out0 (signal),
        .probe_out1 (chal),
        .probe_out2 (reset)
    );

    // ILA
    ila_0 ila(
        .clk        (clk),
        .probe0     (signal),
        .probe1     (chal),
        .probe2     (resp),
        .probe3     (out_top),
        .probe4     (out_bot)
    );

    // Arbiter PUF
    ArbiterPuf #(.N(128)) APUF(
        .signal     (signal),
        .challenge  (chal),
        .reset      (reset),
        .Q          (resp),
        .out_t      (out_top),
        .out_b      (out_bot)
    );

endmodule
