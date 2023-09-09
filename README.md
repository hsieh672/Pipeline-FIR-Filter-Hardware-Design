# Pipeline-FIR-filter
The minimum number of taps is used in the FIR low-pass filter to achieve an allowed deviation < -40 dB.  
To reduce the critical path delay, add a pipeline to the architecture, the critical path delay from the original 𝑇𝑚𝑢𝑙 + (𝑁 − 1) ∗ 𝑇𝑎𝑑𝑑 to 𝑇𝑚𝑢𝑙 + 𝑇𝑎𝑑𝑑, where N is the number of taps. I expect the SNR to be greater than 50 dB in the fixed-point simulation results and the clock speed to increase up to 4 times.  
## Block diagram
![direct](https://github.com/hsieh672/Pipeline-FIR-filter/blob/main/imag/direct.png)  
![transpose](https://github.com/hsieh672/Pipeline-FIR-filter/blob/main/imag/transpose.png)  
![pipeline](https://github.com/hsieh672/Pipeline-FIR-filter/blob/main/imag/pipeline.png)  
## FIR filter design
To generate the FIR low-pass filter with minimum tap count, use the firceqrip() function in MATLAB to find the filter coefficients for the specifications of Fs = 8k, fp = 1.5k, and Δf = 0.5k.  
```sh
eqnum = firceqrip('minorder',[0.375 0.5],[0.01 0.01]); % eqnum = vec of coeffs
fvtool(eqnum) % Visualize filter
```
![design](https://github.com/hsieh672/Pipeline-FIR-filter/blob/main/imag/FIR_filter.png)  

| number | coefficients | number | coefficients |
|--------|--------------|--------|--------------|
| h0     | -0.003228676 | h17    | 0.402422410  |
| h1     | 0.006687062  | h18    | 0.185931227  |
| h2     | 0.007508142  | h19    | -0.034753709 |
| h3     | -0.002885080 | h20    | -0.085897199 |
| h4     | -0.01172004  | h21    | -0.007522090 |
| h5     | -0.000729732 | h22    | 0.048108705  |
| h6     | 0.017582985  | h23    | 0.020060672  |
| h7     | 0.009693306  | h24    | -0.024835213 |
| h8     | -0.021422765 | h25    | -0.021422765 |
| h9     | -0.024835213 | h26    | 0.009693306  |
| h10    | 0.020060672  | h27    | 0.017582985  |
| h11    | 0.048108705  | h28    | -0.000729732 |
| h12    | -0.007522090 | h29    | -0.011720046 |
| h13    | -0.085897199 | h30    | -0.002885080 |
| h14    | -0.034753709 | h31    | 0.007508142  |
| h15    | 0.185931227  | h32    | 0.006687062  |
| h16    | 0.402422410  | h33    | -0.003228676 |

Used the coefficients I obtained above to construct the FIR filter:  
```sh
// the FIR filter function
void firFloat(double *coeffs, double *input, double *output,
	int length, int filterLength)
{
	double acc;     // accumulator
	double *coeffp; // coefficients
	double *inputp; // input samples
	int n;
	int k;

	memcpy(&insamp[filterLength - 1], input,
		length * sizeof(double));

	for (n = 0; n < length; n++) {
		coeffp = coeffs;
		inputp = &insamp[filterLength - 1 + n];
		acc = 0;
		for (k = 0; k < filterLength; k++) {
			acc += (*coeffp++) * (*inputp--);
		}
		output[n] = acc;
	}
	memmove(&insamp[0], &insamp[length],
		(filterLength - 1) * sizeof(double));

}
```
## Floating-point and Fixed-point simulation results
Generate three sets of random signed-value signals with a data size of 50,000 each. The following is the simulation result for one of the sets of data.  
![floating](https://github.com/hsieh672/Pipeline-FIR-filter/blob/main/imag/floating.png)  

In fixed-point simulation, because the input signal is random signed-value signals ranging from 0 to 1, more bits are required to approach saturation for SNR. To balance hardware costs and meet the target specifications, a word-length design of 13 bits is adopted, which includes one signed bit, one integer part bit, and 11 fractional part bits.  
![WL](https://github.com/hsieh672/Pipeline-FIR-filter/blob/main/imag/WL.png)  
![fix](https://github.com/hsieh672/Pipeline-FIR-filter/blob/main/imag/fixed-point.png)  

It is challenging to observe the difference between the simulation results of C# and Verilog after passing through the FIR low-pass filter with the naked eye. However, regarding SNR comparison, the Verilog simulation result is approximately 1.5 dB lower than the C# simulation result.

The reason for this difference is that quantizing the signal reduces the amount of data, which allows for better results with the same precision in computation. However, when considering the accuracy of the output data, using unquantized signals can achieve more accurate results.

The choice of fixed-point word length is based on the C# simulation result, which is approximately two less significant bits different from the Verilog simulation result, resulting in a lower SNR value. If the goal is to achieve a 50 dB SNR in Verilog simulation results, a word length of 14 bits can be used, increasing costs.


| SNR\dataset | 1       | 2       | 3       |
|-------------|---------|---------|---------|
| C#          | 50.1709 | 50.0973 | 50.1248 |
| Verilog     | 48.6986 | 48.7159 | 48.6825 |

## Hardware design
![HD](https://github.com/hsieh672/Pipeline-FIR-filter/blob/main/imag/HWDesign.png)  
In the FIR filter architecture shown above, i represents the computation of the i+1th tap, where i = [0:33], for 34 fixtures. In the upper part of the structure, the output dp_i is the input signal of the next pipeline stage's added D-flip flop. In the lower part of the structure, d(i) is the input signal of the next pipeline stage's added D-flip flop.

Multiplication is calculated using 2's complement for positive and negative input data. If the input data is harmful, it is first converted to a positive value before multiplication, and all multiplication operations are performed through logical processes.

Because the FIR filter coefficients have a symmetric property, only 17 registers are needed to store the coefficient values, reducing hardware usage costs. Specifically, coefficients h17~h0 are reused in taps 18-34.  
## Verilog simulation
X is the input signal, dataout is the output signal, i is the total number of input data, and j is the index of the current input/output data in the entire dataset.  
![simulation](https://github.com/hsieh672/Pipeline-FIR-filter/blob/main/imag/simulation.png)  

## Synthesis
![synthesis](https://github.com/hsieh672/Pipeline-FIR-filter/blob/main/imag/synthesis.png)  

Here, I have included the transposed form for comparison, and the clock speed of the transposed form and pipeline architecture has increased by approximately 4.5 times. The clock period is required for one multiplier and adder to complete their operation. The speedup achieved is as expected.  
Although the number of clock cycles required from input to output in the pipeline architecture has increased, the latency is reduced due to the increased clock speed, resulting in a throughput improvement of approximately two times.  

