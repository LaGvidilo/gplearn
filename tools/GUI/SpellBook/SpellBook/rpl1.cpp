/*
 *  rpl1.cpp
 *  RPMIL1
 *
 *  Created by Rick Sanchez on 8/30/19.
 *  Copyright 2019 __MyCompanyName__. All rights reserved.
 *
 */

#include "rpl1.h"


/* LogicGate */
void LogicGate::setInputs(vector<bool> inp){
	inputs = inp;
}

void LogicGate::defineType(string letypedeporte){
	inType = letypedeporte;
	if ( inType == "xor" ) {
		//cout << "Type de porte logique: BON" << endl;
	}else if( inType == "and" ) {
		//cout << "Type de porte logique: BON" << endl;
	}else if( inType == "or" ) {
		//cout << "Type de porte logique: BON" << endl;
	}else if( inType == "nor" ) {
		//cout << "Type de porte logique: BON" << endl;
	}else if( inType == "nand" ) {
		//cout << "Type de porte logique: BON" << endl;
	}else if( inType == "nxor" ) {
		//cout << "Type de porte logique: BON" << endl;
	}
	else{
		cout << "Type de porte logique: MAUVAIS" << endl;
	}
}

bool LogicGate::getOutput(){
	bool outp = false;
	bool A = inputs[0];
	bool B = inputs[1];
	
	if ( inType == "xor" ) {
		outp = A xor B;
	}else if( inType == "and" ) {
		outp = A and B;
	}else if( inType == "or" ) {
		outp = A or B;
	}else if( inType == "nor" ) {
		outp = (not(A) or not(B));
	}else if( inType == "nand" ) {
		outp = (not(A) and not(B));
	}else if( inType == "nxor" ) {
		outp = (not(A) xor not(B));
	}
	else{
		cout << "Type de porte logique: ERREUR" << endl;
	}
	
	return outp;
}





/* LogicProcess */
void LP::setSeed(string seed0){
	graine = fonctionseed.getSeedFromString(seed0);
}
void LP::setSeed(unsigned int seed0){
	graine = seed0;
}

void LP::generateVectorStructure(int couches, int entreebase, int sortiefin){
	ProgStructured.clear();
	int nbinp = entreebase;
	vector<LogicGate> cnj;
	LogicGate LogicG;
	for (int i=0; i<couches; i++){
		cnj.clear();
		nbinp = nbinp/2;
		if (nbinp <= sortiefin){ break; }
		for (int j=0; j<nbinp; j++){
			cnj.push_back(LogicG);
		}
		ProgStructured.push_back(cnj);
	}
}

void LP::generateVectorProgram(){
	srand(graine);
	int tpye = 0;
	programrepresentation =  "";
	for (vector< vector<LogicGate> >::iterator it1=ProgStructured.begin(); it1!=ProgStructured.end(); ++it1){
		programrepresentation = programrepresentation + "(";
		for (vector<LogicGate>::iterator it2=(*it1).begin(); it2!=(*it1).end(); ++it2){
			tpye = rand() % 6;
			if ( tpye == 0 ){
				(*it2).defineType("xor");
				programrepresentation = programrepresentation + "xor ";
			} else if ( tpye == 1 ){
				(*it2).defineType("and");
				programrepresentation = programrepresentation + "and ";
			} else if ( tpye == 2 ){
				(*it2).defineType("or");
				programrepresentation = programrepresentation + "or ";
			} else if ( tpye == 3 ){
				(*it2).defineType("nor");
				programrepresentation = programrepresentation + "nor ";
			} else if ( tpye == 4 ){
				(*it2).defineType("nand");
				programrepresentation = programrepresentation + "nand ";
			} else if ( tpye == 5 ){
				(*it2).defineType("nxor");
				programrepresentation = programrepresentation + "nxor ";
			}
		}
		programrepresentation = programrepresentation + ")\n";
	}
}

void LP::setStructureAndProgram(vector<	vector<LogicGate> > PrgStrct){
	ProgStructured = PrgStrct;
}

vector< vector<LogicGate> > LP::getStructureAndProgram(){
	return ProgStructured;
}

void LP::setInputs(vector<bool> inp){
	inputs = inp;
}

vector<bool> LP::getOutputs(){
	return outputs;
}

void LP::compute(){
	vector<bool> outs;
	for (vector< vector<LogicGate> >::iterator it1=ProgStructured.begin(); it1!=ProgStructured.end(); ++it1){
		vector<bool> tmpin;
		if (it1 == ProgStructured.begin()){
			int ink = 0;
			outs.clear();
			for (vector<LogicGate>::iterator it2=(*it1).begin(); it2!=(*it1).end(); ++it2){
				tmpin.clear();
				tmpin.push_back(inputs[ink]);
				tmpin.push_back(inputs[ink+1]);
				(*it2).setInputs(tmpin);
				outs.push_back((*it2).getOutput());
				ink+=2;
			}
		}
		else{
			int ink = 0;
			vector<bool> inptm=outs;
			outs.clear();
			for (vector<LogicGate>::iterator it2=(*it1).begin(); it2!=(*it1).end(); ++it2){
				tmpin.clear();
				tmpin.push_back(inptm[ink]);
				tmpin.push_back(inptm[ink+1]);
				(*it2).setInputs(tmpin);
				outs.push_back((*it2).getOutput());
				ink+=2;
			}
		}
	}
	outputs = outs;
}

unsigned int LP::getSeed(){
	return graine;
}


/* INput Module Program */

vector< vector<bool> > INMP::getInputs(){
	return inputs;
}

vector< vector<bool> > INMP::getOutputs(){
	return outputs;
}

void INMP::addInputs(vector<bool> inp){
	inputs.push_back(inp);
}

void INMP::addOutputs(vector<bool> outp){
	outputs.push_back(outp);
}


LP INMP::sortieProcess(unsigned int maxDernier, int couches, int taillesortie, int invid){
	LP lpr;
	int score = 0;
	int bestscore = 0;
	map<int, LP> lpbest;
	for (unsigned int i=0; i<maxDernier; i++){
		int totalafaire = inputs.size();
		int k = 0;
		for (vector< vector<bool> >::iterator itin=inputs.begin(); itin!=inputs.end(); ++itin){
			lpr.setSeed(i+invid);
			lpr.generateVectorStructure(couches, (*itin).size(), taillesortie);
			lpr.generateVectorProgram();
			lpr.setInputs((*itin));
			lpr.compute();
			if (lpr.getOutputs() == outputs[k]){
				totalafaire -= 1;
			}
			k+=1;
		}
		score = inputs.size() - totalafaire;
		if (score > bestscore){ bestscore = score; }
		lpbest[score] = lpr;
		if (totalafaire < 1){
			cout << "Solution trouvée !" << endl;
			break;
		}
		else{
			cout << "SEED(" << i << ") ; SCORE("<< inputs.size() - totalafaire << "/" <<inputs.size()<<")"<<endl;
		}
	}
	cout << "BEST SCORE: " << bestscore;
	scorecentral = bestscore;
	return lpbest[bestscore];
}





/* AutomaticInventor */
void AutomaticInventor::AutoFull(int lpass, string namefile, int tailleinp, int tailleout, unsigned int graine, int inventmax){
	stringstream SS;
	fn funcsuper;
	stringstream FF;
	for (int inventi=0; inventi<inventmax; inventi++){
		srand(graine+inventi);
		INMP module;
		FF.str("");
		vector<bool> INP0;
		vector<bool> OUT0;
		LP lowr;
		FF << "invention_" << inventi << ".csv";
		ofstream inventcsv(FF.str().c_str());
		inventcsv << "x"<<tailleinp<<",y"<<tailleout<<"\n";
		for (int h=0; h<pow(2,tailleinp); h++){
			SS << "#" << h << endl;
			INP0.clear();
			OUT0.clear();
			SS << "INPUTS: ";
			INP0 = funcsuper.int2boolvector(h,tailleinp);
			for (vector<bool>::iterator it=INP0.begin(); it!=INP0.end(); ++it){
				SS << (*it) << " ";
				inventcsv << (*it)<<",";
			}
			SS << endl;
			SS << "OUTPUTS: ";
			for (int i=0; i<tailleout; i++){
				bool xbin = random();
				OUT0.push_back(xbin);
				SS << xbin << " ";
				inventcsv << xbin;
				if (i>=tailleout){ 
					inventcsv << ",";
				}
			}
			if (1+h<pow(2,tailleinp)){
				inventcsv << "\n";
			}
			SS << endl;
			module.addInputs(INP0);
			module.addOutputs(OUT0);
			
		}
		
		lowr = module.sortieProcess(lpass, tailleinp/2 , 0, inventi);
		SS << "INVENTION#"<<inventi<<": " << lowr.getSeed() << "("<<module.scorecentral<<")"<< endl << lowr.programrepresentation << endl << endl << endl;
	}
	
	ofstream fichier(namefile.c_str());
	fichier << SS.str() << endl;
	fichier.close();
}



