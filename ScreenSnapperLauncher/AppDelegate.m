//
//  AppDelegate.m
//  ScreenSnapperLauncher
//
//  Created by Sam Stone on 31/03/2015.
//  Copyright (c) 2015 Sam Stone. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate ()

@property (weak) IBOutlet NSWindow *window;
@end

@implementation AppDelegate

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification {
    NSString *appPath = [[[[[[NSBundle mainBundle] bundlePath]
                            stringByDeletingLastPathComponent]
                           stringByDeletingLastPathComponent]
                          stringByDeletingLastPathComponent]
                         stringByDeletingLastPathComponent];
    [[NSWorkspace sharedWorkspace] launchApplication:appPath];
    [NSApp terminate:nil];
    // Insert code here to initialize your application
}

- (void)applicationWillTerminate:(NSNotification *)aNotification {
    // Insert code here to tear down your application
}

@end
