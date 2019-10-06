/*
 *  rpl1.h
 *  RPMIL1
 *
 *  Created by Rick Sanchez on 8/30/19.
 *  Copyright 2019 __MyCompanyName__. All rights reserved.
 *
 */

#include "functionsx.h"
#include <vector>
#include <string>
#include <iostream>
#include <locale>         // std::locale, std::tolower
#include <map>
#include <sstream>
#include <fstream>
#include <math.h>       /* pow */
using namespace std;


/* LogicGate */
class LogicGate{//version simple avec 2 entrées 1 sortie
private:
	string inType;
	vector<bool> inputs;
	bool outputs;
	locale loc;

public:
	void setInputs(vector<bool> inp);
	bool getOutput();
	void defineType(string letypedeporte);

};


/* LogicProcess */
class LP{
private:
	vector< vector<LogicGate> > ProgStructured;
	vector<bool> outputs;
	vector<bool> inputs;
	unsigned int graine;
	fn fonctionseed;

public:
	string programrepresentation;
	void setSeed(string seed0);
	void setSeed(unsigned int seed0);
	unsigned int getSeed();
	void generateVectorStructure(int couches, int entreebase, int sortiefin);
	void generateVectorProgram();
	void setStructureAndProgram(vector< vector<LogicGate> > PrgStrct);
	vector< vector<LogicGate> > getStructureAndProgram();
	void setInputs(vector<bool> inp);
	void compute();
	vector<bool> getOutputs();
	
};


/* INput Module Program */
class INMP{
private:
	vector< vector<bool> > inputs;
	vector< vector<bool> > outputs;

public:
	int scorecentral;
	vector< vector<bool> > getInputs();
	vector< vector<bool> > getOutputs();
	void addInputs(vector<bool> inp);
	void addOutputs(vector<bool> outp);
	LP sortieProcess(unsigned int maxDernier, int couches, int taillesortie, int invid);
	
};


class AutomaticInventor{
private:
	bool random() {
		if (rand() % 2 == 0)
			return true;
		else return false;
	}

public:

	void AutoFull(int lpass, string namefile, int tailleinp, int tailleout, unsigned int graine, int inventmax);

};








