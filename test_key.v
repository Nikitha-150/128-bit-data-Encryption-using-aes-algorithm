`timescale 1ns / 1ps
module test_key_gen;

    // Declare test signals
    reg [127:0] temp_key, mx_key;
    reg [31:0] rcon;
    wire [127:0] ko, r_key;

    // Instantiate key expansion module
    key_gen uut (
        .temp_key(temp_key), 
        .mx_key(mx_key), 
        .rcon(rcon), 
        .ko(ko), 
        .r_key(r_key)
    );

    initial begin
        // Initialize inputs
        temp_key = 128'h2b7e151628aed2a6abf7158809cf4f3c;
        mx_key   = 128'h000102030405060708090a0b0c0d0e0f;
        rcon     = 32'h01000000;  // First round RCON value

        #10;  // Wait for computation
        
        // Display output values
      //  $display("Generated Round Key: %h", r_key);
        
        // End simulation
        $stop;
    end
endmodule