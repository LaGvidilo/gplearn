//
//  oseffile.hpp
//  MySerialKeys
//
//  Created by Rick Sanchez on 10/10/2019.
//  Copyright © 2019 Rick Sanchez. All rights reserved.
//

#ifndef oseffile_hpp
#define oseffile_hpp

#include <stdio.h>
#include <string>
#include <map>
#include <vector>
#include <sstream>
#include <fstream>
#include <iostream>
#include "base64.h"
using namespace std;
struct forproduct{
    int depart;
    int nbcle;
    string data;//nom de code
    string namefichier;
    int Difficult;
    int ik;
};
class OsefFileFormat{
private:
    string filepath;
    map<int, string> KFC_Chicken;
    forproduct headfile;
public:
    OsefFileFormat();//ok
    OsefFileFormat(string filepath);//ok
    //setters
    void setData(map<int, string>manchons, forproduct poussins);//ok
    void writeFile();//broyeuse ok
    void readFile();
    map<int, string> getPoulet();//ok
    forproduct getIntern();
};

#endif /* oseffile_hpp */
