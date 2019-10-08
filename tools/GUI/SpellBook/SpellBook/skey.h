#import <Cocoa/Cocoa.h>
#include "base64.h"
#include "cadimpl.h"
#include <string>
#include <fstream>
using namespace std;
@interface skey : NSResponder {
    IBOutlet NSWindow *window;
	IBOutlet NSTextField *cle;
}
- (IBAction)showWindow:(id)sender;
- (IBAction)buyredirect:(id)sender;
- (IBAction)validationkey:(id)sender;



@end
