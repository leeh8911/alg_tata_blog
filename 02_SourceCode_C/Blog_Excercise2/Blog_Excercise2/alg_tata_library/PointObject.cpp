#include "PointObject.h"
#include "includes.h"

PointObject::PointObject()
{
	this->x = 0;
	this->y = 0;
}

PointObject::~PointObject()
{
	;
}

char PointObject::SetVector(double x, double y)
{
	this->x = x;
	this->y = y;

	return 1;
}

char PointObject::GetVector(double* x, double* y)
{
	*x = this->x;
	*y = this->y;

	return 1;
}

char PointObject::PrintVector(void)
{
	printf("this vector is [%f, %f]\n", this->x, this->y);

	return 1;
}
char PointObject::Add(PointObject vec2, PointObject* result)
{
	result->x = this->x + vec2.x;
	result->y = this->y + vec2.y;

	return 1;
}

char PointObject::Diff(PointObject vec2, PointObject* result)
{
	result->x = this->x - vec2.x;
	result->y = this->y - vec2.y;

	return 1;
}

char PointObject::ConstMult(double c, PointObject* result)
{
	result->x = c * this->x;
	result->y = c * this->y;

	return 1;
}

double PointObject::Dot(PointObject vec2)
{
	double result = 0;
	result += this->x * vec2.x;
	result += this->y * vec2.y;

	return result;
}