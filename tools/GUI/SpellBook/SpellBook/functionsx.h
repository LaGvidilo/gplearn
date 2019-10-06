/*
 *  functionsx.h
 *  genmath
 *
 *  Created by Rick Sanchez on 8/17/19.
 *  Copyright 2019 __MyCompanyName__. All rights reserved.
 *
 */
#include <string>
#include <sstream>
#include <vector>
#include <algorithm>
#include <map>
using namespace std;

class fn{
public:
/* Fonction de transformation int -> vecteur binaire */
vector<bool> int2boolvector(unsigned int chiffre, int taille){
	vector<bool> cbin;
	for (int i=0; i<taille; i++){
		if ( rand()%2 ){
			cbin.push_back(true);
		}
		else {
			cbin.push_back(false);
		}
	}
	//reverse(cbin.begin(),cbin.end());
	return cbin;
}


/*Fonction pour transformer une string en int pour fabriquer une seed*/
unsigned int getSeedFromString(string textseed){
	unsigned int result = 0;
	int tmp;
	unsigned postresult = 0;
	for (int i=0; i<textseed.size(); i++){
		tmp = (int)textseed[i];
		result = result + tmp;
		srand((unsigned)result);
		postresult = postresult + rand()%100;
	}
	return postresult;
}

string getStringFromVector(vector<int> vect){
	stringstream SS;
	for (vector<int>::iterator it=vect.begin(); it!=vect.end(); ++it){
		SS << (*it);
	}
	return SS.str();
}

string getStringFromVector(vector<double> vect){
	stringstream SS;
	for (vector<double>::iterator it=vect.begin(); it!=vect.end(); ++it){
		SS << (*it);
	}
	return SS.str();
}

string getStringFromVector(vector<float> vect){
	stringstream SS;
	for (vector<float>::iterator it=vect.begin(); it!=vect.end(); ++it){
		SS << (*it);
	}
	return SS.str();
}
	
string STR2_OTAN_CODE(string texte){
	map<string, string> CODE;
	CODE["A"] = "Alpha";
	CODE["B"] = "Bravo";
	CODE["C"] = "Charlie";
	CODE["D"] = "Delta";
	CODE["E"] = "Echo";
	CODE["F"] = "Foxtrot";
	CODE["G"] = "Golf";
	CODE["H"] = "Hotel";
	CODE["I"] = "India";
	CODE["J"] = "Juliett";
	CODE["K"] = "Kilo";
	CODE["L"] = "Lima";
	CODE["M"] = "Mike";
	CODE["N"] = "November";
	CODE["O"] = "Oscar";
	CODE["P"] = "Papa";
	CODE["Q"] = "Quebec";
	CODE["R"] = "Romeo";
	CODE["S"] = "Sierra";
	CODE["T"] = "Tango";
	CODE["U"] = "Uniform";
	CODE["Ü"] = "Uniform";
	CODE["V"] = "Victor";
	CODE["W"] = "Whiskey";
	CODE["X"] = "X-ray";
	CODE["Y"] = "Yankee";
	CODE["Z"] = "Zulu";
	
	stringstream outfinal;
	stringstream SS;
	for(int i=0; i<texte.size(); i++){
		SS << texte[i];
		if ( CODE.find(SS.str()) != CODE.end() ) {
			outfinal << CODE[SS.str()];
		}	
		SS.str("");
	}
	return outfinal.str();
}

};