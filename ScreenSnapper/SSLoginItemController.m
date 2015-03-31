//
//  SSLoginItemController.m
//  ScreenSnapper
//
//  Created by Sam Stone on 31/03/2015.
//  Copyright (c) 2015 Sam Stone. All rights reserved.
//

#import "SSLoginItemController.h"
#import <AppKit/AppKit.h>
static SSLoginItemController *sharedController;

@implementation SSLoginItemController
+ (void)initialize {
    sharedController = [[SSLoginItemController alloc]
                        initWithIdentifier:@"com.samstone.ScreenSnapperLauncher"];
}

+ (instancetype)sharedController {
    return sharedController;
}

- (void)toggleStartOnLogin:(id)sender {
    NSMenuItem *menuSender = (NSMenuItem*)sender;
    BOOL newState = !menuSender.state;
    self.startAtLogin = newState;
    menuSender.state = newState;
}
@end
