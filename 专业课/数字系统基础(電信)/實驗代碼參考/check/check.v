module check
(
    CLK, RSTn, LED_Out, Key_In, Digitron_Out, DigitronCS_Out, Buzzer_Out
);

    input CLK;
	 input RSTn;
	 input [7:0]Key_In;
	 output [7:0]LED_Out;
	 output [7:0]Digitron_Out;
	 output [5:0]DigitronCS_Out;
	 output Buzzer_Out;
	 wire [23:0]result;
	 parameter Dis = 23'd6565;
	 /*
	led8_module U1
	(
		.CLK( CLK ),
		.RSTn( RSTn ),
		.LED_Out( LED_Out )
	); 
	*/

	/*
	Digitron_module U2
	(
		.CLK( CLK ),
		.RSTn( RSTn ),
		.Digitron_Out( Digitron_Out ),
		.DigitronCS_Out( DigitronCS_Out )
	);
	*/
	//分频器 50M/200k
	Accumulator_module U4
	(
		.CLK( CLK ),
		.RSTn( RSTn ),
		.Result( result )
	);
	//数码管轮询显示
	Digitron_NumDisplay U5
	(
		.CLK( CLK ), 
		.RSTn( RSTn ), 
		.Hex_SixNum( result ), 
		.Digitron_Out( Digitron_Out ),
		.DigitronCS_Out( DigitronCS_Out )
	);
	//按键、蜂鸣器、LED显示
	Buzzer_module U3
	(
		.CLK( CLK ),
		.RSTn( RSTn ),
		.Buzzer_Out( Buzzer_Out ),
		.Key_In( Key_In ),
		.LED_Out( LED_Out ),
	);
/*
	key_module
	(
		.CLK(CLK),
		.RSTn( RSTn ),
		.Key_In(Key_In),
		.LED_Out( LED_Out )
	);
*/	 
	 /**********************************/
	 
	 
	 /***********************************/

endmodule
