module main_tb;
// Declare inputs and outputs
reg [127:0] data, key;
wire [127:0] en_key;

// Instantiate the main module
main uut (
    .data(data),
    .key(key),
    .en_key(en_key)
);


initial begin
    // Test Case 1: Simple Known Input
    data = 128'h00112233445566778899aabbccddeeff;
    key  = 128'h000102030405060708090a0b0c0d0e0f;

    #10; // Wait 10 ns for simulation

    // Test Case 2: Different Input
    data = 128'h112233445566778899aabbccddeeff00;
    key  = 128'h0f0e0d0c0b0a09080706050403020100;

    #10;

    // Test Case 3: All Zeros
    data = 128'h00000000000000000000000000000000;
    key  = 128'h00000000000000000000000000000000;

    #10;

    // Test Case 4: All Ones
    data = 128'hFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF;
    key  = 128'hFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF;
    #10;
    // End the simulation
    $stop;
end

// Monitor output
initial begin
    $monitor("Time=%0t | Data=%h | Key=%h | Encrypted=%h", $time, data, key, en_key);
end

endmodule

