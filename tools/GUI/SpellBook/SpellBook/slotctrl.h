/*
 *  slotctrl.h
 *  StarTrekSim
 *
 *  Created by Rick Sanchez on 9/20/19.
 *  Copyright 2019 Informabox Tech. All rights reserved.
 *
 */

/* Logic Imbrication Generator */
/* (Puzzle generator) */

#include <iostream>
#include <string>
#include <fstream>
#include <sstream>
#include <vector>
#include "rpl1.h"
#include <math.h>       /* pow */

using namespace std;

class RS_CELL{
private:
	bool OUTPUT;
public:
	RS_CELL(bool outp);//ok
	void SET();//ok
	void RESET();//ok
	bool GET();	//ok
};

class Slots{//LIG v1 - Puzzle Generator
private:
	fn funcsuper;
	unsigned int seed0;
	int inbase;
	int outfin;
	vector<bool> INP0;
	int couches;
	int nblvl;
	unsigned int problem;
public:
	
	Slots(int inpbase, int outpfin, int nmblvl){
		outfin = outpfin;//nb de sortie
		inbase = inpbase;//nb de entree
		nblvl  = nmblvl;//nb de level
		couches = inbase/2;
		problem = 0;
	}
	void setSeed(unsigned int seed){
		seed0 = seed;
		srand(seed);
	}
	
	void setProblem(unsigned int problm);
	bool verifySolution(unsigned int solution);
	string displayProgram(unsigned int solution);
	
	void bruteForce(int ikmax){
		for (unsigned int k=seed0; k<seed0+nblvl; k++){
			srand(k);
			/*
			 INP0 = funcsuper.int2boolvector(rand()%((int)pow(2,stage)),stage);
			 lpp.generateVectorStructure(stage/2, stage, outcnt);
			 */
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
			cout << inbase << "_" << k << "_" << couches << "_" << outfin << " == ";
			cout << k << " / " << seed0+nblvl << " :: " << (k/(seed0+nblvl*1.00)) << "%" << endl;
			stringstream SS;
			SS.str("");
			SS << inbase << "_" << k << "_" << couches << "_" << outfin <<".osef";
			ofstream fichier(SS.str().c_str());
			//sltprg.addInputs(INP0);)
			//int ik = 0;
			//sltprg.addOutputs(lpp.getOutputs());
			int countpossible=0;
			for (unsigned int i=0; i<ikmax; i++){
				LP lpp2;
				lpp2.setSeed(i);
				lpp2.generateVectorStructure(couches, inbase, outfin);
				lpp2.generateVectorProgram();
				lpp2.setInputs(INP0);
				lpp2.compute();

				if (lpp.getOutputs() == lpp2.getOutputs()){
					countpossible++;
						//solution trouvée
					lpp2.generateVectorProgram();
					fichier << endl;
					for (vector<bool>::iterator itp1=INP0.begin(); itp1!=INP0.end(); ++itp1){
						fichier << (*itp1);
					}
					fichier << "$" << k << "$" << i ;//<< "$" << lpp.programrepresentation << "$" << lpp2.programrepresentation;
				}
			}
			cout << countpossible << " Possibilite trouvees ! "<< endl;
			fichier.close();
		}	
	
	
	}
};

/*
	stringstream SS;
	for (unsigned int k=seed0; k<seed0+nblvl; k++){
		srand(k);
		
		INP0 = funcsuper.int2boolvector(rand()%((int)pow(2,inbase)),inbase);
		LP lpp;
		lpp.setSeed(k);
		lpp.generateVectorStructure(couches, inbase, outfin);
		lpp.generateVectorProgram();
		lpp.setInputs(INP0);
		lpp.compute();
		SS.str("");
		SS << inbase << "_" << k << "_" << couches << "_" << outfin << ".osef";
		ofstream file(SS.str().c_str());
		for (vector<bool>::iterator it=INP0.begin(); it!=INP0.end(); ++it){
			file << (*it) << ";";
		}
		int ik = 0;
		vector<bool> outputs = lpp.getOutputs();
		for (vector<bool>::iterator it=outputs.begin(); it!=outputs.end(); ++it){
			file << (*it);
			if (1+ik<outputs.size()){
				file << ",";
			}
			ik++;
		}
		file << endl << k << endl << "$" << endl << lpp.programrepresentation;
		file.close();
	}
 */
