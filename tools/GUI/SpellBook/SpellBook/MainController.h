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
@interface MainController : NSObject
{
    IBOutlet NSTextField *filepathtext;
    NSString *filepath;
    IBOutlet NSImageView *pentaview;
    
    NSTimer *timerAnim;
}
- (IBAction)browsecsv:(id)sender;//ok
//- (void)awakeFromNib;
@end

#endif /* MainController_h */
