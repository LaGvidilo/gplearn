//
//  Coeur.hpp
//  SpellBook
//
//  Created by Rick Sanchez on 14/10/2019.
//  Copyright © 2019 Rick Sanchez. All rights reserved.
//

#ifndef Coeur_hpp
#define Coeur_hpp

#include <stdio.h>
#include <string>
#include <sstream>
#include <fstream>
#include <vector>
#include <map>
#include <iostream>
using namespace std;

class core{
private:
    int sizepop;
    int numbergen;
    double stpcrit;
    int njobs;
    double crossover;
    double subtreemutation;
    double hoistmutation;
    double pointmutation;
    double maxsamples;
    double parsimonycoefficient;
    string csvfile;
    int parammath;
    double randomstate;
    string putin;
public:
    //core();
    core(string ptnpath);
    
    void initAll();//ok
    void setter(int tmp_sizepop, int tmp_numbergen,double tmp_stpcrit, int tmp_njobs,double tmp_crossover,double tmp_subtreemutation,double tmp_hoistmutation,double tmp_pointmutation,double tmp_maxsamples,double tmp_parsimonycoefficient,string tmp_csvfile,int tmp_parammath,int tmp_randomstate);//ok
    bool limitis();//ok
    void run();//ok
    
};



#endif /* Coeur_hpp */
