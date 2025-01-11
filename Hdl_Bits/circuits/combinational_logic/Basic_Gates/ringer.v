module top_module (
    input ring,
    input vibrate_mode,
    output ringer,       // Make sound
    output motor         // Vibrate
);
	assign ringer = ring & ~vibrate_mode;
    assign motor = ring & vibrate_mode;
endmodule
/* here understand that when the ring is zero the output will always be zero
if the ringer is 1 the output depends on vibrate
if both are 1 the phin emust vibrate else the phone must ring */
