//
//  ScreenshotController.m
//  ScreenSnapper
//
//  Created by Sam Stone on 27/03/2015.
//  Copyright (c) 2015 Sam Stone.
//
#import "SSScreenshotController.h"
#import "SSSnapMenu.h"

static SSScreenshotController *sharedInstance = nil;

@interface SSScreenshotController () {
    CGEventSourceRef src;
    CGEventTapLocation loc;
    CGEventRef threed, threeu;
    CGEventRef fourd, fouru;
    CGEventRef spaced, spaceu;
    CGEventRef cntrld, cntrlu;
    CGEventRef cmdd, cmdu;
    CGEventRef shftd, shftu;
}
@property (assign, nonatomic) BOOL saveToClipboard;
@end

@implementation SSScreenshotController
+ (instancetype)sharedInstance {
    if (sharedInstance == nil) {
        sharedInstance = [[SSScreenshotController alloc] init];
    }
    return sharedInstance;
}

- (instancetype)init {
    if (self = [super init]) {
        src = CGEventSourceCreate(kCGEventSourceStateHIDSystemState);
        loc = kCGHIDEventTap;
        threed = CGEventCreateKeyboardEvent(src, 0x14, true);
        threeu = CGEventCreateKeyboardEvent(src, 0x14, false);
        
        fourd = CGEventCreateKeyboardEvent(src, 0x15, true);
        fouru = CGEventCreateKeyboardEvent(src, 0x15, false);
        
        spaced = CGEventCreateKeyboardEvent(src, 0x31, true);
        spaceu = CGEventCreateKeyboardEvent(src, 0x31, false);
        
        cmdd = CGEventCreateKeyboardEvent(src, 0x38, true);
        cmdu = CGEventCreateKeyboardEvent(src, 0x38, false);
        
        shftd = CGEventCreateKeyboardEvent(src, 0x37, true);
        shftu = CGEventCreateKeyboardEvent(src, 0x37, false);
        
        cntrld = CGEventCreateKeyboardEvent(src, 0x3B, true);
        cntrlu = CGEventCreateKeyboardEvent(src, 0x3B, false);
        
        self.saveToClipboard = [[NSUserDefaults standardUserDefaults]
                                boolForKey:@"SAVE_TO_CLIPBOARD"];
        
    }
    return self;
}

- (void)createMenuItem {
    NSImage *image = [NSImage imageNamed:@"MenuIcon_Template"];
    self.statusItem = [[NSStatusBar systemStatusBar] statusItemWithLength:image.size.width+4];
    self.statusItem.enabled = YES;
    self.menu = [[SSSnapMenu alloc] init];
    
    if (self.saveToClipboard) {
        self.menu.saveToClipboardItem.state = true;
    } else {
        self.menu.saveToDiskItem.state = true;
    }
    
    self.statusItem.menu = self.menu;
    self.statusItem.image = image;
}

- (void)saveToClipboardSelected:(id)sender {
    self.saveToClipboard = true;
}

- (void)saveToDiskSelected:(id)sender {
    self.saveToClipboard = false;
}

- (void)setSaveToClipboard:(BOOL)saveToClipboard {
    if (saveToClipboard) {
        self.menu.saveToClipboardItem.state = true;
        self.menu.saveToDiskItem.state = false;
    } else {
        self.menu.saveToClipboardItem.state = false;
        self.menu.saveToDiskItem.state = true;
    }
    
    _saveToClipboard = saveToClipboard;
    [[NSUserDefaults standardUserDefaults]
        setBool:saveToClipboard forKey:@"SAVE_TO_CLIPBOARD"];
}


- (IBAction)snapScreen:(id)sender {
    CGEventFlags modifierFlags = [self flagsForCurrentState];
    CGEventSetFlags(threed, modifierFlags);
    CGEventSetFlags(threeu, modifierFlags);
    
    CGEventPost(loc, cmdd);
    CGEventPost(loc, shftd);
    if (self.saveToClipboard) CGEventPost(loc, cntrld);
    CGEventPost(loc, threed);
    CGEventPost(loc, threeu);
    if (self.saveToClipboard) CGEventPost(loc, cntrlu);
    CGEventPost(loc, shftu);
    CGEventPost(loc, cmdu);
}
- (IBAction)snapWindow:(id)sender {
    [self snapSelection:self];
    usleep(500000);
    
    CGEventPost(loc, spaced);
    CGEventPost(loc, spaceu);
    
}
- (IBAction)snapSelection:(id)sender {
    
    CGEventFlags modifierFlags = [self flagsForCurrentState];
    CGEventSetFlags(fourd, modifierFlags);
    CGEventSetFlags(fouru, modifierFlags);
    
    CGEventPost(loc, cmdd);
    CGEventPost(loc, shftd);
    if (self.saveToClipboard) CGEventPost(loc, cntrld);
    CGEventPost(loc, fourd);
    CGEventPost(loc, fouru);
    if (self.saveToClipboard) CGEventPost(loc, cntrlu);
    CGEventPost(loc, shftu);
    CGEventPost(loc, cmdu);
}

- (CGEventFlags)flagsForCurrentState {
    CGEventFlags flags;
    if (self.saveToClipboard) {
        flags = kCGEventFlagMaskCommand | kCGEventFlagMaskShift | kCGEventFlagMaskControl;
    } else {
        flags = kCGEventFlagMaskCommand | kCGEventFlagMaskShift;
    }
    return flags;
}
- (void)dealloc {
    CFRelease(src);
    CFRelease(threed);
    CFRelease(threeu);
    CFRelease(fourd);
    CFRelease(fouru);
    CFRelease(spaced);
    CFRelease(spaceu);
    CFRelease(cmdd);
    CFRelease(cmdu);
    CFRelease(shftd);
    CFRelease(shftu);
    CFRelease(cntrld);
    CFRelease(cntrlu);
}

@end
