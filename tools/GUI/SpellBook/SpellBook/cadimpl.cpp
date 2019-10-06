/*
 *  cadimpl.cpp
 *  CoinAfterDay
 *
 *  Created by Rick Sanchez on 8/2/19.
 *  Copyright 2019 __MyCompanyName__. All rights reserved.
 *
 */

#include "cadimpl.h"

/* --- CLASS Block --- */
	Block::Block(int Num, int Non, string Dat){
		Number = Num;
		Nonce = Non;
		Data = Dat;
		rawDifficult = 3;
		HRATE = 0;
		hashprev = "";
	}
	Block::Block(int Num, int Non, string Dat, int rawDiff){
		Number = Num;
		Nonce = Non;
		Data = Dat;
		rawDifficult = rawDiff;
		HRATE = 0;
		hashprev = "";
	}
	Block::Block(){
		Number = 1;
		Nonce = 0;
		Data = "";
		HRATE = 0;
		rawDifficult=3;
		hashprev = "";
	}
	//Getter
	long Block::getNumber(){
		return Number;
	}
	long Block::getNonce(){
		return Nonce;
	}
	string Block::getData(){
		return Data;
	}
	
	
	//Setter
	void Block::setNumber(long Num){
		Number = Num;
	}
	void Block::setNonce(long Non){
		Nonce = Non;
	}
	void Block::setData(string Dat){
		Data = Dat;
	}
	void Block::setDifficult(int rawDiff){
		rawDifficult = rawDiff;
	}
	void Block::setNonceFromB64M(string Non){
		stringstream SS;
		SS << base64_decode(Non);
		long tmp;
		SS >> tmp;
	}
	

	//Verificator & Compute
	void Block::compute(){
		ostringstream SS1;
		SS1 << Number << ":" << Nonce << "=" << Data << "= " << hashprev << ";";
		hashout = sha512(SS1.str());
		SS1.str("");
	}
	
	
	int Block::count_chrinstr(string s, char headblck) {
		int count = 0;
		for (int i = 0; i < s.size(); i++){
			if (s[i] == headblck){
				count++;
			}
		}
		return count;
	}


	bool Block::isValid(){
		compute();
		string BVald = hashout.substr(0, rawDifficult);
		bool valid=false;
		valid = (count_chrinstr(BVald, '0') == rawDifficult);
		return valid;
	}
	
	void Block::Mine(){
		bool validated = false;
		long iNonce = -1;
		while(!validated){
			iNonce++;
			Nonce = iNonce;
			cout << "Block#"<<Number<< "- TEST FOR Nonce("<<Nonce<<")"<<endl;
			validated = isValid();
		}
	}
	
	
	
/* - BLOCKCHAIN - */
	Blockchain::Blockchain(){
		DiffRaw = 5;
	}
	
	bool Blockchain::isMined(){
		long int countb = 0;
		for (vector<Block>::iterator it=chain.begin(); it!=chain.end(); ++it){
			if ( ( (*it).isValid() ) ){
				countb++;
			}  
		}
		return (countb==chain.size());
	}
	
	void Blockchain::addBlock(string data){
		long nb = 1;
		string prev="";
		if (chain.size()>0){
			nb = chain[chain.size()-1].getNumber();
			prev = chain[chain.size()-1].hashout;
		}
		nb++;
		Block blk(nb, 0, data);
		blk.hashprev = prev;
		blk.setDifficult(DiffRaw);
		chain.push_back(blk);
	}
	
	unsigned int Blockchain::addCalcBlock(string data){
		long nb = 1;
		string prev="";
		if (chain.size()>0){
			nb = chain[chain.size()-1].getNumber();
			prev = chain[chain.size()-1].hashout;
		}
		nb++;
		if (isMined()){
			Block blk(nb, 0, data);
			blk.hashprev = prev;
			blk.setDifficult(DiffRaw);
			blk.Mine();
			chain.push_back(blk);
			return 0;
		}
		else{
			cout << "Erreur, les precedents blocs ne sont pas calcule !" << endl;
		}
		return 1;
	}
	
	void Blockchain::calcNewsBlock(){
		for (vector<Block>::iterator it=chain.begin(); it!=chain.end(); ++it){
			if ( not ((*it).isValid()) ) {
				(*it).Mine();
				cout << "Mining of block #"<<(*it).getNumber()<< " Done !" << endl;
			}
		}
	}
	
	void Blockchain::calcOneNewBlock(){
		for (vector<Block>::iterator it=chain.begin(); it!=chain.end(); ++it){
			if ( not ((*it).isValid()) ) {
				(*it).Mine();
				cout << "Mining of block #"<<(*it).getNumber()<< " Done !" << endl;
				break;
			}
		}
	}
	
	//SAVE FILE
	void Blockchain::saveChain(string filename){
		ofstream outfile;
		outfile.open((filename+".osef").c_str());
		long Number;
		long Nonce;
		string Data;
		string hashprev;
		string hashout;
		//<< Number << ":" << Nonce << "=" << Data << "= " << hashprev << ";";
		for (vector<Block>::iterator it=chain.begin(); it!=chain.end(); it++){
			Number = (*it).getNumber();
			Nonce = (*it).getNonce();
			Data = (*it).getData();
			hashprev = (*it).hashprev;
			hashout = (*it).hashout;
			outfile << Number << ":" << Nonce << "=" << Data << "= " << hashprev << ";" << hashout << endl;
		}  
		outfile.close();
	}
	
	string Blockchain::getLastItemChain(){
		long Number;
		long Nonce;
		string Data;
		string hashprev;
		string hashout;
		stringstream SS;
		for (vector<Block>::iterator it=chain.end()-1; it!=chain.end(); it++){
			Number = (*it).getNumber();
			Nonce = (*it).getNonce();
			Data = (*it).getData();
			hashprev = (*it).hashprev;
			hashout = (*it).hashout;
			SS.str("");
			SS << Number << ":" << Nonce << "=" << Data << "= " << hashprev << ";" << hashout << endl;
		}  
		return SS.str();
	}

/*
    string line;
    ifstream f( "myfile.txt" );
    for (int i=0; i<LINE_TO_FIND;i++)
    {
        getline(f,line);
    }
	*/
	void Blockchain::loadChain(string filename){
		chain.clear();
		long Number;
		long Nonce;
		string Data;
		string hashprev;
		string hashout;
		string line;
		stringstream SS;
		ifstream f(filename.c_str());
		while (getline(f, line)){
			int tp1 = 0;
			for(int i=0; i<line.size(); i++){
				if (line[i]==':'){
					tp1 = i-1;
					break;
				}
			}
			SS << line.substr(0,tp1);
			SS >> Number;
			SS.str("");
			line = line.substr(tp1+2, line.size());
			
			tp1 = 0;
			for(int i=0; i<line.size(); i++){
				if (line[i]=='='){
					tp1 = i-1;
					break;
				}
			}
			SS << line.substr(0,tp1);
			SS >> Nonce;
			SS.str("");
			line = line.substr(tp1+2, line.size());

			tp1 = 0;
			for(int i=0; i<line.size(); i++){
				if (line[i]=='='){
					tp1 = i-1;
					break;
				}
			}
			Data = line.substr(0,tp1);
			line = line.substr(tp1+2, line.size());

			tp1 = 0;
			for(int i=0; i<line.size(); i++){
				if (line[i]==';'){
					tp1 = i-1;
					break;
				}
			}
			hashprev = line.substr(0,tp1);
			line = line.substr(tp1+2, line.size());
			hashout = line;
			
			Block blok(Number, Nonce, Data);
			blok.hashprev = hashprev;
			blok.hashout = hashout;
			chain.push_back(blok);
		}
	}

	long Blockchain::getLastBlockId(){
		vector<Block>::iterator it = chain.end();
		return (*it).getNumber();
	}
	


	