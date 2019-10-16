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
            
            filepath = fname;
            //coeur = core(filepath);
            [self->filepathtext setStringValue:NSStrPath];
            [self->itemstartincantation setTarget:self];
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
    
    [self->itemexportformule setTarget:nil];
    [self->itemnewincantation setTarget:self];
    [self->itemcloseincantation setTarget:self];
    [self->itemstartincantation setTarget:nil];
    [self->itemstopincantation setTarget:nil];
    [self->itemsavespell setTarget:nil];
    [self->itemselectspell setTarget:self];
    [self->itemopenspell setTarget:nil];
    [self->itempredictspell setTarget:nil];
    [self->itemexportspell setTarget:nil];
    
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
    [paramath itemAtIndex:0];
    [randomstate setIntValue:0];
    
    coeur.initAll();
    [self->itemexportformule setTarget:nil];
    [self->itemnewincantation setTarget:self];
    [self->itemcloseincantation setTarget:self];
    [self->itemstartincantation setTarget:nil];
    [self->itemstopincantation setTarget:nil];
    [self->itemsavespell setTarget:nil];
    [self->itemselectspell setTarget:self];
    [self->itemopenspell setTarget:nil];
    [self->itempredictspell setTarget:nil];
    [self->itemexportspell setTarget:nil];
}
- (IBAction)closeincantation:(id)sender{
    NSAlert *alert = [[NSAlert alloc] init];
       [alert setMessageText:@"Voulez vous fermer ce projet ?\nCECI FERMERA LE PROJET SI OUVERT."];
       [alert setInformativeText:@"Projet et initialisation."];
       [alert addButtonWithTitle:@"Non"];
       [alert addButtonWithTitle:@"Oui, Je confirme"];
       [alert setAlertStyle:NSWarningAlertStyle];
       //[alert runModal];
       NSInteger result;

       // Run the alert as a sheet on the main window
       result = [alert runModal];
       if (result==NSAlertFirstButtonReturn){
           NSLog(@"Ne fait rien");
       }
       else if (result==NSAlertSecondButtonReturn){
           NSLog(@"Fermeture -> Nouveau");
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
           [paramath itemAtIndex:0];
           [randomstate setIntValue:0];
           
           coeur.initAll();
           [self->itemexportformule setTarget:nil];
           [self->itemnewincantation setTarget:self];
           [self->itemcloseincantation setTarget:self];
           [self->itemstartincantation setTarget:nil];
           [self->itemstopincantation setTarget:nil];
           [self->itemsavespell setTarget:nil];
           [self->itemselectspell setTarget:self];
           [self->itemopenspell setTarget:nil];
           [self->itempredictspell setTarget:nil];
           [self->itemexportspell setTarget:nil];
       }
    
}
- (void)processus{
    coeur.run();
    [timerAnim invalidate];
    NSAlert *alert = [[NSAlert alloc] init];
       [alert setMessageText:@"Le calcul est terminé, c'est le moment de sauvegarder !"];
       [alert setInformativeText:@"Projet et finalisation."];
       [alert addButtonWithTitle:@"OK"];
       [alert runModal];
    [self->itemexportformule setTarget:self];
    [self->itemnewincantation setTarget:self];
    [self->itemcloseincantation setTarget:self];
    [self->itemstartincantation setTarget:nil];
    [self->itemstopincantation setTarget:nil];
    [self->itemsavespell setTarget:self];
    [self->itemselectspell setTarget:self];
    [self->itemopenspell setTarget:self];
    [self->itempredictspell setTarget:self];
    [self->itemexportspell setTarget:self];
}
- (IBAction)runincantation:(id)sender{
    //sound
    /*NSString *resourcePath = [[NSBundle mainBundle] pathForResource:@"Ancient_Game_Magic_Revive" ofType:@"wav"];
    NSSound *soundtmp = [[NSSound alloc] initWithContentsOfFile:resourcePath byReference:YES];
    [soundtmp play];*/
    
    //animation
    //A1
    numanim = 1;
    countFrame = 0;
    maxFrame = 359;
    [timerAnim invalidate];
    timerAnim = [NSTimer scheduledTimerWithTimeInterval:0.020
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
    
    /*cout << [ [sizepop titleOfSelectedItem] intValue];
    cout<<"--"<<[ [numbergen titleOfSelectedItem] intValue];
    cout<<"--"<<[ [stpcrit titleOfSelectedItem] doubleValue];
    cout<<"--"<<[ [njobs titleOfSelectedItem] intValue];
    cout<<"--"<<[ [crossover titleOfSelectedItem] doubleValue];
    cout<<"--"<<[ [subtreemutation titleOfSelectedItem] doubleValue];
    cout<<"--"<<[ [hoistmutation titleOfSelectedItem] doubleValue];
    cout<<"--"<<[ [pointmutation titleOfSelectedItem] doubleValue];
    cout<<"--"<<[ [maxsamples titleOfSelectedItem] doubleValue];
    cout<<"--"<<[ [parsimonucoef titleOfSelectedItem] doubleValue];
    cout<<"--"<<filepath;
    cout<<"--"<<(int)[paramath indexOfSelectedItem];
    cout<<"--"<<[ [randomstate titleOfSelectedItem] intValue];*/
    coeur.setter([ [sizepop titleOfSelectedItem] intValue], [ [numbergen titleOfSelectedItem] intValue], [ [stpcrit titleOfSelectedItem] doubleValue], [ [njobs titleOfSelectedItem] intValue], [ [crossover titleOfSelectedItem] doubleValue], [ [subtreemutation titleOfSelectedItem] doubleValue], [ [hoistmutation titleOfSelectedItem] doubleValue], [ [pointmutation titleOfSelectedItem] doubleValue], [ [maxsamples titleOfSelectedItem] doubleValue], [ [parsimonucoef titleOfSelectedItem] doubleValue], filepath, 1 + (int)[paramath indexOfSelectedItem], [ [randomstate titleOfSelectedItem] intValue]);
    
    if (not(coeur.limitis())){
        //lancement du processus
        //coeur.run();
        //[NSThread detachNewThreadSelector:@selector(startTheBackgroundJob) toTarget:self withObject:nil];
        
        athread = [[NSThread alloc] initWithTarget:self selector:@selector(processus) object:nil];
        [athread start];
        //coeur.run();
    }
    else{
        //message d'erreur
        NSAlert *alert = [[NSAlert alloc] init];
           [alert setMessageText:@"The sum of p_crossover, p_subtree_mutation, p_hoist_mutation and p_point_mutation should total to 1.0 or less !"];
           [alert setInformativeText:@"ERROR !"];
           [alert addButtonWithTitle:@"OK"];
           [alert runModal];
    }
    [self->itemexportformule setTarget:nil];
    [self->itemnewincantation setTarget:nil];
    [self->itemcloseincantation setTarget:nil];
    [self->itemstartincantation setTarget:nil];
    [self->itemstopincantation setTarget:self];
    [self->itemsavespell setTarget:nil];
    [self->itemselectspell setTarget:nil];
    [self->itemopenspell setTarget:nil];
    [self->itempredictspell setTarget:nil];
    [self->itemexportspell setTarget:nil];
    
}
- (IBAction)stopincantation:(id)sender{
    
    NSString *resourcePath = [[NSBundle mainBundle] pathForResource:@"Healing_Spell_Light_Buff" ofType:@"wav"];
    NSSound *soundtmp = [[NSSound alloc] initWithContentsOfFile:resourcePath byReference:YES];
    [soundtmp play];
    [timerAnim invalidate];
    
    //stop incantation
    [athread cancel];
    [self->itemexportformule setTarget:nil];
    [self->itemnewincantation setTarget:self];
    [self->itemcloseincantation setTarget:self];
    [self->itemstartincantation setTarget:self];
    [self->itemstopincantation setTarget:nil];
    [self->itemsavespell setTarget:nil];
    [self->itemselectspell setTarget:self];
    [self->itemopenspell setTarget:nil];
    [self->itempredictspell setTarget:nil];
    [self->itemexportspell setTarget:nil];
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
    NSAlert *alert = [[NSAlert alloc] init];
       [alert setMessageText:@"Voulez vous fermer ce projet ?\nCECI FERMERA LE PROJET SI OUVERT."];
       [alert setInformativeText:@"Projet et initialisation."];
       [alert addButtonWithTitle:@"Non"];
       [alert addButtonWithTitle:@"Oui, Je confirme"];
       [alert setAlertStyle:NSWarningAlertStyle];
       //[alert runModal];
       NSInteger result;

       // Run the alert as a sheet on the main window
       result = [alert runModal];
       if (result==NSAlertFirstButtonReturn){
           NSLog(@"Ne fait rien");
       }
       else if (result==NSAlertSecondButtonReturn){
           NSLog(@"Fermeture -> Nouveau");
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
           [paramath itemAtIndex:0];
           [randomstate setIntValue:0];
           
           coeur.initAll();
           [self->itemexportformule setTarget:nil];
           [self->itemnewincantation setTarget:self];
           [self->itemcloseincantation setTarget:self];
           [self->itemstartincantation setTarget:nil];
           [self->itemstopincantation setTarget:nil];
           [self->itemsavespell setTarget:nil];
           [self->itemselectspell setTarget:self];
           [self->itemopenspell setTarget:nil];
           [self->itempredictspell setTarget:nil];
           [self->itemexportspell setTarget:nil];
       }
}

@end
/*
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
 */
