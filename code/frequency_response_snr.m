clear;
clc;
len = 11;

fixoutputfile = 'C:\Users\88697\Desktop\NTHU\DSPIC\final\Project2\fixoutput.txt';
floatinputfile = 'C:\Users\88697\Desktop\NTHU\DSPIC\final\Project1\Project1\floatinput.txt';
floatoutputfile = 'C:\Users\88697\Desktop\NTHU\DSPIC\final\Project1\Project1\floatoutput.txt';
verilogoutputfile = 'C:\Users\88697\Desktop\NTHU\DSPIC\final\project_1\project_1.sim\sim_1\behav\verilogout.txt';

%[fixdatain]=textread(fixinputfile,'%f');
[fixdataout]=textread(fixoutputfile,'%f');
[floatdatain]=textread(floatinputfile,'%f');
[floatdataout]=textread(floatoutputfile,'%f');
[verilogdataout]=textread(verilogoutputfile, '' , 'headerlines', 1);


%fvtool(fixdatain);
fixdataout = roundn(fixdataout./(2^len),-len);
fvtool(fixdataout);
fvtool(floatdatain);
fvtool(floatdataout);
vdataout = roundn(verilogdataout./(2^len),-len);
fvtool(vdataout);

Pin = 0;
Pout = 0;
for i = 1:50000
    Pin = Pin + (floatdataout(i)^2);
end

for i = 1:40000
    Pout = Pout + (floatdataout(i)-fixdataout(i))^2;
end

SNR = 10*log10(Pin/Pout);

Pout2 = 0;
for i = 1:50000
    Pout2 = Pout2 + (floatdataout(i)-vdataout(i))^2;
end

SNR2 = 10*log10(Pin/Pout2);


