#include <stdio.h>
#include <stdint.h>
#include <stdlib.h>
#include <string.h>
#include <math.h>


#define FILTER_LEN  34

double insamp[FILTER_LEN];

// FIR initial
void firFloatInit(void)
{
	memset(insamp, 0, sizeof(insamp));
}

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


double coeffs[FILTER_LEN] =
{
  -0.00322867630840993 , 0.00668706283972872 , 0.00750814238064482 , -0.00288508087987160 , -0.0117200461453065 ,
  -0.000729732002661702 , 0.0175829853221176 , 0.00969330654800287 , -0.0214227651995731 , -0.0248352132875825 , 
  0.0200606728029008 , 0.0481087054444618 , -0.00752209048250370 , -0.0858971992423787 , -0.0347537090677002 ,
  0.185931227077790 , 0.402422410200341 , 0.402422410200341 , 0.185931227077790 , -0.0347537090677002 , 
  -0.0858971992423787 , -0.00752209048250370 , 0.0481087054444618 , 0.0200606728029008 , -0.0248352132875825 ,
  -0.0214227651995731 , 0.00969330654800287 , 0.0175829853221176 , -0.000729732002661702 , -0.0117200461453065 ,
  -0.00288508087987160 , 0.00750814238064482 , 0.00668706283972872 , -0.00322867630840993
};


int main(void)
{
	int size = 1;
	double output;
	double inputp[40000];
	double input = 0;
	int inputsize = 40000;

	firFloatInit();

	FILE *f1 = fopen("input_24bits.txt", "r");
	FILE *f2 = fopen("floatoutput.txt", "w");

	for (int i = 0; i < inputsize; i++) {
		fscanf(f1, "%lf", &inputp[i]);
	}

	for (int i = 0; i < inputsize; i++) {
		input = inputp[i];

		firFloat(coeffs, &input, &output, size, FILTER_LEN);
		fprintf(f2, "%f\n", output);
	}
	fclose(f1);
	fclose(f2);

	return 0;
}