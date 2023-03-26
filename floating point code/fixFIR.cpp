#include <stdio.h>
#include <stdint.h>
#include <stdlib.h>
#include <string.h>
#include <math.h>


#define FILTER_LEN  34
#define FIXED_POINT_FRACTIONAL_BITS 11

int16_t insamp[FILTER_LEN];

// FIR initial
void firFixedInit(void)
{
	memset(insamp, 0, sizeof(insamp));
}

// the FIR filter function
void firFixed(int16_t *coeffs, int16_t *input, double *output,
	int length, int filterLength)
{
	int32_t acc;     // accumulator
	int16_t *coeffp; // coefficients
	int16_t *inputp; // input samples
	int n;
	int k;

	memcpy(&insamp[filterLength - 1], input,
		length * sizeof(double));

	for (n = 0; n < length; n++) {
		coeffp = coeffs;
		inputp = &insamp[filterLength - 1 + n];
		acc = 0;
		for(k = 0; k < filterLength; k++) {
			acc += (int32_t)(*coeffp++) * (int32_t)(*inputp--);
		}
		output[n] = acc;
		output[n] = (double)(double(acc) /(1 << FIXED_POINT_FRACTIONAL_BITS));
	}

	memmove(&insamp[0], &insamp[length],
		(filterLength - 1) * sizeof(int16_t));

}


double coeff[FILTER_LEN] =
{
  -0.00322867630840993 , 0.00668706283972872 , 0.00750814238064482 , -0.00288508087987160 , -0.0117200461453065 ,
  -0.000729732002661702 , 0.0175829853221176 , 0.00969330654800287 , -0.0214227651995731 , -0.0248352132875825 ,
  0.0200606728029008 , 0.0481087054444618 , -0.00752209048250370 , -0.0858971992423787 , -0.0347537090677002 ,
  0.185931227077790 , 0.402422410200341 , 0.402422410200341 , 0.185931227077790 , -0.0347537090677002 ,
  -0.0858971992423787 , -0.00752209048250370 , 0.0481087054444618 , 0.0200606728029008 , -0.0248352132875825 ,
  -0.0214227651995731 , 0.00969330654800287 , 0.0175829853221176 , -0.000729732002661702 , -0.0117200461453065 ,
  -0.00288508087987160 , 0.00750814238064482 , 0.00668706283972872 , -0.00322867630840993
};


void double_to_fixed(double *input, int16_t *output, int length)
{
	int i;

	for (i = 0; i < length; i++) {
		output[i] = (int16_t)(floor(input[i] * (1 << FIXED_POINT_FRACTIONAL_BITS)));
	}
}


int main(void)
{
	int size = 1;
	int16_t input = 0;
	double inputp[40000];
	double output;
	int inputsize = 40000;
	int16_t save = 0;
	int16_t coeffs[FILTER_LEN];

	for (int i = 0; i < FILTER_LEN; i++) {
		double_to_fixed(&coeff[i], &coeffs[i],1);
	}


	firFixedInit();

	FILE *f1 = fopen("fixoutput.txt", "w");
	FILE *f2 = fopen("C:/Users/88697/Desktop/NTHU/DSPIC/HW4/Q2/Project2/Project2/input_8bits.txt", "r");
	FILE *f3 = fopen("fixinput.txt", "w");

	for (int i = 0; i < inputsize; i++){
		fscanf(f2, "%lf", &inputp[i]);
	}

	for (int i = 0; i < inputsize; i++) {
		double_to_fixed(&inputp[i],&input,1);
		fprintf(f3, "%d\n", input);

		firFixed(coeffs, &input, &output, size, FILTER_LEN);
		fprintf(f1, "%f\n", output);
	}
	fclose(f1);
	fclose(f2);
	fclose(f3);

	return 0;
}