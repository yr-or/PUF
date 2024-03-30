// Single 2-input multiplexer
(* keep_hierarchy = "yes" *)
module Mux(
    input a,
    input b,
    input sel,
    output out
    );
    
    reg out_wire;
    
    always @(*) begin
        if (sel) begin
            out_wire = a;
        end else
        begin
            out_wire = b;
        end
    end
    
    assign out = out_wire;
    
endmodule
