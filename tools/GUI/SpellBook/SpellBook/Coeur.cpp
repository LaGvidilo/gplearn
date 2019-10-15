//
//  Coeur.cpp
//  SpellBook
//
//  Created by Rick Sanchez on 14/10/2019.
//  Copyright © 2019 Rick Sanchez. All rights reserved.
//

#include "Coeur.hpp"


core::core(){
    
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
}

bool core::limitis(){
    /*'The sum of p_crossover, p_subtree_mutation, '
    'p_hoist_mutation and p_point_mutation should '
    'total to 1.0 or less.'*/
    return ( (crossover+subtreemutation+hoistmutation+pointmutation) > 1 );
}
