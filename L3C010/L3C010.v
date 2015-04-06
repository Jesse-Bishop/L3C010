module L3C010(
							input [9:0] sw,		
							input [3:0] key,
							input clock,
							output [9:0] ledr,
							output [7:0] ledg,
							output reg [6:0] hex0,hex1,hex2,hex3
							);


	reg[24:0] delay;
	reg[24:0] delay2;
	reg blink = 1'b0;

	//various toggle and increament
	//variables
	reg [6:0]state;
	reg [6:0]totalDispense;
	reg toggle = 1'b0;
	reg updateOnce = 1'b1;
	
	//reset parameters
	reg firstTime = 1'b1;
	reg mylatch = 1'b0;
	
	//registers needed for the red LED's
	reg [9:0]LED_reg;
	assign ledr[0] = LED_reg[0];
	assign ledr[1] = LED_reg[1];
	assign ledr[2] = LED_reg[2];
	assign ledr[3] = LED_reg[3];
	assign ledr[4] = LED_reg[4];
	assign ledr[5] = LED_reg[5];
	assign ledr[6] = LED_reg[6];
	assign ledr[7] = LED_reg[7];
	assign ledr[8] = LED_reg[8];
	assign ledr[9] = LED_reg[9];
	parameter COUNT_LEDBLIP = 6000000;
	reg[24:0] counter_LEDBLIP;
	
	//Note: state 61 is the error state

always @ (posedge clock) begin
		
		//Set equal to CID for the first time
		if(firstTime == 1'b1) begin
			LED_reg[9:0] = 10'b0000000000;
			state = 6'b100100;
			totalDispense = 6'b000000;
			firstTime = 1'b0;	
		end
	
	case(state)
	0: begin 
			blink = 1'b0;
			updateOnce = 1'b1;
			LED_reg[9:0] = 10'b0000000000;
			if(sw[0]&&sw[1] || sw[0]&&sw[2] || sw[1]&&sw[2] || 
			   sw[0]&&sw[8] || sw[1]&&sw[8] || sw[2]&&sw[8] ||
			   sw[3]&&sw[0] || sw[3]&&sw[1] || sw[3]&&sw[2] || sw[3]&&sw[8] ||
			   sw[4]&&sw[0] || sw[4]&&sw[1] || sw[4]&&sw[2] || sw[4]&&sw[3] ||
			   sw[4]&&sw[8])
				increment(61);
			if(sw[0])
				increment(5);
			if(sw[1])
				increment(10);
			if(sw[2])
				increment(25);
			if(sw[3])
				increment(100);
			if(sw[4])
				increment(35);
		  if(sw[9]) begin
				display(totalDispense, hex0[6:0]); display(19, hex1[6:0]);
	      display(19, hex2[6:0]); display(19, hex3[6:0]);
			end
			else begin
				display(0, hex0[6:0]); display(0, hex1[6:0]);
	      display(0, hex2[6:0]); display(0, hex3[6:0]);
			end
		
		end
	5: begin
			blink = 1'b0;
			updateOnce = 1'b1; 
			LED_reg[9:0] = 10'b0000000000;
			if(sw[0]&&sw[1] || sw[0]&&sw[2] || sw[1]&&sw[2] || 
			   sw[0]&&sw[8] || sw[1]&&sw[8] || sw[2]&&sw[8] ||
			   sw[3]&&sw[0] || sw[3]&&sw[1] || sw[3]&&sw[2] || sw[3]&&sw[8] ||
			   sw[4]&&sw[0] || sw[4]&&sw[1] || sw[4]&&sw[2] || sw[4]&&sw[3] ||
			   sw[4]&&sw[8])
				increment(56);
			if(sw[8])
				increment(-5);
			if(sw[0])
				increment(5);
			if(sw[1])
				increment(10);
			if(sw[2])
				increment(25);
			if(sw[3])
				increment(100);
			if(sw[4])
				increment(30);
		  if(sw[9]) begin
				display(totalDispense, hex0[6:0]); display(19, hex1[6:0]);
	      display(19, hex2[6:0]); display(19, hex3[6:0]);
			end
			else begin
					 display(0, hex0[6:0]); display(0, hex1[6:0]);
	         display(5, hex2[6:0]); display(0, hex3[6:0]);
			end
		end
	10: begin 
			blink = 1'b0;
			updateOnce = 1'b1;
			LED_reg[9:0] = 10'b0000000000;
			
			if(sw[0]&&sw[1] || sw[0]&&sw[2] || sw[1]&&sw[2] || 
			   sw[0]&&sw[8] || sw[1]&&sw[8] || sw[2]&&sw[8] ||
			   sw[3]&&sw[0] || sw[3]&&sw[1] || sw[3]&&sw[2] || sw[3]&&sw[8] ||
			   sw[4]&&sw[0] || sw[4]&&sw[1] || sw[4]&&sw[2] || sw[4]&&sw[3] ||
			   sw[4]&&sw[8])
				increment(51);
			if(sw[8])
				increment(-10);
			if(sw[0])
				increment(5);
			if(sw[1])
				increment(10);
			if(sw[2])
				increment(25);
			if(sw[3])
				increment(100);
			if(sw[4])
				increment(25);
		 	if(sw[9]) begin
				display(totalDispense, hex0[6:0]); display(19, hex1[6:0]);
	      display(19, hex2[6:0]); display(19, hex3[6:0]);
			end
			else begin
				display(0, hex0[6:0]); display(0, hex1[6:0]);
	      display(0, hex2[6:0]); display(1, hex3[6:0]);
			end
		end
	15: begin 
		  blink = 1'b0;
			updateOnce = 1'b1;
			LED_reg[9:0] = 10'b0000000000;
			if(sw[0]&&sw[1] || sw[0]&&sw[2] || sw[1]&&sw[2] || 
			   sw[0]&&sw[8] || sw[1]&&sw[8] || sw[2]&&sw[8] ||
			   sw[3]&&sw[0] || sw[3]&&sw[1] || sw[3]&&sw[2] || sw[3]&&sw[8] ||
			   sw[4]&&sw[0] || sw[4]&&sw[1] || sw[4]&&sw[2] || sw[4]&&sw[3] ||
			   sw[4]&&sw[8])
				increment(46);
			if(sw[8])
				increment(-15);
			if(sw[0])
				increment(5);
			if(sw[1])
				increment(10);
			if(sw[2])
				increment(25);
			if(sw[3])
				increment(100);
			if(sw[4])
				increment(20); 
			if(sw[9]) begin
				display(totalDispense, hex0[6:0]); display(19, hex1[6:0]);
	      display(19, hex2[6:0]); display(19, hex3[6:0]);
			end
			else begin
				display(0, hex0[6:0]); display(0, hex1[6:0]);
	      display(5, hex2[6:0]); display(1, hex3[6:0]);
			end
				    
		end
		
	20: begin 
			blink = 1'b0;
			updateOnce = 1'b1;
			LED_reg[9:0] = 10'b0000000000;
			if(sw[0]&&sw[1] || sw[0]&&sw[2] || sw[1]&&sw[2] || 
			   sw[0]&&sw[8] || sw[1]&&sw[8] || sw[2]&&sw[8] ||
			   sw[3]&&sw[0] || sw[3]&&sw[1] || sw[3]&&sw[2] || sw[3]&&sw[8] ||
			   sw[4]&&sw[0] || sw[4]&&sw[1] || sw[4]&&sw[2] || sw[4]&&sw[3] ||
			   sw[4]&&sw[8])
				increment(41);
			if(sw[8])
				increment(-20);
			if(sw[0])
				increment(5);
			if(sw[1])
				increment(10);
			if(sw[2])
				increment(25);
			if(sw[3])
				increment(100);
			if(sw[4])
				increment(15);
			if(sw[9]) begin
				display(totalDispense, hex0[6:0]); display(19, hex1[6:0]);
	      display(19, hex2[6:0]); display(19, hex3[6:0]);
			end
			else begin
				display(0, hex0[6:0]); display(0, hex1[6:0]);
	      display(0, hex2[6:0]); display(2, hex3[6:0]);
			end     
	end
	
	25: begin 
			blink = 1'b0;
			updateOnce = 1'b1;
			LED_reg[9:0] = 10'b0000000000;
			if(sw[0]&&sw[1] || sw[0]&&sw[2] || sw[1]&&sw[2] || 
			   sw[0]&&sw[8] || sw[1]&&sw[8] || sw[2]&&sw[8] ||
			   sw[3]&&sw[0] || sw[3]&&sw[1] || sw[3]&&sw[2] || sw[3]&&sw[8] ||
			   sw[4]&&sw[0] || sw[4]&&sw[1] || sw[4]&&sw[2] || sw[4]&&sw[3] ||
			   sw[4]&&sw[8])
				increment(36);
			if(sw[8])
				increment(-25);
			if(sw[0])
				increment(5);
			if(sw[1])
				increment(10);
			if(sw[2])
				increment(25);
			if(sw[3])
				increment(100);
			if(sw[4])
				increment(10);
		  if(sw[9]) begin
				display(totalDispense, hex0[6:0]); display(19, hex1[6:0]);
	      display(19, hex2[6:0]); display(19, hex3[6:0]);
			end
			else begin
				display(0, hex0[6:0]); display(0, hex1[6:0]);
	      display(5, hex2[6:0]); display(2, hex3[6:0]);
			end     
	end
	
	30: begin 
			blink = 1'b0;
			updateOnce = 1'b1;
			LED_reg[9:0] = 10'b0000000000;
			
			if(sw[0]&&sw[1] || sw[0]&&sw[2] || sw[1]&&sw[2] || 
			   sw[0]&&sw[8] || sw[1]&&sw[8] || sw[2]&&sw[8] ||
			   sw[3]&&sw[0] || sw[3]&&sw[1] || sw[3]&&sw[2] || sw[3]&&sw[8] ||
			   sw[4]&&sw[0] || sw[4]&&sw[1] || sw[4]&&sw[2] || sw[4]&&sw[3] ||
			   sw[4]&&sw[8])
				increment(31);
			if(sw[8])
				increment(-30);
			if(sw[0])
				increment(5);
			if(sw[1])
				increment(10);
			if(sw[2])
				increment(25);
			if(sw[3])
				increment(100);
			if(sw[4])
				increment(5);
			if(sw[9]) begin
				display(totalDispense, hex0[6:0]); display(19, hex1[6:0]);
	      display(19, hex2[6:0]); display(19, hex3[6:0]);
			end
			else begin
				display(0, hex0[6:0]); display(0, hex1[6:0]);
	      display(0, hex2[6:0]); display(3, hex3[6:0]);
			end      
	end
	35: begin
		blink = 1'b1;
		if(counter_LEDBLIP == COUNT_LEDBLIP) begin
			counter_LEDBLIP <= 0;
			toggle <= !toggle;
		end
		else begin
			counter_LEDBLIP <= counter_LEDBLIP + 1;	
		end
		dispense(toggle, LED_reg[9:0]);
		if(updateOnce) begin
			totalDispense = totalDispense + 1;
			updateOnce = 1'b0;
		end
			if(sw[0]&&sw[1] || sw[0]&&sw[2] || sw[1]&&sw[2] || 
			   sw[0]&&sw[8] || sw[1]&&sw[8] || sw[2]&&sw[8] ||
			   sw[3]&&sw[0] || sw[3]&&sw[1] || sw[3]&&sw[2] || sw[3]&&sw[8] ||
			   sw[4]&&sw[0] || sw[4]&&sw[1] || sw[4]&&sw[2] || sw[4]&&sw[3] ||
			   sw[4]&&sw[8])
				increment(26);
			if(sw[8]) 
				increment(-35);
			if(sw[0]) 
				increment(-30);
			if(sw[1]) 
				increment(-25);
			if(sw[2]) 
				increment(-10);
		  if(sw[3])begin
				increment(65);
			end
			if(sw[4])
				increment(26);
			if(totalDispense > 15)
				totalDispense = 0;
				
		  if(sw[9]) begin
				display(totalDispense, hex0[6:0]); display(19, hex1[6:0]);
	      display(19, hex2[6:0]); display(19, hex3[6:0]);
			end
			else begin
				display(0, hex0[6:0]); display(0, hex1[6:0]);
	      display(5, hex2[6:0]); display(3, hex3[6:0]);
			end
	end
	
	40: begin 
		blink = 1'b1;
		if(counter_LEDBLIP == COUNT_LEDBLIP) begin
			counter_LEDBLIP <= 0;
			toggle <= !toggle;
		end
		else begin
			counter_LEDBLIP <= counter_LEDBLIP + 1;	
		end
		dispense(toggle, LED_reg[9:0]);
	  if(updateOnce) begin
		if(updateOnce) begin
			totalDispense = totalDispense + 1;
			updateOnce = 1'b0;
		end
			updateOnce = 1'b0;
		end
			if(sw[0]&&sw[1] || sw[0]&&sw[2] || sw[1]&&sw[2] || 
			   sw[0]&&sw[8] || sw[1]&&sw[8] || sw[2]&&sw[8] ||
			   sw[3]&&sw[0] || sw[3]&&sw[1] || sw[3]&&sw[2] || sw[3]&&sw[8] ||
			   sw[4]&&sw[0] || sw[4]&&sw[1] || sw[4]&&sw[2] || sw[4]&&sw[3] ||
			   sw[4]&&sw[8])
				increment(21);
			if(sw[8]) 
				increment(-40);
			if(sw[0]) 
				increment(-35);
			if(sw[1])
				increment(-30);
			if(sw[2]) 
				increment(-15);
			if(sw[4]) 
				increment(-5);
			if(totalDispense > 15)
				totalDispense = 0;
			if(sw[9]) begin
				display(totalDispense, hex0[6:0]); display(19, hex1[6:0]);
	      display(19, hex2[6:0]); display(19, hex3[6:0]);
			end
			else begin
				display(5, hex0[6:0]); display(0, hex1[6:0]);
	      display(5, hex2[6:0]); display(3, hex3[6:0]);
			end
	end
	
	45: begin 
		blink = 1'b1;
		if(counter_LEDBLIP == COUNT_LEDBLIP) begin
			counter_LEDBLIP <= 0;
			toggle <= !toggle;
		end
		else begin
			counter_LEDBLIP <= counter_LEDBLIP + 1;	
		end
		dispense(toggle, LED_reg[9:0]);
		if(updateOnce) begin
			totalDispense = totalDispense + 1;
			updateOnce = 1'b0;
		end
			if(sw[0]&&sw[1] || sw[0]&&sw[2] || sw[1]&&sw[2] || 
			   sw[0]&&sw[8] || sw[1]&&sw[8] || sw[2]&&sw[8] ||
			   sw[3]&&sw[0] || sw[3]&&sw[1] || sw[3]&&sw[2] || sw[3]&&sw[8] ||
			   sw[4]&&sw[0] || sw[4]&&sw[1] || sw[4]&&sw[2] || sw[4]&&sw[3] ||
			   sw[4]&&sw[8])
				increment(16);
			if(sw[8])
				increment(-45);   
			if(sw[0])
				increment(-40);
			if(sw[1])
				increment(-35);
			if(sw[2])
				increment(-20);
			if(sw[4])
				increment(-10);
			if(totalDispense > 15)
				totalDispense = 0;
			if(sw[9]) begin
				display(totalDispense, hex0[6:0]); display(19, hex1[6:0]);
	      display(19, hex2[6:0]); display(19, hex3[6:0]);
			end
			else begin
				display(0, hex0[6:0]); display(1, hex1[6:0]);
	      display(5, hex2[6:0]); display(3, hex3[6:0]);
			end   
	end
	
	50: begin 
		blink = 1'b1;
		if(counter_LEDBLIP == COUNT_LEDBLIP) begin
			counter_LEDBLIP <= 0;
			toggle <= !toggle;
		end
		else begin
			counter_LEDBLIP <= counter_LEDBLIP + 1;	
		end
		dispense(toggle, LED_reg[9:0]);
		if(updateOnce) begin
			totalDispense = totalDispense + 1;
			updateOnce = 1'b0;
		end
			if(sw[0]&&sw[1] || sw[0]&&sw[2] || sw[1]&&sw[2] || 
			   sw[0]&&sw[8] || sw[1]&&sw[8] || sw[2]&&sw[8] ||
			   sw[3]&&sw[0] || sw[3]&&sw[1] || sw[3]&&sw[2] || sw[3]&&sw[8] ||
			   sw[4]&&sw[0] || sw[4]&&sw[1] || sw[4]&&sw[2] || sw[4]&&sw[3] ||
			   sw[4]&&sw[8])
				increment(11);			
			if(sw[8])
				increment(-50);
			if(sw[0])
				increment(-45);
			if(sw[1])
				increment(-40);
			if(sw[2])
				increment(-25);
			if(sw[4])
				increment(-15);
			if(totalDispense > 15)
				totalDispense = 0;
			if(sw[9]) begin
				display(totalDispense, hex0[6:0]); display(19, hex1[6:0]);
	      display(19, hex2[6:0]); display(19, hex3[6:0]);
			end
			else begin
				display(5, hex0[6:0]); display(1, hex1[6:0]);
	      display(5, hex2[6:0]); display(3, hex3[6:0]);
			end       
	end
	
	55: begin 
		blink = 1'b1;
		if(counter_LEDBLIP == COUNT_LEDBLIP) begin
			counter_LEDBLIP <= 0;
			toggle <= !toggle;
		end
		else begin
			counter_LEDBLIP <= counter_LEDBLIP + 1;	
		end
		dispense(toggle, LED_reg[9:0]);
		if(updateOnce) begin
			totalDispense = totalDispense + 1;
			updateOnce = 1'b0;
		end
			if(sw[0]&&sw[1] || sw[0]&&sw[2] || sw[1]&&sw[2] || 
			   sw[0]&&sw[8] || sw[1]&&sw[8] || sw[2]&&sw[8] ||
			   sw[3]&&sw[0] || sw[3]&&sw[1] || sw[3]&&sw[2] || sw[3]&&sw[8] ||
			   sw[4]&&sw[0] || sw[4]&&sw[1] || sw[4]&&sw[2] || sw[4]&&sw[3] ||
			   sw[4]&&sw[8])
				increment(6);			
			if(sw[8])
				increment(-55);    
			if(sw[0])
				increment(-45);
			if(sw[1])
				increment(-40);
			if(sw[2])
				increment(-25);
			if(sw[4])
				increment(-20); 
			if(totalDispense > 15)
				totalDispense = 0;
			if(sw[9]) begin
				display(totalDispense, hex0[6:0]); display(19, hex1[6:0]);
	      display(19, hex2[6:0]); display(19, hex3[6:0]);
			end
			else begin
				display(0, hex0[6:0]); display(2, hex1[6:0]);
	      display(5, hex2[6:0]); display(3, hex3[6:0]);
			end  
	end
	
	60: begin 
		blink = 1'b1;
		if(counter_LEDBLIP == COUNT_LEDBLIP) begin
			counter_LEDBLIP <= 0;
			toggle <= !toggle;
		end
		else begin
			counter_LEDBLIP <= counter_LEDBLIP + 1;	
		end
		dispense(toggle, LED_reg[9:0]);
		if(updateOnce) begin
			totalDispense = totalDispense + 1;
			updateOnce = 1'b0;
		end
			if(sw[0]&&sw[1] || sw[0]&&sw[2] || sw[1]&&sw[2] || 
			   sw[0]&&sw[8] || sw[1]&&sw[8] || sw[2]&&sw[8] ||
			   sw[3]&&sw[0] || sw[3]&&sw[1] || sw[3]&&sw[2] || sw[3]&&sw[8] ||
			   sw[4]&&sw[0] || sw[4]&&sw[1] || sw[4]&&sw[2] || sw[4]&&sw[3] ||
			   sw[4]&&sw[8])
				increment(1);
			if(sw[8])
				increment(-60);  
			if(sw[0])
				increment(-55);
			if(sw[1])
				increment(-50);
			if(sw[2])
				increment(-45);
			if(sw[4])
				increment(-25);
			if(totalDispense > 15)
				totalDispense = 0;
			if(sw[9]) begin
				display(totalDispense, hex0[6:0]); display(19, hex1[6:0]);
	      display(19, hex2[6:0]); display(19, hex3[6:0]);
			end
			else begin
				display(5, hex0[6:0]); display(2, hex1[6:0]);
	      display(5, hex2[6:0]); display(3, hex3[6:0]);
			end      
	end
	
	61: begin display(19, hex0[6:0]); display(18, hex1[6:0]);
	          display(18, hex2[6:0]); display(17, hex3[6:0]);
			updateOnce = 1'b1;
			
			if(blink == 1'b1)begin
				if(counter_LEDBLIP == COUNT_LEDBLIP) begin
					counter_LEDBLIP <= 0;
					toggle <= !toggle;
				end
				else begin
					counter_LEDBLIP <= counter_LEDBLIP + 1;	
				end
					dispense(toggle, LED_reg[9:0]);
			end
			
			if(sw[8])
				increment(-61);  
			if(sw[0])
				increment(-61);
			if(sw[1])
				increment(-61);
			if(sw[2])
				increment(-61);
			if(sw[3])
				increment(-61);
			if(sw[4])
				increment(-26);
			if(!sw[8] || !sw[0] || !sw[1] || !sw[2] || !sw[3] || !sw[4])
				increment(-61);
			end
		
	100: begin 
		blink = 1'b1;
		if(counter_LEDBLIP == COUNT_LEDBLIP) begin
			counter_LEDBLIP <= 0;
			toggle <= !toggle;
		end
		else begin
			counter_LEDBLIP <= counter_LEDBLIP + 1;	
		end
		dispense(toggle, LED_reg[9:0]);
		if(updateOnce) begin
			totalDispense = totalDispense + 1;
			updateOnce = 1'b0;
		end
			if(sw[0]&&sw[1] || sw[0]&&sw[2] || sw[1]&&sw[2] || 
			   sw[0]&&sw[8] || sw[1]&&sw[8] || sw[2]&&sw[8] ||
			   sw[3]&&sw[0] || sw[3]&&sw[1] || sw[3]&&sw[2] || sw[3]&&sw[8] ||
			   sw[4]&&sw[0] || sw[4]&&sw[1] || sw[4]&&sw[2] || sw[4]&&sw[3] ||
			   sw[4]&&sw[8])
				increment(1);
			if(sw[8])
				increment(-100);  
			if(sw[0])
				increment(-95);
			if(sw[1])
				increment(-90);
			if(sw[2])
				increment(-75); 
			if(sw[3])
				increment(-39);
			if(sw[4])
				increment(-65);
			if(totalDispense > 15)
				totalDispense = 0;
			if(sw[9]) begin
				display(totalDispense, hex0[6:0]); display(19, hex1[6:0]);
	      display(19, hex2[6:0]); display(19, hex3[6:0]);
			end
			else begin
				display(5, hex0[6:0]); display(6, hex1[6:0]);
	      display(5, hex2[6:0]); display(3, hex3[6:0]);
			end
   
	end
		
	105: begin 
		blink = 1'b1;
		if(counter_LEDBLIP == COUNT_LEDBLIP) begin
			counter_LEDBLIP <= 0;
			toggle <= !toggle;
		end
		else begin
			counter_LEDBLIP <= counter_LEDBLIP + 1;	
		end
		dispense(toggle, LED_reg[9:0]);
		if(updateOnce) begin
			totalDispense = totalDispense + 1;
			updateOnce = 1'b0;
		end
			if(sw[0]&&sw[1] || sw[0]&&sw[2] || sw[1]&&sw[2] || 
			   sw[0]&&sw[8] || sw[1]&&sw[8] || sw[2]&&sw[8] ||
			   sw[3]&&sw[0] || sw[3]&&sw[1] || sw[3]&&sw[2] || sw[3]&&sw[8] ||
			   sw[4]&&sw[0] || sw[4]&&sw[1] || sw[4]&&sw[2] || sw[4]&&sw[3] ||
			   sw[4]&&sw[8])
				increment(1);
			if(sw[8])
				increment(-105);  
			if(sw[0])
				increment(-100);
			if(sw[1])
				increment(-95);
			if(sw[2])
				increment(-80); 
			if(sw[4])
				increment(-70); 
			if(totalDispense > 15)
				totalDispense = 0;
			if(sw[9]) begin
				display(totalDispense, hex0[6:0]); display(19, hex1[6:0]);
	      display(19, hex2[6:0]); display(19, hex3[6:0]);
			end
			else begin
				display(0, hex0[6:0]); display(7, hex1[6:0]);
	      display(5, hex2[6:0]); display(3, hex3[6:0]);
			end  
	end

	110: begin 
		blink = 1'b1;
		if(counter_LEDBLIP == COUNT_LEDBLIP) begin
			counter_LEDBLIP <= 0;
			toggle <= !toggle;
		end
		else begin
			counter_LEDBLIP <= counter_LEDBLIP + 1;	
		end
		dispense(toggle, LED_reg[9:0]);
		if(updateOnce) begin
			totalDispense = totalDispense + 1;
			updateOnce = 1'b0;
		end
			if(sw[0]&&sw[1] || sw[0]&&sw[2] || sw[1]&&sw[2] || 
			   sw[0]&&sw[8] || sw[1]&&sw[8] || sw[2]&&sw[8] ||
			   sw[3]&&sw[0] || sw[3]&&sw[1] || sw[3]&&sw[2] || sw[3]&&sw[8] ||
			   sw[4]&&sw[0] || sw[4]&&sw[1] || sw[4]&&sw[2] || sw[4]&&sw[3] ||
			   sw[4]&&sw[8])
				increment(1);
			if(sw[8])
				increment(-110);  
			if(sw[0])
				increment(-105);
			if(sw[1])
				increment(-10);
			if(sw[2])
				increment(-85);    
			if(sw[4])
				increment(-75);
			if(totalDispense > 15)
				totalDispense = 0;
			if(sw[9]) begin
				display(totalDispense, hex0[6:0]); display(19, hex1[6:0]);
	      display(19, hex2[6:0]); display(19, hex3[6:0]);
			end
			else begin
				display(5, hex0[6:0]); display(7, hex1[6:0]);
	      display(5, hex2[6:0]); display(3, hex3[6:0]);
			end 
	end
	
	125: begin 
		blink = 1'b1;
		if(counter_LEDBLIP == COUNT_LEDBLIP) begin
			counter_LEDBLIP <= 0;
			toggle <= !toggle;
		end
		else begin
			counter_LEDBLIP <= counter_LEDBLIP + 1;	
		end
		dispense(toggle, LED_reg[9:0]);
		if(updateOnce) begin
			totalDispense = totalDispense + 1;
			updateOnce = 1'b0;
		end
			if(sw[0]&&sw[1] || sw[0]&&sw[2] || sw[1]&&sw[2] || 
			   sw[0]&&sw[8] || sw[1]&&sw[8] || sw[2]&&sw[8] ||
			   sw[3]&&sw[0] || sw[3]&&sw[1] || sw[3]&&sw[2] || sw[3]&&sw[8] ||
			   sw[4]&&sw[0] || sw[4]&&sw[1] || sw[4]&&sw[2] || sw[4]&&sw[3] ||
			   sw[4]&&sw[8])
				increment(1);
			if(sw[8])
				increment(-125);  
			if(sw[0])
				increment(-120);
			if(sw[1])
				increment(-115);
			if(sw[2])
				increment(-100);  
			if(sw[4])
				increment(-90);
			if(totalDispense > 15)
				totalDispense = 0;
			if(sw[9]) begin
				display(totalDispense, hex0[6:0]); display(19, hex1[6:0]);
	      display(19, hex2[6:0]); display(19, hex3[6:0]);
			end
			else begin
				display(0, hex0[6:0]); display(9, hex1[6:0]);
	      display(5, hex2[6:0]); display(3, hex3[6:0]);
			end  
	end
		
	default: begin display(0, hex0[6:0]); display(1, hex1[6:0]);
	               display(0, hex2[6:0]); display(0, hex3[6:0]);
								 increment(-36);
	         end                
	endcase
end


	//create a task that simply increments
	task increment;		
		input integer incrementBy;

		//The counting process
		if(!key[3] && (mylatch == 1'b0)) begin
			if(delay2 >= 20) begin
				mylatch = 1'b1;
				state = state + incrementBy;
				delay2 <= 0;
			end
			else begin
				delay2 <= delay2 +1;
			end
		end
		else if(key[3] && (mylatch == 1'b1)) begin
			if(delay >= 20)begin 
				mylatch = 1'b0;
				delay <= 0;
			end
			else begin
				delay <= delay + 1;
			end
		end
	endtask

	task display;
		input integer num;
		output reg[6:0]HEX;
		
		case (num)
			0:  begin HEX[6:0] = 7'b1000000; end
			1:  begin HEX[6:0] = 7'b1111001; end
			2:  begin HEX[6:0] = 7'b0100100; end
			3:  begin HEX[6:0] = 7'b0110000; end
			4:  begin HEX[6:0] = 7'b0011001; end
			5:  begin HEX[6:0] = 7'b0010010; end
			6:  begin HEX[6:0] = 7'b0000010; end
			7:  begin HEX[6:0] = 7'b1111000; end
			8:  begin HEX[6:0] = 7'b0000000; end
			9:  begin HEX[6:0] = 7'b0010000; end
			10: begin HEX[6:0] = 7'b0001000; end
			11: begin HEX[6:0] = 7'b0000011; end
			12: begin HEX[6:0] = 7'b1000110; end
			13: begin HEX[6:0] = 7'b0100001; end
			14: begin HEX[6:0] = 7'b0000110; end
			15: begin HEX[6:0] = 7'b0001110; end
			16: begin HEX[6:0] = 7'b1111111; end
			17: begin HEX[6:0] = 7'b0000110; end//E
			18: begin HEX[6:0] = 7'b0101111; end//r
			19: begin HEX[6:0] = 7'b1111111; end//blank
			default: 			                 ; 
		endcase
	endtask 

	//Task that blinks the red LED's during 
	//dispensing...
	task dispense;
		input integer num;
		output reg [9:0]LED_reg;

		if(num == 1) begin
			LED_reg[9:0] = 10'b1111111111;
		end
		else begin
			LED_reg[9:0] = 10'b0000000000;
		end
	endtask
endmodule