
`timescale 1 ns / 1 ps

	module sign_extender #
	(
        INPUT_LENGTH	= 16,
        ADDITIONAL_OUTPUT_BITS = 16
	)

	(
		input wire [INPUT_LENGTH-1 : 0] inp,
        output wire [INPUT_LENGTH + ADDITIONAL_OUTPUT_BITS - 1 : 0] outp
	);

    assign outp = {{(ADDITIONAL_OUTPUT_BITS){inp[INPUT_LENGTH-1]}}, {inp[INPUT_LENGTH - 1:0]}};

	endmodule
