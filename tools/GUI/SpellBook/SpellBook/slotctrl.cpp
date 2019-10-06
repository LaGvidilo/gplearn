/*
 *  slotctrl.cpp
 *  StarTrekSim
 *
 *  Created by Rick Sanchez on 9/20/19.
 *  Copyright 2019 Informabox Tech. All rights reserved.
 *
 */

#include "slotctrl.h"

/* RS_CELL class */
RS_CELL::RS_CELL(bool outp){
	OUTPUT = outp;
}
void RS_CELL::SET(){
	OUTPUT = true;
}
void RS_CELL::RESET(){
	OUTPUT = false;
}
bool RS_CELL::GET(){
	return OUTPUT;
}






/* Slots CLASS */


void Slots::setProblem(unsigned int problm){
	problem = problm;
}

bool Slots::verifySolution(unsigned int solution){
	unsigned int k=problem;
	srand(k);
	INP0 = funcsuper.int2boolvector(rand()%((int)pow(2,inbase)),inbase);
	cout << "Generate("<<k<<")"<<endl;
	INMP sltprg;
	LP lpp;
	lpp.setSeed(k);
	lpp.generateVectorStructure(couches, inbase, outfin);
	lpp.generateVectorProgram();
		
	lpp.setInputs(INP0);
	lpp.compute();
	lpp.generateVectorProgram();
	
	//partie 2
	unsigned int i = solution;
	LP lpp2;
	lpp2.setSeed(i);
	lpp2.generateVectorStructure(couches, inbase, outfin);
	lpp2.generateVectorProgram();
	lpp2.setInputs(INP0);
	lpp2.compute();
			
	if (lpp.getOutputs() == lpp2.getOutputs()){
		return true;
	}
	else{
		return false;
	}
}

string Slots::displayProgram(unsigned int solution){
	unsigned int k=problem;
	srand(k);
	INP0 = funcsuper.int2boolvector(rand()%((int)pow(2,inbase)),inbase);
	cout << "Generate("<<k<<")"<<endl;
	INMP sltprg;
	LP lpp;
	lpp.setSeed(k);
	lpp.generateVectorStructure(couches, inbase, outfin);
	lpp.generateVectorProgram();
		
	lpp.setInputs(INP0);
	lpp.compute();
	lpp.generateVectorProgram();
		
	//partie 2
	unsigned int i = solution;
	LP lpp2;
	lpp2.setSeed(i);
	lpp2.generateVectorStructure(couches, inbase, outfin);
	lpp2.generateVectorProgram();
	lpp2.setInputs(INP0);
	lpp2.compute();
	
	lpp2.generateVectorProgram();
	return lpp2.programrepresentation;		
}

