# Pipeline-FIR-filter
In the FIR low-pass filter, the minimum number of taps is used to achieve an allowed deviation < -40 dB.  
In order to reduce the critical path delay, add pipeline to the architecture
## Block diagraam
![direct](https://github.com/hsieh672/Pipeline-FIR-filter/blob/main/imag/direct.png)  
![transpose](https://github.com/hsieh672/Pipeline-FIR-filter/blob/main/imag/transpose.png)  
![pipeline](https://github.com/hsieh672/Pipeline-FIR-filter/blob/main/imag/pipeline.png)  
## FIR filter design
To generate a FIR low-pass filter with minimum tap count, use the firceqrip() function in MATLAB to find the filter coefficients for the specifications of Fs = 8k, fp = 1.5k, and Δf = 0.5k.  
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



| SNR\dataset | 1       | 2       | 3       |
|-------------|---------|---------|---------|
| C#          | 50.1709 | 50.0973 | 50.1248 |
| Verilog     | 48.6986 | 48.7159 | 48.6825 |
