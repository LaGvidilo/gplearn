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
    //cout << "   " << endl;
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
        */
        if ( argc < 2 ){
            usage();
        }
        else{
            string mode = argv[1];
            if (mode == "PREDICT"){
                
            }
            else if (mode == "EXPERIMENT"){
                
            }
        }
        
        
    }
    return 0;
}
