module classifier_tb;

reg signed [31:0] out1;
reg signed [31:0] out2;
reg signed [31:0] out3;

wire [1:0] class_id;

classifier uut
(
    .out1(out1),
    .out2(out2),
    .out3(out3),
    .class_id(class_id)
);

initial
begin

    // Triangle
    out1 = 100;
    out2 = 20;
    out3 = -10;

    #10;
    $display("Class = %d", class_id);

    // Square
    out1 = 10;
    out2 = 200;
    out3 = 30;

    #10;
    $display("Class = %d", class_id);

    // Circle
    out1 = 5;
    out2 = 50;
    out3 = 300;

    #10;
    $display("Class = %d", class_id);

    $finish;

end

endmodule