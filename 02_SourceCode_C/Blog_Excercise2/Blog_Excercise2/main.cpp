#include <stdio.h>

char isIntersect(float* A, float* B, float* C, float* D, float* H);


void main(void)
{
	float A[2] = { 1, 1 };
	float B[2] = { -1, -1 };
	float C[2] = { 1, -1 };
	float D[2] = { -1, 1 };
	float E[2] = { 1.5, 1.5 };
	float F[2] = { -1.5, 1.5 };
	float H1[2] = { 0 };
	float H2[2] = { 0 };
	float H3[2] = { 0 };

	char intersectl1l2 = isIntersect(A, B, C, D, H1);
	char intersectl2l3 = isIntersect(C, D, E, F, H2);
	char intersectl1l3 = isIntersect(A, B, E, F, H3);

	printf("l1-l2 is intersect?  %c, [%f, %f]\n", intersectl1l2 ? 'o' : 'x', H1[0], H1[1]);
	printf("l2-l3 is intersect?  %c, [%f, %f]\n", intersectl2l3 ? 'o' : 'x', H2[0], H2[1]);
	printf("l1-l3 is intersect?  %c, [%f, %f]\n", intersectl1l3 ? 'o' : 'x', H3[0], H3[1]);
}


char isIntersect(float* A, float* B, float* C, float* D, float* H)
{
	float CA[2] = { 0 };
	float CB[2] = { 0 };
	float CD[2] = { 0 };

	CA[0] = A[0] - C[0];
	CA[1] = A[1] - C[1];
	CB[0] = B[0] - C[0];
	CB[1] = B[1] - C[1];
	CD[0] = D[0] - C[0];
	CD[1] = D[1] - C[1];

	float c1 = CD[0] * CA[1] - CD[1] * CA[0];
	float c2 = CD[0] * CB[1] - CD[1] * CB[0];
	float c3 = CB[0] * CA[1] - CB[1] * CA[0];

	float a = -c2 / (c1 - c2);
	float b = c3 / (c1 - c2);

	H[0] = CD[0] * b + C[0];
	H[1] = CD[1] * b + C[1];

 	if (((0 <= a) && (a <= 1)) && ((0 <= b) && (b <= 1)))
	{
		return 1;
	}
	else
	{
		return 0;
	}
}