#include "Vsinegen.h"
#include "verilated.h"
#include "verilated_vcd_c.h"
#include "vbuddy.cpp"

int main(int argc, char **argv, char **env){
    int i;
    int clk;

    Verilated::commandArgs(argc, argv);

    Vsinegen* top = new Vsinegen;

    Verilated::traceEverOn(true);
    VerilatedVcdC* tfp = new VerilatedVcdC;
    top->trace (tfp, 99);
    tfp->open ("sinegen.vcd");

    if (vbdOpen() != 1)
        return (-1);
    vbdHeader("Lab 2: sgen");

    top->clk = 1;
    top->rst = 0;
    top->en = 1;
    top->incr = vbdValue();

    for(i=1; i<1000000; i++){
        top->incr = vbdValue();
            
        for(clk=0; clk<2; clk++){
            tfp->dump (2*i+clk);
            top->clk = !top->clk;
            
            top->eval ();
        }

        vbdPlot(int(top->dout1), 0, 255);
        vbdPlot(int(top->dout2), 0, 255);

        top->rst = (i<2) | (i == 15);


            // either simulation finished, or 'q' is pressed
        if ((Verilated::gotFinish()) || (vbdGetkey()=='q')) 
        exit(0);                // ... exit if finish OR 'q' pressed
    }

    vbdClose();
    tfp->close();
    exit(0);
}