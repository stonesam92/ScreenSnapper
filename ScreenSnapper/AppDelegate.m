//
//  AppDelegate.m
//  ScreenSnapper
//
//  Created by Sam Stone on 26/03/2015.
//  Copyright (c) 2015 Sam Stone.
//

#import "AppDelegate.h"
#import "SSScreenshotController.h"
#import <StartAtLoginController/StartAtLoginController.h>

@import ServiceManagement;

static NSString *FIRST_RUN_DEFAULT_KEY = @"HAS_RUN_ONCE";

@interface AppDelegate ()
@property (strong, nonatomic) StartAtLoginController *loginItemController;
@property (weak) IBOutlet NSWindow *window;
@property (strong) NSStatusItem *statusBarItem;
@end

@implementation AppDelegate

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification {
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    if (![userDefaults boolForKey:FIRST_RUN_DEFAULT_KEY]) {
        [userDefaults setBool:YES forKey:FIRST_RUN_DEFAULT_KEY];
        [userDefaults setBool:YES forKey:@"SAVE_TO_CLIPBOARD"];
        [userDefaults synchronize];
    }
    [[SSScreenshotController sharedInstance] createMenuItem];
}

- (void)applicationWillTerminate:(NSNotification *)aNotification {
    // Insert code here to tear down your application
}
@end
