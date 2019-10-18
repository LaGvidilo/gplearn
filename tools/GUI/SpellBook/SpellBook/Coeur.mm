//
//  Coeur.cpp
//  SpellBook
//
//  Created by Rick Sanchez on 14/10/2019.
//  Copyright © 2019 Rick Sanchez. All rights reserved.
//

#include "Coeur.hpp"


core::core(string ptnpath){
    putin = ptnpath;
    fin = false;
}

void core::setter(int tmp_sizepop, int tmp_numbergen,double tmp_stpcrit, int tmp_njobs,double tmp_crossover,double tmp_subtreemutation,double tmp_hoistmutation,double tmp_pointmutation,double tmp_maxsamples,double tmp_parsimonycoefficient,string tmp_csvfile,int tmp_parammath,int tmp_randomstate){
    
    sizepop=tmp_sizepop;
    numbergen=tmp_numbergen;
    stpcrit=tmp_stpcrit;
    njobs=tmp_njobs;
    crossover=tmp_crossover;
    subtreemutation=tmp_subtreemutation;
    hoistmutation=tmp_hoistmutation;
    pointmutation=tmp_pointmutation;
    maxsamples=tmp_maxsamples;
    parsimonycoefficient=tmp_parsimonycoefficient;
    csvfile=tmp_csvfile;
    parammath=tmp_parammath;
    randomstate=tmp_randomstate;
}

void core::initAll(){
    sizepop=100;
    numbergen=10;
    stpcrit=0.1;
    njobs=1;
    crossover=0.7;
    subtreemutation=0.1;
    hoistmutation=0.5;
    pointmutation=0.1;
    maxsamples=0.9;
    parsimonycoefficient=0.01;
    csvfile="";
    parammath=1;
    randomstate=0;
    fin=false;
}

bool core::limitis(){
    /*'The sum of p_crossover, p_subtree_mutation, '
    'p_hoist_mutation and p_point_mutation should '
    'total to 1.0 or less.'*/
    return ( (crossover+subtreemutation+hoistmutation+pointmutation) > 1 );
}


string core::run(){
    //string gommand = "python "+putin+"/vocal.py "+projectpath+"/"+it->second.name+".mp3 "+projectpath;
    //std::system(gommand.c_str());
    stringstream SS;
    SS << putin  << "/GPCTSCRM.py ";
    SS << sizepop << " ";
    SS << numbergen << " ";
    SS << stpcrit << " ";
    SS << njobs << " ";
    SS << crossover << " ";
    SS << subtreemutation << " ";
    SS << hoistmutation << " ";
    SS << pointmutation << " ";
    SS << maxsamples << " ";
    SS << parsimonycoefficient << " ";
    SS << csvfile << " ";
    SS << parammath << " ";
    SS << randomstate;
    string gommand = SS.str();
    //std::system(gommand.c_str());
    //fin = true;
    return gommand;
}



/*
 void OsefFileFormat::writeFile(){
     ofstream f(filepath.c_str());
     f << headfile.depart << "|" << headfile.nbcle << "|" << base64_encode(reinterpret_cast<const unsigned char *>(headfile.data.c_str()), (unsigned int)headfile.data.size()) << "|" << base64_encode(reinterpret_cast<const unsigned char *>(headfile.namefichier.c_str()), (int)headfile.namefichier.size()) << "|" << headfile.Difficult << "|" << headfile.ik << "\n";
     for (auto it=KFC_Chicken.begin(); it!=KFC_Chicken.end(); ++it){
         f << it->first << "|" << it->second << "\n";
     }
     f.close();
 }*/

void core::save(string filepath){
    ifstream file(csvfile.c_str());
    std::stringstream buffer;
    buffer << file.rdbuf();
    string datacsv = buffer.str();
    file.close();
    
    ofstream f(filepath.c_str());
    stringstream SS;
    SS << sizepop << "|";
    SS << numbergen << "|";
    SS << stpcrit << "|";
    SS << njobs << "|";
    SS << crossover << "|";
    SS << subtreemutation << "|";
    SS << hoistmutation << "|";
    SS << pointmutation << "|";
    SS << maxsamples << "|";
    SS << parsimonycoefficient << "|";
    SS << base64_encode(reinterpret_cast<const unsigned char *>(csvfile.c_str()), (unsigned int)csvfile.size()) << "|";
    SS << parammath << "|";
    SS << randomstate << "|" << base64_encode(reinterpret_cast<const unsigned char *>(datacsv.c_str()), (unsigned int)datacsv.size()) << endl;
    f.close();
}



/*
 void OsefFileFormat::readFile(){
     KFC_Chicken.clear();
     ifstream ifile(filepath.c_str());
     string line;
     bool isheader = true;
     while (getline(ifile,line)){
         if (isheader){
             isheader = false;
             headfile.depart = stoi(line.substr(0,line.find("|")));
             line = line.substr(line.find("|") + 1);
             headfile.nbcle = stoi(line.substr(0,line.find("|")));
             line = line.substr(line.find("|") + 1);
             headfile.data = base64_decode(line.substr(0,line.find("|")));
             line = line.substr(line.find("|") + 1);
             headfile.namefichier = base64_decode(line.substr(0,line.find("|")));
             line = line.substr(line.find("|") + 1);
             //cout << "diff: " << line.substr(0,line.find("|")) <<endl;
             headfile.Difficult = stoi(line.substr(0,line.find("|")));
             line = line.substr(line.find("|") + 1);
             headfile.ik = stoi(line);
         }
         else{
             int cky = stoi(line.substr(0,line.find("|")));
             line = line.substr(line.find("|") + 1);
             string dta = line;
             KFC_Chicken[cky] = dta;
         }
     }
     ifile.close();
 }

 */
void core::load(string filepath){
    
}
