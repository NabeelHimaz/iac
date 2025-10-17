module counter #(
    parameter WIDTH = 8
)(
    //interface signals
    input  logic             clk,  //clock
    input  logic             rst,  //rest
    input  logic             en,   //counter enable
    output logic [WIDTH-1:0] count //count output
);

always_ff @ (posedge clk or posedge rst)
    
    if (rst) count <= {WIDTH{1'b0}};
    else if(en) count <= count + {{WIDTH-1{1'b0}}, en};
    else     count <= count - 1'b1;

endmodule
