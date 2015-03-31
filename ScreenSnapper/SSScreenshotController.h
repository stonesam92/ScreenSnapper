//
//  ScreenshotController.h
//  ScreenSnapper
//
//  Created by Sam Stone on 27/03/2015.
//  Copyright (c) 2015 Sam Stone.
//

#import <Foundation/Foundation.h>
#import <AppKit/AppKit.h>

@class SSSnapMenu;

@interface SSScreenshotController : NSObject
@property (strong, nonatomic) NSStatusItem *statusItem;
@property (strong, nonatomic) SSSnapMenu *menu;
+ (instancetype)sharedInstance;
- (void)createMenuItem;
- (void)snapScreen:(id)sender;
- (void)snapWindow:(id)sender;
- (void)snapSelection:(id)sender;
- (void)saveToClipboardSelected:(id)sender;
- (void)saveToDiskSelected:(id)sender;
@end
