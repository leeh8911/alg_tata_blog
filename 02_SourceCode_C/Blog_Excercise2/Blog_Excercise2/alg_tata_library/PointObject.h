#pragma once
class PointObject
{
private:
	double x;
	double y;

public:
	PointObject();
	~PointObject();

	char SetVector(double x, double y);
	char GetVector(double* x, double* y);
	char PrintVector(void);
	
	char Add (PointObject vec2, PointObject *result);
	char Diff(PointObject vec2, PointObject* result);
	char ConstMult(double c, PointObject* result);
	double Dot (PointObject vec2);

};

