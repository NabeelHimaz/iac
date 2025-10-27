module sinegen #(
    parameter ADDRESS_WIDTH = 8,
    parameter DATA_WIDTH = 8
) (
    input  logic             clk,  //clock
    input  logic             rst,  //rest
    input  logic             en,   //counter enable
    input  logic [ADDRESS_WIDTH-1:0]  incr,
    output logic [DATA_WIDTH-1:0] dout
);
    
    logic [ADDRESS_WIDTH-1:0] addr; //internal signal
    logic [ADDRESS_WIDTH-1:0] count;

    assign addr = count;

    counter #(
        .WIDTH(ADDRESS_WIDTH)
    ) counter1 (
        .clk(clk),
        .rst(rst),
        .en(en),
        .incr(incr),
        .count(count)
    );

    rom #(
        .ADDRESS_WIDTH(ADDRESS_WIDTH),
        .DATA_WIDTH(DATA_WIDTH)
    ) rom1(
        .clk(clk),
        .addr(addr),
        .dout(dout)

    );

endmodule
