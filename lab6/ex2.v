module  dec3to8(W,Y,En);
input [2:0]W;
output  [0:7]Y;
input En;
reg [0:7]Y;
integer k;
always @ (W or En) begin
for(k=0;k<=7;k=k+1) begin
if((W==k)&&(En==1))
 Y[k]=1;
 else
 Y[k]=0;
 end
 end
endmodule


module dec4to16(W,Y,En);
input [3:0]W; input En;
output  [0:15]Y;
wire [0:7] y0,y1;
 dec3to8 m(W[2:0],y0,(~W[3])&En);
 dec3to8 m1(W[2:0],y1,(W[3])&En);
 assign y={y1,y0};
 endmodule
