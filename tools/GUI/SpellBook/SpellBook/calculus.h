/*
 *  calculus.h
 *  StarTrekSim
 *
 *  Created by Rick Sanchez on 9/15/19.
 *  Copyright 2019 Informabox Tech. All rights reserved.
 *
 */

#include <iostream>
#include <math.h>

/* NAVIGATION */
double WarpCoef(double x){
	return abs( abs( (log(x)+x*x) * ((-0.613*x*(x-(-0.949))) / sqrt(x) ) + cos(sin(sin(x))) + sqrt(sqrt(sqrt(x))) ) + tan(-0.558) ) + cos(tan(-0.924) + sqrt(-0.191) + x);
}

double DistanceTS(double wcoef){
	return ( (11/216000) * WarpCoef(wcoef) ) / 2;
}

double DistanceTSminute(double wcoef){
	return ( ( (11/216000) * WarpCoef(wcoef) ) / 2 ) * 60;
}

double AutoWarpCoef(double POSX, double POSY, double DESTX, double DESTY){
	return sqrt( abs( DESTX - POSX ) + POSY - DESTY + tan(sqrt(POSX)) + tan(POSY) + (POSY/(0.1+DESTX)) );
}


/* COMBAT */

double getDammage(double attacker_atk, double self_def){
	return attacker_atk * 4 - self_def * 2;
}