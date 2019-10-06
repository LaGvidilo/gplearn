/*
 *  cadimpl.h
 *  CoinAfterDay
 *
 *  Created by Rick Sanchez on 8/2/19.
 *  Copyright 2019 __MyCompanyName__. All rights reserved.
 *
 */
#include <string>
#include <vector>
#include <map>
#include <math.h>
#include <sstream>
#include <fstream>
#include "base64.h"
#include "sha512.h"



#include <iostream>
#include "strtoken.h"





using namespace std;


class Block{
private:
	long Number;
	long Nonce;
	string Data;
	int rawDifficult;
	long double HRATE;
	
	//Compute
	void compute();
	int count_chrinstr(string s, char headblck);
public:
	
	string hashprev;
	string hashout;
	Block(int Num, int Non, string Dat);
	Block(int Num, int Non, string Dat, int rawDiff);
	Block();
	
	//Getter
	long getNumber();
	long getNonce();
	string getData();
	
	
	//Setter
	void setNumber(long Num);
	void setNonce(long Non);
	void setNonceFromB64M(string Non);
	void setData(string Dat);
	void setDifficult(int rawDiff);

	//BenchMark
	double Benchraw(int long cycle);
	
	//Verificator & Compute
	bool isValid();
	
	//Mine
	void Mine();
};

class Blockchain{
private:
	vector<Block> chain;
	
	int DiffRaw;
public:
	//declar and init
	Blockchain();
	bool isMined();	
	//add & calculate the next
	void addBlock(string data);
	unsigned int addCalcBlock(string data);
	void calcNewsBlock();
	void calcOneNewBlock();
	
	//LOAD FILE
	void loadChain(string filename);
	
	//SAVE FILE
	void saveChain(string filename);
	
	//OPERATION
	long getLastBlockId();
	string getLastItemChain();
	

};
