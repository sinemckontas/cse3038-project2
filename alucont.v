module alucont(aluop1,aluop0,f5,f4,f3,f2,f1,f0,gout,brnout);//Figure 4.12 
input aluop1,aluop0,f5,f4,f3,f2,f1,f0;
output [2:0] gout;
output brnout;
reg [2:0] gout;
reg brnout;
always @(aluop1 or aluop0 or f5 or f4 or f3 or f2 or f1 or f0)
begin
if(~(aluop1|aluop0))  gout=3'b010;
if(aluop0)gout=3'b110;
if(aluop1)//R-type
begin
	if (f5&~f4&~f3&~f2&~f1&~f0)gout=3'b010; 	//function code=100000,ALU control=010 (2)(add)
	if (f5&~f4&f3&~f2&f1&~f0)gout=3'b111;			//function code=101010,ALU control=111 (7)(set on less than)
	if (f5&~f4&~f3&~f2&f1&~f0)gout=3'b110;		//function code=100010,ALU control=110 (6)(sub)
	if (f5&~f4&~f3&f2&~f1&f0)gout=3'b001;			//function code=100101,ALU control=001 (1)(or)
	if (f5&~f4&~f3&f2&~f1&~f0)gout=3'b000;		//function code=100100,ALU control=000 (0)(and)
	if (~f5&f4&~f3&f2&~f1&f0)gout=3'b010;		//function code=010101,ALU control=010 (2)(brn), same as add since it will only add 0
	brnout=(~f5&f4&~f3&f2&~f1&f0);
	if (~f5&~f4&~f3&f2&~f1&~f0) gout=3'b011;	//function code=000100, ALU control=011 (3)(sllv), since this is a brand new instruction with shift operation
end
end
endmodule
