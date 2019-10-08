#import "skey.h"

@implementation skey
- (IBAction)showWindow:(id)sender {
    NSWindowController *nw = [[NSWindowController alloc] initWithWindow: window];
    [nw showWindow:self];
}
- (IBAction)buyredirect:(id)sender{
	NSString *resourcePath = [[NSBundle mainBundle] pathForResource:@"Pop" ofType:@"wav"];
	NSSound *soundtmp = [[NSSound alloc] initWithContentsOfFile:resourcePath byReference:YES];
	[soundtmp play];	
	[[NSWorkspace sharedWorkspace] openURL:[NSURL URLWithString:@"http://www.informaboxtech.fr/buy/sts1"]];
}
- (IBAction)validationkey:(id)sender{
    string serialkey = [ [cle stringValue] UTF8String];
    string data = "informaboxtechricksanchezgamests1";//a changer
    string decodedkey = base64_decode(serialkey);
	//cout << decodedkey << endl;
    string delim="-";
    std::size_t found = decodedkey.find(delim);
    string numstr = decodedkey.substr(0,found);
    string nonstr = decodedkey.substr(found+1,decodedkey.size()-1);
	int number;
	int nonce;
	stringstream SS;
	SS << numstr;
	SS >> number;
	stringstream SS2;
	SS2 << nonstr;
	SS2 >> nonce;

	cout << number << " - " << nonce << " , " << data << " ; " << 3 << endl;
	if ( (number > 0) and (nonce > 0) ){
		Block bloc(number, nonce, data, 5);
	
		if (bloc.isValid()){
			NSString *resourcePath = [[NSBundle mainBundle] pathForResource:@"Tadada" ofType:@"wav"];
			NSSound *soundtmp = [[NSSound alloc] initWithContentsOfFile:resourcePath byReference:YES];
			[soundtmp play];
            NSAlert *alert2 = [[NSAlert alloc] init];
            [alert2 setMessageText:@"Votre logiciel est maintenant débloquer."];
            [alert2 setInformativeText:@"Avertissement de succes."];
            [alert2 addButtonWithTitle:@"OK"];
            [alert2 setAlertStyle:NSWarningAlertStyle];
            [alert2 runModal];
            ofstream fout("serial");
            string g = [ [cle stringValue] UTF8String];
            fout << base64_encode(reinterpret_cast <const unsigned char *>( g.c_str() ), g.size() ) << endl;
            fout.close();
            NSWindowController *nw = [[NSWindowController alloc] initWithWindow: window];
            [nw close];
		}	
		else{
			NSString *resourcePath = [[NSBundle mainBundle] pathForResource:@"Computer-Error" ofType:@"wav"];
			NSSound *soundtmp = [[NSSound alloc] initWithContentsOfFile:resourcePath byReference:YES];
            [soundtmp play];
            NSAlert *alert2 = [[NSAlert alloc] init];
            [alert2 setMessageText:@"La clé n'est pas valide."];
            [alert2 setInformativeText:@"Avertissement."];
            [alert2 addButtonWithTitle:@"OK"];
            [alert2 setAlertStyle:NSWarningAlertStyle];
            [alert2 runModal];
		}
	}
}





- (IBAction)newincantation:(id)sender{
    
}
- (IBAction)closeincantation:(id)sender{
    
}
- (IBAction)runincantation:(id)sender{
    
}
- (IBAction)stopincantation:(id)sender{
    
}
- (IBAction)exportformula:(id)sender{
    
}
- (IBAction)invocation:(id)sender{
    
}

@end
