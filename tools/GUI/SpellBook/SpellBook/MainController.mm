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
    NSOpenPanel*    panel = [NSOpenPanel openPanel];
    NSArray  * fileTypes = [NSArray arrayWithObjects:@"csv",@"CSV",nil];
    //ProjViewController *otherViewController=[[ProjViewController alloc] init]
    [panel setCanChooseFiles:YES];
    [panel setCanChooseDirectories:NO];
    [panel setAllowedFileTypes:fileTypes];;
    //[self->tableproj setDataSource:otherViewController];
    //[ [otherViewController array] removeAllObjects];
    //[self->tableproj reloadData];
    //[ [ otherViewController table] reloadData];
    [panel beginWithCompletionHandler:^(NSInteger result){
        if (result == NSModalResponseOK)//NSFileHandlingPanelOKButton
        {
            NSString *NSStrPath  = [panel.URLs.firstObject path];
            NSLog(@"%@", NSStrPath);
            string fname = [NSStrPath UTF8String];
            
            putinpath = fname;
            coeur = core(putinpath);
            [self->filepathtext setStringValue:NSStrPath];
        }
    }];
}
- (void)awakeFromNib{
    NSBundle *bundle = [NSBundle mainBundle];
    NSString *resourceFolderPath = [bundle resourcePath];
    putinpath =[resourceFolderPath UTF8String];
    coeur = core(putinpath);
    //string gommand = "python "+putin+"/vocal.py "+projectpath+"/"+it->second.name+".mp3 "+projectpath;
    //std::system(gommand.c_str());
    
    [timerAnim invalidate];
    //A3
    numanim = 3;
    countFrame = 0;
    maxFrame = 255;

    timerAnim = [NSTimer scheduledTimerWithTimeInterval:0.015
                                                 target:self
                                               selector:@selector(animated)
                                               userInfo:nil
                                                repeats:YES];
}



/*
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
 */

- (IBAction)newincantation:(id)sender{
    NSString *resourcePath = [[NSBundle mainBundle] pathForResource:@"Sword_Of_Light" ofType:@"wav"];
    NSSound *soundtmp = [[NSSound alloc] initWithContentsOfFile:resourcePath byReference:YES];
    [soundtmp play];
    [timerAnim invalidate];
    
    //init all in GUI
    [sizepop setIntValue:100];
    [numbergen setIntValue:10];
    [stpcrit setDoubleValue:0.1];
    [njobs setIntValue:1];
    [crossover setDoubleValue:0.7];
    [subtreemutation setDoubleValue:0.1];
    [hoistmutation setDoubleValue:0.5];
    [pointmutation setDoubleValue:0.1];
    [maxsamples setDoubleValue:0.9];
    [parsimonucoef setDoubleValue:0.01];
    [filepathtext setStringValue:@""];
    [paramath setIntValue:1];
    [randomstate setIntValue:0];
    
    coeur.initAll();
    
}
- (IBAction)closeincantation:(id)sender{
    NSString *resourcePath = [[NSBundle mainBundle] pathForResource:@"Sword_Of_Light" ofType:@"wav"];
    NSSound *soundtmp = [[NSSound alloc] initWithContentsOfFile:resourcePath byReference:YES];
    [soundtmp play];
    [timerAnim invalidate];
    
    //close incantation
    [sizepop setIntValue:100];
    [numbergen setIntValue:10];
    [stpcrit setDoubleValue:0.1];
    [njobs setIntValue:1];
    [crossover setDoubleValue:0.7];
    [subtreemutation setDoubleValue:0.1];
    [hoistmutation setDoubleValue:0.5];
    [pointmutation setDoubleValue:0.1];
    [maxsamples setDoubleValue:0.9];
    [parsimonucoef setDoubleValue:0.01];
    [filepathtext setStringValue:@""];
    [paramath setIntValue:1];
    [randomstate setIntValue:0];
    
    coeur.initAll();
    
}
- (IBAction)runincantation:(id)sender{
    //sound
    NSString *resourcePath = [[NSBundle mainBundle] pathForResource:@"Ancient_Game_Magic_Revive" ofType:@"wav"];
    NSSound *soundtmp = [[NSSound alloc] initWithContentsOfFile:resourcePath byReference:YES];
    [soundtmp play];
    
    //animation
    //A1
    numanim = 1;
    countFrame = 0;
    maxFrame = 359;
    [timerAnim invalidate];
    timerAnim = [NSTimer scheduledTimerWithTimeInterval:0.033
                                                 target:self
                                               selector:@selector(animated)
                                               userInfo:nil
                                                repeats:YES];
    
    //traitement
    /*
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
     */
    coeur.setter([sizepop intValue], [numbergen intValue],[stpcrit doubleValue], [njobs intValue],[crossover doubleValue],[subtreemutation doubleValue],[hoistmutation doubleValue],[pointmutation doubleValue],[maxsamples doubleValue],[parsimonucoef doubleValue] ,[filepath UTF8String],[paramath intValue],[randomstate intValue]);
    
    if (not(coeur.limitis())){
        //lancement du processus
        
        
    }
    else{
        //message d'erreur
        
        
    }
    
    
}
- (IBAction)stopincantation:(id)sender{
    
    NSString *resourcePath = [[NSBundle mainBundle] pathForResource:@"Healing_Spell_Light_Buff" ofType:@"wav"];
    NSSound *soundtmp = [[NSSound alloc] initWithContentsOfFile:resourcePath byReference:YES];
    [soundtmp play];
    [timerAnim invalidate];
    
    //stop incantation
    
    
}
- (IBAction)exportformula:(id)sender{
    //sound
    NSString *resourcePath = [[NSBundle mainBundle] pathForResource:@"Sword_Of_Light" ofType:@"wav"];
    NSSound *soundtmp = [[NSSound alloc] initWithContentsOfFile:resourcePath byReference:YES];
    [soundtmp play];
    //animation
    //A2
    numanim = 2;
    countFrame = 0;
    maxFrame = 359;
    [timerAnim invalidate];
    timerAnim = [NSTimer scheduledTimerWithTimeInterval:0.033
                                                 target:self
                                               selector:@selector(animated)
                                               userInfo:nil
                                                repeats:YES];
    //NSOpen puis export formula
}
- (IBAction)invocation:(id)sender{
    
}



//sorts
- (IBAction)savespell:(id)sender{
    NSSavePanel*    panel = [NSSavePanel savePanel];
    [panel setAllowedFileTypes:[NSArray arrayWithObjects:@"OSEF",@"osef",nil]];
    [panel beginWithCompletionHandler:^(NSInteger result){
        if (result == NSModalResponseOK)//NSFileHandlingPanelOKButton
        {
            NSString *NSStrPath  = [panel.URL path];
            string PATHO = [NSStrPath UTF8String];
            coeur.save(PATHO);
        }
    }];
}
- (IBAction)opencsv:(id)sender{

}
- (IBAction)exportspell:(id)sender{

}
- (IBAction)selectspell:(id)sender{

}
- (IBAction)predictionspell:(id)sender{

}



- (IBAction)closespell:(id)sender{
    
}

@end
