/*
 *  strtoken.h
 *  CoinAfterDay
 *
 *  Created by Rick Sanchez on 8/3/19.
 *  Copyright 2019 __MyCompanyName__. All rights reserved.
 *
 */

#include <string>
#include <sstream>

using namespace std;

class Token{
private:
	int long LENg;
	int long SEEDr;
	string CHRACt;
	int getPosCar(string cc){
		int posi = 0;	
		for (string::iterator i= CHRACt.begin(); i!=CHRACt.end(); i++){
			stringstream SS;
			SS << *i;
			if ( SS.str() == cc ){
				return posi;
			}
			SS.str("");
			posi++;
		}
		return posi;
	}
	
public:
	Token(int long len, int long seed, char caracts){
		LENg = len;
		SEEDr = seed;
		CHRACt = caracts;
	}
	Token(int long len, int long seed){
		LENg = len;
		SEEDr = seed;
		CHRACt = "0123456789AZERTYUIOPMLKJHGFDSQWXCVBN";
	}
	Token(int long len){
		LENg = len;
		SEEDr = -1;
		CHRACt = "azertyuiopmlkjhgfdsqwxcvbn0123456789AZERTYUIOPMLKJHGFDSQWXCVBN";
	}
	
	string getGenerate(){
		string token="";
		resetSEED();
		for (int long i=0; i<LENg; i++){
			token = token + CHRACt[((int)rand()%CHRACt.length())];
		}
		return token;
	}
	
	
	
	void resetSEED(){
		if (SEEDr>-1){
			srand(SEEDr);
		}
		else 
		{
			srand(time(NULL));
		}
	}
	
	void setSEED(int long seed){
		SEEDr = seed;
		resetSEED();
	}
};