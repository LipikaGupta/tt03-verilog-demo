`timescale 1ns / 1ps
module Signed_Calculator_2B_BM(output reg [4:0]answer, output reg [2:0] remainder, input [1:0] a,b, input sa,sb, input [1:0] opn);
	always @* begin : AWS
			case({sa,sb})
				2'd0 : begin : CASE1
					case(opn)
						2'd0 : answer = a + b;
						2'd1 : answer = a - b;
						2'd2 : answer = a * b;
						2'd3 : begin : DIV1
							if (a==2'd0 | b==2'd0) begin
								answer = 5'd0;
								remainder = 3'd0;
							end
							else begin
								answer = a / b;
								remainder = a % b;
							end
						end : DIV1
					endcase
				end : CASE1
				
				2'd1 : begin : CASE2
					case(opn)
						2'd0 : answer = a - b;
						2'd1 : answer = a + b;
						2'd2 : answer = -(a * b);
						2'd3 : begin : DIV2
							if (a==2'd0 | b==2'd0) begin
								answer = 5'd0;
								remainder = 3'd0;
							end
							else begin : DIV2ELSE
								if ((a % b)==0) begin
									answer = -(a / b);
									remainder = a % b;
								end
								else if (a>b) begin
									answer = -((a / b) + 5'd1);
									remainder = b - (a%b) ;
								end
								else if (a<b) begin
									answer = -((a / b) + 5'd1);
									remainder = b - a;
								end
								else begin
									answer = -(a / b);
									remainder = a % b;
								end
							end : DIV2ELSE
						end : DIV2
					endcase
				end : CASE2
				
				2'd2 : begin : CASE3
					case(opn)
						2'd0 : answer = - a + b;
						2'd1 : answer = - a - b;
						2'd2 : answer = -(a * b);
						2'd3 : begin : DIV3
							if (a==2'd0 | b==2'd0) begin
								answer = 5'd0;
								remainder = 3'd0;
							end
							else begin : DIV3ELSE
								if ((a % b)==0) begin
									answer = -(a / b);
									remainder = a % b;
								end
								else if (a>b) begin
									answer = -((a / b) + 5'd1);
									remainder = b - (a%b) ;
								end
								else if (a<b) begin
									answer = -((a / b) + 5'd1);
									remainder = b - a;
								end
								else begin
									answer = -(a / b);
									remainder = a % b;
								end
							end : DIV3ELSE
						end : DIV3
					endcase
				end : CASE3
				
				2'd3: begin : CASE4
					case(opn)
						2'd0 : answer = - (a + b);
						2'd1 : answer = - a + b;
						2'd2 : answer = a * b;
						2'd3 : begin : DIV4
							if (a==2'd0 | b==2'd0) begin
								answer = 5'd0;
								remainder = 3'd0;
							end
							else begin
								answer = a / b;
								remainder = a % b;
							end
						end : DIV4
					endcase
				end : CASE4
			endcase
	end : AWS
endmodule
