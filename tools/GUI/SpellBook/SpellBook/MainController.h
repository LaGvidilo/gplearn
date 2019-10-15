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
using namespace std;
unsigned int numanim;
int countFrame;
int maxFrame;
string filepath;
string putinpath;
@interface MainController : NSObject
{
    IBOutlet NSTextField *filepathtext;
    NSString *filepath;
    IBOutlet NSImageView *pentaview;
    
    NSTimer *timerAnim;
    
    
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
- (IBAction)browsecsv:(id)sender;//ok
//- (void)awakeFromNib;
- (IBAction)newincantation:(id)sender;
- (IBAction)closeincantation:(id)sender;
- (IBAction)runincantation:(id)sender;
- (IBAction)stopincantation:(id)sender;
- (IBAction)exportformula:(id)sender;
- (IBAction)invocation:(id)sender;
- (IBAction)savespell:(id)sender;
- (IBAction)opencsv:(id)sender;
- (IBAction)exportspell:(id)sender;
- (IBAction)selectspell:(id)sender;
- (IBAction)predictionspell:(id)sender;
- (IBAction)closespell:(id)sender;
@end

#endif /* MainController_h */
