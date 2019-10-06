#import <Cocoa/Cocoa.h>
#include "base64.h"
#include "cadimpl.h"


@interface skey : NSResponder {
    IBOutlet NSWindow *window;
	IBOutlet NSTextField *cle;
}
- (IBAction)showWindow:(id)sender;
- (IBAction)buyredirect:(id)sender;
- (IBAction)validationkey:(id)sender;
@end
