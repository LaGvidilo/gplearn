//
//  main.m
//  gpltool
//
//  Created by Rick Sanchez on 05/10/2019.
//  Copyright © 2019 Rick Sanchez. All rights reserved.
//
#import <Foundation/Foundation.h>
#include <string>
#include <iostream>
using namespace std;

string versionsoft = "1.0.0";

void paramaths_details(){
    cout << "MATHEMATICAL PARAMS MODES:" << endl;
    cout << "1 - Simple" << endl;
    cout << "   1: ('add','sub','mul','div')" << endl << endl;
    cout << "2 - Total" << endl;
    cout << "   2: 'all'" << endl << endl;
    cout << "3 - Geometrie" << endl;
    cout << "   3: ('add','sub','mul','div','hypot','sin','cos','tan')" << endl << endl;
    cout << "4 - Statistique" << endl;
    cout << "   4: ('add','sub','mul','div','max','min','abs')" << endl << endl;
    cout << "5 - Avance" << endl;
    cout << "   5: ('add','sub','mul','div','sqrt','log','abs','neg','inv','sin','cos','tan','sigmoid','ceil','fabs','floor','trunc','cbrt','modulo')" << endl << endl << endl;
}

void hello(){
    cout << "gpltool v(" << versionsoft << ")" << endl;
}

void usage(){
    cout << "gpltool USAGE: \ngpltool <mode> <args...>" <<endl;
    cout << "MODE <PREDICT> :"<<endl;
    cout << "   -namemodel <pathfile>" << endl;
    cout << "   -datapredict <sequence>" << endl;
    
    
    cout << "MODE <EXPERIMENT> :"<<endl;
    cout << "   -sizepop <val>" << endl;
    cout << "   -numbergen <val>" << endl;
    cout << "   -stpcrit <val>" << endl;
    cout << "   -njobs <val>" << endl;
    cout << "   -crossover <val>" << endl;
    cout << "   -subtreemutation <val>" << endl;
    cout << "   -hoistmutation <val>" << endl;
    cout << "   -pointmutation <val>" << endl;
    cout << "   -maxsamples <val>" << endl;
    cout << "   -parsimonycoefficient <val>" << endl;
    cout << "   -csvfile <pathfile>" << endl;
    cout << "   -parammath <val>" << endl << endl;
    cout << "   -randomstate <val> (random_state)" << endl;
    
    paramaths_details();
}



int main(int argc, const char * argv[]) {
    @autoreleasepool {
        hello();
        /*
         #import <Cocoa/Cocoa.h>
         #import <Foundation/Foundation.h>
         NSBundle *bundle = [NSBundle mainBundle];
         //NSString *appPath = [bundle bundlePath];
         NSString *resourceFolderPath = [bundle resourcePath];
         string putin =[resourceFolderPath UTF8String];
         string gommand = "python "+putin+"/vocal.py "+projectpath+"/"+it->second.name+".mp3 "+projectpath;
         std::system(gommand.c_str());
         */
        /*
        NSBundle *bundle = [NSBundle mainBundle];
        //NSString *appPath = [bundle bundlePath];
        NSString *resourceFolderPath = [bundle resourcePath];
        string putin =[resourceFolderPath UTF8String];
        cout << putin << endl;
         */
        
        
        //args recognize here
        /*
        0 = mode (Experience / Prediction)
         PREDICT:
            -namemodel
            -datapredict
         
         EXPERIMENT:
            -sizepop
            -numbergen
            -stpcrit
            -njobs
            -crossover
            -subtreemutation
            -hoistmutation
            -pointmutation
            -maxsamples
            -parsimonycoefficient
            -csvfile
            -parammath
            -randomstate
        */
        if ( argc < 2 ){
            usage();
        }
        else{
            string mode = argv[1];
            string argument;
            if (mode == "PREDICT"){
                //define default
                string namemodel = "NONE";
                string datapredict = "NONE";
                for (int i=2; i < argc; i++){
                    argument = argv[i];
                    if (argument == "-namemodel"){
                        namemodel = argv[i+1];
                        i++;
                    }
                    if (argument == "-datapredict"){
                        datapredict = argv[i+1];
                        i++;
                    }
                }
                //call script
                if ( (namemodel!="NONE") && (datapredict!="NONE") ){
                    cout << "Nom du model: " << namemodel << endl;
                    cout << "Sequence: \"" << datapredict << "\"" << endl;
                    
                }
                else {
                    cout << "ERREUR: parametres manquants!" << endl;
                }
            }
            else if (mode == "EXPERIMENT"){
                string sizepop;//ok
                string numbergen;//ok
                string stpcrit;//ok
                string njobs;//ok
                string crossover;//ok
                string subtreemutation;//ok
                string hoistmutation;//ok
                string pointmutation;//ok
                string maxsamples;//ok
                string parsimonycoefficient;//ok
                string csvfile;//ok
                string parammath;//ok
                string randomstate;//ok
                
                string verboz;//not implement for tool
                
                crossover="0.7";
                subtreemutation="0.1";
                hoistmutation="0.05";
                pointmutation="0.1";
                maxsamples="0.9";
                verboz="1";
                parsimonycoefficient="0.01";
                randomstate="0";
                njobs = "1";
                stpcrit = "0.1";
                numbergen = "100";
                sizepop = "300";
                parammath = "1";
                for (int i=2; i < argc; i++){
                    argument = argv[i];
                    if (argument == "-randomstate"){
                        randomstate = argv[i+1];
                        i++;
                    }
                    if (argument == "-parammath"){
                        parammath = argv[i+1];
                        i++;
                    }
                    if (argument == "-csvfile"){
                        csvfile = argv[i+1];
                        i++;
                    }
                    if (argument == "-parsimonycoefficient"){
                        parsimonycoefficient = argv[i+1];
                        i++;
                    }
                    if (argument == "-maxsamples"){
                        maxsamples = argv[i+1];
                        i++;
                    }
                    if (argument == "-pointmutation"){
                        pointmutation = argv[i+1];
                        i++;
                    }
                    if (argument == "-hoistmutation"){
                        hoistmutation = argv[i+1];
                        i++;
                    }
                    if (argument == "-subtreemutation"){
                        subtreemutation = argv[i+1];
                        i++;
                    }
                    if (argument == "-crossover"){
                        crossover = argv[i+1];
                        i++;
                    }
                    if (argument == "-njobs"){
                        njobs = argv[i+1];
                        i++;
                    }
                    if (argument == "-stpcrit"){
                        stpcrit = argv[i+1];
                        i++;
                    }
                    if (argument == "-numbergen"){
                        numbergen = argv[i+1];
                        i++;
                    }
                    if (argument == "-sizepop"){
                        sizepop = argv[i+1];
                        i++;
                    }
                }
                if ( csvfile != "NONE" ){
                    //call script
                    
                }
            }
            else{
                usage();
            }
        }
        
        
    }
    return 0;
}
