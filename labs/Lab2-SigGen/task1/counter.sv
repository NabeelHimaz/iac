module counter #(
    parameter WIDTH = 8
)(
    //interface signals
    input  logic             clk,  //clock
    input  logic             rst,  //rest
    input  logic             en,
    input logic [WIDTH-1:0] incr,   //counter enable
    output logic [WIDTH-1:0] count //count output
);

always_ff @ (posedge clk or posedge rst)
    if (rst && en) count <= {WIDTH{1'b0}};
    else     count <= count + incr;

endmodule
