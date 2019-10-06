//
//  MainController.m
//  SpellBook
//
//  Created by Rick Sanchez on 06/10/2019.
//  Copyright © 2019 Rick Sanchez. All rights reserved.
//


#import "MainController.h"
@interface MainController()
//@property NSTableView *Table;
//@property NSMutableArray *Data;
@end
@implementation MainController

/*
- (IBAction)modifInput:(id)sender{
    NSString *nameofitem = [self->selectorbtn titleOfSelectedItem];

    DataStruct DF = MCD.getItem( [ nameofitem UTF8String ] );
    [namelabel setStringValue: [NSString stringWithCString:DF.name.c_str() encoding:NSUTF8StringEncoding] ];
    [pathimglabel setStringValue: [NSString stringWithCString:DF.imagepath.c_str() encoding:NSUTF8StringEncoding]];
    [halflifelabel setStringValue: [NSString stringWithCString:to_string(DF.halflife).c_str() encoding:[NSString defaultCStringEncoding]] ];
    [typecombo setStringValue:[NSString stringWithCString:DF.type.c_str() encoding:NSUTF8StringEncoding] ];
    [categorycombo setStringValue:[NSString stringWithCString:DF.category.c_str() encoding:NSUTF8StringEncoding] ];
    //stringstream SSF1;
    //SSF1 << endl;
    //boost::replace_all(DF.text, "\n", "\r");
    //(DF.text, std::string("\n"), std::endl)
    
    NSString *nstexttruc = [NSString stringWithCString:DF.text.c_str() encoding:NSUTF8StringEncoding];
    nstexttruc = [nstexttruc stringByReplacingOccurrencesOfString:@"\\n" withString:@"\n"];
    nstexttruc = [nstexttruc stringByReplacingOccurrencesOfString:@"\\'" withString:@"'"];
    [contentformated setString:nstexttruc ];
    
    
    NSWindowController *nw = [[NSWindowController alloc] initWithWindow: DataItemWindow];
    [nw showWindow:self];
    
}
 */
- (void)animated{
    //A1-(0->359)
    stringstream SS1;
    SS1 << "A"<<numanim <<"-"<<countFrame;
    [pentaview setImage:[NSImage imageNamed:[NSString stringWithCString:SS1.str().c_str() encoding:NSUTF8StringEncoding] ]];
    SS1.str("");
    countFrame = (countFrame+1) % (maxFrame+1);
    if ( (numanim==3) && (countFrame==0) ) { [timerAnim invalidate]; }
}
- (IBAction)browsecsv:(id)sender{
    
    //A1
    numanim = 1;
    countFrame = 0;
    maxFrame = 359;
    
    //A2
    //numanim = 2;
    //countFrame = 0;
    //maxFrame = 359;
    
    //A3
    //numanim = 3;
    //countFrame = 0;
    //maxFrame = 255;
    
    // if a timer is already scheduled, cancel it
    [timerAnim invalidate];
    
    // save in 5 seconds
    // maybe this timer will also be canceled before it fires,
    // amd the 'save' will be delayed further
    timerAnim = [NSTimer scheduledTimerWithTimeInterval:0.033
                                                 target:self
                                               selector:@selector(animated)
                                               userInfo:nil
                                                repeats:YES];
}
- (void)awakeFromNib{
    // if a timer is already scheduled, cancel it
    [timerAnim invalidate];
    //A3
    numanim = 3;
    countFrame = 0;
    maxFrame = 255;
    // save in 5 seconds
    // maybe this timer will also be canceled before it fires,
    // amd the 'save' will be delayed further
    timerAnim = [NSTimer scheduledTimerWithTimeInterval:0.015
                                                 target:self
                                               selector:@selector(animated)
                                               userInfo:nil
                                                repeats:YES];

}
@end
