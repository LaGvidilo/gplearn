/*
 *  colliertheorem.cpp
 *  StarTrekSim
 *
 *  Created by Rick Sanchez on 9/23/19.
 *  Copyright 2019 Informabox Tech. All rights reserved.
 *
 */

#include "colliertheorem.h"


collier::collier(vector<int> sequence){
	csequence = sequence;
}

collier::collier(unsigned int randomseed){
	rndseed = randomseed;
}

collier::collier(){
	rndseed = 0;
	csequence.clear();
	mcsequence.clear();
}

void collier::setSequence(vector<int> sequence){
	csequence = sequence;
}

void collier::setSeed(unsigned int valseed){
	rndseed = valseed;
}

vector<int> collier::getVectSequence(){
	return csequence;
}

map<int, int> collier::getMapSequence(){
	return mcsequence;
}

void collier::convertInternToMap(){
	int CbVal = csequence.size() / 2;
	int CaVal = (- CbVal);
	int i = CaVal;
	for (vector<int>::iterator it=csequence.begin(); it!=csequence.end(); ++it){
		mcsequence[i] = (*it);
		i++;
	}
}

void collier::makeSymetric(){
	vector<int> Ya;
	vector<int> Yb;
	for ( map<int, int>::iterator it=mcsequence.begin(); it!=mcsequence.end(); ++it){
		Ya.push_back(it->second);
	}
	Yb = Ya;
	reverse(Yb.begin(), Yb.end());
	vector<int> CSY=Ya;
	for(vector<int>::iterator it=Yb.begin(); it!=Yb.end(); ++it){
		CSY.push_back((*it));
	}
	csequence = CSY;
	convertInternToMap();
}

bool collier::isSymetric(){
	vector<int> Ya;
	vector<int> Yb;
	
	for (map<int, int>::iterator it=mcsequence.begin(); it!=mcsequence.end(); ++it){
		if (it->first < 0){
			Ya.push_back(it->second);
		}
		else if (it->first == 0){
			Ya.push_back(it->second);
			Yb.push_back(it->second);
		}
		else if (it->first > 0){
			Yb.push_back(it->second);
		}
	}	
	
	reverse(Yb.begin(),Yb.end());
	
	return (Ya == Yb);
}



