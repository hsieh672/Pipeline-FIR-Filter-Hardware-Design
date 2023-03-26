clear;
clc;
len = 11;

fixinputfile = 'C:\Users\88697\Desktop\NTHU\DSPIC\HW4\Q2\Project2\Project2\input_8bits.txt';
fixoutputfile = 'C:\Users\88697\Desktop\NTHU\DSPIC\HW4\Q2\Project2\Project2\fixoutput.txt';
floatinputfile = 'C:\Users\88697\Desktop\NTHU\DSPIC\HW4\Q2\Project1\Project1\input_24bits.txt';
floatoutputfile = 'C:\Users\88697\Desktop\NTHU\DSPIC\HW4\Q2\Project1\Project1\floatoutput.txt';
verilogoutputfile = 'C:\Users\88697\Desktop\NTHU\DSPIC\HW4\Q2\project_1\project_1.sim\sim_1\behav\verilogout.txt';

[fixdatain]=textread(fixinputfile,'%f');
[fixdataout]=textread(fixoutputfile,'%f');
[floatdatain]=textread(floatinputfile,'%f');
[floatdataout]=textread(floatoutputfile,'%f');
[verilogdataout]=textread(verilogoutputfile, '' , 'headerlines', 1);


fvtool(fixdatain);
fixdataout = roundn(fixdataout./(2^len),-len);
fvtool(fixdataout);
fvtool(floatdatain);
fvtool(floatdataout);
vdataout = roundn(verilogdataout./(2^len),-len);
fvtool(vdataout);

Pin = 0;
Pout = 0;
for i = 1:40000
    Pin = Pin + (floatdataout(i)^2);
end

for i = 1:40000
    Pout = Pout + (floatdataout(i)-fixdataout(i))^2;
end

SNR = 10*log10(Pin/Pout);

Pout2 = 0;
for i = 1:40000
    Pout2 = Pout2 + (floatdataout(i)-vdataout(i))^2;
end

SNR2 = 10*log10(Pin/Pout2);


