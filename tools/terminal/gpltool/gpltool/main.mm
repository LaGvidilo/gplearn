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

void hello(){
    cout << " " << endl;
}

void usage(){
    cout << " " << endl;
}



int main(int argc, const char * argv[]) {
    @autoreleasepool {
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
        NSBundle *bundle = [NSBundle mainBundle];
        //NSString *appPath = [bundle bundlePath];
        NSString *resourceFolderPath = [bundle resourcePath];
        string putin =[resourceFolderPath UTF8String];
        
        cout << putin << endl;
        
        
    }
    return 0;
}
