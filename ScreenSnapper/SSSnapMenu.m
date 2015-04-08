//
//  SSSnapMenu.m
//  ScreenSnapper
//
//  Created by Sam Stone on 31/03/2015.
//  Copyright (c) 2015 Sam Stone. 
//

#import "SSSnapMenu.h"
#import "SSScreenshotController.h"
#import "SSLoginItemController.h"

@import Sparkle;

@implementation SSSnapMenu
- (instancetype) init {
    if (self = [super init]) {
        self.saveToClipboardItem = [[NSMenuItem alloc] initWithTitle:@"Save to Clipboard"
                                                              action:@selector(saveToClipboardSelected:)
                                                       keyEquivalent:@""];
        [self addItem:self.saveToClipboardItem];
        self.saveToDiskItem = [[NSMenuItem alloc] initWithTitle:@"Save to File"
                                                         action:@selector(saveToDiskSelected:)
                                                  keyEquivalent:@""];
        [self addItem:self.saveToDiskItem];
        self.snapScreenItem = [[NSMenuItem alloc] initWithTitle:@"Snap Screen"
                                                         action:@selector(snapScreen:)
                                                  keyEquivalent:@""];
        
        [self addItem:[NSMenuItem separatorItem]];
        
        [self addItem:self.snapScreenItem];
        self.snapSelectionItem = [[NSMenuItem alloc] initWithTitle:@"Snap Selection"
                                                            action:@selector(snapSelection:)
                                                     keyEquivalent:@""];
        [self addItem:self.snapSelectionItem];
        self.snapWindowItem = [[NSMenuItem alloc] initWithTitle:@"Snap Window"
                                                         action:@selector(snapWindow:)
                                                  keyEquivalent:@""];
        [self addItem:self.snapWindowItem];
        for (NSMenuItem *item in self.itemArray) {
            item.target = [SSScreenshotController sharedInstance];
        }
        
        [self addItem:[NSMenuItem separatorItem]];
        self.checkForUpdateItem = [[NSMenuItem alloc] initWithTitle:@"Check for Updates..."
                                                             action:@selector(checkForUpdates:)
                                                      keyEquivalent:@""];
        self.checkForUpdateItem.target = [SUUpdater sharedUpdater];
        [self addItem:self.checkForUpdateItem];
        self.startAtLoginItem = [[NSMenuItem alloc] initWithTitle:@"Start at Login"
                                                           action:@selector(toggleStartOnLogin:)
                                                    keyEquivalent:@""];
        self.startAtLoginItem.target = [SSLoginItemController sharedController];
        self.startAtLoginItem.state = [SSLoginItemController sharedController].startAtLogin;
        [self addItem:self.startAtLoginItem];
        self.quitAppItem = [[NSMenuItem alloc] initWithTitle:@"Quit"
                                                      action:@selector(terminate:)
                                               keyEquivalent:@""];
        self.quitAppItem.target = [NSApplication sharedApplication];
        [self addItem:self.quitAppItem];
    }
    return self;
}
@end
