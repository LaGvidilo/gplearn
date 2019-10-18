//
//  MainController.h
//  SpellBook
//
//  Created by Rick Sanchez on 06/10/2019.
//  Copyright © 2019 Rick Sanchez. All rights reserved.
//

#ifndef MainController_h
#define MainController_h
#include <string>
#import <Cocoa/Cocoa.h>
#import <Foundation/Foundation.h>
#include <sstream>
#include "Coeur.hpp"
#include <thread>
using namespace std;
unsigned int numanim;
int countFrame;
int maxFrame;
string filepath;
string putinpath;
core coeur;
dispatch_queue_t myQueue;
NSTask *task;
struct task_struct
{
    int& i;
    task_struct(int& ii):i(ii){
        cout << "task_struct constructor i = " << i << endl;
    }

    void operator()()
    {
        cout << " core->run()\n";
        coeur.run();
    }
};

std::thread t;


@interface MainController : NSObject
{
    //menu
    IBOutlet NSMenuItem *itemexportformule;
    IBOutlet NSMenuItem *itemnewincantation;
    IBOutlet NSMenuItem *itemcloseincantation;
    IBOutlet NSMenuItem *itemstartincantation;
    IBOutlet NSMenuItem *itemstopincantation;
    IBOutlet NSMenuItem *itemsavespell;
    IBOutlet NSMenuItem *itemselectspell;
    IBOutlet NSMenuItem *itemopenspell;
    IBOutlet NSMenuItem *itempredictspell;
    IBOutlet NSMenuItem *itemexportspell;
    IBOutlet NSMenuItem *itemloadincantation;
    
    
    
    IBOutlet NSTextField *filepathtext;
    //NSString *filepath;
    IBOutlet NSImageView *pentaview;
    
    NSTimer *timerAnim;
    NSTimer *subtimer;
    NSThread *athread;
    
    
    //incantation outlets
    IBOutlet NSPopUpButton *sizepop;
    IBOutlet NSPopUpButton *numbergen;
    IBOutlet NSPopUpButton *stpcrit;
    IBOutlet NSPopUpButton *njobs;
    IBOutlet NSPopUpButton *crossover;
    IBOutlet NSPopUpButton *subtreemutation;
    IBOutlet NSPopUpButton *hoistmutation;
    IBOutlet NSPopUpButton *pointmutation;
    IBOutlet NSPopUpButton *maxsamples;
    IBOutlet NSPopUpButton *parsimonucoef;
    IBOutlet NSPopUpButton *paramath;
    IBOutlet NSPopUpButton *randomstate;
    
}
- (void)processus;
- (IBAction)browsecsv:(id)sender;//ok
//- (void)awakeFromNib;
- (IBAction)newincantation:(id)sender;//ok
- (IBAction)closeincantation:(id)sender;//ok
- (IBAction)runincantation:(id)sender;
- (IBAction)stopincantation:(id)sender;
- (IBAction)exportformula:(id)sender;
- (IBAction)invocation:(id)sender;
- (IBAction)savespell:(id)sender;//ok
- (IBAction)loadspell:(id)sender;//ok
- (IBAction)opencsv:(id)sender;
- (IBAction)exportspell:(id)sender;
- (IBAction)selectspell:(id)sender;
- (IBAction)predictionspell:(id)sender;
- (IBAction)closespell:(id)sender;//ok
@end

#endif /* MainController_h */
