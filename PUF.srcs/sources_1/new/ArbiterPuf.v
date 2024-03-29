
module ArbiterPuf #(parameter N=8)(
    input signal, 
    input [N-1:0] challenge, 
    input reset, 
    output Q, 
    output out_t, out_b 
); 
 
    // Split input signal 
    wire sig_t, sig_b; 
    assign sig_t = signal; 
    assign sig_b = signal; 
     
    // Need N internal wires 
    wire [N-1:0] mux_out_t; 
    wire [N-1:0] mux_out_b; 
    reg Q_reg = 0; 
 
    // Instantiate first Mux pair 
    Mux2 mu0( 
        .in_t       (sig_t), 
        .in_b       (sig_b), 
        .chal_bit   (challenge[0]), 
        .out_t      (mux_out_t[0]), 
        .out_b      (mux_out_b[0]) 
    ); 
 
    // Generate rest of N-1 Mux pairs 
    genvar i; 
    generate 
        for (i=1; i<N; i=i+1) begin 
            Mux2 muN( 
                .in_t       (mux_out_t[i-1]), 
                .in_b       (mux_out_b[i-1]), 
                .chal_bit   (challenge[i]), 
                .out_t      (mux_out_t[i]), 
                .out_b      (mux_out_b[i]) 
            ); 
        end 
    endgenerate 
     
    // Assign output of last mux pair to flip-flop 
    always @(posedge mux_out_b[N-1], posedge reset) begin 
        if (reset) 
            Q_reg <= 1'b0; 
        else if (mux_out_b[N-1]) 
            Q_reg <= mux_out_t[N-1]; 
    end 
 
    assign Q = Q_reg; 
    assign out_t = mux_out_t[N-1]; 
    assign out_b = mux_out_b[N-1]; 
 
endmodule 
