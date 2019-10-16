//
//  oseffile.cpp
//  MySerialKeys
//
//  Created by Rick Sanchez on 10/10/2019.
//  Copyright © 2019 Rick Sanchez. All rights reserved.
//

#include "oseffile.hpp"



//declarattion

OsefFileFormat::OsefFileFormat(){//just init to zero all vars and datastruct
    KFC_Chicken.clear();
    filepath = "";
}

OsefFileFormat::OsefFileFormat(string filepath_0){//init all for use
    KFC_Chicken.clear();
    filepath = filepath_0;
}

void OsefFileFormat::setData(map<int, string> manchons, forproduct poussins){
    KFC_Chicken = manchons;
    headfile = poussins;
}
void OsefFileFormat::writeFile(){
    ofstream f(filepath.c_str());
    f << headfile.depart << "|" << headfile.nbcle << "|" << base64_encode(reinterpret_cast<const unsigned char *>(headfile.data.c_str()), (unsigned int)headfile.data.size()) << "|" << base64_encode(reinterpret_cast<const unsigned char *>(headfile.namefichier.c_str()), (int)headfile.namefichier.size()) << "|" << headfile.Difficult << "|" << headfile.ik << "\n";
    for (auto it=KFC_Chicken.begin(); it!=KFC_Chicken.end(); ++it){
        f << it->first << "|" << it->second << "\n";
    }
    f.close();
}
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
map<int, string> OsefFileFormat::getPoulet(){
    return KFC_Chicken;
}

forproduct OsefFileFormat::getIntern(){
    return headfile;
}
