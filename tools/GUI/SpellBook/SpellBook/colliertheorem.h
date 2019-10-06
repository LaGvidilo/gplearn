/*
 *  colliertheorem.h
 *  StarTrekSim
 *
 *  Created by Rick Sanchez on 9/23/19.
 *  Copyright 2019 Informabox Tech. All rights reserved.
 *
 */

#include <string>
#include <map>
#include <vector>
#include <algorithm>    // std::reverse
using namespace std;


class collier{
private:
	unsigned int rndseed;
	vector<int> csequence;
	map<int, int> mcsequence;
	
public:
	collier(vector<int> sequence);//ok
	collier(unsigned int randomseed);//ok
	collier();//ok
	
	void setSequence(vector<int> sequence);//ok
	void setSeed(unsigned int valseed);//ok
	
	vector<int> getVectSequence();//ok
	map<int, int> getMapSequence();//ok
	
	void convertInternToMap();//ok
	
	void makeSymetric();//ok
	bool isSymetric();//ok

};