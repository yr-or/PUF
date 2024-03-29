
module ArbiterPuf_top(
        input clk
    );

    // Functionality: Instantiate 20 PUFs and cycle through different challenges.
    // All share same input and challenge.

    localparam APUF_SIZE = 256;
    localparam NUM_PUFS = 256;

    // Create internal wires to connect ILA and VIO
    wire                    signal;
    wire [APUF_SIZE-1:0]    chal;
    wire [NUM_PUFS-1:0]     resp;

    // VIO
    vio_0 vio(
        .clk                (clk),
        .probe_out0         (signal),
        .probe_out1         (chal)
    );

    // ILA
    ila_0 ila(
        .clk        (clk),
        .probe0     (signal),
        .probe1     (chal),
        .probe2     (resp)
    );

    // Instantiate 256 PUFs
    genvar i;
    generate
        for (i=0; i<NUM_PUFS; i=i+1) begin
            ArbiterPuf #(.N(APUF_SIZE)) APUF(
                .signal     (signal),
                .challenge  (chal),
                .result     (resp[i])
            );
        end
    endgenerate

endmodule