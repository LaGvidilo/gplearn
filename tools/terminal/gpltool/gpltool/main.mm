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

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        NSBundle *bundle = [NSBundle mainBundle];
        //NSString *appPath = [bundle bundlePath];
        NSString *resourceFolderPath = [bundle resourcePath];
        string putin =[resourceFolderPath UTF8String];
        
        cout << putin << endl;
        
        
    }
    return 0;
}
