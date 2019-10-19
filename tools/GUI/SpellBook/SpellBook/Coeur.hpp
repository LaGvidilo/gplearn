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
#include "base64.h"
using namespace std;

struct coreData{
    string b64Image;
    string program;
    string latex;
    string b64Model;
};

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
    bool fin;
    coreData genData;
public:
    core(){
        fin=false;
    }
    core(string ptnpath);
    
    void initAll();//ok
    void setter(int tmp_sizepop, int tmp_numbergen,double tmp_stpcrit, int tmp_njobs,double tmp_crossover,double tmp_subtreemutation,double tmp_hoistmutation,double tmp_pointmutation,double tmp_maxsamples,double tmp_parsimonycoefficient,string tmp_csvfile,int tmp_parammath,int tmp_randomstate);//ok
    bool limitis();//ok
    string run();//ok
    void save(string filepath);
    void load(string filepath);
    
    
    coreData get_coreData();
    void setFormule(string LaTeX, string Program);
    void setModelFilePath(string filepath);
    void setImageFilePath(string filepath);
    void setModel(string b64Data);
    void setImage(string b64Data);
    
    void toend();
    bool ended();
};



#endif /* Coeur_hpp */
